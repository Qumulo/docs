"""
OpenAPI to Jekyll REST API Documentation Generator

This script fetches an OpenAPI JSON specification for Qumulo Core and generates:
1. Individual Markdown resource files for each API endpoint with structured YAML frontmatter.
2. HTML-formatted parameter and response descriptions to work around Kramdown table rendering limits.
3. Directory structures categorized and versioned by API tags.
4. A Jekyll sidebar configuration file (`rest_api_guide_sidebar.yml`).
"""

import os
import sys
import json
import yaml
import requests
import re
from tqdm import tqdm


# --- Global Constants & Configurations ---
VERSION_PATTERN = re.compile(r"^/v(\d+)/")
DEFAULT_VERSION = "v1"
HTTP_METHODS = ["get", "post", "put", "delete", "patch", "options", "head"]
OUTPUT_FORMATS = "web,pdf"

OUTPUT_BASE_DIR = os.path.expanduser("~/git/docs-internal/rest-api-guide")
SIDEBAR_FILE_PATH = os.path.expanduser(
    "~/git/docs-internal/_data/sidebars/rest_api_guide_sidebar.yml"
)


def format_description(desc):
    """
    Convert raw OpenAPI string descriptions into pure HTML elements.
    
    Standard Markdown engines (like Kramdown) do not render multiline Markdown 
    lists or inline code cleanly inside HTML table cells. This function converts:
    - Typo fixes (e.g. '.:' -> '.')
    - Bullet points (*, -, •, ·) into <ul><li> HTML lists
    - Words containing underscores inside bullet items into <code> elements
    - Backticks (`code`) and single quotes ('code') into <code> elements
    - Double code blocks (`code` - `code`) into (`code` - plain_text)
    - Plain text line breaks into <br> tags
    """
    if not desc:
        return ""

    # Clean up accidental '.:' typo from source specs
    desc = desc.replace(".:", ".")

    # Fix inline list bullets lacking prior line breaks (e.g., "types:* item" -> "types:\n* item")
    desc = re.sub(r"(\S)([\*\-\•\·])\s+", r"\1\n\2 ", desc)

    # Convert backtick inline code (`value`) to <code>value</code>
    desc = re.sub(r"`([^`]+)`", r"<code>\1</code>", desc)

    # Convert single-quoted strings ('value') to <code>value</code>, ignoring contractions (e.g., don't)
    desc = re.sub(r"(?<![a-zA-Z0-9])'([^'\n]+)'(?![a-zA-Z0-9])", r"<code>\1</code>", desc)

    lines = desc.splitlines()
    output_parts = []
    in_list = False

    # Group bullet points into HTML unordered lists (<ul>)
    for line in lines:
        stripped = line.strip()
        if not stripped:
            continue

        bullet_match = re.match(r"^[\*\-\•\·]\s+(.*)$", stripped)
        if bullet_match:
            # Strip trailing punctuation (commas/semicolons) from individual list items
            item_content = bullet_match.group(1).rstrip(",;").strip()

            # Enclose any word containing underscores (e.g., child_file_added) in <code> if not already wrapped
            if "<code>" not in item_content:
                item_content = re.sub(
                    r"\b([a-zA-Z0-9]+(?:_[a-zA-Z0-9]+)+)\b",
                    r"<code>\1</code>",
                    item_content,
                )
            else:
                parts = re.split(r"(<code>.*?</code>)", item_content)
                new_parts = []
                for part in parts:
                    if part.startswith("<code>"):
                        new_parts.append(part)
                    else:
                        part = re.sub(
                            r"\b([a-zA-Z0-9]+(?:_[a-zA-Z0-9]+)+)\b",
                            r"<code>\1</code>",
                            part,
                        )
                        new_parts.append(part)
                item_content = "".join(new_parts)

            if not in_list:
                output_parts.append("<ul>")
                in_list = True
            output_parts.append(f"<li>{item_content}</li>")
        else:
            if in_list:
                output_parts.append("</ul>")
                in_list = False
            output_parts.append(stripped)

    if in_list:
        output_parts.append("</ul>")

    # Reconstruct text block, joining plain text lines with <br> breaks
    result = ""
    for part in output_parts:
        if part in ("<ul>", "</ul>") or part.startswith("<li>"):
            result += part
        else:
            if result and not result.endswith("<ul>") and not result.endswith("</ul>"):
                result += "<br>"
            result += part

    # Clean up patterns where two code blocks are separated by a dash (e.g. <code>A</code> - <code>B</code>)
    # Strips <code> tags from the second item so it renders as plain text.
    result = re.sub(
        r"(<code>[^<]+</code>\s*[\-\–\—]\s*)<code>([^<]+)</code>",
        r"\1\2",
        result,
    )

    return result


