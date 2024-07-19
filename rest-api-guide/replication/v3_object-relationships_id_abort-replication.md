---
category: /replication
methods:
  post:
    parameters:
    - description: Relationship identifier
      name: id
      required: true
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    summary: Abort any ongoing replication job for the specified object replication
      relationship.
rest_endpoint: /v3/replication/object-relationships/{id}/abort-replication
permalink: /rest-api-guide/replication/v3_object-relationships_id_abort-replication.html
sidebar: rest_api_guide_sidebar
---