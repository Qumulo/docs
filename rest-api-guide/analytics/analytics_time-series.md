---
category: /Analytics
methods:
  get:
    parameters:
    - description: Lower bound on intervals returned, in RFC 3339 format or epoch
        seconds. If not specified, defaults to the current system time.
      name: begin-time
      required: false
    response_body:
      schema: "{\n  \"type\": \"array\",\n  \"items\": {\n    \"description\": \"\
        api_time_series_dataset\",\n    \"type\": \"object\",\n    \"properties\"\
        : {\n      \"id\": {\n        \"description\": \"id\",\n        \"type\":\
        \ \"string\"\n      },\n      \"times\": {\n        \"type\": \"array\",\n\
        \        \"items\": {\n          \"description\": \"times\",\n          \"\
        type\": \"number\"\n        }\n      },\n      \"values\": {\n        \"type\"\
        : \"array\",\n        \"items\": {\n          \"description\": \"values\"\
        ,\n          \"type\": \"number\"\n        }\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Returns all time series data maintained by the cluster.
rest_endpoint: /v1/analytics/time-series/
api_version: v1
permalink: /rest-api-guide/analytics/analytics_time-series.html
sidebar: rest_api_guide_sidebar
---
