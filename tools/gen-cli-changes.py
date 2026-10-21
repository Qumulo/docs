import argparse
from collections import Counter
from concurrent.futures import ThreadPoolExecutor
import json
import os
import re
import shutil
import subprocess
import sys
import tempfile
from tqdm import tqdm

TARGET_FILE = "qq-cli-command-guide/change-log.md"
CACHE_DIR = "tools/.cli-change-cache"

DEFAULT_REPO = os.environ.get("QUMULO_REPO", os.path.expanduser("~/src"))
DEFAULT_PYTHON = os.environ.get("QQ_PYTHON", "python3")
MIN_EXPECTED_COMMANDS = 50

# Alias exception map specifically for 7.10.3
ALIAS_MAPPING_7_10_3 = {
    "add_nodes": "cluster_add_nodes",
    "auth_add_group": "auth_create_group",
    "auth_add_user": "auth_create_user",
    "auth_list_group": "auth_get_group",
    "auth_list_user": "auth_get_user",
    "auth_mod_group": "auth_modify_group",
    "auth_mod_user": "auth_modify_user",
    "capacity_clamp_get": "capacity_get_clamp",
    "capacity_clamp_set": "capacity_set_clamp",
    "capacity_history_files_get": "analytics_get_capacity_history_files",
    "capacity_history_get": "analytics_get_capacity_history",
    "change_password": "auth_change_password",
    "cluster_conf": "cluster_get_config",
    "cluster_slots": "cluster_get_slot_status",
    "create_object_backed_cluster": "cluster_create_object_backed_cluster",
    "current_activity_get": "analytics_get_current_activity",
    "data_core_cluster_create": "cluster_create_data_core",
    "fs_security_add_key": "encryption_add_key",
    "fs_security_delete_key": "encryption_delete_key",
    "fs_security_get_key": "encryption_get_key",
    "fs_security_get_key_replace_challenge": "encryption_get_key_replace_challenge",
    "fs_security_get_key_usage": "encryption_get_key_usage",
    "fs_security_list_keys": "encryption_list_keys",
    "fs_security_modify_key": "encryption_modify_key",
    "fs_security_replace_key": "encryption_replace_key",
    "get_object_backed_nodes": "cluster_get_object_backed_nodes",
    "get_object_storage_uris": "cluster_get_object_storage_uris",
    "get_vpn_keys": "support_get_vpn_keys",
    "install_vpn_keys": "support_install_vpn_keys",
    "ldap_update_settings": "ldap_modify_settings",
    "monitoring_conf": "monitoring_get_config",
    "monitoring_status_get": "monitoring_get_status",
    "network_backend_interfaces": "network_list_backend_interfaces",
    "network_frontend_interfaces": "network_list_frontend_interfaces",
    "network_put_config": "network_modify_config",
    "network_status": "network_get_status",
    "nfs_add_export": "nfs_create_export",
    "nfs_mod_export": "nfs_modify_export",
    "nfs_mod_export_host_access": "nfs_modify_export_host_access",
    "node_chassis_status_get": "cluster_get_node_chassis_status",
    "nodes_list": "cluster_list_nodes",
    "object_backed_fault_tolerance_get": "cluster_get_object_backed_fault_tolerance",
    "protection_status_get": "cluster_get_protection_status",
    "quota_update_quota": "quota_modify_quota",
    "replace_nodes": "cluster_replace_nodes",
    "replication_add_blackout_window": "replication_create_blackout_window",
    "restriper_status": "restriper_get_status",
    "rotate_encryption_keys": "encryption_rotate_keys",
    "s3_add_bucket": "s3_create_bucket",
    "set_cluster_conf": "cluster_set_config",
    "set_monitoring_conf": "monitoring_set_config",
    "set_node_identify_light": "cluster_set_node_identify_light",
    "smb_add_share": "smb_create_share",
    "smb_mod_share": "smb_modify_share",
    "smb_mod_share_permissions": "smb_modify_share_permissions",
    "static_ip_allocation": "network_get_static_ip_allocation",
    "stratus_cluster_create": "cluster_create_stratus",
    "time_reset_configuration": "time_reset_config",
    "time_series_get": "analytics_get_time_series",
    "time_status": "time_get_status",
    "unconfigured_nodes_list": "cluster_list_unconfigured_nodes",
    "unconfigured_upgrade_config": "unconfigured_upgrade_get_config",
    "unconfigured_upgrade_config_set": "unconfigured_upgrade_set_config",
    "unprotected_edge_cluster_create": "cluster_create_unprotected_edge",
    "who_am_i": "auth_who_am_i"
}

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
        "description": (getattr(cls, "DESCRIPTION", "") or "").strip(),
        "usage": "",
        "positional_flags": {},
        "optional_flags": {},
    }
    try:
        parser = argparse.ArgumentParser(prog="qq " + name, add_help=False)
        cls.options(parser)
        formatter = argparse.HelpFormatter(prog="unused")
        entry["usage"] = parser.format_usage().strip()
        entry["positional_flags"] = dump_actions(parser._positionals._actions, formatter)
        entry["optional_flags"] = dump_actions(parser._optionals._actions, formatter)
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

