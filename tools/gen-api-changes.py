import argparse
from concurrent.futures import ThreadPoolExecutor
import json
import os
import re
import requests
from tqdm import tqdm

# Configuration
TARGET_FILE = "rest-api-guide/change-log.md"
URL_TEMPLATE = "https://artifacts.eng.qumulo.com/release/{version}/src/build/debug/iodocs/openapi.json"
CACHE_DIR = "tools/.api-change-cache"

api_data = {}


def fetch_version(version, force):
  if not version:
    return
  cache_path = os.path.join(CACHE_DIR, f"{version}.json")
  if not force and os.path.exists(cache_path):
    try:
      with open(cache_path, "r") as f:
        api_data[version] = json.load(f)
        return
    except:
      pass
  try:
    r = requests.get(URL_TEMPLATE.format(version=version), timeout=10)
    if r.status_code == 200:
      data = r.json()
      os.makedirs(CACHE_DIR, exist_ok=True)
      with open(cache_path, "w") as f:
        json.dump(data, f)
      api_data[version] = data
  except:
    api_data[version] = None


def walk_schema(schema, prefix=""):
  """Recursively walks an OpenAPI schema dictionary (including wrapped requestBody/response objects)

  and yields (property_path, property_dict).
  """
  if not schema or not isinstance(schema, dict):
    return

  # Unwrap response/requestBody wrappers if present
  if "content" in schema:
    schema = (
        schema.get("content", {})
        .get("application/json", {})
        .get("schema", {})
    )

  # Object properties
  props = schema.get("properties")
  if isinstance(props, dict):
    for name, prop in props.items():
      path = f"{prefix}.{name}" if prefix else name
      yield path, prop
      yield from walk_schema(prop, path)

  # Array items
  items = schema.get("items")
  if isinstance(items, dict):
    yield from walk_schema(items, prefix)


def filter_root_paths(path_set):
  """Given a set of property paths (e.g. {'user', 'user.domain'}), returns only

  the root-most paths that don't have a parent in path_set.
  """
  root_paths = set()
  sorted_paths = sorted(path_set)
  for p in sorted_paths:
    parts = p.split(".")
    has_parent = False
    for i in range(1, len(parts)):
      parent = ".".join(parts[:i])
      if parent in root_paths:
        has_parent = True
        break
    if not has_parent:
      root_paths.add(p)
  return root_paths


def extract_param_enums(param_dict):
  """Extracts enum values from an OpenAPI parameter dict or schema."""
  if not isinstance(param_dict, dict):
    return set()
  e = param_dict.get("enum")
  if isinstance(e, list):
    return set(e)
  s = param_dict.get("schema")
  if isinstance(s, dict):
    e = s.get("enum")
    if isinstance(e, list):
      return set(e)
    items = s.get("items")
    if isinstance(items, dict):
      e = items.get("enum")
      if isinstance(e, list):
        return set(e)
  return set()


def format_change_group(label, items, verb, method_path, base_indent=""):
  count = len(items)
  word = "field" if "field" in label.lower() else "parameter"
  plural = f"{word}s" if count > 1 else word
  prep = "to" if verb == "added" else "from"
  if count == 1:
    item = list(items)[0]
    return (
        f"{verb.capitalize()} <code>{item}</code> {word} {prep}"
        f" {method_path} {label}"
    )
  res = f"{verb.capitalize()} {plural} {prep} {method_path} {label}:\n"
  res += f"{base_indent}  <ul>\n"
  for i in sorted(items):
    res += f"{base_indent}    <li><code>{i}</code></li>\n"
  res += f"{base_indent}  </ul>"
  return res


def format_enum_change_group(
    target_name, items, verb, method_path, label, base_indent=""
):
  count = len(items)
  word = "parameter" if "parameter" in label.lower() else "field"
  singular = "enum value"
  plural = "enum values"
  prep = "to" if verb == "added" else "from"
  loc = f" {label}" if label else ""
  display_name = target_name.split(".")[-1]
  if count == 1:
    item = list(items)[0]
    return (
        f"{verb.capitalize()} <code>{item}</code> {singular} {prep}"
        f" <code>{display_name}</code> {word} in {method_path}{loc}"
    )
  res = (
      f"{verb.capitalize()} {plural} {prep} <code>{display_name}</code> {word}"
      f" in {method_path}{loc}:\n"
  )
  res += f"{base_indent}  <ul>\n"
  for i in sorted(items):
    res += f"{base_indent}    <li><code>{i}</code></li>\n"
  res += f"{base_indent}  </ul>"
  return res


