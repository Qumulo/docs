import os
import re
import yaml

CONFIG_FILE = "_config.yml"
VARIABLE_PATTERN = re.compile(r"\{\{\s*site\.([^\}]+?)\s*\}\}")
IGNORED_PATTERNS = [
    "site.data.alerts.",
    "site.baseurl"
]

# Flatten nested dictionary into dot notation
def flatten_dict(d, prefix=""):
    items = {}
    for k, v in d.items():
        new_key = f"{prefix}.{k}" if prefix else k
        if isinstance(v, dict):
            items.update(flatten_dict(v, new_key))
        else:
            items[new_key] = v
    return items

# Parse only the YAML section after 'scanVars: true'
def parse_config_variables():
    with open(CONFIG_FILE, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    # Find scanVars line
    start_index = None
    for i, line in enumerate(lines):
        if line.strip().startswith("scanVars:"):
            value = line.strip().split(":")[1].strip().lower()
            if value == "false":
                print("scanVars is false — skipping scan.")
                return None
            elif value == "true":
                start_index = i + 1
                break

    if start_index is None:
        print("ERROR: scanVars not found — skipping scan.")
        return None

    yaml_fragment = ''.join(lines[start_index:])
    try:
        parsed = yaml.safe_load(yaml_fragment) or {}
    except yaml.YAMLError as e:
        print(f"YAML error after scanVars: {e}")
        return set()

    flat_vars = flatten_dict(parsed)
    return set(f"site.{key}" for key in flat_vars.keys())

# Scan all .md files and collect used vars + their file paths
def find_used_variables_with_paths():
    used_vars = set()
    var_to_files = {}

    for root, _, files in os.walk("."):
        for filename in files:
            if filename.endswith(".md"):
                filepath = os.path.relpath(os.path.join(root, filename))
                try:
                    with open(filepath, 'r', encoding='utf-8') as f:
                        content = f.read()
                        matches = VARIABLE_PATTERN.findall(content)
                        for match in matches:
                            var = f"site.{match.strip()}"
                            used_vars.add(var)
                            var_to_files.setdefault(var, set()).add(filepath)
                except FileNotFoundError:
                    # Skip broken symlinks or moved files
                    continue

    return used_vars, var_to_files

# Main function
def main():
    defined_vars = parse_config_variables()
    if defined_vars is None:
        return

    used_vars, var_to_files = find_used_variables_with_paths()

    undefined = sorted(
        var for var in used_vars - defined_vars
        if not any(var.startswith(p) or var == p for p in IGNORED_PATTERNS)
    )
    unused = sorted(
        var for var in defined_vars - used_vars
        if not any(var.startswith(p) or var == p for p in IGNORED_PATTERNS)
    )

    if undefined:
        print("\nUndefined Variables")
        for var in undefined:
            files = sorted(var_to_files.get(var, []))
            for file in files:
                print(f"{file}: {var}")
    else:
        print("No undefined variables found.")

    if unused:
        print("\nUnused Variables")
        for var in unused:
            print(var)
    else:
        print("No unreferenced variables found.")

if __name__ == "__main__":
    main()

