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
    - code: '202'
      description: Return value on success
    summary: Replicate from the source to the target of the specified replication
      relationship where this cluster is the source.
rest_endpoint: /v2/replication/source-relationships/{id}/replicate
api_version: v2
permalink: /rest-api-guide/replication/source-relationships_id_replicate.html
sidebar: rest_api_guide_sidebar
---