def generate_api_bullets(curr_v, prev_v):
  """Diffs versions and handles 0/1/N content logic with smart drawer."""
  if not prev_v:
    return "{{ noAPIchanges }}"
  curr_json = api_data.get(curr_v)
  prev_json = api_data.get(prev_v)
  if not curr_json or not prev_json:
    return "{{ noAPIchanges }}"

  removals, additions, modifications = [], [], []
  c_p, p_p = curr_json.get("paths", {}), prev_json.get("paths", {})

  for path in sorted(set(c_p.keys()) | set(p_p.keys())):
    if path not in c_p:
      removals.append(f"Removed <code>{path}</code> endpoint")
      continue
    c_m, p_m = c_p[path], p_p.get(path, {})
    agg = " | ".join([
        m.upper()
        for m in sorted(c_m.keys())
        if m in ["get", "post", "put", "delete", "patch"]
    ])
    mp = f"<code>{agg} {path}</code>"
    if path not in p_p:
      additions.append(f"Added {mp} endpoint")
      continue
    for m in sorted(c_m.keys()):
      vp = f"<code>{m.upper()} {path}</code>"
      c_obj, p_obj = c_m[m], p_m.get(m, {})
      if not p_obj:
        additions.append(f"Added support for {vp}")
        continue
      cats = []

      # Parameters check
      prm_c_objs = {
          p["name"]: p
          for p in c_obj.get("parameters", [])
          if isinstance(p, dict) and "name" in p
      }
      prm_p_objs = {
          p["name"]: p
          for p in p_obj.get("parameters", [])
          if isinstance(p, dict) and "name" in p
      }
      c_prm, p_prm = set(prm_c_objs.keys()), set(prm_p_objs.keys())

      if c_prm - p_prm:
        cats.append(
            format_change_group(
                "parameters", c_prm - p_prm, "added", vp, "        "
            )
        )
      if p_prm - c_prm:
        cats.append(
            format_change_group(
                "parameters", p_prm - c_prm, "removed", vp, "        "
            )
        )

      for p_name in sorted(c_prm & p_prm):
        c_enums = extract_param_enums(prm_c_objs[p_name])
        p_enums = extract_param_enums(prm_p_objs[p_name])
        if c_enums - p_enums:
          cats.append(
              format_enum_change_group(
                  p_name,
                  c_enums - p_enums,
                  "added",
                  vp,
                  "parameters",
                  "        ",
              )
          )
        if p_enums - c_enums:
          cats.append(
              format_enum_change_group(
                  p_name,
                  p_enums - c_enums,
                  "removed",
                  vp,
                  "parameters",
                  "        ",
              )
          )

      # Request body check
      req_c_props = dict(walk_schema(c_obj.get("requestBody", {})))
      req_p_props = dict(walk_schema(p_obj.get("requestBody", {})))
      req_c, req_p = set(req_c_props.keys()), set(req_p_props.keys())

      added_req = filter_root_paths(req_c - req_p)
      removed_req = filter_root_paths(req_p - req_c)

      if added_req:
        display_fields = {f.split(".")[-1] for f in added_req}
        cats.append(
            format_change_group(
                "request body", display_fields, "added", vp, "        "
            )
        )
      if removed_req:
        display_fields = {f.split(".")[-1] for f in removed_req}
        cats.append(
            format_change_group(
                "request body", display_fields, "removed", vp, "        "
            )
        )

      for f_name in sorted(req_c & req_p):
        c_enums = set(req_c_props[f_name].get("enum", []))
        p_enums = set(req_p_props[f_name].get("enum", []))
        if c_enums - p_enums:
          cats.append(
              format_enum_change_group(
                  f_name,
                  c_enums - p_enums,
                  "added",
                  vp,
                  "request body",
                  "        ",
              )
          )
        if p_enums - c_enums:
          cats.append(
              format_enum_change_group(
                  f_name,
                  p_enums - c_enums,
                  "removed",
                  vp,
                  "request body",
                  "        ",
              )
          )

      # Responses check
      c_res, p_res = c_obj.get("responses", {}), p_obj.get("responses", {})
      for code in sorted(set(c_res.keys()) | set(p_res.keys())):
        lbl = "response" if code == "200" else f"<code>{code}</code> response"
        res_c_props = dict(walk_schema(c_res.get(code, {})))
        res_p_props = dict(walk_schema(p_res.get(code, {})))
        rc, rp = set(res_c_props.keys()), set(res_p_props.keys())

        added_res = filter_root_paths(rc - rp)
        removed_res = filter_root_paths(rp - rc)

        if added_res:
          display_fields = {f.split(".")[-1] for f in added_res}
          cats.append(
              format_change_group(lbl, display_fields, "added", vp, "        ")
          )
        if removed_res:
          display_fields = {f.split(".")[-1] for f in removed_res}
          cats.append(
              format_change_group(
                  lbl, display_fields, "removed", vp, "        "
              )
          )

        for f_name in sorted(rc & rp):
          c_enums = set(res_c_props[f_name].get("enum", []))
          p_enums = set(res_p_props[f_name].get("enum", []))
          if c_enums - p_enums:
            cats.append(
                format_enum_change_group(
                    f_name, c_enums - p_enums, "added", vp, lbl, "        "
                )
            )
          if p_enums - c_enums:
            cats.append(
                format_enum_change_group(
                    f_name, p_enums - c_enums, "removed", vp, lbl, "        "
                )
            )

      if len(cats) == 1:
        modifications.append(cats[0])
      elif len(cats) > 1:
        nested = f"Modified {vp}:\n      <ul>\n"
        for cat in cats:
          nested += f"        <li>{cat}</li>\n"
        nested += "      </ul>"
        modifications.append(nested)

  all_bullets = removals + additions + modifications
  if not all_bullets:
    return "{{ noAPIchanges }}"
  if len(all_bullets) == 1:
    # Strip the 8-space base_indent so the HTML isn't indented into a Markdown code block
    return all_bullets[0].replace("\n        ", "\n")

  if len(all_bullets) <= 5:
    res = "<ul>\n"
    for b in all_bullets:
      res += (
          f"  <li>\n    {b}\n  </li>\n" if "\n" in b else f"  <li>{b}</li>\n"
      )
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

  # Interactive prompt loop if no CLI version provided
  if not target_v:
    while True:
      choice = input(
          "Which version of REST API docs to generate change log version for?"
          " Enter a valid Qumulo Core version or q to quit: "
      ).strip()
      if choice == "q":
        return
      elif choice == "current" or re.match(
          r"^\d+\.\d+\.\d+(?:\.\d+)*$", choice
      ):
        target_v = choice
        break
      else:
        print(
            f"Error: Invalid version format '{choice}'. Expected 'current' or"
            " 'N.N.N'."
        )

  if not os.path.exists(TARGET_FILE):
    return
  with open(TARGET_FILE, "r", encoding="utf-8") as f:
    full_content = f.read()

  parts = full_content.split("---", 2)
  if len(parts) < 3:
    return
  yaml_header = "---" + parts[1] + "---"
  body_content = parts[2]

  # Auto-insert missing version section/nexus tag under the correct ## X.Y Releases heading
  if target_v and target_v != "current":
    mm_match = re.match(r"^(\d+\.\d+)", target_v)
    major_minor = mm_match.group(1) if mm_match else target_v
    parent_heading = f"## {major_minor} Releases"

    header_pattern = rf"### Qumulo Core {re.escape(target_v)}\b"
    nexus_pattern = rf"### Qumulo Core {re.escape(target_v)}\b(?:(?!### Qumulo Core)[\s\S])*?{{\{{\s*nexusLink\s*\}}}}"

    has_header = re.search(header_pattern, body_content)
    has_nexus = re.search(nexus_pattern, body_content)

    if not has_header:
      parent_pattern = rf"## {re.escape(major_minor)} Releases\b"
      has_parent = re.search(parent_pattern, body_content)
      new_entry = f"### Qumulo Core {target_v}\n{{{{ nexusLink }}}}\n\n"

      if has_parent:
        body_content = re.sub(
            rf"({parent_pattern}\n*)",
            rf"\1\n{new_entry}",
            body_content,
            count=1,
        )
      else:
        full_block = f"\n\n\n{parent_heading}\n\n{new_entry}"
        topmost = re.search(
            r"(\n## \d+\.\d+ Releases|\n### Qumulo Core \d+\.\d+\.\d+)",
            body_content,
        )
        if topmost:
          pos = topmost.start()
          body_content = body_content[:pos] + full_block + body_content[pos:]
        else:
          body_content = full_block + body_content
    elif not has_nexus:
      body_content = re.sub(
          rf"(### Qumulo Core {re.escape(target_v)}\b)",
          r"\1\n{{ nexusLink }}",
          body_content,
          count=1,
      )

  # Check whether grouping of releases has a parent ## heading for all groups. If not, insert one.
  all_versions = re.findall(
      r"### Qumulo Core (\d+\.\d+\.\d+(?:\.\d+)*)", body_content
  )
  seen_groups = set()
  for v in all_versions:
    m = re.match(r"^(\d+\.\d+)", v)
    if not m:
      continue
    group = m.group(1)
    if group in seen_groups:
      continue
    seen_groups.add(group)

    if not re.search(
        rf"^## {re.escape(group)} Releases\b", body_content, re.MULTILINE
    ):
      first_rel = re.search(
          rf"(\n*)(### Qumulo Core {re.escape(group)}\b)", body_content
      )
      if first_rel:
        pos = first_rel.start(2)
        body_content = (
            body_content[:pos]
            + f"\n\n\n## {group} Releases\n\n"
            + body_content[pos:]
        )

  version_blocks = re.split(
      r"(\n### Qumulo Core \d+\.\d+\.\d+.*?\n)", body_content
  )
  processed_body = [version_blocks[0]]

  versions = re.findall(
      r"### Qumulo Core (\d+\.\d+\.\d+(?:\.\d+)*)", body_content
  )
  with ThreadPoolExecutor(max_workers=10) as exe:
    list(
        tqdm(
            exe.map(lambda v: fetch_version(v, args.no_cache), versions),
            total=len(versions),
        )
    )

  for i in range(1, len(version_blocks), 2):
    header = version_blocks[i]
    content = version_blocks[i + 1] if i + 1 < len(version_blocks) else ""
    curr_v_match = re.search(r"(\d+\.\d+\.\d+(?:\.\d+)*)", header)

    if curr_v_match:
      curr_v = curr_v_match.group(1)
      try:
        idx = versions.index(curr_v)
        prev_v = versions[idx + 1] if idx + 1 < len(versions) else None
      except:
        prev_v = None

      # Detect Nexus Link as the anchor
      nexus_split = re.split(r"(\{\{\s*nexusLink\s*\}\})", content)
      if len(nexus_split) >= 3:
        pre_nexus = nexus_split[0]
        nexus_tag = nexus_split[1]
        post_nexus = nexus_split[2]

        # Isolate trailing structure (parent ## headers, ### subheaders, or {% liquid tags)
        anchor_match = re.search(r"(\n\s*(?:##|###|\{%)[\s\S]*)", post_nexus)
        trailing = anchor_match.group(1) if anchor_match else ""

        new_bullets = generate_api_bullets(curr_v, prev_v)
        # Inject directly under NexusLink
        content = pre_nexus + nexus_tag + "\n" + new_bullets + "\n" + trailing

    processed_body.append(header)
    processed_body.append(content)

  final_output = yaml_header + "".join(processed_body)

  # Formatting cleanup: Enforce 2 blank lines before '## ' parent headings
  final_output = re.sub(r"\n+## ", r"\n\n\n## ", final_output)
  final_output = re.sub(r"\n{3,}(?!## )", "\n\n", final_output)

  with open(TARGET_FILE, "w", encoding="utf-8") as f:
    f.write(final_output.strip() + "\n")


if __name__ == "__main__":
  main()
