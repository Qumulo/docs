---
category: /Replication
methods:
  get:
    summary: Get the status of an existing object replication relationship.
    parameters:
    - name: id
      description: Relationship identifier
      required: true
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    preview: false
rest_endpoint: /v3/replication/object-relationships/{id}/status
api_version: v3
permalink: /rest-api-guide/replication/v3_replication_object-relationships_id_status.html
sidebar: rest_api_guide_sidebar
---
