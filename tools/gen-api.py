import os
import json
import yaml
import requests
import re
from tqdm import tqdm

# Helper function for preserving manually added YAML keys
def update_frontmatter_preserving_custom_fields(md_path, updates):
    def create_directory(path):
        if not os.path.exists(path):
            os.makedirs(path)

    create_directory(os.path.dirname(md_path))

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
            val = yaml.dump({key: updates[key]}, default_flow_style=False, sort_keys=False).strip()
            new_lines.extend(val.splitlines())
            keys_updated.add(key)
            skip_key = key
        else:
            new_lines.append(line)

    for key, val in updates.items():
        if key not in keys_updated:
            val_str = yaml.dump({key: val}, default_flow_style=False, sort_keys=False).strip()
            new_lines.extend(val_str.splitlines())

    with open(md_path, "w") as f:
        f.write("---\n")
        f.write("\n".join(new_lines) + "\n")
        f.write("---\n")
        f.write(body)

# URL to fetch the OpenAPI definition
while True:
    version_input = input("Which version of REST API docs to generate docs for? Enter a valid Qumulo Core version or q to quit. ").strip()
    if version_input.lower() == 'q':
        print("Exiting.")
        exit(0)

    url = f"https://artifacts.eng.qumulo.com/release/{version_input}/src/build/debug/iodocs/openapi.json"
    print(f"Building REST API documentation from {url} ...")

    try:
        response = requests.get(url)
        response.raise_for_status()
        api_definition = response.json()
        break
    except (requests.RequestException, json.JSONDecodeError):
        print("Enter a valid Qumulo Core version or q to quit.")

# Define the base directory for output
output_base_dir = os.path.expanduser("~/git/docs-internal/rest-api-guide")
sidebar_file_path = os.path.expanduser("~/git/docs-internal/_data/sidebars/rest_api_guide_sidebar.yml")

# Hard-coded tag configuration for all exceptions
TAG_CONFIG = {
    # Format: "Tag Name": (sort_order, api_version_for_parent, api_version_for_children)
    "Network Configuration V1": (1, None, "v1"),     # Sort first, no parent tag
    "Network Configuration": (2, "v2", "v2"),        # Sort second, parent tag v2
    "NFS Methods V2": (1, "v2", "v2"),               # Sort first, parent tag v2
    "NFS Methods": (2, "v3", "v3"),                  # Sort second, parent tag v3
    "SMB Shares Methods V1": (1, None, "v1"),        # Sort first, no parent tag
    "SMB Shares Methods V2": (2, "v2", "v2"),        # Sort second, parent tag v2
    "SMB Shares Methods": (3, "v3", "v3"),           # Sort third, parent tag v3

    # Deal with dual-tagged APIs
    "Configured Node Management": (1, None, "v1"),
    "Unconfigured Node Management": (2, None, "v1")
}

# Function to create the directory if it does not exist
def create_directory(path):
    if not os.path.exists(path):
        os.makedirs(path)

# Function to write markdown files
def write_markdown(file_path, content):
    with open(file_path, "w") as file:
        file.write(content)

# Function to generate the content for index.md
def generate_index_md(tag, title, tag_info):
    return f"""---
layout: landing_page
sidebar: rest_api_guide_sidebar
summary: "{tag_info['description']}"
title: {title}
---
"""

