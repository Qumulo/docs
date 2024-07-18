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
    summary: Revert target directory to the latest recovery point to ensure that it
      is in a point-in-time consistent state. Then disconnect the specified target
      replication relationship, breaking the relationship with the source and making
      the target directory writable. The revert action may take some time to complete.
      If the relationship is later reconnected, any changes made to the target directory
      since the relationship was disconnected will be reverted upon reconnecting.
rest_endpoint: /v2/replication/target-relationships/{id}/make-writable
permalink: /rest-api-guide/replication/v2_target-relationships_id_make-writable.html
sidebar: rest_api_guide_sidebar
---
