---
category: /snapshots
methods:
  post:
    parameters:
    - description: The snapshot identifier.
      name: id
      required: true
    request_body:
      example_value: TO DO
      schema: TO DO
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Unlock the specified snapshot. After you unlock a snapshot, you can modify
      it.
rest_endpoint: /v3/snapshots/{id}/unlock
permalink: /rest-api-guide/snapshots/v3_snapshots__id_unlock.html
sidebar: rest_api_guide_sidebar
---
