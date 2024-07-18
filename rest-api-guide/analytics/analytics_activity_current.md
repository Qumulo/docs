---
category: /analytics
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
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Returns the current sampled IOPS and throughput from the cluster.
rest_endpoint: /v1/analytics/activity/current
permalink: /rest-api-guide/analytics/analytics_activity_current.html
sidebar: rest_api_command_guide_sidebar
---
