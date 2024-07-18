---
category: /support
methods:
  get:
    parameters: []
    response_body:
      example_value: '"TO DO"'
      schema: "{\n  \"type\": \"array\",\n  \"items\": {\n    \"description\": \"\
        api_node_monitoring_status\",\n    \"type\": \"object\",\n    \"properties\"\
        : {\n      \"node_id\": {\n        \"description\": \"Node Id\",\n       \
        \ \"type\": \"number\"\n      },\n      \"monitoring\": {\n        \"type\"\
        : \"string\",\n        \"enum\": [\n          \"DISABLED\",\n          \"\
        IN_PROGRESS\",\n          \"CONNECTED\",\n          \"ERROR\",\n         \
        \ \"ERROR_PENDING\"\n        ],\n        \"description\": \"monitoring:\\\
        n * `CONNECTED` - MONITORING_CONNECTION_STATE_CONNECTED,\\n * `DISABLED` -\
        \ MONITORING_CONNECTION_STATE_DISABLED,\\n * `ERROR` - MONITORING_CONNECTION_STATE_ERROR,\\\
        n * `ERROR_PENDING` - MONITORING_CONNECTION_STATE_ERROR_PENDING,\\n * `IN_PROGRESS`\
        \ - MONITORING_CONNECTION_STATE_IN_PROGRESS\"\n      },\n      \"file_upload\"\
        : {\n        \"type\": \"string\",\n        \"enum\": [\n          \"DISABLED\"\
        ,\n          \"IN_PROGRESS\",\n          \"CONNECTED\",\n          \"ERROR\"\
        ,\n          \"ERROR_PENDING\"\n        ],\n        \"description\": \"file_upload:\\\
        n * `CONNECTED` - MONITORING_CONNECTION_STATE_CONNECTED,\\n * `DISABLED` -\
        \ MONITORING_CONNECTION_STATE_DISABLED,\\n * `ERROR` - MONITORING_CONNECTION_STATE_ERROR,\\\
        n * `ERROR_PENDING` - MONITORING_CONNECTION_STATE_ERROR_PENDING,\\n * `IN_PROGRESS`\
        \ - MONITORING_CONNECTION_STATE_IN_PROGRESS\"\n      },\n      \"vpn_connection\"\
        : {\n        \"type\": \"string\",\n        \"enum\": [\n          \"DISABLED\"\
        ,\n          \"IN_PROGRESS\",\n          \"CONNECTED\",\n          \"ERROR\"\
        ,\n          \"ERROR_PENDING\"\n        ],\n        \"description\": \"vpn_connection:\\\
        n * `CONNECTED` - MONITORING_CONNECTION_STATE_CONNECTED,\\n * `DISABLED` -\
        \ MONITORING_CONNECTION_STATE_DISABLED,\\n * `ERROR` - MONITORING_CONNECTION_STATE_ERROR,\\\
        n * `ERROR_PENDING` - MONITORING_CONNECTION_STATE_ERROR_PENDING,\\n * `IN_PROGRESS`\
        \ - MONITORING_CONNECTION_STATE_IN_PROGRESS\"\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: 'List the monitoring status of all nodes: whether various kinds of monitoring
      connections are enabled/connected/etc.'
rest_endpoint: /v1/support/status/
permalink: /rest-api-guide/support/status.html
sidebar: rest_api_guide_sidebar
---
