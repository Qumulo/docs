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
    summary: Clear the error associated with this source relationship's last replication
      attempt, if one exists.
rest_endpoint: /v2/replication/source-relationships/{id}/dismiss-error
permalink: /rest-api-guide/replication/v2_replication_source-relationships_id_dismiss-error.html
sidebar: rest_api_command_guide_sidebar
---
