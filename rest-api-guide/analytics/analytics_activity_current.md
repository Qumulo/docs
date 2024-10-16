---
category: /Analytics
methods:
  get:
    parameters:
    - description: "Filters activity to a specific type. If not specified, all activity\
        \ is returned.:\n * `file-iops-read` - file-iops-read,\n * `file-iops-write`\
        \ - file-iops-write,\n * `file-throughput-read` - file-throughput-read,\n\
        \ * `file-throughput-write` - file-throughput-write,\n * `metadata-iops-read`\
        \ - metadata-iops-read,\n * `metadata-iops-write` - metadata-iops-write"
      name: type
      required: false
    response_body:
      schema: "{\n  \"description\": \"api_rates\",\n  \"type\": \"object\",\n  \"\
        properties\": {\n    \"entries\": {\n      \"type\": \"array\",\n      \"\
        items\": {\n        \"description\": \"entries\",\n        \"type\": \"object\"\
        ,\n        \"properties\": {\n          \"id\": {\n            \"description\"\
        : \"id\",\n            \"type\": \"string\"\n          },\n          \"ip\"\
        : {\n            \"description\": \"ip\",\n            \"type\": \"string\"\
        \n          },\n          \"rate\": {\n            \"description\": \"rate\"\
        ,\n            \"type\": \"number\"\n          },\n          \"type\": {\n\
        \            \"type\": \"string\",\n            \"enum\": [\n            \
        \  \"file-iops-read\",\n              \"file-iops-write\",\n             \
        \ \"metadata-iops-read\",\n              \"metadata-iops-write\",\n      \
        \        \"file-throughput-read\",\n              \"file-throughput-write\"\
        \n            ],\n            \"description\": \"type:\\n * `file-iops-read`\
        \ - HEAT_OP_TYPE_FILE_IOPS_READ,\\n * `file-iops-write` - HEAT_OP_TYPE_FILE_IOPS_WRITE,\\\
        n * `file-throughput-read` - HEAT_OP_TYPE_FILE_THROUGHPUT_READ,\\n * `file-throughput-write`\
        \ - HEAT_OP_TYPE_FILE_THROUGHPUT_WRITE,\\n * `metadata-iops-read` - HEAT_OP_TYPE_METADATA_IOPS_READ,\\\
        n * `metadata-iops-write` - HEAT_OP_TYPE_METADATA_IOPS_WRITE\"\n         \
        \ }\n        }\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Returns the current sampled IOPS and throughput from the cluster.
rest_endpoint: /v1/analytics/activity/current
api_version: v1
permalink: /rest-api-guide/analytics/analytics_activity_current.html
sidebar: rest_api_guide_sidebar
---
