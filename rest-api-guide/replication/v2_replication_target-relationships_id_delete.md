---
category: /Replication
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
    summary: Delete the specified replication relationship where this cluster is the
      target.
rest_endpoint: /v2/replication/target-relationships/{id}/delete
api_version: v2
permalink: /rest-api-guide/replication/v2_replication_target-relationships_id_delete.html
sidebar: rest_api_guide_sidebar
---
