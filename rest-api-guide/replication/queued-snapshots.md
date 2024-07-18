---
category: /replication
methods:
  get:
    parameters:
    - description: Relationship identifier
      name: id
      required: true
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: List information for all snapshots awaiting replication by the specified
      relationship.
rest_endpoint: /v2/replication/source-relationships/{id}/queued-snapshots/
permalink: /rest-api-guide/replication/queued-snapshots.html
sidebar: rest_api_guide_sidebar
---
