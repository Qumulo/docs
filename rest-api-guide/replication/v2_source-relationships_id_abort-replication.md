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
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    summary: Abort any ongoing replication work for the specified replication relationship
      where this cluster is the source.
rest_endpoint: /v2/replication/source-relationships/{id}/abort-replication
permalink: /rest-api-guide/replication/v2_source-relationships_id_abort-replication.html
sidebar: rest_api_guide_sidebar
---
