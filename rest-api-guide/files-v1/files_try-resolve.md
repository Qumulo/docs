---
category: /Files V1
methods:
  post:
    summary: 'Attempt to return the full path for each specified file ID, grouped
      by outcome: success with path, file deleted, file temporarily unavailable. Resolution
      for a temporarily unavailable file should be attempted again later. If a file
      has more than one path (due to hard links) a canonical path is chosen.'
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"fs_api_try_resolve_result\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"available\": {\n      \"type\": \"array\"\
        ,\n      \"items\": {\n        \"description\": \"Full path of each file or\
        \ directory whose path was resolved\",\n        \"type\": \"object\",\n  \
        \      \"properties\": {\n          \"id\": {\n            \"description\"\
        : \"Unique ID of this file or directory\",\n            \"type\": \"string\"\
        \n          },\n          \"path\": {\n            \"description\": \"Full\
        \ path of this file or directory\",\n            \"type\": \"string\"\n  \
        \        }\n        }\n      }\n    },\n    \"unavailable\": {\n      \"type\"\
        : \"array\",\n      \"items\": {\n        \"description\": \"File IDs that\
        \ are temporarily unavailable\",\n        \"type\": \"string\"\n      }\n\
        \    },\n    \"deleted\": {\n      \"type\": \"array\",\n      \"items\":\
        \ {\n        \"description\": \"File IDs that have been deleted\",\n     \
        \   \"type\": \"string\"\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
    request_body:
      schema: "{\n  \"description\": \"fs_api_try_resolve_request\",\n  \"type\":\
        \ \"object\",\n  \"properties\": {\n    \"ids\": {\n      \"type\": \"array\"\
        ,\n      \"items\": {\n        \"description\": \"File IDs to resolve\",\n\
        \        \"type\": \"string\"\n      }\n    },\n    \"snapshot\": {\n    \
        \  \"description\": \"Snapshot to resolve against. Defaults to the live filesystem.\"\
        ,\n      \"type\": \"number\"\n    }\n  }\n}"
rest_endpoint: /v1/files/try-resolve
api_version: v1
deprecated: false
permalink: /rest-api-guide/files-v1/files_try-resolve.html
sidebar: rest_api_guide_sidebar
---