def extract_api_version(path):
    """Extract the API version string from an endpoint path (e.g., '/v1/analytics' -> 'v1')."""
    match = VERSION_PATTERN.match(path)
    if match:
        return f"v{match.group(1)}"

    assert False, f"Path without version prefix: {path}"


def normalize_tag_with_version(tag, path_version):
    """
    Normalize tag names to ensure consistent version suffixes based on path versioning.
    
    Example:
    ("Network Configuration", "v2") -> ("Network Configuration V2", "Network Configuration")
    """
    base_tag = re.sub(r"\s+V\d+$", "", tag)
    versioned_tag = f"{base_tag} {path_version.upper()}"
    return versioned_tag, base_tag


def get_versioned_directory_name(tag, version):
    """
    Generate a URL/filesystem friendly directory name for a versioned tag.
    
    Example:
    ("Cloud Data Fabric V1", "v1") -> "cloud-data-fabric-v1"
    """
    base_tag = re.sub(r"\s+V\d+$", "", tag)
    return f"{base_tag.lower().replace(' ', '-')}-{version.lower()}"


def create_sidebar_entry(title, url, api_version=DEFAULT_VERSION, is_preview=False, is_deprecated=False):
    """Construct a dictionary representing an endpoint entry in the Jekyll sidebar."""
    entry = {"output": OUTPUT_FORMATS, "title": title, "url": url}
    if is_preview:
        entry["preview"] = True
    if is_deprecated:
        entry["deprecated"] = True
    if api_version:
        entry["apiversion"] = api_version
    return entry


def update_frontmatter_preserving_custom_fields(md_path, updates):
    """
    Update YAML frontmatter in an existing Markdown file without overwriting
    manually added custom frontmatter keys.
    """
    os.makedirs(os.path.dirname(md_path), exist_ok=True)

    if not os.path.exists(md_path):
        with open(md_path, "w") as f:
            f.write("---\n")
            f.write(yaml.dump(updates, default_flow_style=False, sort_keys=False))
            f.write("---\n")
        return

    with open(md_path, "r") as f:
        content = f.read()

    match = re.match(r"(?s)^---\n(.*?)\n---\n(.*)", content)
    if not match:
        raise ValueError(f"Missing or malformed frontmatter in {md_path}")

    frontmatter_text, body = match.groups()
    frontmatter_lines = frontmatter_text.splitlines()

    new_lines = []
    keys_updated = set()
    skip_key = None

    for line in frontmatter_lines:
        if skip_key:
            if re.match(r"^\S", line):
                skip_key = None
            else:
                continue

        key = line.split(":", 1)[0].strip()
        if key in updates:
            val = yaml.dump(
                {key: updates[key]}, default_flow_style=False, sort_keys=False
            ).strip()
            new_lines.extend(val.splitlines())
            keys_updated.add(key)
            skip_key = key
        else:
            new_lines.append(line)

    for key, val in updates.items():
        if key not in keys_updated:
            val_str = yaml.dump(
                {key: val}, default_flow_style=False, sort_keys=False
            ).strip()
            new_lines.extend(val_str.splitlines())

    with open(md_path, "w") as f:
        f.write("---\n")
        f.write("\n".join(new_lines) + "\n")
        f.write("---\n")
        f.write(body)


