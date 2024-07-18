---
category: /replication
methods:
  get:
    parameters:
    - description: Relationship identifier
      name: id
      required: true
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Get current status of the specified replication relationship where this
      cluster is the target.
rest_endpoint: /v2/replication/target-relationships/{id}/status
permalink: /rest-api-guide/replication/v2_target-relationships_id_status.html
sidebar: rest_api_guide_sidebar
---
