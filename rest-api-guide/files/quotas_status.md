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
      description: Return value on success
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"api_files_quota_status_entries\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"quotas\": {\n      \"type\": \"\
        array\",\n      \"items\": {\n        \"description\": \"quotas\",\n     \
        \   \"type\": \"object\",\n        \"properties\": {\n          \"id\": {\n\
        \            \"description\": \"Unique ID of this directory.\",\n        \
        \    \"type\": \"string\"\n          },\n          \"path\": {\n         \
        \   \"description\": \"Full path of this directory.\",\n            \"type\"\
        : \"string\"\n          },\n          \"limit\": {\n            \"description\"\
        : \"Limit in bytes of the cumulative size of this directory and its descendants.\"\
        ,\n            \"type\": \"string\"\n          },\n          \"capacity_usage\"\
        : {\n            \"description\": \"Capacity used by this directory and all\
        \ of its children, in bytes.\",\n            \"type\": \"string\"\n      \
        \    }\n        }\n      }\n    }\n  }\n}"
      status_code: '200'
    summary: List all directory quotas and their corresponding directories' paths
      and cumulative sizes.
rest_endpoint: /v1/files/quotas/status/
permalink: /rest-api-guide/files/quotas_status.html
sidebar: rest_api_guide_sidebar
---
