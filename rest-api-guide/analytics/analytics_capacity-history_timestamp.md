---
category: /analytics
methods:
  get:
    parameters:
    - description: Time in epoch seconds
      name: timestamp
      required: true
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Returns all paths using more than 0.1% of overall used capacity at a
      given timestamp. A path that meets the threshold with many items smaller than
      the threshold will be aggregated. Individual items above the threshold will
      be reported separately.
rest_endpoint: /v1/analytics/capacity-history/{timestamp}/
sidebar: rest_api_command_guide_sidebar
---
