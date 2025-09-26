---
category: /Replication V3
methods:
  post:
    summary: Abort any ongoing replication job for the specified object replication
      relationship.
    parameters:
    - name: id
      description: Relationship identifier
      required: true
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    preview: false
rest_endpoint: /v3/replication/object-relationships/{id}/abort-replication
api_version: v3
permalink: /rest-api-guide/replication-v3/v3_replication_object-relationships_id_abort-replication.html
sidebar: rest_api_guide_sidebar
redirect_from: /rest-api-guide/replication/v3_replication_object-relationships_id_abort-replication.html
---
