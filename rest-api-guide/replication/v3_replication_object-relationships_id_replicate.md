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
    - code: '202'
      description: Return value on success
    summary: Start a new replication job for the specified object relationship
rest_endpoint: /v3/replication/object-relationships/{id}/replicate
api_version: v3
permalink: /rest-api-guide/replication/v3_replication_object-relationships_id_replicate.html
sidebar: rest_api_guide_sidebar
---
