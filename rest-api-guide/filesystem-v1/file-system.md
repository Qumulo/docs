---
category: /Filesystem V1
methods:
  get:
    summary: Retrieve general filesystem statistics.
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"api_fs_attributes\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"block_size_bytes\": {\n      \"description\"\
        : \"Filesystem block size in bytes\",\n      \"type\": \"number\"\n    },\n\
        \    \"total_size_bytes\": {\n      \"description\": \"Total filesystem size\
        \ in bytes\",\n      \"type\": \"string\"\n    },\n    \"free_size_bytes\"\
        : {\n      \"description\": \"Available filesystem size in bytes\",\n    \
        \  \"type\": \"string\"\n    },\n    \"snapshot_size_bytes\": {\n      \"\
        description\": \"Capacity used by all snapshots in bytes\",\n      \"type\"\
        : \"string\"\n    },\n    \"portal_cache_size_bytes\": {\n      \"description\"\
        : \"Capacity used by portal caching in bytes. Does not count against free_size_bytes\"\
        ,\n      \"type\": \"string\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
rest_endpoint: /v1/file-system
api_version: v1
deprecated: false
permalink: /rest-api-guide/filesystem-v1/file-system.html
sidebar: rest_api_guide_sidebar
---
