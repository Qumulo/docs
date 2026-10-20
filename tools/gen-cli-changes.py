#!/usr/bin/env python3
"""
gen-cli-changes.py — generate change-log.md for the qq CLI command surface.

Mirrors gen-api-changes.py: one cached JSON snapshot per release version,
generated once and never regenerated, then a diff of the two newest snapshots.

USAGE
    python3 gen-cli-changes.py 7.10.3
    python3 gen-cli-changes.py 7.9.1 7.10.0 7.10.3     # backfill several
    python3 gen-cli-changes.py --repo ~/src 7.10.3

    Options:
      --repo PATH           hg checkout to extract from   (default: ~/src)
      --snapshot-dir PATH   snapshot cache directory      (default: ./cli-snapshots)
      --output PATH         changelog to write            (default: ./change-log.md)
      --qpython PATH        qpython binary (default: /opt/qumulo/toolchain/bin/qpython)

WHAT IT DOES
    For each version not already cached:
      1. resolve hg rev   (branch release-X.Y.Z, falling back to tag QumuloCore-X.Y.Z)
      2. hg archive that rev's `qumulo/` subtree into a temp dir  (never `hg update`)
      3. import it under qpython and introspect opts.Subcommand.__subclasses__()
      4. write cli-snapshots/<version>.json
    Then diffs the two newest cached snapshots into change-log.md.

    Versions already cached cost nothing — no hg, no import.
"""

import argparse
import json
import os
import re
import shutil
import subprocess
import sys
import tempfile

DEFAULT_REPO = os.path.expanduser('~/src')
DEFAULT_QPYTHON = '/opt/qumulo/toolchain/bin/qpython'
MIN_EXPECTED_COMMANDS = 50


class Failure(Exception):
    """A clean, explainable failure. Printed as an error, not a traceback."""


# --------------------------------------------------------------------------
# The extractor. Written to a temp file and run under qpython inside the
# archived tree. Field extraction is a faithful copy of
# ~/src/tools/extract_cli_help.py (minus the Jekyll/doc-writing parts).
# --------------------------------------------------------------------------

EXTRACTOR = r'''
import argparse
import json
import sys

try:
    import qumulo.lib.opts as opts
    import qumulo.lib.qq as qq  # noqa: F401  (registers the subcommands)
except Exception as exc:
    sys.stderr.write('IMPORT_FAILED: %s: %s\n' % (type(exc).__name__, exc))
    sys.exit(3)

command_classes = sorted(opts.Subcommand.__subclasses__(), key=lambda i: getattr(i, 'NAME'))

if len(command_classes) < MIN_EXPECTED:
    sys.stderr.write(
        'TOO_FEW_SUBCOMMANDS: found %d, expected at least %d\n'
        % (len(command_classes), MIN_EXPECTED)
    )
    sys.exit(4)

commands = []
for cls in command_classes:
    if '==SUPPRESS==' in cls.SYNOPSIS:
        continue

    parser = argparse.ArgumentParser(prog='qq %s' % cls.NAME)
    cls.options(parser)

    generated_usage = parser.format_usage()[7:].strip()
    usage = '\n'.join(
        ('    ' + line.strip()) if idx > 0 else line
        for idx, line in enumerate(generated_usage.split('\n'))
    )

    hf = argparse.HelpFormatter(prog='unused')

    commands.append(
        {
            'command': cls.NAME,
            'category': cls.NAME.split('_')[0],
            'synopsis': cls.SYNOPSIS,
            'usage': usage,
            'positional_options': [
                {'name': opt.dest, 'help': hf._expand_help(opt), 'required': True}
                for opt in parser._positionals._actions
                if len(opt.option_strings) == 0
                and opt.help
                and '==SUPPRESS==' not in opt.help
            ],
            'optional_options': [
                {
                    'name': opt.option_strings[0],
                    'alternate': opt.option_strings[1:],
                    'help': hf._expand_help(opt),
                    'required': opt.required,
                }
                for opt in parser._optionals._actions
                if len(opt.option_strings) > 0
                and '-h' not in opt.option_strings
                and opt.help
                and '==SUPPRESS==' not in opt.help
            ],
        }
    )

json.dump({'version': VERSION, 'commands': commands}, sys.stdout, indent=2, sort_keys=True)
'''


# --------------------------------------------------------------------------
# hg
# --------------------------------------------------------------------------

