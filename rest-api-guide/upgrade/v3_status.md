---
category: /upgrade
methods:
  get:
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"upgrade_status\",\n  \"type\": \"object\",\n\
        \  \"properties\": {\n    \"state\": {\n      \"type\": \"string\",\n    \
        \  \"enum\": [\n        \"UPGRADE_STATE_IDLE\",\n        \"UPGRADE_STATE_PREPARING\"\
        ,\n        \"UPGRADE_STATE_PREPARED\",\n        \"UPGRADE_STATE_COMMITTING\"\
        ,\n        \"UPGRADE_STATE_COMMITTED\",\n        \"UPGRADE_STATE_REBOOTING\"\
        \n      ],\n      \"description\": \"state:\\n * `UPGRADE_STATE_COMMITTED`\
        \ - UPGRADE_STATE_COMMITTED,\\n * `UPGRADE_STATE_COMMITTING` - UPGRADE_STATE_COMMITTING,\\\
        n * `UPGRADE_STATE_IDLE` - UPGRADE_STATE_IDLE,\\n * `UPGRADE_STATE_PREPARED`\
        \ - UPGRADE_STATE_PREPARED,\\n * `UPGRADE_STATE_PREPARING` - UPGRADE_STATE_PREPARING,\\\
        n * `UPGRADE_STATE_REBOOTING` - UPGRADE_STATE_REBOOTING\"\n    },\n    \"\
        progress\": {\n      \"description\": \"progress\",\n      \"type\": \"number\"\
        \n    },\n    \"settings\": {\n      \"description\": \"settings\",\n    \
        \  \"type\": \"object\",\n      \"properties\": {\n        \"install_path\"\
        : {\n          \"description\": \"install_path\",\n          \"type\": \"\
        string\"\n        },\n        \"target_version\": {\n          \"description\"\
        : \"target_version\",\n          \"type\": \"string\"\n        },\n      \
        \  \"upgrade_type\": {\n          \"type\": \"string\",\n          \"enum\"\
        : [\n            \"SOFTWARE_ONLY\",\n            \"SOFTWARE_AND_PLATFORM\"\
        \n          ],\n          \"description\": \"upgrade_type:\\n * `SOFTWARE_AND_PLATFORM`\
        \ - SOFTWARE_AND_PLATFORM,\\n * `SOFTWARE_ONLY` - SOFTWARE_ONLY\"\n      \
        \  },\n        \"auto_commit\": {\n          \"description\": \"auto_commit\"\
        ,\n          \"type\": \"boolean\"\n        },\n        \"do_rolling_reboot\"\
        : {\n          \"description\": \"do_rolling_reboot\",\n          \"type\"\
        : \"boolean\"\n        },\n        \"num_nodes_to_reboot\": {\n          \"\
        description\": \"num_nodes_to_reboot\",\n          \"type\": \"number\"\n\
        \        }\n      }\n    },\n    \"error_info\": {\n      \"description\"\
        : \"error_info\",\n      \"type\": \"string\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Retrieve the current status of the upgrade system.
rest_endpoint: /v3/upgrade/status
permalink: /rest-api-guide/upgrade/v3_status.html
sidebar: rest_api_guide_sidebar
---
