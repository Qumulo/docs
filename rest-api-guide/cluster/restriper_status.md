---
category: /cluster
methods:
  get:
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"api_restriper_status\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"status\": {\n      \"type\": \"string\",\n \
        \     \"enum\": [\n        \"RUNNING\",\n        \"NOT_RUNNING\",\n      \
        \  \"BLOCKED\"\n      ],\n      \"description\": \"Restriper status (one of\
        \ RUNNING, BLOCKED, NOT_RUNNING).:\\n * `BLOCKED` - API_RESTRIPER_STATE_BLOCKED,\\\
        n * `NOT_RUNNING` - API_RESTRIPER_STATE_NOT_RUNNING,\\n * `RUNNING` - API_RESTRIPER_STATE_RUNNING\"\
        \n    },\n    \"data_at_risk\": {\n      \"description\": \"True if any data\
        \ in the cluster needs to be reprotected, false otherwise.\",\n      \"type\"\
        : \"boolean\"\n    },\n    \"blocked_reason\": {\n      \"description\": \"\
        If status is BLOCKED, this field provides more information.\",\n      \"type\"\
        : \"string\"\n    },\n    \"phase\": {\n      \"type\": \"string\",\n    \
        \  \"enum\": [\n        \"PLANNING\",\n        \"REPROTECT\",\n        \"\
        REBALANCE\",\n        \"PARTITIONED_REBALANCE\",\n        \"TRANSCODE\",\n\
        \        \"\"\n      ],\n      \"description\": \"Restriper phase when status\
        \ is RUNNING (one of PLANNING, REPROTECT, REBALANCE, PARTITIONED_REBALANCE,\
        \ TRANSCODE), empty otherwise.:\\n * `` - API_RESTRIPER_PHASE_NOT_RUNNING,\\\
        n * `PARTITIONED_REBALANCE` - API_RESTRIPER_PHASE_PARTITIONED_REBALANCE,\\\
        n * `PLANNING` - API_RESTRIPER_PHASE_PLANNING,\\n * `REBALANCE` - API_RESTRIPER_PHASE_REBALANCE,\\\
        n * `REPROTECT` - API_RESTRIPER_PHASE_REPROTECT,\\n * `TRANSCODE` - API_RESTRIPER_PHASE_TRANSCODING\"\
        \n    },\n    \"elapsed_seconds\": {\n      \"description\": \"How long since\
        \ the current phase began (0 if status != RUNNING).\",\n      \"type\": \"\
        number\"\n    },\n    \"estimated_seconds_left\": {\n      \"description\"\
        : \"How much longer the current phase is expected to take (UINTMAX if status\
        \ != RUNNING).\",\n      \"type\": \"number\"\n    },\n    \"percent_complete\"\
        : {\n      \"description\": \"Percent of work completed by the current phase.\"\
        ,\n      \"type\": \"number\"\n    },\n    \"coordinator_node\": {\n     \
        \ \"description\": \"Restriper coordinator for this quorum (where reports\
        \ will get stored).\",\n      \"type\": \"number\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Get current status of restriper, including data protection status and
      current restripe phase (if running). This API is deprecated in favor of /v1/cluster/protection/restriper/status
      after v5.3.4.
rest_endpoint: /v1/cluster/restriper/status
api_version: v1
permalink: /rest-api-guide/cluster/restriper_status.html
sidebar: rest_api_guide_sidebar
---
