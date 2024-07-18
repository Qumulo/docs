---
category: /cluster
methods:
  get:
    parameters: []
    response_body:
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"api_restriper_status_v2\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"state\": {\n      \"type\": \"string\"\
        ,\n      \"enum\": [\n        \"NOT_STARTED\",\n        \"RUNNING\",\n   \
        \     \"FINISHED\"\n      ],\n      \"description\": \"Restriper state (one\
        \ of NOT_STARTED, RUNNING, FINISHED).:\\n * `FINISHED` - FINISHED,\\n * `NOT_STARTED`\
        \ - NOT_STARTED,\\n * `RUNNING` - RUNNING\"\n    },\n    \"phase\": {\n  \
        \    \"type\": \"string\",\n      \"enum\": [\n        \"PLANNING\",\n   \
        \     \"REPROTECT\",\n        \"REBALANCE\",\n        \"PARTITIONED_REBALANCE\"\
        ,\n        \"TRANSCODE\"\n      ],\n      \"description\": \"Restriper phase\
        \ when state is RUNNING (one of PLANNING, REPROTECT, REBALANCE, PARTITIONED_REBALANCE,\
        \ TRANSCODE). Empty otherwise.:\\n * `PARTITIONED_REBALANCE` - PARTITIONED_REBALANCE,\\\
        n * `PLANNING` - PLANNING,\\n * `REBALANCE` - REBALANCE,\\n * `REPROTECT`\
        \ - REPROTECT,\\n * `TRANSCODE` - TRANSCODE\"\n    },\n    \"blocked_reason\"\
        : {\n      \"description\": \"If state is FINISHED but restriper did not complete\
        \ all required work, this field provides the reason for the work being incomplete.\
        \ Empty otherwise.\",\n      \"type\": \"string\"\n    },\n    \"data_at_risk\"\
        : {\n      \"description\": \"True if any data is not fully protected, false\
        \ otherwise.\",\n      \"type\": \"boolean\"\n    },\n    \"elapsed_seconds\"\
        : {\n      \"description\": \"Elapsed time since the current phase began (0\
        \ if state is not RUNNING).\",\n      \"type\": \"number\"\n    },\n    \"\
        percent_complete\": {\n      \"description\": \"Percent completion of the\
        \ current phase (0 if state is not RUNNING).\",\n      \"type\": \"number\"\
        \n    },\n    \"coordinator_node\": {\n      \"description\": \"Restriper\
        \ coordinator node ID in this quorum, where reports are being recorded.\"\
        ,\n      \"type\": \"number\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Get current status of restriper, including data protection status and
      current restripe phase (if running)
rest_endpoint: /v1/cluster/protection/restriper/status
permalink: /rest-api-guide/cluster/protection_restriper_status.html
sidebar: rest_api_guide_sidebar
---
