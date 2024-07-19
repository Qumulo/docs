---
category: /ad
methods:
  get:
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"ad_domain_monitor\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"status\": {\n      \"type\": \"string\",\n \
        \     \"enum\": [\n        \"LEAVE_SUCCEEDED\",\n        \"JOIN_SUCCEEDED\"\
        ,\n        \"LEAVE_FAILED\",\n        \"JOIN_FAILED\",\n        \"LEAVE_IN_PROGRESS\"\
        ,\n        \"JOIN_IN_PROGRESS\",\n        \"RECONFIGURE_IN_PROGRESS\"\n  \
        \    ],\n      \"description\": \"status:\\n * `JOIN_FAILED` - JOIN_FAILED,\\\
        n * `JOIN_IN_PROGRESS` - JOIN_IN_PROGRESS,\\n * `JOIN_SUCCEEDED` - JOIN_SUCCEEDED,\\\
        n * `LEAVE_FAILED` - LEAVE_FAILED,\\n * `LEAVE_IN_PROGRESS` - LEAVE_IN_PROGRESS,\\\
        n * `LEAVE_SUCCEEDED` - LEAVE_SUCCEEDED,\\n * `RECONFIGURE_IN_PROGRESS` -\
        \ RECONFIGURE_IN_PROGRESS\"\n    },\n    \"last_error\": {\n      \"description\"\
        : \"last_error\",\n      \"type\": \"object\",\n      \"properties\": {\n\
        \        \"module\": {\n          \"description\": \"module\",\n         \
        \ \"type\": \"string\"\n        },\n        \"error_class\": {\n         \
        \ \"description\": \"error_class\",\n          \"type\": \"string\"\n    \
        \    },\n        \"description\": {\n          \"description\": \"description\"\
        ,\n          \"type\": \"string\"\n        },\n        \"stack\": {\n    \
        \      \"description\": \"stack\",\n          \"type\": \"string\"\n     \
        \   },\n        \"user_visible\": {\n          \"description\": \"user_visible\"\
        ,\n          \"type\": \"boolean\"\n        }\n      }\n    },\n    \"last_action_time\"\
        : {\n      \"description\": \"last_action_time\",\n      \"type\": \"string\"\
        \n    },\n    \"id\": {\n      \"description\": \"id\",\n      \"type\": \"\
        number\"\n    },\n    \"domain\": {\n      \"description\": \"domain\",\n\
        \      \"type\": \"string\"\n    },\n    \"domain_netbios\": {\n      \"description\"\
        : \"domain_netbios\",\n      \"type\": \"string\"\n    },\n    \"ou\": {\n\
        \      \"description\": \"ou\",\n      \"type\": \"string\"\n    },\n    \"\
        search_trusted_domains\": {\n      \"description\": \"search_trusted_domains\"\
        ,\n      \"type\": \"boolean\"\n    },\n    \"use_ad_posix_attributes\": {\n\
        \      \"description\": \"use_ad_posix_attributes\",\n      \"type\": \"boolean\"\
        \n    },\n    \"base_dn\": {\n      \"description\": \"base_dn\",\n      \"\
        type\": \"string\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Gets details on a join or leave operation.
rest_endpoint: /v1/ad/monitor
permalink: /rest-api-guide/ad/monitor.html
sidebar: rest_api_guide_sidebar
---
