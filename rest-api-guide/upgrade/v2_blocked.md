---
category: /upgrade
methods:
  get:
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"api_upgrade_blocked_response\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"is_blocked\": {\n      \"description\"\
        : \"is_blocked\",\n      \"type\": \"boolean\"\n    },\n    \"cluster_degraded\"\
        : {\n      \"description\": \"cluster_degraded\",\n      \"type\": \"boolean\"\
        \n    },\n    \"blocked_reason\": {\n      \"description\": \"blocked_reason\"\
        ,\n      \"type\": \"string\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Check if upgrade is currently blocked.
rest_endpoint: /v2/upgrade/blocked
permalink: /rest-api-guide/upgrade/v2_blocked.html
sidebar: rest_api_guide_sidebar
---