def _resolve_dot_rev(repo, parent_branch, version):
    """Find the commit on parent_branch where release.json was bumped to `version`."""
    r = subprocess.run(
        ["hg", "--repository", repo, "log", "-b", parent_branch, "--template", "{node}\n", "--", "release.json"],
        cwd=repo,
        capture_output=True,
        text=True,
        timeout=120,
    )
    if r.returncode != 0:
        return None
    for node in r.stdout.strip().splitlines():
        cat = subprocess.run(
            ["hg", "--repository", repo, "cat", "-r", node, "release.json"],
            cwd=repo,
            capture_output=True,
            text=True,
            timeout=60,
        )
        if cat.returncode != 0:
            continue
        try:
            data = json.loads(cat.stdout)
        except ValueError:
            continue
        if data.get("version") == version:
            return node
    return None

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
    parts = version.split(".")
    if len(parts) == 4:
        parent_branch = f"release-{'.'.join(parts[:3])}"
        node = _resolve_dot_rev(repo, parent_branch, version)
        if node:
            return node
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
          print(f"Warning: could not resolve a branch/tag for version {version}")
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
            print(f"Warning: extractor failed for {version} (exit {proc.returncode}):\n{proc.stderr.strip()[-2000:]}")
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


def all_flags(cmd):
    """Positional and optional flags merged into one name-keyed dict."""
    if not isinstance(cmd, dict):
        return {}
    merged = {}
    merged.update(cmd.get("positional_flags") or {})
    merged.update(cmd.get("optional_flags") or {})
    return merged


def format_change_group(items, verb, command_path):
    count = len(items)
    word = "flag" if count == 1 else "flags"
    prep = "to" if verb == "added" else "from"
    if count == 1:
        item = list(items)[0]
        return f"{verb.capitalize()} <code>{item}</code> {word} {prep} {command_path} command"
    res = f"{verb.capitalize()} {word} {prep} {command_path} command:\n"
    res += "<ul>\n"
    for i in sorted(items):
        res += f"  <li><code>{i}</code></li>\n"
    res += "</ul>"
    return res


def format_choice_change_group(target_name, items, verb, raw_command):
    count = len(items)
    singular = "value"
    plural = "values"
    prep = "to" if verb == "added" else "from"
    display_name = target_name.split(".")[-1]
    combined_cmd = f"<code>{raw_command} {display_name}</code>"
    if count == 1:
        item = list(items)[0]
        return (
            f"{verb.capitalize()} <code>{item}</code> {singular} {prep} "
            f"{combined_cmd} command"
        )
    res = (
        f"{verb.capitalize()} {plural} {prep} {combined_cmd} command:\n"
    )
    res += "<ul>\n"
    for i in sorted(items):
        res += f"  <li><code>{i}</code></li>\n"
    res += "</ul>"
    return res


