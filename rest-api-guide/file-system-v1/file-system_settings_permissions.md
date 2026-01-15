---
category: /File System V1
methods:
  put:
    summary: Set permissions settings.
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"api_permissions_settings\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"mode\": {\n      \"type\": \"string\"\
        ,\n      \"enum\": [\n        \"NATIVE\",\n        \"_DEPRECATED_MERGED_V1\"\
        ,\n        \"CROSS_PROTOCOL\",\n        \"CROSS_PROTOCOL_POSIX_PRIORITY\"\n\
        \      ],\n      \"description\": \"mode:\\n * `CROSS_PROTOCOL` - CROSS_PROTOCOL,\\\
        n * `CROSS_PROTOCOL_POSIX_PRIORITY` - CROSS_PROTOCOL_POSIX_PRIORITY,\\n *\
        \ `NATIVE` - NATIVE,\\n * `_DEPRECATED_MERGED_V1` - _DEPRECATED_MERGED_V1\"\
        \n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
    request_body:
      schema: "{\n  \"description\": \"api_permissions_settings\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"mode\": {\n      \"type\": \"string\"\
        ,\n      \"enum\": [\n        \"NATIVE\",\n        \"_DEPRECATED_MERGED_V1\"\
        ,\n        \"CROSS_PROTOCOL\",\n        \"CROSS_PROTOCOL_POSIX_PRIORITY\"\n\
        \      ],\n      \"description\": \"mode:\\n * `CROSS_PROTOCOL` - CROSS_PROTOCOL,\\\
        n * `CROSS_PROTOCOL_POSIX_PRIORITY` - CROSS_PROTOCOL_POSIX_PRIORITY,\\n *\
        \ `NATIVE` - NATIVE,\\n * `_DEPRECATED_MERGED_V1` - _DEPRECATED_MERGED_V1\"\
        \n    }\n  }\n}"
  get:
    summary: Get permissions settings.
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"api_permissions_settings\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"mode\": {\n      \"type\": \"string\"\
        ,\n      \"enum\": [\n        \"NATIVE\",\n        \"_DEPRECATED_MERGED_V1\"\
        ,\n        \"CROSS_PROTOCOL\",\n        \"CROSS_PROTOCOL_POSIX_PRIORITY\"\n\
        \      ],\n      \"description\": \"mode:\\n * `CROSS_PROTOCOL` - CROSS_PROTOCOL,\\\
        n * `CROSS_PROTOCOL_POSIX_PRIORITY` - CROSS_PROTOCOL_POSIX_PRIORITY,\\n *\
        \ `NATIVE` - NATIVE,\\n * `_DEPRECATED_MERGED_V1` - _DEPRECATED_MERGED_V1\"\
        \n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
rest_endpoint: /v1/file-system/settings/permissions
api_version: v1
permalink: /rest-api-guide/file-system-v1/file-system_settings_permissions.html
sidebar: rest_api_guide_sidebar
redirect_from: /rest-api-guide/file-system/file-system_settings_permissions.html
---
