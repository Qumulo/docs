---
category: /analytics
methods:
  get:
    parameters:
    - description: Time in epoch seconds
      name: timestamp
      required: true
    response_body:
      schema: "{\n  \"description\": \"historical_capacity_details\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"threshold_for_inclusion\": {\n \
        \     \"description\": \"threshold_for_inclusion\",\n      \"type\": \"string\"\
        \n    },\n    \"status\": {\n      \"type\": \"string\",\n      \"enum\":\
        \ [\n        \"AVAILABLE\",\n        \"UNAVAILABLE\",\n        \"PENDING\"\
        \n      ],\n      \"description\": \"status:\\n * `AVAILABLE` - DETAILED_PATH_CAPACITY_AVAILABLE,\\\
        n * `PENDING` - DETAILED_PATH_CAPACITY_PENDING,\\n * `UNAVAILABLE` - DETAILED_PATH_CAPACITY_UNAVAILABLE\"\
        \n    },\n    \"largest_paths\": {\n      \"type\": \"array\",\n      \"items\"\
        : {\n        \"description\": \"largest_paths\",\n        \"type\": \"object\"\
        ,\n        \"properties\": {\n          \"capacity_used\": {\n           \
        \ \"description\": \"capacity_used\",\n            \"type\": \"string\"\n\
        \          },\n          \"path\": {\n            \"description\": \"path\"\
        ,\n            \"type\": \"string\"\n          }\n        }\n      }\n   \
        \ }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Returns all paths using more than 0.1% of overall used capacity at a
      given timestamp. A path that meets the threshold with many items smaller than
      the threshold will be aggregated. Individual items above the threshold will
      be reported separately.
rest_endpoint: /v1/analytics/capacity-history/{timestamp}/
permalink: /rest-api-guide/analytics/capacity-history_timestamp.html
sidebar: rest_api_guide_sidebar
---
