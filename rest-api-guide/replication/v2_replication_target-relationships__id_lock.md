---
category: /replication
methods:
  post:
    parameters:
    - description: Relationship identifier
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
    summary: Set or clear the snapshot lock key ID for snapshots that this target
      replication relationship creates. Changing the lock key applies only to snapshots
      that the system takes after you make a configuration change.
rest_endpoint: /v2/replication/target-relationships/{id}/lock
permalink: /rest-api-guide/replication/v2_replication_target-relationships__id_lock.html
sidebar: rest_api_guide_sidebar
---