def interactive_version_selector():
    """Determine product version via CLI argument or interactive prompt and fetch OpenAPI spec JSON."""
    if len(sys.argv) >= 2:
        version_input = sys.argv[1]
        interactive_mode = False
    else:
        version_input = None
        interactive_mode = True

    while True:
        if interactive_mode:
            version_input = input(
                "Which version of REST API docs to generate docs for? Enter a valid Qumulo Core version or q to quit. "
            ).strip()
            if version_input.lower() == "q":
                print("Exiting.")
                exit(0)

        url = f"https://artifacts.eng.qumulo.com/release/{version_input}/src/build/debug/iodocs/openapi.json"
        print(f"Building REST API documentation from {url} ...")

        try:
            response = requests.get(url)
            response.raise_for_status()
            return response.json()
        except (requests.RequestException, json.JSONDecodeError):
            if interactive_mode:
                print("Enter a valid Qumulo Core version or q to quit.")
            else:
                print(
                    f"Error: Unable to fetch OpenAPI spec for version {version_input}"
                )
                print(
                    f"Please check that '{version_input}' is a valid Qumulo Core version."
                )
                exit(1)


def generate_index_md(tag, title, tag_info, api_version):
    """Generate index landing page content for a documentation subcategory directory."""
    out = f"""---
layout: landing_page
sidebar: rest_api_guide_sidebar
summary: "{tag_info['description']}"
title: {title}"""

    if api_version == "v1":
        old_url = tag.lower().replace(" v1", "").replace(" ", "-")
        out += f"""
redirect_from:
- /rest-api-guide/{old_url}/"""

    return out + "\n---\n"


def generate_resource_md(tag, endpoint, methods, permalink, api_version=None):
    """Parse endpoint HTTP methods, parameter details, and response schemas into YAML frontmatter."""
    yaml_content = {"category": f"/{tag}", "rest_endpoint": endpoint, "methods": {}}

    for method, details in methods.items():
        response_details = details.get("responses", {})
        response_body = (
            response_details.get("200", {})
            .get("content", {})
            .get("application/json", {})
        )
        request_body = (
            details.get("requestBody", {})
            .get("content", {})
            .get("application/json", {})
        )

        is_preview = "[preview]" in details.get("summary", "").lower()

        method_details = {
            "summary": details.get("summary", ""),
            "parameters": [
                {
                    "name": param["name"],
                    "description": format_description(param.get("description", "")),
                    "required": param.get("required", False),
                }
                for param in details.get("parameters", [])
            ],
            "response_body": {
                "schema": json.dumps(response_body.get("schema", ""), indent=2)
            }
            if response_body
            else {},
            "responses": [
                {"code": code, "description": format_description(response.get("description", ""))}
                for code, response in response_details.items()
            ],
            "preview": is_preview,
        }

        if request_body:
            method_details["request_body"] = {
                "schema": json.dumps(request_body.get("schema", ""), indent=2)
            }

        if is_preview:
            method_details["preview"] = True

        yaml_content["methods"][method] = method_details

    yaml_string = yaml.dump(yaml_content, default_flow_style=False)
    version_string = f"api_version: {api_version}\n" if api_version else ""
    full_md = f"---\n{yaml_string}{version_string}permalink: {permalink}\nsidebar: rest_api_guide_sidebar\n---\n"
    return full_md, yaml_content


def clean_path(path, remove_version=True, is_parent=False):
    """Clean raw API path segment for sidebar title presentation."""
    parts = path.strip("/").split("/")
    if remove_version and parts and parts[0].startswith("v") and parts[0][1:].isdigit():
        parts.pop(0)
    if is_parent:
        return parts[0] if parts else ""
    return "/".join(parts)


