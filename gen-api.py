import os
import json
import yaml
import requests

# URL to fetch the OpenAPI definition
url = "https://music.eng.qumulo.com:8000/openapi.json"

# Define the base directory for output
output_base_dir = os.path.expanduser("~/git/docs-internal/rest-api-guide")
sidebar_file_path = os.path.expanduser("~/git/docs-internal/_data/sidebars/rest_api_guide_sidebar.yml")

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
            ]
        }

        if request_body:
            method_details["request_body"] = {
                "schema": json.dumps(request_body.get("schema", ""), indent=2)
            }

        yaml_content["methods"][method] = method_details

    yaml_string = yaml.dump(yaml_content, default_flow_style=False)
    version_string = f"api_version: {api_version}\n" if api_version else ""
    return f"---\n{yaml_string}{version_string}permalink: {permalink}\nsidebar: rest_api_guide_sidebar\n---\n"

# Function to clean up filenames
def clean_filename(tag, filename, api_version=None):
    filename = filename.replace(f'{tag}_', '').replace('{', '_').replace('}', '').replace('__', '_').strip('_')
    filename = filename.replace('v1_', '').replace('v2_', '').replace('v3_', '').replace('v4_', '')
    if api_version and api_version != 'v1':
        filename = f"{api_version}_{filename}"
    return filename

# Function to create the sidebar title from the tag and segment
def create_sidebar_title(tag, segment):
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
    if len(parts) > 1:
        parts.pop(0)  # Remove the first segment
    return '/'.join(parts)

# Fetch the OpenAPI definition
response = requests.get(url)
api_definition = response.json()

# Dictionary to store sidebar entries grouped by tag
sidebar_entries_by_tag = {}

# Dictionary to store the tag information
tag_info_dict = {tag['name']: tag for tag in api_definition['tags']}

# Main processing logic
for path, path_item in api_definition["paths"].items():
    path_segments = path.strip("/").split("/")
    if len(path_segments) < 2:
        print(f"Skipping path '{path}' as it does not have enough segments.")
        continue
    
    # Find the tags for the category
    tags = find_tags_for_category(path_item)
    if not tags:
        print(f"Skipping path '{path}' as it does not have any tags.")
        continue

    # Determine API version
    if path.startswith('/v2'):
        api_version = 'v2'
    elif path.startswith('/v3'):
        api_version = 'v3'
    elif path.startswith('/v4'):
        api_version = 'v4'
    else:
        api_version = 'v1'

    for tag in tags:
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
        resource_md_content = generate_resource_md(tag, path, path_item, permalink, api_version)
        write_markdown(resource_md_path, resource_md_content)

        # Clean path for child title
        cleaned_path = clean_path_for_title(path)

        # Add entry to sidebar entries
        sidebar_entry = {
            "output": "web,pdf",
            "title": cleaned_path,  # Use the cleaned path for the child title
            "url": permalink
        }

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

# Add folderitems for each tag
for tag, entries in sidebar_entries_by_tag.items():
    tag_info = tag_info_dict.get(tag, {'name': tag})
    if entries:
        parent_title = f"{tag} ({entries[0]['title'].split('/')[0]})"
        sidebar_content["entries"][0]["folders"].append({
            "folderitems": entries,
            "output": "web,pdf",
            "title": parent_title,
            "url": f"/rest-api-guide/{tag.lower().replace(' ', '-')}/"
        })

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

