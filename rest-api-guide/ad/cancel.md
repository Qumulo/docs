---
category: /ad
methods:
  post:
    parameters: []
    response_body:
      description: Return value on success
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"api_monitor_uri\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"monitor_uri\": {\n      \"description\": \"\
        monitor_uri\",\n      \"type\": \"string\"\n    }\n  }\n}"
      status_code: '202'
    summary: Cancel current join or leave operation.
rest_endpoint: /v1/ad/cancel
permalink: /rest-api-guide/ad/cancel.html
sidebar: rest_api_guide_sidebar
---
