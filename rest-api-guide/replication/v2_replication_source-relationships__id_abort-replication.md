---
category: /replication
methods:
  post:
    parameters:
    - description: Relationship identifier
      name: id
      required: true
    - description: If set to true and the currently replicating snapshot was created
        by a policy, the next replication job will use the next queued snapshot instead
        of retrying the current one. Defaults to false if not specified.
      name: skip-active-policy-snapshot
      required: false
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Abort any ongoing replication work for the specified replication relationship
      where this cluster is the source.
rest_endpoint: /v2/replication/source-relationships/{id}/abort-replication
permalink: /rest-api-guide/replication/v2_replication_source-relationships__id_abort-replication.html
sidebar: rest_api_guide_sidebar
---