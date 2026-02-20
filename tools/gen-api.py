import os
import sys
import json
import yaml
import requests
import re
from tqdm import tqdm


VERSION_PATTERN = re.compile(r"^/v(\d+)/")
DEFAULT_VERSION = "v1"
HTTP_METHODS = ["get", "post", "put", "delete", "patch", "options", "head"]
OUTPUT_FORMATS = "web,pdf"

OUTPUT_BASE_DIR = os.path.expanduser("~/git/docs-internal/rest-api-guide")
SIDEBAR_FILE_PATH = os.path.expanduser(
    "~/git/docs-internal/_data/sidebars/rest_api_guide_sidebar.yml"
)


def extract_api_version(path):
    """Extract API version from path.

    All paths in the OpenAPI spec have version prefixes (e.g., /v1/..., /v2/...).
    This is the single source of truth for API versions.
    """
    match = VERSION_PATTERN.match(path)
    if match:
        return f"v{match.group(1)}"

    assert False, f"Path without version prefix: {path}"


def normalize_tag_with_version(tag, path_version):
    """Normalize tag by removing any existing version suffix and adding path version.

    This ensures all tags have consistent versioning based on their actual API paths,
    fixing any inconsistencies in the OpenAPI spec tag naming.

    Examples:
    - "Network Configuration", "v2" -> ("Network Configuration V2", "Network Configuration")
    - "Network Configuration V1", "v1" -> ("Network Configuration V1", "Network Configuration")
    - "Cloud Data Fabric", "v1" -> ("Cloud Data Fabric V1", "Cloud Data Fabric")
    """
    # Strip any existing version suffix (e.g., "Network Configuration V1" -> "Network Configuration")
    base_tag = re.sub(r"\s+V\d+$", "", tag)
    # Add the version from the path
    versioned_tag = f"{base_tag} {path_version.upper()}"
    return versioned_tag, base_tag


def get_versioned_directory_name(tag, version):
    """Generate consistent directory name for versioned tag.

    Examples:
    - "Cloud Data Fabric V1", "v1" -> "cloud-data-fabric-v1"
    - "Network Configuration", "v2" -> "network-configuration-v2"
    - "Analytics V1", "v1" -> "analytics-v1"
    """
    # Remove version suffix if present (e.g., "Cloud Data Fabric V1" -> "Cloud Data Fabric")
    base_tag = re.sub(r"\s+V\d+$", "", tag)
    # Convert to lowercase, replace spaces with hyphens, append version
    return f"{base_tag.lower().replace(' ', '-')}-{version.lower()}"


def create_sidebar_entry(title, url, api_version=DEFAULT_VERSION, is_preview=False, is_deprecated=False):
    entry = {"output": OUTPUT_FORMATS, "title": title, "url": url}
    if is_preview:
        entry["preview"] = True
    if is_deprecated:
        entry["deprecated"] = True
    if api_version:
        entry["apiversion"] = api_version
    return entry


def update_frontmatter_preserving_custom_fields(md_path, updates):
    """Helper function for preserving manually added YAML keys"""
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
    """Function to generate the content for individual REST resource files"""
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
                    "description": param.get("description", ""),
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
                {"code": code, "description": response.get("description", "")}
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
    """Clean up paths for titles or filenames."""
    parts = path.strip("/").split("/")
    if remove_version and parts and parts[0].startswith("v") and parts[0][1:].isdigit():
        parts.pop(0)  # Remove the version segment
    if is_parent:
        return parts[0] if parts else ""
    return "/".join(parts)

def clean_filename(tag, filename, api_version=None):
    # Clean brackets and underscores in one pass
    filename = re.sub(r"[{}]", "_", filename.replace(f"{tag}_", ""))
    filename = re.sub(r"_+", "_", filename).strip("_")

    # Remove version prefixes (v1_, v2_, etc.)
    filename = re.sub(r"^v\d+_", "", filename)
    if api_version and api_version != DEFAULT_VERSION:
        filename = f"{api_version}_{filename}"
    return filename


def create_sidebar_title(tag, segment):
    # Tag already includes version if it's versioned (e.g., "Cloud Data Fabric V1")
    # No special cases needed - just use the tag as-is
    return f"{tag} ({segment})"


def find_tags_for_category(path_item):
    tags = set()
    for method, details in path_item.items():
        if method in HTTP_METHODS:
            if "tags" in details:
                tags.update(details["tags"])
    return tags


