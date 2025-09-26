---
category: /Replication V2
methods:
  post:
    summary: Replicate from the source to the target of the specified replication
      relationship where this cluster is the source.
    parameters:
    - name: id
      description: Relationship identifier
      required: true
    response_body: {}
    responses:
    - code: '202'
      description: Return value on success
    preview: false
rest_endpoint: /v2/replication/source-relationships/{id}/replicate
api_version: v2
permalink: /rest-api-guide/replication-v2/v2_replication_source-relationships_id_replicate.html
sidebar: rest_api_guide_sidebar
redirect_from: /rest-api-guide/replication/v2_replication_source-relationships_id_replicate.html
---
