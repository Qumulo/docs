import os
import json
import yaml
import requests

# URL to fetch the OpenAPI definition
url = "https://music.eng.qumulo.com:8000/openapi.json"

# Define the base directory for output
output_base_dir = os.path.expanduser("~/git/docs-internal/rest-api-guide")
sidebar_file_path = os.path.expanduser("~/git/docs-internal/_data/sidebars/rest_api_command_guide_sidebar.yml")

# Function to create the directory if it does not exist
def create_directory(path):
    if not os.path.exists(path):
        os.makedirs(path)

# Function to write markdown files
def write_markdown(file_path, content):
    with open(file_path, "w") as file:
        file.write(content)

# Function to generate the content for index.md
def generate_index_md(category):
    return f"""---
layout: landing_page
sidebar: rest_api_command_guide_sidebar
summary: Listing of commands for {category}
title: {category}
---
"""

# Function to generate the content for individual REST resource files
def generate_resource_md(category, endpoint, methods):
    yaml_content = {
        "category": f"/{category}",
        "rest_endpoint": endpoint,
        "methods": {}
    }

    for method, details in methods.items():
        method_details = {
            "summary": details.get("summary", ""),
            "parameters": [
                {"name": param["name"], "description": param.get("description", ""), "required": param.get("required", False)}
                for param in details.get("parameters", [])
            ],
            "response_body": {
                "status_code": list(details.get("responses", {}).keys())[0],
                "description": details["responses"][list(details.get("responses", {}).keys())[0]]["description"],
                "example_value": "TO DO",
                "schema": "TO DO"
            }
        }
        
        if "requestBody" in details:
            method_details["request_body"] = {
                "example_value": "TO DO",
                "schema": "TO DO"
            }

        yaml_content["methods"][method] = method_details

    yaml_string = yaml.dump(yaml_content, default_flow_style=False)
    return f"---\n{yaml_string}sidebar: rest_api_command_guide_sidebar\n---\n"

# Function to clean up filenames
def clean_filename(filename):
    filename = filename.replace('{', '').replace('}', '')
    filename = filename.replace('v1_', '')
    filename = filename.replace('-_', '-')
    return filename

# Function to create the sidebar title from the path
def create_sidebar_title(path):
    # Remove leading /v1 and replace parameters {param} with {param}
    return path.replace('/v1', '').replace('{', '{').replace('}', '}')

# Fetch the OpenAPI definition
response = requests.get(url)
api_definition = response.json()

# List to store sidebar entries
sidebar_entries = []

# Main processing logic
for path, path_item in api_definition["paths"].items():
    path_segments = path.strip("/").split("/")
    if len(path_segments) < 2:
        print(f"Skipping path '{path}' as it does not have enough segments.")
        continue
    
    # Extract category from the path
    category = path_segments[1]
    category_dir = os.path.join(output_base_dir, category)

    # Create category directory if it does not exist
    create_directory(category_dir)

    # Write the index.md file for the category
    index_md_path = os.path.join(category_dir, "index.md")
    if not os.path.exists(index_md_path):
        index_md_content = generate_index_md(category)
        write_markdown(index_md_path, index_md_content)

    # Clean up filename and write the individual resource file
    resource_filename = clean_filename(f"{path.strip('/').replace('/', '_')}.md")
    resource_md_path = os.path.join(category_dir, resource_filename)
    resource_md_content = generate_resource_md(category, path, path_item)
    write_markdown(resource_md_path, resource_md_content)

    # Add entry to sidebar entries
    sidebar_entries.append({
        "output": "web,pdf",
        "title": create_sidebar_title(path),
        "url": f"/rest-api-guide/{category}/{resource_filename}"
    })

# Generate sidebar YAML content
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
                    "type": "frontmatter"
                },
                {
                    "folderitems": [
                        {"output": "web", "title": "Documentation Home", "url": "/index.html"},
                        {"output": "web", "title": "Qumulo REST API Guide Home", "url": "/rest-api-guide/"},
                        {"output": "web", "title": "Contacting the Qumulo Care Team", "url": "/contacting-qumulo-care-team.html"},
                    ],
                    "output": "web",
                    "title": "Qumulo REST API Guide",
                    "type": "navi"
                },
                {
                    "folderitems": sidebar_entries,
                    "output": "web,pdf",
                    "title": "API Endpoints",
                    "type": "navi"
                }
            ]
        }
    ]
}

# Write the sidebar YAML file
with open(sidebar_file_path, "w") as file:
    yaml.dump(sidebar_content, file, default_flow_style=False)

print("API documentation generation completed.")

