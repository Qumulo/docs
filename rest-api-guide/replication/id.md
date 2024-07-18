---
category: /replication
methods:
  delete:
    parameters:
    - description: Relationship identifier
      name: id
      required: true
    - description: ETag for expected version
      name: If-Match
      required: false
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Delete the specified object replication relationship, which must not
      be running a job.
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
    summary: Get information about the specified object replication relationship.
rest_endpoint: /v3/replication/object-relationships/{id}
permalink: /rest-api-guide/replication/id.html
sidebar: rest_api_guide_sidebar
---
