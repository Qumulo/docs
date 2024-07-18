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
      example_value: '"TO DO"'
      schema: '"TO DO"'
      status_code: '200'
    summary: Clear the error associated with this target relationship's last replication
      attempt, if one exists.
rest_endpoint: /v2/replication/target-relationships/{id}/dismiss-error
permalink: /rest-api-guide/replication/v2_target-relationships_id_dismiss-error.html
sidebar: rest_api_guide_sidebar
---
