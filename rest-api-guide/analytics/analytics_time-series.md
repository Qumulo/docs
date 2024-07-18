---
category: /analytics
methods:
  get:
    parameters:
    - description: Lower bound on intervals returned, in RFC 3339 format or epoch
        seconds. If not specified, defaults to the current system time.
      name: begin-time
      required: false
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Returns all time series data maintained by the cluster.
rest_endpoint: /v1/analytics/time-series/
permalink: /rest-api-guide/analytics/analytics_time-series.html
sidebar: rest_api_command_guide_sidebar
---
