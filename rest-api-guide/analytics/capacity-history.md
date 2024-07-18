---
category: /analytics
methods:
  get:
    parameters:
    - description: Lower bound on history returned, in RFC 3339 format or epoch seconds.
      name: begin-time
      required: true
    - description: Upper bound on history returned, in RFC 3339 format or epoch seconds.
        If not specified, defaults to the current system time.
      name: end-time
      required: false
    - description: "Sampling interval. If not specified, defaults to 'hourly'.:\n\
        \ * `daily` - daily,\n * `hourly` - hourly,\n * `weekly` - weekly"
      name: interval
      required: false
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Returns capacity history data for the cluster. Does not return entries
      for timeslots without capacity data. Returned history data will be sorted by
      ascending time.
rest_endpoint: /v1/analytics/capacity-history/
permalink: /rest-api-guide/analytics/capacity-history.html
sidebar: rest_api_guide_sidebar
---
