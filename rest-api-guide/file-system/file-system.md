---
category: /file-system
methods:
  get:
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"api_fs_attributes\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"block_size_bytes\": {\n      \"description\"\
        : \"File system block size in bytes\",\n      \"type\": \"number\"\n    },\n\
        \    \"total_size_bytes\": {\n      \"description\": \"Total file system size\
        \ in bytes\",\n      \"type\": \"string\"\n    },\n    \"free_size_bytes\"\
        : {\n      \"description\": \"Available file system size in bytes\",\n   \
        \   \"type\": \"string\"\n    },\n    \"snapshot_size_bytes\": {\n      \"\
        description\": \"Capacity used by all snapshots in bytes\",\n      \"type\"\
        : \"string\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Retrieve general file system statistics.
rest_endpoint: /v1/file-system
permalink: /rest-api-guide/file-system/file-system.html
sidebar: rest_api_guide_sidebar
---
