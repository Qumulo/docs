import argparse
from concurrent.futures import ThreadPoolExecutor
import json
import os
import re
import shutil
import subprocess
import tempfile
from tqdm import tqdm

TARGET_FILE = "qq-cli-command-guide/change-log.md"
CACHE_DIR = "tools/.cli-change-cache"

DEFAULT_REPO = os.environ.get("QUMULO_REPO", os.path.expanduser("~/src"))
DEFAULT_PYTHON = os.environ.get("QQ_PYTHON", "python3")
MIN_EXPECTED_COMMANDS = 50

cli_data = {}

EXTRACT_PROGRAM = r"""
import argparse
import json
import sys

import qumulo.lib.qq  # noqa: F401  (registers all subcommands)
import qumulo.lib.opts as opts


def expand(action, formatter):
    try:
        return formatter._expand_help(action)
    except Exception:
        return (action.help or "").strip()


def dump_actions(actions, formatter):
    out = {}
    for action in actions:
        if action.dest in ("help", "==SUPPRESS=="):
            continue
        name = max(action.option_strings, key=len) if action.option_strings else action.dest
        out[name] = {
            "dest": action.dest,
            "option_strings": list(action.option_strings),
            "metavar": action.metavar,
            "required": bool(getattr(action, "required", False)),
            "nargs": action.nargs if isinstance(action.nargs, (int, str)) else None,
            "choices": sorted([str(c) for c in action.choices]) if action.choices else [],
            "help": expand(action, formatter),
        }
    return out


commands = {}
subclasses = opts.Subcommand.__subclasses__()
for cls in subclasses:
    name = getattr(cls, "NAME", None)
    if not name:
        continue
    entry = {
        "name": name,
        "synopsis": (getattr(cls, "SYNOPSIS", "") or "").strip(),
        "description": (getattr(cls, "DESCRIPTION", "") or "").strip(),
        "usage": "",
        "positional_options": {},
        "optional_options": {},
    }
    try:
        parser = argparse.ArgumentParser(prog="qq " + name, add_help=False)
        cls.options(parser)
        formatter = argparse.HelpFormatter(prog="unused")
        entry["usage"] = parser.format_usage().strip()
        entry["positional_options"] = dump_actions(parser._positionals._actions, formatter)
        entry["optional_options"] = dump_actions(parser._optionals._actions, formatter)
    except Exception as e:
        entry["error"] = str(e)
    commands[name] = entry

json.dump({"subclass_count": len(subclasses), "commands": commands}, sys.stdout)
"""


def _quoted(rev):
    """Wrap a branch/tag name in hg revset string-literal quotes. Needed because
    bare hyphenated names like release-7.10.3 get parsed as a revset subtraction
    expression (release MINUS 7.10.3) rather than a literal name."""
    return f"'{rev}'"


def _resolve_rev(repo, version):
    """Prefer the release-X.Y.Z branch; fall back to the QumuloCore-X.Y.Z tag."""
    for candidate in (f"release-{version}", f"QumuloCore-{version}"):
        try:
            r = subprocess.run(
                ["hg", "--repository", repo, "log", "-r", _quoted(candidate), "--template", "{node}"],
                capture_output=True,
                text=True,
                timeout=120,
            )
            if r.returncode == 0 and r.stdout.strip():
                return candidate
        except Exception:
            continue
    return None