def clean_filename(tag, filename, api_version=None):
    """Sanitize API path string into a clean Markdown filename."""
    filename = re.sub(r"[{}]", "_", filename.replace(f"{tag}_", ""))
    filename = re.sub(r"_+", "_", filename).strip("_")

    filename = re.sub(r"^v\d+_", "", filename)
    if api_version and api_version != DEFAULT_VERSION:
        filename = f"{api_version}_{filename}"
    return filename


def create_sidebar_title(tag, segment):
    """Format display title for category folders in the sidebar navigation."""
    return f"{tag} ({segment})"


def find_tags_for_category(path_item):
    """Extract set of OpenAPI tags associated with supported HTTP operations on a path."""
    tags = set()
    for method, details in path_item.items():
        if method in HTTP_METHODS:
            if "tags" in details:
                tags.update(details["tags"])
    return tags


def process_endpoint(path, path_item, sidebar_entries_by_tag, tag_info_dict):
    """Process a single OpenAPI path object, writing resource Markdown files and updating tracking lists."""
    path_segments = path.strip("/").split("/")
    if path == "/openapi.json" or len(path_segments) < 2:
        if path != "/openapi.json":
            tqdm.write(
                f"Skipping path {repr(path)} (segments: {len(path_segments)}): too short."
            )
        return

    tags = find_tags_for_category(path_item)
    if not tags:
        tqdm.write(f"Skipping path '{path}' as it doesn't have any tags.")
        return

    is_preview = any(
        "[preview]" in details.get("summary", "").lower()
        for details in path_item.values()
    )

    is_deprecated = any(
        details.get("deprecated", False)
        for details in path_item.values()
    )

    for tag in tags:
        api_version = extract_api_version(path)
        versioned_tag, base_tag = normalize_tag_with_version(tag, api_version)
        tag_dir_name = get_versioned_directory_name(versioned_tag, api_version)

        tag_dir = os.path.join(OUTPUT_BASE_DIR, tag_dir_name)
        os.makedirs(tag_dir, exist_ok=True)

        if versioned_tag not in sidebar_entries_by_tag:
            sidebar_entries_by_tag[versioned_tag] = []

        resource_name = (
            path.strip("/").replace("/", "_").replace("{", "_").replace("}", "")
        )
        resource_filename = clean_filename(tag, f"{resource_name}.md", api_version)
        resource_md_path = os.path.join(tag_dir, resource_filename)
        permalink = f"/rest-api-guide/{tag_dir_name}/{resource_filename.replace('.md', '.html')}"

        resource_md_content, yaml_content = generate_resource_md(
            tag, path, path_item, permalink, api_version
        )
        update_frontmatter_preserving_custom_fields(
            resource_md_path,
            {
                "category": f"/{versioned_tag}",
                "methods": yaml_content["methods"],
                "rest_endpoint": path,
                "api_version": api_version,
                "deprecated": is_deprecated,
                "permalink": permalink,
                "sidebar": "rest_api_guide_sidebar",
            },
        )

        cleaned_path = clean_path(path)
        sidebar_entry = create_sidebar_entry(
            title=cleaned_path,
            url=permalink,
            api_version=api_version,
            is_preview=is_preview,
            is_deprecated=is_deprecated,
        )
        sidebar_entries_by_tag[versioned_tag].append(sidebar_entry)

        if len(sidebar_entries_by_tag[versioned_tag]) == 1:
            tag_info = tag_info_dict.get(
                base_tag,
                {
                    "name": base_tag,
                    "description": "Listing of commands for " + base_tag,
                },
            )
            first_segment = clean_path(path, is_parent=True)
            index_md_title = create_sidebar_title(versioned_tag, first_segment)
            index_md_content = generate_index_md(
                versioned_tag, index_md_title, tag_info, api_version
            )
            index_md_path = os.path.join(tag_dir, "index.md")
            with open(index_md_path, "w") as f:
                f.write(index_md_content)


