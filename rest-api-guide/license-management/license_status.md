---
category: /License Management
methods:
  get:
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"api_license_status\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"state\": {\n      \"type\": \"string\",\n  \
        \    \"enum\": [\n        \"LICENSE_STATE_NONE\",\n        \"LICENSE_STATE_ACTIVE\"\
        ,\n        \"LICENSE_STATE_EXPIRED\"\n      ],\n      \"description\": \"\
        state:\\n * `LICENSE_STATE_ACTIVE` - LICENSE_STATE_ACTIVE,\\n * `LICENSE_STATE_EXPIRED`\
        \ - LICENSE_STATE_EXPIRED,\\n * `LICENSE_STATE_NONE` - LICENSE_STATE_NONE\"\
        \n    },\n    \"license\": {\n      \"description\": \"license\",\n      \"\
        type\": \"object\",\n      \"properties\": {}\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Retrieve the current license and whether it is active.
rest_endpoint: /v1/license/status
api_version: v1
permalink: /rest-api-guide/license-management/license_status.html
sidebar: rest_api_guide_sidebar
---
