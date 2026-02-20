---
category: /Directory Quotas V1
methods:
  get:
    summary: List all set directory quotas.
    parameters:
    - name: after
      description: Return entries after the given key (keys are returned in the paging
        object)
      required: false
    - name: limit
      description: Return no more than this many entries; the system may choose a
        smaller limit.
      required: false
    response_body:
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
    preview: false
  post:
    summary: Add a directory quota.
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"api_files_quota\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"id\": {\n      \"description\": \"Unique ID\
        \ of this directory.\",\n      \"type\": \"string\"\n    },\n    \"limit\"\
        : {\n      \"description\": \"Limit in bytes of the cumulative size of this\
        \ directory and its descendants.\",\n      \"type\": \"string\"\n    }\n \
        \ }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
    request_body:
      schema: "{\n  \"description\": \"api_files_quota\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"id\": {\n      \"description\": \"Unique ID\
        \ of this directory.\",\n      \"type\": \"string\"\n    },\n    \"limit\"\
        : {\n      \"description\": \"Limit in bytes of the cumulative size of this\
        \ directory and its descendants.\",\n      \"type\": \"string\"\n    }\n \
        \ }\n}"
rest_endpoint: /v1/files/quotas/
api_version: v1
permalink: /rest-api-guide/directory-quotas-v1/files_quotas.html
sidebar: rest_api_guide_sidebar
redirect_from: /rest-api-guide/directory-quotas/files_quotas.html
deprecated: false
---
