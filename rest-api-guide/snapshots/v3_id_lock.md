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
    summary: Lock the specified snapshot. The only modification you can make to a
      locked snapshot is extending its expiration time.
rest_endpoint: /v3/snapshots/{id}/lock
permalink: /rest-api-guide/snapshots/v3_id_lock.html
sidebar: rest_api_guide_sidebar
---
