---
category: /Cloud Data Fabric
methods:
  get:
    parameters: []
    preview: false
    response_body:
      schema: "{\n  \"type\": \"array\",\n  \"items\": {\n    \"description\": \"\
        api_portal_fs_info\",\n    \"type\": \"object\",\n    \"properties\": {\n\
        \      \"uuid\": {\n        \"description\": \"File System UUID\",\n     \
        \   \"type\": \"string\"\n      },\n      \"usage_bytes\": {\n        \"description\"\
        : \"Capacity used by portal data in bytes\",\n        \"type\": \"string\"\
        \n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Retrieve portal information for all file systems.
rest_endpoint: /v1/portal/file-systems/
api_version: v1
permalink: /rest-api-guide/cloud-data-fabric/portal_file-systems.html
sidebar: rest_api_guide_sidebar
redirect_from:
  - /rest-api-guide/global-namespace/portal_file-systems.html
---
