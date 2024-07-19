---
category: /snapshots
methods:
  get:
    parameters:
    - description: Snapshot identifier
      name: id
      required: true
    response_body:
      schema: "{\n  \"description\": \"api_snapshot_capacity_usage_info\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"id\": {\n      \"description\":\
        \ \"Unique identifier for a snapshot\",\n      \"type\": \"number\"\n    },\n\
        \    \"capacity_used_bytes\": {\n      \"description\": \"Amount of space\
        \ that would be reclaimed if the snapshot were deleted\",\n      \"type\"\
        : \"string\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Returns the approximate amount of space that would be reclaimed if the
      given snapshot were deleted.
rest_endpoint: /v1/snapshots/capacity-used-per-snapshot/{id}
api_version: v1
permalink: /rest-api-guide/snapshots/capacity-used-per-snapshot_id.html
sidebar: rest_api_guide_sidebar
---
