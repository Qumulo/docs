---
category: /replication
methods:
  post:
    parameters:
    - description: Relationship identifier
      name: id
      required: true
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Delete the specified replication relationship where this cluster is the
      target.
rest_endpoint: /v2/replication/target-relationships/{id}/delete
sidebar: rest_api_command_guide_sidebar
---
