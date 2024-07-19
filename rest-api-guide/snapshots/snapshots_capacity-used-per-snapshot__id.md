---
category: /snapshots
methods:
  get:
    parameters:
    - description: Snapshot identifier
      name: id
      required: true
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Returns the approximate amount of space that would be reclaimed if the
      given snapshot were deleted.
rest_endpoint: /v1/snapshots/capacity-used-per-snapshot/{id}
permalink: /rest-api-guide/snapshots/snapshots_capacity-used-per-snapshot__id.html
sidebar: rest_api_guide_sidebar
---