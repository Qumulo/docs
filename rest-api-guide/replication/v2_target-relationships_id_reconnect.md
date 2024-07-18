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
    summary: Make the target directory read-only and revert any changes made to the
      target directory since the latest recovery point. Then reconnect the specified
      target replication relationship with its source directory. The revert action
      may take some time to complete before replication is resumed.
rest_endpoint: /v2/replication/target-relationships/{id}/reconnect
permalink: /rest-api-guide/replication/v2_target-relationships_id_reconnect.html
sidebar: rest_api_guide_sidebar
---
