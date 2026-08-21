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


def get_fields(obj):
  if not obj or not isinstance(obj, dict):
    return set()
  props = obj.get("properties", {})
  if not props and "content" in obj:
    content = obj.get("content", {}).get("application/json", {})
    props = content.get("schema", {}).get("properties", {})
  return set(props.keys())


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
      removals.append(f"Removed <code>{path}</code>")
      continue
    c_m, p_m = c_p[path], p_p.get(path, {})
    agg = " | ".join([
        m.upper()
        for m in sorted(c_m.keys())
        if m in ["get", "post", "put", "delete", "patch"]
    ])
    mp = f"<code>{agg} {path}</code>"
    if path not in p_p:
      additions.append(f"Added {mp}")
      continue
    for m in sorted(c_m.keys()):
      vp = f"<code>{m.upper()} {path}</code>"
      c_obj, p_obj = c_m[m], p_m.get(m, {})
      if not p_obj:
        additions.append(f"Added support for {vp}")
        continue
      cats = []
      c_prm = {p["name"] for p in c_obj.get("parameters", []) if "name" in p}
      p_prm = {p["name"] for p in p_obj.get("parameters", []) if "name" in p}
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
      req_c, req_p = get_fields(c_obj.get("requestBody")), get_fields(
          p_obj.get("requestBody")
      )
      if req_c - req_p:
        cats.append(
            format_change_group(
                "request body", req_c - req_p, "added", vp, "        "
            )
        )
      if req_p - req_c:
        cats.append(
            format_change_group(
                "request body", req_p - req_c, "removed", vp, "        "
            )
        )
      c_res, p_res = c_obj.get("responses", {}), p_obj.get("responses", {})
      for code in sorted(set(c_res.keys()) | set(p_res.keys())):
        lbl = "response" if code == "200" else f"<code>{code}</code> response"
        rc, rp = get_fields(c_res.get(code)), get_fields(p_res.get(code))
        if rc - rp:
          cats.append(
              format_change_group(lbl, rc - rp, "added", vp, "        ")
          )
        if rp - rc:
          cats.append(
              format_change_group(lbl, rp - rc, "removed", vp, "        ")
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
    return all_bullets[0]

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

  # Auto-insert missing version section/nexus tag above the topmost item
  if target_v and target_v != "current":
    header_pattern = rf"## Qumulo Core {re.escape(target_v)}\b"
    nexus_pattern = rf"## Qumulo Core {re.escape(target_v)}\b(?:(?!## Qumulo Core)[\s\S])*?{{\{{\s*nexusLink\s*\}}}}"

    has_header = re.search(header_pattern, body_content)
    has_nexus = re.search(nexus_pattern, body_content)

    if not has_header:
      topmost = re.search(r"(\n## Qumulo Core \d+\.\d+\.\d+)", body_content)
      if topmost:
        pos = topmost.start()
        new_entry = f"\n\n## Qumulo Core {target_v}\n{{{{ nexusLink }}}}\n\n"
        body_content = body_content[:pos] + new_entry + body_content[pos:]
      else:
        body_content = (
            f"\n\n## Qumulo Core {target_v}\n{{{{ nexusLink }}}}\n\n"
            + body_content
        )
    elif not has_nexus:
      body_content = re.sub(
          rf"(## Qumulo Core {re.escape(target_v)}\b)",
          r"\1\n{{ nexusLink }}",
          body_content,
          count=1,
      )

  version_blocks = re.split(
      r"(\n## Qumulo Core \d+\.\d+\.\d+.*?\n)", body_content
  )
  processed_body = [version_blocks[0]]

  versions = re.findall(
      r"## Qumulo Core (\d+\.\d+\.\d+(?:\.\d+)*)", body_content
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

        # Find end of this version's data area
        liquid_anchor = re.search(r"(\n\{%.*)", post_nexus, re.S)
        trailing = liquid_anchor.group(1) if liquid_anchor else ""

        new_bullets = generate_api_bullets(curr_v, prev_v)
        # Inject directly under NexusLink with one newline
        content = pre_nexus + nexus_tag + "\n" + new_bullets + "\n" + trailing

    processed_body.append(header)
    processed_body.append(content)

  final_output = yaml_header + "".join(processed_body)
  final_output = re.sub(r"\n{3,}", "\n\n", final_output)
  final_output = re.sub(
      r"([^\s%])\n+## Qumulo Core", r"\1\n\n\n## Qumulo Core", final_output
  )
  final_output = re.sub(
      r"(%})\n*## Qumulo Core", r"\1\n\n\n## Qumulo Core", final_output
  )

  with open(TARGET_FILE, "w", encoding="utf-8") as f:
    f.write(final_output.strip() + "\n")


if __name__ == "__main__":
  main()