def _stage_env(repo, rev, envdir):
    """Assemble a standalone, importable environment for this one revision:
      envdir/qumulo/...            -- from cli/qumulo/** in the archive
      envdir/qinternal/core/byte_units.py  -- the one cross-package file qumulo.rest
                                           actually needs, pulled directly with hg cat
      envdir/qinternal/__init__.py, envdir/qinternal/core/__init__.py  -- empty, just
                                           so Python treats these as packages

    This mirrors qinternal-hook.sh's install-time path remap (qinternal.X == repo-root
    X/), but hand-assembled for just the files qq CLI introspection needs, instead of
    copying the whole repo. Confirmed via hg files/hg cat that none of this is
    build-generated -- it's a verbatim checked-in file, just outside the qumulo/ tree.
    """
    tmp_archive = os.path.join(envdir, "_archive")
    archive = subprocess.run(
        ["hg", "--repository", repo, "archive", "-r", _quoted(rev), "-I", "glob:cli/qumulo/**", tmp_archive],
        cwd=repo,
        capture_output=True,
        text=True,
        timeout=900,
    )
    if archive.returncode != 0:
        raise RuntimeError(f"hg archive failed: {archive.stderr.strip()}")

    src_qumulo = os.path.join(tmp_archive, "cli", "qumulo")
    if not os.path.isdir(src_qumulo):
        raise RuntimeError("archive did not contain cli/qumulo/")
    shutil.move(src_qumulo, os.path.join(envdir, "qumulo"))
    shutil.rmtree(tmp_archive, ignore_errors=True)

    qinternal_core = os.path.join(envdir, "qinternal", "core")
    os.makedirs(qinternal_core, exist_ok=True)
    cat = subprocess.run(
        ["hg", "--repository", repo, "cat", "-r", _quoted(rev), "core/byte_units.py"],
        cwd=repo,
        capture_output=True,
        text=True,
        timeout=120,
    )
    if cat.returncode != 0 or not cat.stdout.strip():
        raise RuntimeError(f"hg cat core/byte_units.py failed: {cat.stderr.strip()}")
    with open(os.path.join(qinternal_core, "byte_units.py"), "w") as f:
        f.write(cat.stdout)

    open(os.path.join(envdir, "qinternal", "__init__.py"), "w").close()
    open(os.path.join(qinternal_core, "__init__.py"), "w").close()


def fetch_version(version, force):
    """CLI analogue of the REST script's HTTP fetch: stage a standalone importable
    environment for this release (read-only hg archive/cat -- we NEVER hg update)
    and introspect the qq subcommands.
    """
    if not version:
        return
    cache_path = os.path.join(CACHE_DIR, f"{version}.json")
    if not force and os.path.exists(cache_path):
        try:
            with open(cache_path, "r") as f:
                cli_data[version] = json.load(f)
                return
        except Exception:
            pass
    envdir = None
    try:
        rev = _resolve_rev(DEFAULT_REPO, version)
        if not rev:
            print(f"Warning: extractor failed for {version} (exit {proc.returncode}):\n{proc.stderr.strip()[-2000:]}")            
            cli_data[version] = None
            return
        envdir = tempfile.mkdtemp(prefix=f"qq-cli-{version}-")
        _stage_env(DEFAULT_REPO, rev, envdir)

        env = dict(os.environ)
        env["PYTHONPATH"] = envdir + os.pathsep + env.get("PYTHONPATH", "")
        env["PYTHONDONTWRITEBYTECODE"] = "1"
        proc = subprocess.run(
            [DEFAULT_PYTHON, "-c", EXTRACT_PROGRAM],
            capture_output=True,
            text=True,
            cwd=envdir,
            env=env,
            timeout=600,
        )
        if proc.returncode != 0 or not proc.stdout.strip():
            print(f"Warning: extractor failed for {version} (exit {proc.returncode}): {proc.stderr.strip()[:300]}")
            cli_data[version] = None
            return
        data = json.loads(proc.stdout)
        if data.get("subclass_count", 0) < MIN_EXPECTED_COMMANDS:
            print(f"Warning: {version} only found {data.get('subclass_count', 0)} commands (expected >= {MIN_EXPECTED_COMMANDS})")
            cli_data[version] = None
            return        
        os.makedirs(CACHE_DIR, exist_ok=True)
        with open(cache_path, "w") as f:
            json.dump(data, f)
        cli_data[version] = data
    except Exception as e:
        print(f"Warning: failed to fetch version {version}: {e}")
        cli_data[version] = None    
    finally:
        if envdir:
            shutil.rmtree(envdir, ignore_errors=True)


