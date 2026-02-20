---
category: /Snapshots V1
methods:
  get:
    summary: Returns approximate amount of space that would be reclaimed if all snapshots
      were deleted.
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"api_snapshot_capacity_used\",\n  \"type\":\
        \ \"object\",\n  \"properties\": {\n    \"bytes\": {\n      \"description\"\
        : \"bytes\",\n      \"type\": \"string\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
rest_endpoint: /v1/snapshots/total-used-capacity
api_version: v1
permalink: /rest-api-guide/snapshots-v1/snapshots_total-used-capacity.html
sidebar: rest_api_guide_sidebar
redirect_from: /rest-api-guide/snapshots/snapshots_total-used-capacity.html
deprecated: false
---