def process_endpoint(path, path_item, sidebar_entries_by_tag, tag_info_dict):
    """Process a single endpoint and update sidebar entries."""
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
        # Get API version from path - the single source of truth
        api_version = extract_api_version(path)

        # Normalize the tag with the path version
        versioned_tag, base_tag = normalize_tag_with_version(tag, api_version)

        # Generate directory name consistently
        tag_dir_name = get_versioned_directory_name(versioned_tag, api_version)

        tag_dir = os.path.join(OUTPUT_BASE_DIR, tag_dir_name)
        os.makedirs(tag_dir, exist_ok=True)

        # Initialize sidebar entries if needed
        if versioned_tag not in sidebar_entries_by_tag:
            sidebar_entries_by_tag[versioned_tag] = []

        # Create resource file
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

        # Add sidebar entry
        cleaned_path = clean_path(path)
        sidebar_entry = create_sidebar_entry(
            title=cleaned_path,
            url=permalink,
            api_version=api_version,
            is_preview=is_preview,
            is_deprecated=is_deprecated,
        )
        sidebar_entries_by_tag[versioned_tag].append(sidebar_entry)

        # Generate index.md if first entry for this tag
        if len(sidebar_entries_by_tag[versioned_tag]) == 1:
            # Use base_tag to look up tag info since that's what's in the OpenAPI spec
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


api_definition = interactive_version_selector()

sidebar_entries_by_tag = {}
tag_info_dict = {tag["name"]: tag for tag in api_definition["tags"]}

# Main processing loop
paths_items = list(api_definition["paths"].items())
for path, path_item in tqdm(paths_items, desc="Generating API docs", unit="endpoint"):
    process_endpoint(path, path_item, sidebar_entries_by_tag, tag_info_dict)


def version_key(entry):
    """Alphabetize entries within each tag"""
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
                        {
                            "output": "pdf",
                            "title": "",
                            "type": "frontmatter",
                            "url": "/titlepage.html",
                        },
                        {
                            "output": "pdf",
                            "title": "",
                            "type": "frontmatter",
                            "url": "/tocpage.html",
                        },
                    ],
                    "output": "pdf",
                    "title": "",
                    "type": "frontmatter",
                },
                {
                    "folderitems": [
                        {
                            "output": "web",
                            "title": "Documentation Home",
                            "url": "/index.html",
                        },
                        {
                            "output": "web",
                            "title": "Qumulo REST API Guide Home",
                            "url": "/rest-api-guide/",
                        },
                        {
                            "output": "web",
                            "title": "Contacting the Qumulo Care Team",
                            "url": "/contacting-qumulo-care-team.html",
                        },
                    ],
                    "output": "web",
                    "title": "Qumulo REST API Guide",
                    "type": "navi",
                },
            ]
        }
    ]
}

# Create unsorted list of folder entries
folders = []

# Add folderitems for each tag
for tag, entries in sidebar_entries_by_tag.items():
    # All tags should now be normalized with versions (e.g., "Tag Name V1", "Tag Name V2")
    version_match = re.match(r"^(.*)\s+V(\d+)$", tag)
    if version_match:
        base_tag = version_match.group(1)
        version_num = version_match.group(2)
        version = f"v{version_num}"
        tag_dir_name = get_versioned_directory_name(tag, version)
    else:
        # This should never happen - all tags must have versions after normalization
        assert False, f"Tag without version after normalization: {tag}"

    tag_info = tag_info_dict.get(base_tag, {"name": base_tag})
    if entries:
        # Extract the first segment from the first entry's path
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

        # If all children are preview, mark the parent as preview
        if all_preview:
            parent_entry["preview"] = True

        # If all children are deprecated, mark the parent as deprecated
        if all_deprecated:
            parent_entry["deprecated"] = True

        # Sort order is simply the version number for consistent V1 → V2 → V3 ordering
        sort_order = int(version_num)

        # Add the entry with sorting info
        folders.append((base_tag, sort_order, tag, parent_entry))

# Sort folders first by tag base, then by the specified sort order
folders.sort(key=lambda x: (x[0], x[1]))
sidebar_content["entries"][0]["folders"].extend([entry for _, _, _, entry in folders])

# Write the sidebar YAML file
with open(SIDEBAR_FILE_PATH, "w") as file:
    yaml.dump(sidebar_content, file, default_flow_style=False)

# Manually append the additional YAML content
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