# Function to generate the content for individual REST resource files
def generate_resource_md(tag, endpoint, methods, permalink, api_version=None):
    yaml_content = {
        "category": f"/{tag}",
        "rest_endpoint": endpoint,
        "methods": {}
    }

    for method, details in methods.items():
        response_details = details.get("responses", {})
        response_body = response_details.get("200", {}).get("content", {}).get("application/json", {})
        request_body = details.get("requestBody", {}).get("content", {}).get("application/json", {})

        is_preview = "[preview]" in details.get("summary", "").lower()
        
        method_details = {
            "summary": details.get("summary", ""),
            "parameters": [
                {"name": param["name"], "description": param.get("description", ""), "required": param.get("required", False)}
                for param in details.get("parameters", [])
            ],
            "response_body": {
                "schema": json.dumps(response_body.get("schema", ""), indent=2)
            } if response_body else {},
            "responses": [
                {"code": code, "description": response.get("description", "")}
                for code, response in response_details.items()
            ],
            "preview": is_preview
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

# Function to clean up filenames
def clean_filename(tag, filename, api_version=None):
    filename = filename.replace(f'{tag}_', '').replace('{', '_').replace('}', '').replace('__', '_').strip('_')
    filename = filename.replace('v1_', '').replace('v2_', '').replace('v3_', '').replace('v4_', '').replace('v5_', '')
    if api_version and api_version != 'v1':
        filename = f"{api_version}_{filename}"
    return filename

# Function to create the sidebar title from the tag and segment
def create_sidebar_title(tag, segment):
    # Special case for Configured Node Management
    if tag == "Configured Node Management":
        return f"Node Management ({segment})"
    return f"{tag} ({segment})"

# Function to find the tag for a category based on the path item
def find_tags_for_category(path_item):
    tags = set()
    for method, details in path_item.items():
        if method in ["get", "post", "put", "delete", "patch", "options", "head"]:
            if "tags" in details:
                tags.update(details["tags"])
    return tags

# Function to clean up path for titles
def clean_path_for_title(path, is_parent=False):
    parts = path.strip('/').split('/')
    if parts[0].startswith('v') and parts[0][1:].isdigit():
        parts.pop(0)  # Remove the version segment
    if is_parent:
        return parts[0]
    return '/'.join(parts)

# Function to determine API version for a tag
def get_api_version_for_tag(tag, path):
    # If tag is in our config, use the specified child version
    if tag in TAG_CONFIG:
        return TAG_CONFIG[tag][2]
    
    # Default: determine by path
    if path.startswith('/v2'):
        return 'v2'
    elif path.startswith('/v3'):
        return 'v3'
    elif path.startswith('/v4'):
        return 'v4'
    elif path.startswith('/v5'):
        return 'v5'
    else:
        return 'v1'

# Fetch the OpenAPI definition
response = requests.get(url)
api_definition = response.json()

# Dictionary to store sidebar entries grouped by tag
sidebar_entries_by_tag = {}

# Dictionary to store the tag information
tag_info_dict = {tag['name']: tag for tag in api_definition['tags']}

# Main processing logic
paths_items = list(api_definition["paths"].items())
for path, path_item in tqdm(paths_items, desc="Generating API docs", unit="endpoint"):
    path_segments = path.strip("/").split("/")
    if path == "/openapi.json" or len(path_segments) < 2:
        if path != "/openapi.json":
            tqdm.write(f"Skipping path {repr(path)} (segments: {len(path_segments)}): too short.")
        continue
    
    # Find the tags for the category
    tags = find_tags_for_category(path_item)
    if not tags:
        tqdm.write(f"Skipping path '{path}' as it does not have any tags.")
        continue

    is_preview = any("[preview]" in details.get("summary", "").lower() for details in path_item.values())

    for tag in tags:
        # Get API version using our function
        api_version = get_api_version_for_tag(tag, path)
        
        tag_dir = os.path.join(output_base_dir, tag.lower().replace(" ", "-"))
        create_directory(tag_dir)

        # Initialize the sidebar entries dictionary for the tag if not already present
        if tag not in sidebar_entries_by_tag:
            sidebar_entries_by_tag[tag] = []

        # Clean up filename and write the individual resource file
        resource_name = path.strip("/").replace("/", "_").replace("{", "_").replace("}", "")
        resource_filename = clean_filename(tag, f"{resource_name}.md", api_version)
        resource_md_path = os.path.join(tag_dir, resource_filename)
        permalink = f"/rest-api-guide/{tag.lower().replace(' ', '-')}/{resource_filename.replace('.md', '.html')}"
        resource_md_content, yaml_content = generate_resource_md(tag, path, path_item, permalink, api_version)
        update_frontmatter_preserving_custom_fields(resource_md_path, {
            "category": f"/{tag}",
            "methods": yaml_content["methods"],
            "rest_endpoint": path,
            "api_version": api_version,
            "permalink": permalink,
            "sidebar": "rest_api_guide_sidebar"
        })

        # Clean path for child title
        cleaned_path = clean_path_for_title(path)

        # Add entry to sidebar entries
        sidebar_entry = {
            "output": "web,pdf",
            "title": cleaned_path,  # Use the cleaned path for the child title
            "url": permalink
        }

        if is_preview:
            sidebar_entry["preview"] = True

        if api_version != 'v1':
            sidebar_entry["apiversion"] = api_version

        sidebar_entries_by_tag[tag].append(sidebar_entry)

        # Generate the index.md file for the tag
        if len(sidebar_entries_by_tag[tag]) == 1:  # Only create the index.md once per tag
            tag_info = tag_info_dict.get(tag, {'name': tag, 'description': 'Listing of commands for ' + tag})
            first_segment = clean_path_for_title(path, is_parent=True)
            index_md_title = create_sidebar_title(tag, first_segment)
            index_md_content = generate_index_md(tag, index_md_title, tag_info)
            index_md_path = os.path.join(tag_dir, "index.md")
            write_markdown(index_md_path, index_md_content)

# Alphabetize entries within each tag
def version_key(entry):
    version = entry.get('apiversion', 'v1').replace('v', '')
    return int(version)

for tag in sidebar_entries_by_tag:
    sidebar_entries_by_tag[tag] = sorted(sidebar_entries_by_tag[tag], key=lambda x: (x["title"], version_key(x)))

# Generate sidebar YAML content
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
                            "url": "/titlepage.html"
                        },
                        {
                            "output": "pdf",
                            "title": "",
                            "type": "frontmatter",
                            "url": "/tocpage.html"
                        }
                    ],
                    "output": "pdf",
                    "title": "",
                    "type": "frontmatter"
                },
                {
                    "folderitems": [
                        {
                            "output": "web",
                            "title": "Documentation Home",
                            "url": "/index.html"
                        },
                        {
                            "output": "web",
                            "title": "Qumulo REST API Guide Home",
                            "url": "/rest-api-guide/"
                        },
                        {
                            "output": "web",
                            "title": "Contacting the Qumulo Care Team",
                            "url": "/contacting-qumulo-care-team.html"
                        }
                    ],
                    "output": "web",
                    "title": "Qumulo REST API Guide",
                    "type": "navi"
                }
            ]
        }
    ]
}

