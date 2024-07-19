---
category: /snapshots
methods:
  get:
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"api_snapshot_capacity_used\",\n  \"type\":\
        \ \"object\",\n  \"properties\": {\n    \"bytes\": {\n      \"description\"\
        : \"bytes\",\n      \"type\": \"string\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Returns approximate amount of space that would be reclaimed if all snapshots
      were deleted.
rest_endpoint: /v1/snapshots/total-used-capacity
api_version: v1
permalink: /rest-api-guide/snapshots/total-used-capacity.html
sidebar: rest_api_guide_sidebar
---