def build_html_table(rows, base_indent=""):
    """Helper to render a clean HTML table from list of (old, new) tuples with width:100% and 50/50 split."""
    tbl = f'{base_indent}<table style="width: 100%;">\n'
    tbl += f"{base_indent}  <thead>\n"
    tbl += f"{base_indent}    <tr>\n"
    tbl += f'{base_indent}      <th style="width: 50%;">Previous <code>qq</code> CLI Command Name</th>\n'
    tbl += f'{base_indent}      <th style="width: 50%;">New <code>qq</code> CLI Command Alias</th>\n'
    tbl += f"{base_indent}    </tr>\n"
    tbl += f"{base_indent}  </thead>\n"
    tbl += f"{base_indent}  <tbody>\n"
    for old_cmd, new_cmd in rows:
        tbl += f"{base_indent}    <tr>\n"
        tbl += f"{base_indent}      <td><code>qq {old_cmd}</code></td>\n"
        tbl += f"{base_indent}      <td><code>qq {new_cmd}</code></td>\n"
        tbl += f"{base_indent}    </tr>\n"
    tbl += f"{base_indent}  </tbody>\n"
    tbl += f"{base_indent}</table>"
    return tbl


def generate_alias_tables_7_10_3(max_visible_rows=10):
    """Build visible and hidden HTML tables for 7.10.3 aliases."""
    sorted_pairs = [(old_cmd, ALIAS_MAPPING_7_10_3[old_cmd]) for old_cmd in sorted(ALIAS_MAPPING_7_10_3.keys())]
    
    if len(sorted_pairs) <= max_visible_rows:
        return build_html_table(sorted_pairs), ""
        
    visible_pairs = sorted_pairs[:max_visible_rows]
    hidden_pairs = sorted_pairs[max_visible_rows:]
    
    visible_html = build_html_table(visible_pairs, base_indent="")
    hidden_html = build_html_table(hidden_pairs, base_indent="  ")
    
    return visible_html, hidden_html


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

    removed_names = set(p_c.keys()) - set(c_c.keys())
    added_names = set(c_c.keys()) - set(p_c.keys())
    common_names = set(c_c.keys()) & set(p_c.keys())

    # Exception logic for 7.10.3 alias renaming hackathon
    visible_table_html = ""
    hidden_table_html = ""
    if curr_v == "7.10.3":
        visible_table_html, hidden_table_html = generate_alias_tables_7_10_3(max_visible_rows=10)
        old_aliases = set(ALIAS_MAPPING_7_10_3.keys())
        new_aliases = set(ALIAS_MAPPING_7_10_3.values())
        
        removed_names = removed_names - old_aliases
        added_names = added_names - new_aliases

    # Rename detection
    rename_pair = None
    if len(removed_names) == 1 and len(added_names) == 1:
        old_name = next(iter(removed_names))
        new_name = next(iter(added_names))
        if set(all_flags(p_c[old_name]).keys()) == set(all_flags(c_c[new_name]).keys()):
            rename_pair = (old_name, new_name)

    if rename_pair:
        old_name, new_name = rename_pair
        removed_names = set()
        added_names = set()
        modifications.append(
            f"Replaced <code>qq {old_name}</code> command with <code>qq {new_name}</code> command"
        )

    for name in sorted(removed_names):
        removals.append(f"Removed <code>qq {name}</code> command")
    for name in sorted(added_names):
        additions.append(f"Added <code>qq {name}</code> command")

    for name in sorted(common_names):
        cp = f"<code>qq {name}</code>"
        raw_cmd = f"qq {name}"
        c_obj, p_obj = c_c[name], p_c[name]
        cats = []

        c_opt_objs = all_flags(c_obj)
        p_opt_objs = all_flags(p_obj)
        c_opt, p_opt = set(c_opt_objs.keys()), set(p_opt_objs.keys())
        
        if c_opt - p_opt:
            cats.append(format_change_group(c_opt - p_opt, "added", cp))
        if p_opt - c_opt:
            cats.append(format_change_group(p_opt - c_opt, "removed", cp))

        for o_name in sorted(c_opt & p_opt):
            c_choices = set(c_opt_objs[o_name].get("choices") or [])
            p_choices = set(p_opt_objs[o_name].get("choices") or [])
            if c_choices - p_choices:
                cats.append(
                    format_choice_change_group(o_name, c_choices - p_choices, "added", raw_cmd)
                )
            if p_choices - c_choices:
                cats.append(
                    format_choice_change_group(o_name, p_choices - c_choices, "removed", raw_cmd)
                )

        c_desc = (c_obj.get("description") or "").strip()
        p_desc = (p_obj.get("description") or "").strip()
        if c_desc != p_desc:
            cats.append(f"Changed description of {cp} command")

        changed_help = set()
        for o_name in sorted(c_opt & p_opt):
            if (c_opt_objs[o_name].get("help") or "").strip() != (
                p_opt_objs[o_name].get("help") or ""
            ).strip():
                changed_help.add(o_name)
        if changed_help:
            if len(changed_help) == 1:
                item = list(changed_help)[0]
                cats.append(f"Changed help text for <code>{raw_cmd} {item}</code> command")
            else:
                blk = f"Changed help text for the following flags of the {cp} command:\n"
                blk += "<ul>\n"
                for i in sorted(changed_help):
                    blk += f"  <li><code>{i}</code></li>\n"
                blk += "</ul>"
                cats.append(blk)

        if len(cats) == 1:
            modifications.append(cats[0])
        elif len(cats) > 1:
            nested = f"Modified {cp} command:\n<ul>\n"
            for cat in cats:
                if "\n" in cat:
                    shifted_cat = cat.replace("\n", "\n    ")
                    nested += f"  <li>\n    {shifted_cat}\n  </li>\n"
                else:
                    nested += f"  <li>{cat}</li>\n"
            nested += "</ul>"
            modifications.append(nested)

    all_bullets = removals + additions + modifications

    # Grouping Pass for parent-level bullets
    parsed_bullets = []
    for b in all_bullets:
        if "\n" not in b:
            m1 = re.match(r"^(Removed|Added) (<code>qq [^<]+</code>) command$", b)
            m2 = re.match(r"^Changed description of (<code>qq [^<]+</code>) command$", b)
            m3 = re.match(r"^Changed help text for (<code>qq [^<]+</code>) command$", b)
            m4 = re.match(r"^(Added|Removed) (<code>[^<]+</code>) value (to|from) (<code>qq [^<]+</code>) command$", b)
            m5 = re.match(r"^(Added|Removed) (<code>[^<]+</code>) flag (to|from) (<code>qq [^<]+</code>) command$", b)
            
            if m1:
                parsed_bullets.append((("command", m1.group(1)), m1.group(2), b))
            elif m2:
                parsed_bullets.append((("description", "Changed"), m2.group(1), b))
            elif m3:
                parsed_bullets.append((("help_text", "Changed"), m3.group(1), b))
            elif m4:
                parsed_bullets.append((("value", m4.group(1), m4.group(2)), m4.group(4), b))
            elif m5:
                parsed_bullets.append((("flag", m5.group(1), m5.group(2)), m5.group(4), b))
            else:
                parsed_bullets.append((None, None, b))
        else:
            parsed_bullets.append((None, None, b))

    freq = Counter(k for k, _, _ in parsed_bullets if k)
    
    final_bullets = []
    seen_groups = set()
    for k, item, b in parsed_bullets:
        if k and freq[k] > 1:
            if k not in seen_groups:
                seen_groups.add(k)
                items = [i for key, i, _ in parsed_bullets if key == k]
                
                kind = k[0]
                if kind == "command":
                    header = f"{k[1]} commands:"
                elif kind == "description":
                    header = "Changed descriptions for commands:"
                elif kind == "help_text":
                    header = "Changed help text for commands:"
                elif kind == "value":
                    prep = "to" if k[1] == "Added" else "from"
                    header = f"{k[1]} {k[2]} value {prep} commands:"
                elif kind == "flag":
                    prep = "to" if k[1] == "Added" else "from"
                    header = f"{k[1]} {k[2]} flag {prep} commands:"
                
                nested = header + "\n<ul>\n"
                for i in sorted(items):
                    nested += f"  <li>{i}</li>\n"
                nested += "</ul>"
                final_bullets.append(nested)
        else:
            final_bullets.append(b)

    all_bullets = final_bullets

    # Smart Collapsing Logic for Bullets
    total_lines = sum(max(1, b.count("<li>")) for b in all_bullets)
    
    visible = []
    hidden = []
    
    if not all_bullets and not visible_table_html:
        return "{{ noCLIchanges }}"

    # If table split occurred, force all bullets into hidden
    if hidden_table_html:
        hidden = all_bullets
    elif len(all_bullets) <= 5 and total_lines <= 25:
        visible = all_bullets
    else:
        visible_lines = 0
        for b in all_bullets:
            lines_in_b = max(1, b.count("<li>"))
            if len(hidden) == 0 and len(visible) < 3 and lines_in_b <= 10 and (visible_lines + lines_in_b <= 20):
                visible.append(b)
                visible_lines += lines_in_b
            else:
                hidden.append(b)

    res = ""
    if visible_table_html:
        res += visible_table_html + "\n\n"

    if visible:
        res += "<ul>\n"
        for b in visible:
            if "\n" in b:
                shifted_b = b.replace("\n", "\n    ")
                res += f"  <li>\n    {shifted_b}\n  </li>\n"
            else:
                res += f"  <li>{b}</li>\n"
        res += "</ul>\n"
        
    if hidden or hidden_table_html:
        if visible or visible_table_html:
            res += "\n\n"
        res += "<details>\n  <summary>Click to expand</summary>\n"
        
        if hidden_table_html:
            res += hidden_table_html + "\n"
            
        if hidden:
            if hidden_table_html:
                res += "\n"
            res += "  <ul>\n"
            for b in hidden:
                if "\n" in b:
                    shifted_b = b.replace("\n", "\n      ")
                    res += f"    <li>\n      {shifted_b}\n    </li>\n"
                else:
                    res += f"    <li>{b}</li>\n"
            res += "  </ul>\n"
            
        res += "</details>\n"
        
    return res.strip()

