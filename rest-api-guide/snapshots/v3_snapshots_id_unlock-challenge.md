---
category: /snapshots
methods:
  get:
    parameters:
    - description: The snapshot identifier.
      name: id
      required: true
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Generate a snapshot unlock challenge to provide in the subsequent unlock
      call.
rest_endpoint: /v3/snapshots/{id}/unlock-challenge
sidebar: rest_api_command_guide_sidebar
---