def run(cmd, cwd=None):
    proc = subprocess.run(cmd, cwd=cwd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    return proc.returncode, proc.stdout.decode('utf-8', 'replace'), proc.stderr.decode(
        'utf-8', 'replace'
    )


def resolve_rev(repo, version):
    """Prefer the release-X.Y.Z branch; fall back to the old QumuloCore-X.Y.Z tag."""
    for rev in ('release-%s' % version, 'QumuloCore-%s' % version):
        code, _, _ = run(['hg', 'log', '-r', rev, '-T', '{node}'], cwd=repo)
        if code == 0:
            return rev
    raise Failure(
        'Could not find release %s in %s.\n'
        "  Tried hg branch 'release-%s' and hg tag 'QumuloCore-%s' — neither exists.\n"
        '  Check the version number, or run `hg branches` in the repo to see what is '
        'available.' % (version, repo, version, version)
    )


def archive_tree(repo, rev, dest):
    code, _, err = run(
        [
            'hg',
            'archive',
            '-r',
            rev,
            '-I',
            'glob:**/qumulo/**',
            '-I',
            'glob:qumulo/**',
            '-I',
            'glob:**/toolchain.json',
            '-I',
            'glob:toolchain.json',
            dest,
        ],
        cwd=repo,
    )
    if code != 0:
        raise Failure(
            'hg archive failed for %s.\n  hg said: %s' % (rev, err.strip() or '(no output)')
        )


def find_package_root(archive_dir):
    """Locate the directory containing qumulo/lib/qq.py. That dir is the PYTHONPATH root."""
    for dirpath, _dirnames, filenames in os.walk(archive_dir):
        if 'qq.py' in filenames:
            # .../<root>/qumulo/lib/qq.py
            lib = dirpath
            pkg = os.path.dirname(lib)
            root = os.path.dirname(pkg)
            if os.path.basename(lib) == 'lib' and os.path.basename(pkg) == 'qumulo':
                return root
    raise Failure(
        'The extracted source tree does not contain qumulo/lib/qq.py.\n'
        '  Nothing to introspect — the archive step pulled an incomplete tree.\n'
        '  This usually means the release predates the current source layout.'
    )


def find_toolchain_qpython(root, fallback):
    """If the release pins a toolchain version, use that qpython; else use the default."""
    tc = os.path.join(root, 'toolchain.json')
    if not os.path.exists(tc):
        return fallback
    try:
        with open(tc) as handle:
            data = json.load(handle)
    except Exception:
        return fallback
    ver = data.get('version') or data.get('toolchain_version')
    if not ver:
        return fallback
    candidate = '/opt/qumulo/env/%s/bin/qpython' % ver
    return candidate if os.path.exists(candidate) else fallback


# --------------------------------------------------------------------------
# snapshot generation
# --------------------------------------------------------------------------

def build_snapshot(repo, version, qpython):
    rev = resolve_rev(repo, version)
    tmp = tempfile.mkdtemp(prefix='qq-cli-%s-' % version)
    try:
        archive_tree(repo, rev, tmp)
        root = find_package_root(tmp)
        interpreter = find_toolchain_qpython(root, qpython)

        if not os.path.exists(interpreter):
            raise Failure(
                'qpython not found at %s.\n'
                '  Pass a different one with --qpython.' % interpreter
            )

        script = EXTRACTOR.replace('MIN_EXPECTED', str(MIN_EXPECTED_COMMANDS)).replace(
            'VERSION', json.dumps(version)
        )
        script_path = os.path.join(tmp, '_extract_cli.py')
        with open(script_path, 'w') as handle:
            handle.write(script)

        env = dict(os.environ)
        env['PYTHONPATH'] = root
        env['PYTHONDONTWRITEBYTECODE'] = '1'
        proc = subprocess.run(
            [interpreter, script_path],
            env=env,
            cwd=root,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
        )
        out = proc.stdout.decode('utf-8', 'replace')
        err = proc.stderr.decode('utf-8', 'replace').strip()

        if proc.returncode == 3:
            raise Failure(
                'Could not import the qq CLI from release %s.\n'
                '  %s\n'
                '  The extracted tree is probably missing generated code '
                '(qumulo/rest/*), which is built rather than checked in.' % (version, err)
            )
        if proc.returncode == 4:
            raise Failure(
                'The CLI introspection for release %s produced far too few commands.\n'
                '  %s\n'
                '  Refusing to cache a bad snapshot.' % (version, err)
            )
        if proc.returncode != 0:
            raise Failure(
                'CLI introspection failed for release %s (exit %d).\n  %s'
                % (version, proc.returncode, err or '(no output)')
            )

        try:
            return json.loads(out)
        except ValueError:
            raise Failure(
                'CLI introspection for release %s did not return valid JSON.\n  %s'
                % (version, err or out[:400])
            )
    finally:
        shutil.rmtree(tmp, ignore_errors=True)


def ensure_snapshot(repo, version, snapshot_dir, qpython):
    path = os.path.join(snapshot_dir, '%s.json' % version)
    if os.path.exists(path):
        print('  %s: already cached (%s)' % (version, path))
        return path
    print('  %s: not cached — extracting (this is slow, but only happens once)' % version)
    snapshot = build_snapshot(repo, version, qpython)
    os.makedirs(snapshot_dir, exist_ok=True)
    with open(path, 'w') as handle:
        json.dump(snapshot, handle, indent=2, sort_keys=True)
    print('  %s: cached %d commands' % (version, len(snapshot['commands'])))
    return path


# --------------------------------------------------------------------------
# diffing
# --------------------------------------------------------------------------

def version_key(version):
    return tuple(int(p) for p in re.findall(r'\d+', version))


def cached_versions(snapshot_dir):
    if not os.path.isdir(snapshot_dir):
        return []
    versions = [f[:-5] for f in os.listdir(snapshot_dir) if f.endswith('.json')]
    return sorted(versions, key=version_key)


def load_commands(snapshot_dir, version):
    with open(os.path.join(snapshot_dir, '%s.json' % version)) as handle:
        data = json.load(handle)[12:45 PM]return {c['command']: c for c in data['commands']}



def option_names(command):
names = [o['name'] for o in command.get('positional_options', [])]
names += [o['name'] for o in command.get('optional_options', [])]
return names



def diff_commands(old, new):
added = sorted(set(new) - set(old))
removed = sorted(set(old) - set(new))

changed = []
for name in sorted(set(old) & set(new)):
    before, after = old[name], new[name]
    notes = []

    if before['synopsis'] != after['synopsis']:
        notes.append(
            'Synopsis changed from "%s" to "%s"' % (before['synopsis'], after['synopsis'])
        )

    old_opts, new_opts = set(option_names(before)), set(option_names(after))
    for opt in sorted(new_opts - old_opts):
        notes.append('Added option `%s`' % opt)
    for opt in sorted(old_opts - new_opts):
        notes.append('Removed option `%s`' % opt)

    old_help = {
        o['name']: o['help']
        for o in before.get('positional_options', []) + before.get('optional_options', [])
    }
    new_help = {
        o['name']: o['help']
        for o in after.get('positional_options', []) + after.get('optional_options', [])
    }
    for opt in sorted(old_opts & new_opts):
        if old_help.get(opt) != new_help.get(opt):
            notes.append('Help text changed for `%s`' % opt)

    if not notes and before['usage'] != after['usage']:
        notes.append('Usage string changed')

    if notes:
        changed.append((name, notes))

return added, removed, changed



def render_changelog(old_version, new_version, old, new):
added, removed, changed = diff_commands(old, new)

lines = ['# qq CLI Changes', '', '## %s (compared to %s)' % (new_version, old_version), '']

if not (added or removed or changed):
    lines += ['No CLI command changes.', '']
    return '\n'.join(lines)

if added:
    lines += ['### Added Commands', '']
    for name in added:
        lines.append('- `qq %s` — %s' % (name, new[name]['synopsis']))
    lines.append('')

if removed:
    lines += ['### Removed Commands', '']
    for name in removed:
        lines.append('- `qq %s` — %s' % (name, old[name]['synopsis']))
    lines.append('')

if changed:
    lines += ['### Changed Commands', '']
    for name, notes in changed:
        lines.append('- `qq %s`' % name)
        for note in notes:
            lines.append('  - %s' % note)
    lines.append('')

return '\n'.join(lines)




--------------------------------------------------------------------------def main():
parser = argparse.ArgumentParser(
description='Generate change-log.md for the qq CLI command surface.'
)
parser.add_argument(
'versions', nargs='+', metavar='VERSION', help='Release version(s), e.g. 7.10.3'
)
parser.add_argument('--repo', default=DEFAULT_REPO, help='hg checkout (default: ~/src)')
parser.add_argument(
'--snapshot-dir',
default='cli-snapshots',
help='Snapshot cache directory (default: ./cli-snapshots)',
)
parser.add_argument(
'--output', default='change-log.md', help='Changelog output file (default: ./change-log.md)'
)
parser.add_argument(
'--qpython', default=DEFAULT_QPYTHON, help='qpython binary (default: %s)' % DEFAULT_QPYTHON
)
args = parser.parse_args()

if not os.path.isdir(os.path.join(args.repo, '.hg')):
    raise Failure(
        'No Mercurial repository at %s.\n  Point at your checkout with --repo.' % args.repo
    )
if shutil.which('hg') is None:
    raise Failure('`hg` is not on your PATH. Add /opt/qumulo/toolchain/bin to PATH.')

print('Snapshots:')
for version in sorted(args.versions, key=version_key):
    ensure_snapshot(args.repo, version, args.snapshot_dir, args.qpython)

available = cached_versions(args.snapshot_dir)
if len(available) < 2:
    raise Failure(
        'Need at least two cached versions to produce a diff — only have %d (%s).\n'
        '  Run this again with an older version to compare against.'
        % (len(available), ', '.join(available) or 'none')
    )

new_version, old_version = available[-1], available[-2]
print('\nDiffing %s against %s' % (new_version, old_version))

text = render_changelog(
    old_version,
    new_version,
    load_commands(args.snapshot_dir, old_version),
    load_commands(args.snapshot_dir, new_version),
)
with open(args.output, 'w') as handle:
    handle.write(text)
print('Wrote %s' % args.output)



if name == 'main':
try:
main()
except Failure as failure:
sys.stderr.write('\nERROR: %s\n' % failure)
sys.exit(1)
except KeyboardInterrupt:
sys.stderr.write('\nInterrupted.\n')
sys.exit(130)