# Create unsorted list of folder entries
folders = []

# Add folderitems for each tag
for tag, entries in sidebar_entries_by_tag.items():
    tag_info = tag_info_dict.get(tag, {'name': tag})
    if entries:
        # Extract the first segment from the first entry's path
        first_segment = clean_path_for_title(entries[0]["title"], is_parent=True)
        parent_title = create_sidebar_title(tag, first_segment)

        # Check if all child entries don't have preview: false
        all_preview = all(entry.get("preview", False) for entry in entries)

        # Create the parent folder entry
        parent_entry = {
            "folderitems": entries,
            "output": "web,pdf",
            "title": parent_title,
            "url": f"/rest-api-guide/{tag.lower().replace(' ', '-')}/"
        }

        # If all children are preview, mark the parent as preview
        if all_preview:
            parent_entry["preview"] = True

        # Get config for this tag if it exists
        tag_config = TAG_CONFIG.get(tag)
        if tag_config:
            sort_order = tag_config[0]
            parent_version = tag_config[1]
            
            # Add parent version tag if specified
            if parent_version and parent_version != 'v1':
                parent_entry["apiversion"] = parent_version
        else:
            # Default sort order for non-configured tags
            sort_order = 100
            
            # For non-configured tags, if all children have the same non-v1 version, add it to parent
            all_versions = set(entry.get('apiversion', 'v1') for entry in entries)
            if len(all_versions) == 1 and 'v1' not in all_versions:
                parent_entry["apiversion"] = next(iter(all_versions))
        
        # For sorting, extract tag base name (strip V1, V2, etc.)
        tag_base = tag
        if " V" in tag and tag[-2:] in ["V1", "V2", "V3", "V4", "V5"]:
            tag_base = tag[:-3]
            
        # Add the entry with sorting info
        folders.append((tag_base, sort_order, tag, parent_entry))

# Sort folders first by tag base, then by the specified sort order
folders.sort(key=lambda x: (x[0], x[1]))

# Add sorted folders to the sidebar
sidebar_content["entries"][0]["folders"].extend([entry for _, _, _, entry in folders])

# Write the sidebar YAML file
with open(sidebar_file_path, "w") as file:
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

with open(sidebar_file_path, "a") as file:
    file.write(additional_yaml_content)

print("API documentation generation completed.")
