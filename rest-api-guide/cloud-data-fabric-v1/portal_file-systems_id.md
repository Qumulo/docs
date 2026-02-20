---
category: /Cloud Data Fabric V1
methods:
  get:
    summary: Retrieve portal information for a file system.
    parameters:
    - name: id
      description: File System UUID
      required: true
    response_body:
      schema: "{\n  \"description\": \"v1_portal_fs_info\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"uuid\": {\n      \"description\": \"File System\
        \ UUID\",\n      \"type\": \"string\"\n    },\n    \"usage_bytes\": {\n  \
        \    \"description\": \"Capacity used by portal data in bytes\",\n      \"\
        type\": \"string\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
rest_endpoint: /v1/portal/file-systems/{id}
api_version: v1
permalink: /rest-api-guide/cloud-data-fabric-v1/portal_file-systems_id.html
sidebar: rest_api_guide_sidebar
redirect_from: /rest-api-guide/cloud-data-fabric/portal_file-systems_id.html
deprecated: false
---