def ensure_dependencies():
    pip_names = {
        "dataclasses_json": "dataclasses-json",
        "dateutil": "python-dateutil",
        "typing_extensions": "typing-extensions",
    }
    missing = []
    for module_name in pip_names:
        try:
            __import__(module_name)
        except ImportError:
            missing.append(module_name)
    if not missing:
        return
    to_install = [pip_names[m] for m in missing]
    print(f"Missing required Python packages: {', '.join(to_install)}")
    answer = input(f"Install them now with pip3 install {' '.join(to_install)}? (y/n): ").strip().lower()
    if answer != "y":
        print("Can't continue without these packages. Exiting.")
        sys.exit(1)
    result = subprocess.run([sys.executable, "-m", "pip", "install", "--break-system-packages", "--user"] + to_install)
    if result.returncode != 0:
        print("pip install failed. Exiting.")
        sys.exit(1)

def main():
    ensure_dependencies()
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
                
                new_bullets = generate_cli_bullets(curr_v, prev_v)
                
                # Match start of table, details, bullets, or noCLIchanges tag
                old_bullets_start = re.search(r"(<table>|<details>|\||<ul>|\{\{\s*noCLIchanges\s*\}\})", post_nexus)
                if old_bullets_start:
                    pre_bullets = post_nexus[:old_bullets_start.start()]
                    bullets_and_after = post_nexus[old_bullets_start.start():]
                    
                    after_match = re.search(r"(\n\s*(?:##|###|\{%)[\s\S]*)", bullets_and_after)
                    post_bullets = after_match.group(1) if after_match else ""
                    
                    pre_bullets = pre_bullets.rstrip() + "\n\n" if pre_bullets.strip() else "\n\n"
                    post_bullets = "\n\n" + post_bullets.lstrip() if post_bullets.strip() else "\n"
                    
                    content = pre_nexus + nexus_tag + pre_bullets + new_bullets + post_bullets
                else:
                    pre_bullets = post_nexus.rstrip() + "\n\n" if post_nexus.strip() else "\n\n"
                    content = pre_nexus + nexus_tag + pre_bullets + new_bullets + "\n"
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