def all_options(cmd):
    """Positional and optional options merged into one name-keyed dict."""
    if not isinstance(cmd, dict):
        return {}
    merged = {}
    merged.update(cmd.get("positional_options") or {})
    merged.update(cmd.get("optional_options") or {})
    return merged


def format_change_group(label, items, verb, command_path, base_indent=""):
    count = len(items)
    word = "option" if "option" in label.lower() else "argument"
    plural = f"{word}s" if count > 1 else word
    prep = "to" if verb == "added" else "from"
    if count == 1:
        item = list(items)[0]
        return f"{verb.capitalize()} <code>{item}</code> {word} {prep} {command_path} {label}"
    res = f"{verb.capitalize()} {plural} {prep} {command_path} {label}:\n"
    res += f"{base_indent}  <ul>\n"
    for i in sorted(items):
        res += f"{base_indent}    <li><code>{i}</code></li>\n"
    res += f"{base_indent}  </ul>"
    return res


def format_choice_change_group(target_name, items, verb, command_path, label, base_indent=""):
    count = len(items)
    word = "option" if "option" in label.lower() else "argument"
    singular = "accepted value"
    plural = "accepted values"
    prep = "to" if verb == "added" else "from"
    loc = f" {label}" if label else ""
    display_name = target_name.split(".")[-1]
    if count == 1:
        item = list(items)[0]
        return (
            f"{verb.capitalize()} <code>{item}</code> {singular} {prep} "
            f"<code>{display_name}</code> {word} in {command_path}{loc}"
        )
    res = (
        f"{verb.capitalize()} {plural} {prep} <code>{display_name}</code> "
        f"{word} in {command_path}{loc}:\n"
    )
    res += f"{base_indent}  <ul>\n"
    for i in sorted(items):
        res += f"{base_indent}    <li><code>{i}</code></li>\n"
    res += f"{base_indent}  </ul>"
    return res


