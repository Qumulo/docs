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
    summary: Start a new replication job for the specified object relationship
rest_endpoint: /v3/replication/object-relationships/{id}/replicate
permalink: /rest-api-guide/replication/replicate.html
sidebar: rest_api_guide_sidebar
---