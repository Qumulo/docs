---
category: /shutdown
methods:
  get:
    parameters: []
    response_body:
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"reboot_status\",\n  \"type\": \"object\",\n\
        \  \"properties\": {\n    \"state\": {\n      \"type\": \"string\",\n    \
        \  \"enum\": [\n        \"REBOOT_IDLE\",\n        \"REBOOT_IN_PROGRESS\",\n\
        \        \"REBOOT_PAUSED\",\n        \"REBOOT_PAUSED_DUE_TO_ERROR\"\n    \
        \  ],\n      \"description\": \"state:\\n * `REBOOT_IDLE` - REBOOT_IDLE,\\\
        n * `REBOOT_IN_PROGRESS` - REBOOT_IN_PROGRESS,\\n * `REBOOT_PAUSED` - REBOOT_PAUSED,\\\
        n * `REBOOT_PAUSED_DUE_TO_ERROR` - REBOOT_PAUSED_DUE_TO_ERROR\"\n    },\n\
        \    \"rolling\": {\n      \"description\": \"rolling\",\n      \"type\":\
        \ \"boolean\"\n    },\n    \"upgrade_initiated\": {\n      \"description\"\
        : \"upgrade_initiated\",\n      \"type\": \"boolean\"\n    },\n    \"total_node_count\"\
        : {\n      \"description\": \"total_node_count\",\n      \"type\": \"number\"\
        \n    },\n    \"rebooted_node_count\": {\n      \"description\": \"rebooted_node_count\"\
        ,\n      \"type\": \"number\"\n    },\n    \"error_message\": {\n      \"\
        description\": \"error_message\",\n      \"type\": \"string\"\n    }\n  }\n\
        }"
    responses:
    - code: '200'
      description: Return value on success
    summary: Retrieve the current status of the reboot manager.
rest_endpoint: /v1/shutdown/reboot/status
permalink: /rest-api-guide/shutdown/reboot_status.html
sidebar: rest_api_guide_sidebar
---
