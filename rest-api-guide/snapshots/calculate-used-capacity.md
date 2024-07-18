---
category: /snapshots
methods:
  post:
    parameters: []
    request_body:
      example_value: '"TO DO"'
      schema: "{\n  \"type\": \"array\",\n  \"items\": {\n    \"type\": \"number\"\
        \n  }\n}"
    response_body:
      description: Return value on success
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"api_snapshot_capacity_used\",\n  \"type\":\
        \ \"object\",\n  \"properties\": {\n    \"bytes\": {\n      \"description\"\
        : \"bytes\",\n      \"type\": \"string\"\n    }\n  }\n}"
      status_code: '200'
    summary: Returns approximate amount of space that would be reclaimed if all specified
      snapshots were deleted.
rest_endpoint: /v1/snapshots/calculate-used-capacity
permalink: /rest-api-guide/snapshots/calculate-used-capacity.html
sidebar: rest_api_guide_sidebar
---
