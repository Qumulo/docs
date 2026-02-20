---
category: /Replication V2
methods:
  post:
    summary: Clear the error associated with this source relationship's last replication
      attempt, if one exists.
    parameters:
    - name: id
      description: Relationship identifier
      required: true
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    preview: false
rest_endpoint: /v2/replication/source-relationships/{id}/dismiss-error
api_version: v2
permalink: /rest-api-guide/replication-v2/v2_replication_source-relationships_id_dismiss-error.html
sidebar: rest_api_guide_sidebar
redirect_from: /rest-api-guide/replication/v2_replication_source-relationships_id_dismiss-error.html
deprecated: false
---
