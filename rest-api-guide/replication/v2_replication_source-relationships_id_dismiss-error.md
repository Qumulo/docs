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
    summary: Clear the error associated with this source relationship's last replication
      attempt, if one exists.
rest_endpoint: /v2/replication/source-relationships/{id}/dismiss-error
api_version: v2
permalink: /rest-api-guide/replication/v2_replication_source-relationships_id_dismiss-error.html
sidebar: rest_api_guide_sidebar
---
