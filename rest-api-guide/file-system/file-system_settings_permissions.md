---
category: /File System
methods:
  get:
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"api_permissions_settings\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"mode\": {\n      \"type\": \"string\"\
        ,\n      \"enum\": [\n        \"NATIVE\",\n        \"_DEPRECATED_MERGED_V1\"\
        ,\n        \"CROSS_PROTOCOL\"\n      ],\n      \"description\": \"mode:\\\
        n * `CROSS_PROTOCOL` - CROSS_PROTOCOL,\\n * `NATIVE` - NATIVE,\\n * `_DEPRECATED_MERGED_V1`\
        \ - _DEPRECATED_MERGED_V1\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Get permissions settings.
  put:
    parameters: []
    request_body:
      schema: "{\n  \"description\": \"api_permissions_settings\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"mode\": {\n      \"type\": \"string\"\
        ,\n      \"enum\": [\n        \"NATIVE\",\n        \"_DEPRECATED_MERGED_V1\"\
        ,\n        \"CROSS_PROTOCOL\"\n      ],\n      \"description\": \"mode:\\\
        n * `CROSS_PROTOCOL` - CROSS_PROTOCOL,\\n * `NATIVE` - NATIVE,\\n * `_DEPRECATED_MERGED_V1`\
        \ - _DEPRECATED_MERGED_V1\"\n    }\n  }\n}"
    response_body:
      schema: "{\n  \"description\": \"api_permissions_settings\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"mode\": {\n      \"type\": \"string\"\
        ,\n      \"enum\": [\n        \"NATIVE\",\n        \"_DEPRECATED_MERGED_V1\"\
        ,\n        \"CROSS_PROTOCOL\"\n      ],\n      \"description\": \"mode:\\\
        n * `CROSS_PROTOCOL` - CROSS_PROTOCOL,\\n * `NATIVE` - NATIVE,\\n * `_DEPRECATED_MERGED_V1`\
        \ - _DEPRECATED_MERGED_V1\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Set permissions settings.
rest_endpoint: /v1/file-system/settings/permissions
api_version: v1
permalink: /rest-api-guide/file-system/file-system_settings_permissions.html
sidebar: rest_api_guide_sidebar
---