# --- Execution Flow ---

api_definition = interactive_version_selector()

sidebar_entries_by_tag = {}
tag_info_dict = {tag["name"]: tag for tag in api_definition["tags"]}

paths_items = list(api_definition["paths"].items())
for path, path_item in tqdm(paths_items, desc="Generating API docs", unit="endpoint"):
    process_endpoint(path, path_item, sidebar_entries_by_tag, tag_info_dict)


def version_key(entry):
    """Sort helper to organize sidebar entries numerically by version."""
    version = entry.get("apiversion", DEFAULT_VERSION).replace("v", "")
    return int(version)


for tag in sidebar_entries_by_tag:
    sidebar_entries_by_tag[tag] = sorted(
        sidebar_entries_by_tag[tag], key=lambda x: (x["title"], version_key(x))
    )

sidebar_content = {
    "entries": [
        {
            "folders": [
                {
                    "folderitems": [
                        {"output": "pdf", "title": "", "type": "frontmatter", "url": "/titlepage.html"},
                        {"output": "pdf", "title": "", "type": "frontmatter", "url": "/tocpage.html"},
                    ],
                    "output": "pdf",
                    "title": "",
                    "type": "frontmatter",
                },
                {
                    "folderitems": [
                        {"output": "web", "title": "Documentation Home", "url": "/index.html"},
                        {"output": "web", "title": "Qumulo REST API Guide Home", "url": "/rest-api-guide/"},
                        {"output": "web", "title": "Contacting the Qumulo Care Team", "url": "/contacting-qumulo-care-team.html"},
                    ],
                    "output": "web",
                    "title": "Qumulo REST API Guide",
                    "type": "navi",
                },
                {
                    "title": "Change Log",
                    "url": "/rest-api-guide/change-log.html",
                    "output": "web,pdf"
                }
            ]
        }
    ]
}

folders = []

for tag, entries in sidebar_entries_by_tag.items():
    version_match = re.match(r"^(.*)\s+V(\d+)$", tag)
    if version_match:
        base_tag = version_match.group(1)
        version_num = version_match.group(2)
        version = f"v{version_num}"
        tag_dir_name = get_versioned_directory_name(tag, version)
    else:
        assert False, f"Tag without version after normalization: {tag}"

    tag_info = tag_info_dict.get(base_tag, {"name": base_tag})
    if entries:
        first_segment = clean_path(
            entries[0]["title"], remove_version=False, is_parent=True
        )
        parent_title = create_sidebar_title(tag, first_segment)
        all_preview = all(entry.get("preview", False) for entry in entries)
        all_deprecated = all(entry.get("deprecated", False) for entry in entries)

        parent_entry = {
            "folderitems": entries,
            "output": OUTPUT_FORMATS,
            "title": parent_title,
            "url": f"/rest-api-guide/{tag_dir_name}/",
        }

        if all_preview:
            parent_entry["preview"] = True

        if all_deprecated:
            parent_entry["deprecated"] = True

        sort_order = int(version_num)
        folders.append((base_tag, sort_order, tag, parent_entry))

folders.sort(key=lambda x: (x[0], x[1]))
sidebar_content["entries"][0]["folders"].extend([entry for _, _, _, entry in folders])

with open(SIDEBAR_FILE_PATH, "w") as file:
    yaml.dump(sidebar_content, file, default_flow_style=False)

additional_yaml_content = """  guidetitle: Qumulo REST API Guide
  guideurl: /rest-api-guide/
  output: web,pdf
  pdftitle: qumulo-rest-api-guide.pdf
  product: ''
  title: Qumulo REST API Guide
  version: ''
"""

with open(SIDEBAR_FILE_PATH, "a") as file:
    file.write(additional_yaml_content)

print("API documentation generation completed.")
