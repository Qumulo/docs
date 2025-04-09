---
category: /Snapshots
methods:
  post:
    summary: Returns approximate amount of space that would be reclaimed if all specified
      snapshots were deleted.
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"api_snapshot_capacity_used\",\n  \"type\":\
        \ \"object\",\n  \"properties\": {\n    \"bytes\": {\n      \"description\"\
        : \"bytes\",\n      \"type\": \"string\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
    request_body:
      schema: "{\n  \"type\": \"array\",\n  \"items\": {\n    \"type\": \"number\"\
        \n  }\n}"
rest_endpoint: /v1/snapshots/calculate-used-capacity
api_version: v1
permalink: /rest-api-guide/snapshots/snapshots_calculate-used-capacity.html
sidebar: rest_api_guide_sidebar
---
