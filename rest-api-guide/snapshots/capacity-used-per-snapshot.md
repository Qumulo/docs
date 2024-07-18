---
category: /snapshots
methods:
  get:
    parameters: []
    response_body:
      description: Return value on success
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"api_snapshot_capacity_used_per_snapshot\",\n\
        \  \"type\": \"object\",\n  \"properties\": {\n    \"entries\": {\n      \"\
        type\": \"array\",\n      \"items\": {\n        \"description\": \"List of\
        \ snapshot identifiers with the amount of space that would be reclaimed by\
        \ deleting each one\",\n        \"type\": \"object\",\n        \"properties\"\
        : {\n          \"id\": {\n            \"description\": \"Unique identifier\
        \ for a snapshot\",\n            \"type\": \"number\"\n          },\n    \
        \      \"capacity_used_bytes\": {\n            \"description\": \"Amount of\
        \ space that would be reclaimed if the snapshot were deleted\",\n        \
        \    \"type\": \"string\"\n          }\n        }\n      }\n    }\n  }\n}"
      status_code: '200'
    summary: Returns the approximate amount of space for each snapshot that would
      be reclaimed if that snapshot were deleted.
rest_endpoint: /v1/snapshots/capacity-used-per-snapshot/
permalink: /rest-api-guide/snapshots/capacity-used-per-snapshot.html
sidebar: rest_api_guide_sidebar
---
