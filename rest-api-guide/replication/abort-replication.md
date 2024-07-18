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
    summary: Abort any ongoing replication job for the specified object replication
      relationship.
rest_endpoint: /v3/replication/object-relationships/{id}/abort-replication
permalink: /rest-api-guide/replication/abort-replication.html
sidebar: rest_api_guide_sidebar
---
