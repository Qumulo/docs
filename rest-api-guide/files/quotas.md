---
category: /files
methods:
  get:
    parameters:
    - description: Return entries after the given key (keys are returned in the paging
        object)
      name: after
      required: false
    - description: Return no more than this many entries; the system may choose a
        smaller limit.
      name: limit
      required: false
    response_body:
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"api_files_quota_entries\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"quotas\": {\n      \"type\": \"array\"\
        ,\n      \"items\": {\n        \"description\": \"quotas\",\n        \"type\"\
        : \"object\",\n        \"properties\": {\n          \"id\": {\n          \
        \  \"description\": \"Unique ID of this directory.\",\n            \"type\"\
        : \"string\"\n          },\n          \"limit\": {\n            \"description\"\
        : \"Limit in bytes of the cumulative size of this directory and its descendants.\"\
        ,\n            \"type\": \"string\"\n          }\n        }\n      }\n   \
        \ }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: List all set directory quotas.
  post:
    parameters: []
    request_body:
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"api_files_quota\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"id\": {\n      \"description\": \"Unique ID\
        \ of this directory.\",\n      \"type\": \"string\"\n    },\n    \"limit\"\
        : {\n      \"description\": \"Limit in bytes of the cumulative size of this\
        \ directory and its descendants.\",\n      \"type\": \"string\"\n    }\n \
        \ }\n}"
    response_body:
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"api_files_quota\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"id\": {\n      \"description\": \"Unique ID\
        \ of this directory.\",\n      \"type\": \"string\"\n    },\n    \"limit\"\
        : {\n      \"description\": \"Limit in bytes of the cumulative size of this\
        \ directory and its descendants.\",\n      \"type\": \"string\"\n    }\n \
        \ }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Add a directory quota.
rest_endpoint: /v1/files/quotas/
permalink: /rest-api-guide/files/quotas.html
sidebar: rest_api_guide_sidebar
---