def generate_cli_bullets(curr_v, prev_v):
    if not prev_v:
        return "{{ noCLIchanges }}"
    curr_json = cli_data.get(curr_v)
    prev_json = cli_data.get(prev_v)
    if not curr_json or not prev_json:
        return "{{ noCLIchanges }}"

    removals, additions, modifications = [], [], []
    c_c = curr_json.get("commands", {})
    p_c = prev_json.get("commands", {})

    for name in sorted(set(c_c.keys()) | set(p_c.keys())):
        cp = f"<code>qq {name}</code>"
        if name not in c_c:
            removals.append(f"Removed <code>qq {name}</code> command")
            continue
        if name not in p_c:
            additions.append(f"Added {cp} command")
            continue
        
        c_obj, p_obj = c_c[name], p_c[name]
        cats = []

        c_opt_objs = all_options(c_obj)
        p_opt_objs = all_options(p_obj)
        c_opt, p_opt = set(c_opt_objs.keys()), set(p_opt_objs.keys())
        
        if c_opt - p_opt:
            cats.append(format_change_group("options", c_opt - p_opt, "added", cp, "        "))
        if p_opt - c_opt:
            cats.append(format_change_group("options", p_opt - c_opt, "removed", cp, "        "))

        for o_name in sorted(c_opt & p_opt):
            c_choices = set(c_opt_objs[o_name].get("choices") or [])
            p_choices = set(p_opt_objs[o_name].get("choices") or [])
            if c_choices - p_choices:
                cats.append(
                    format_choice_change_group(
                        o_name, c_choices - p_choices, "added", cp, "options", "        "
                    )
                )
            if p_choices - c_choices:
                cats.append(
                    format_choice_change_group(
                        o_name, p_choices - c_choices, "removed", cp, "options", "        "
                    )
                )

        c_syn = (c_obj.get("synopsis") or "").strip()
        p_syn = (p_obj.get("synopsis") or "").strip()
        if c_syn != p_syn:
            cats.append(f"Changed the synopsis of {cp}")

        c_desc = (c_obj.get("description") or "").strip()
        p_desc = (p_obj.get("description") or "").strip()
        if c_desc != p_desc:
            cats.append(f"Changed the help text for {cp}")

        changed_help = set()
        for o_name in sorted(c_opt & p_opt):
            if (c_opt_objs[o_name].get("help") or "").strip() != (
                p_opt_objs[o_name].get("help") or ""
            ).strip():
                changed_help.add(o_name)
        if changed_help:
            if len(changed_help) == 1:
                item = list(changed_help)[0]
                cats.append(f"Changed the help text for <code>{item}</code> option in {cp}")
            else:
                blk = f"Changed the help text for {cp} options:\n"
                blk += "          <ul>\n"
                for i in sorted(changed_help):
                    blk += f"            <li><code>{i}</code></li>\n"
                blk += "          </ul>"
                cats.append(blk)

        if len(cats) == 1:
            modifications.append(cats[0])
        elif len(cats) > 1:
            nested = f"Modified {cp}:\n      <ul>\n"
            for cat in cats:
                nested += f"        <li>{cat}</li>\n"
            nested += "      </ul>"
            modifications.append(nested)

    all_bullets = removals + additions + modifications
    if not all_bullets:
        return "{{ noCLIchanges }}"
    if len(all_bullets) == 1:
        return all_bullets[0]
    if len(all_bullets) <= 5:
        res = "<ul>\n"
        for b in all_bullets:
            res += f"  <li>\n    {b}\n  </li>\n" if "\n" in b else f"  <li>{b}</li>\n"
        res += "</ul>"
        return res
    
    visible, hidden = all_bullets[:3], all_bullets[3:]
    res = "<ul>\n"
    for b in visible:
        res += f"  <li>\n    {b}\n  </li>\n" if "\n" in b else f"  <li>{b}</li>\n"
    res += "</ul>\n"
    res += "<details>\n  <summary>Click to expand</summary>\n  <ul>\n"
    for b in hidden:
        res += f"    <li>\n      {b}\n    </li>\n" if "\n" in b else f"    <li>{b}</li>\n"
    res += "  </ul>\n</details>"
    return res


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--no-cache", action="store_true")
    parser.add_argument("version", nargs="?", default=None)
    args = parser.parse_args()
    target_v = args.version
    if not target_v:
        while True:
            choice = input(
                "Which version of qq CLI docs to generate change log version for?"
                " Enter a valid Qumulo Core version or q to quit: "
            ).strip()
            if choice == "q":
                return
            elif choice == "current" or re.match(r"^\d+\.\d+\.\d+(?:\.\d+)*$", choice):
                target_v = choice
                break
            else:
                print(
                    f"Error: Invalid version format '{choice}'. Expected 'current' or"
                    " 'N.N.N'."
                )
    if not os.path.exists(TARGET_FILE):
        print(f"Error: Target file not found at '{TARGET_FILE}'. Run this from the docs-internal repo root.")
        return    
    with open(TARGET_FILE, "r", encoding="utf-8") as f:
        full_content = f.read()
    parts = full_content.split("---", 2)
    if len(parts) < 3:
        print(f"Error: Could not find YAML frontmatter ('---' delimiters) in '{TARGET_FILE}'.")
        return    
    if len(parts) < 3:
        return
    yaml_header = "---" + parts[1] + "---"
    body_content = parts[2]
    
    if target_v and target_v != "current":
        mm_match = re.match(r"^(\d+\.\d+)", target_v)
        major_minor = mm_match.group(1) if mm_match else target_v
        parent_heading = f"## {major_minor} Releases"
        header_pattern = rf"### Qumulo Core {re.escape(target_v)}\b"
        nexus_pattern = rf"### Qumulo Core {re.escape(target_v)}\b(?:(?!### Qumulo Core)[\s\S])*?\{{\{{\s*nexusLink\s*\}}\}}"
        has_header = re.search(header_pattern, body_content)
        has_nexus = re.search(nexus_pattern, body_content)
        if not has_header:
            parent_pattern = rf"## {re.escape(major_minor)} Releases\b"
            has_parent = re.search(parent_pattern, body_content)
            new_entry = f"### Qumulo Core {target_v}\n{{{{ nexusLink }}}}\n\n"
            if has_parent:
                body_content = re.sub(rf"({parent_pattern}\n*)", rf"\1\n{new_entry}", body_content, count=1)
            else:
                full_block = f"\n\n\n{parent_heading}\n\n{new_entry}"
                topmost = re.search(r"(\n## \d+\.\d+ Releases|\n### Qumulo Core \d+\.\d+\.\d+)", body_content)
                if topmost:
                    pos = topmost.start()
                    body_content = body_content[:pos] + full_block + body_content[pos:]
                else:
                    body_content = full_block + body_content
        elif not has_nexus:
            body_content = re.sub(rf"(### Qumulo Core {re.escape(target_v)}\b)", r"\1\n{{ nexusLink }}", body_content, count=1)
            
    all_versions = re.findall(r"### Qumulo Core (\d+\.\d+\.\d+(?:\.\d+)*)", body_content)
    seen_groups = set()

    for v in all_versions:
        m = re.match(r"^(\d+\.\d+)", v)
        if not m:
            continue
        group = m.group(1)
        if group in seen_groups:
            continue
        seen_groups.add(group)
        if not re.search(rf"^## {re.escape(group)} Releases\b", body_content, re.MULTILINE):
            first_rel = re.search(rf"(\n*)(### Qumulo Core {re.escape(group)}\b)", body_content)
            if first_rel:
                pos = first_rel.start(2)
                body_content = body_content[:pos] + f"\n\n\n## {group} Releases\n\n" + body_content[pos:]
                
    version_blocks = re.split(r"(\n### Qumulo Core \d+\.\d+\.\d+.*?\n)", body_content)
    processed_body = [version_blocks[0]]
    versions = re.findall(r"### Qumulo Core (\d+\.\d+\.\d+(?:\.\d+)*)", body_content)
    
    with ThreadPoolExecutor(max_workers=4) as exe:
        list(tqdm(exe.map(lambda v: fetch_version(v, args.no_cache), versions), total=len(versions)))
        
    for i in range(1, len(version_blocks), 2):
        header = version_blocks[i]
        content = version_blocks[i + 1] if i + 1 < len(version_blocks) else ""
        curr_v_match = re.search(r"(\d+\.\d+\.\d+(?:\.\d+)*)", header)
        if curr_v_match:
            curr_v = curr_v_match.group(1)
            try:
                idx = versions.index(curr_v)
                prev_v = versions[idx + 1] if idx + 1 < len(versions) else None
            except Exception:
                prev_v = None
            nexus_split = re.split(r"(\{\{\s*nexusLink\s*\}\})", content)
            if len(nexus_split) >= 3:
                pre_nexus = nexus_split[0]
                nexus_tag = nexus_split[1]
                post_nexus = nexus_split[2]
                anchor_match = re.search(r"(\n\s*(?:##|###|\{%)[\s\S]*)", post_nexus)
                trailing = anchor_match.group(1) if anchor_match else ""
                new_bullets = generate_cli_bullets(curr_v, prev_v)
                content = pre_nexus + nexus_tag + "\n" + new_bullets + "\n" + trailing
        processed_body.append(header)
        processed_body.append(content)
        
    final_output = yaml_header + "".join(processed_body)
    final_output = re.sub(r"\n+## ", r"\n\n\n## ", final_output)
    final_output = re.sub(r"\n{3,}(?!## )", "\n\n", final_output)
    
    with open(TARGET_FILE, "w", encoding="utf-8") as f:
        f.write(final_output.strip() + "\n")
    print(f"Success: updated {TARGET_FILE}")

if __name__ == "__main__":
    main()
