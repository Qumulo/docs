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
      status_code: '202'
    summary: Replicate from the source to the target of the specified replication
      relationship where this cluster is the source.
rest_endpoint: /v2/replication/source-relationships/{id}/replicate
permalink: /rest-api-guide/replication/v2_replication_source-relationships__id_replicate.html
sidebar: rest_api_guide_sidebar
---
