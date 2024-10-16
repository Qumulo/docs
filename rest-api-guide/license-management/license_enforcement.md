---
category: /License Management
methods:
  get:
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"api_license_enforcement\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"license_is_enforced\": {\n      \"description\"\
        : \"license_is_enforced\",\n      \"type\": \"boolean\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Retrieve the current license and whether it is being enforced.
rest_endpoint: /v1/license/enforcement
api_version: v1
permalink: /rest-api-guide/license-management/license_enforcement.html
sidebar: rest_api_guide_sidebar
---
