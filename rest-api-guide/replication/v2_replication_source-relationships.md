---
category: /replication
methods:
  get:
    parameters: []
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: List existing replication relationships where this cluster is the source.
  post:
    parameters: []
    request_body:
      example_value: TO DO
      schema: TO DO
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Create a new replication relationship with this cluster as the source.
      To begin replication, the corresponding relationship on the target cluster must
      be authorized using the authorize API.
rest_endpoint: /v2/replication/source-relationships/
sidebar: rest_api_command_guide_sidebar
---
