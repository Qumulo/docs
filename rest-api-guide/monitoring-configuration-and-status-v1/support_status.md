---
category: /Monitoring Configuration and Status V1
methods:
  get:
    summary: 'List the monitoring status of all nodes: whether various kinds of monitoring
      connections are enabled/connected/etc.'
    parameters: []
    response_body:
      schema: "{\n  \"type\": \"array\",\n  \"items\": {\n    \"description\": \"\
        api_node_monitoring_status\",\n    \"type\": \"object\",\n    \"properties\"\
        : {\n      \"node_id\": {\n        \"description\": \"Node Id\",\n       \
        \ \"type\": \"number\"\n      },\n      \"monitoring\": {\n        \"type\"\
        : \"string\",\n        \"enum\": [\n          \"DISABLED\",\n          \"\
        IN_PROGRESS\",\n          \"CONNECTED\",\n          \"ERROR\",\n         \
        \ \"ERROR_PENDING\"\n        ],\n        \"description\": \"monitoring:\\\
        n * `CONNECTED` - Connection successful,\\n * `DISABLED` - Service is not\
        \ enabled,\\n * `ERROR` - Connection has been down for 5 minutes,\\n * `ERROR_PENDING`\
        \ - Connection error on last attempt,\\n * `IN_PROGRESS` - Status has not\
        \ yet been reported\"\n      },\n      \"file_upload\": {\n        \"type\"\
        : \"string\",\n        \"enum\": [\n          \"DISABLED\",\n          \"\
        IN_PROGRESS\",\n          \"CONNECTED\",\n          \"ERROR\",\n         \
        \ \"ERROR_PENDING\"\n        ],\n        \"description\": \"file_upload:\\\
        n * `CONNECTED` - Connection successful,\\n * `DISABLED` - Service is not\
        \ enabled,\\n * `ERROR` - Connection has been down for 5 minutes,\\n * `ERROR_PENDING`\
        \ - Connection error on last attempt,\\n * `IN_PROGRESS` - Status has not\
        \ yet been reported\"\n      },\n      \"vpn_connection\": {\n        \"type\"\
        : \"string\",\n        \"enum\": [\n          \"DISABLED\",\n          \"\
        IN_PROGRESS\",\n          \"CONNECTED\",\n          \"ERROR\",\n         \
        \ \"ERROR_PENDING\"\n        ],\n        \"description\": \"vpn_connection:\\\
        n * `CONNECTED` - Connection successful,\\n * `DISABLED` - Service is not\
        \ enabled,\\n * `ERROR` - Connection has been down for 5 minutes,\\n * `ERROR_PENDING`\
        \ - Connection error on last attempt,\\n * `IN_PROGRESS` - Status has not\
        \ yet been reported\"\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
rest_endpoint: /v1/support/status/
api_version: v1
permalink: /rest-api-guide/monitoring-configuration-and-status-v1/support_status.html
sidebar: rest_api_guide_sidebar
redirect_from: /rest-api-guide/monitoring-configuration-and-status/support_status.html
deprecated: false
---
