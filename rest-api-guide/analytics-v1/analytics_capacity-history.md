---
category: /Analytics V1
methods:
  get:
    summary: Returns capacity history data for the cluster. Does not return entries
      for timeslots without capacity data. Returned history data will be sorted by
      ascending time.
    parameters:
    - name: begin-time
      description: Lower bound on history returned, in RFC 3339 format or epoch seconds.
      required: true
    - name: end-time
      description: Upper bound on history returned, in RFC 3339 format or epoch seconds.
        If not specified, defaults to the current system time.
      required: false
    - name: interval
      description: "Sampling interval. If not specified, defaults to 'hourly'.:\n\
        \ * `daily` - daily,\n * `hourly` - hourly,\n * `weekly` - weekly"
      required: false
    response_body:
      schema: "{\n  \"type\": \"array\",\n  \"items\": {\n    \"description\": \"\
        overall_historical_capacity\",\n    \"type\": \"object\",\n    \"properties\"\
        : {\n      \"period_start_time\": {\n        \"description\": \"period_start_time\"\
        ,\n        \"type\": \"number\"\n      },\n      \"capacity_used\": {\n  \
        \      \"description\": \"capacity_used\",\n        \"type\": \"string\"\n\
        \      },\n      \"data_used\": {\n        \"description\": \"data_used\"\
        ,\n        \"type\": \"string\"\n      },\n      \"metadata_used\": {\n  \
        \      \"description\": \"metadata_used\",\n        \"type\": \"string\"\n\
        \      },\n      \"snapshot_used\": {\n        \"description\": \"snapshot_used\"\
        ,\n        \"type\": \"string\"\n      },\n      \"total_usable\": {\n   \
        \     \"description\": \"total_usable\",\n        \"type\": \"string\"\n \
        \     },\n      \"details_status\": {\n        \"type\": \"string\",\n   \
        \     \"enum\": [\n          \"AVAILABLE\",\n          \"UNAVAILABLE\",\n\
        \          \"PENDING\"\n        ],\n        \"description\": \"details_status:\\\
        n * `AVAILABLE` - DETAILED_PATH_CAPACITY_AVAILABLE,\\n * `PENDING` - DETAILED_PATH_CAPACITY_PENDING,\\\
        n * `UNAVAILABLE` - DETAILED_PATH_CAPACITY_UNAVAILABLE\"\n      }\n    }\n\
        \  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
rest_endpoint: /v1/analytics/capacity-history/
api_version: v1
permalink: /rest-api-guide/analytics-v1/analytics_capacity-history.html
sidebar: rest_api_guide_sidebar
redirect_from: /rest-api-guide/analytics/analytics_capacity-history.html
---
