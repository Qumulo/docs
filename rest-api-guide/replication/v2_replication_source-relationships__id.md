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
    summary: Delete the specified replication relationship where this cluster is the
      source.
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
    summary: Get information about the specified replication relationship where this
      cluster is the source.
  patch:
    parameters:
    - description: Relationship identifier
      name: id
      required: true
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
      example_value: TO DO
      schema: TO DO
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Modify a subset of fields of an existing replication relationship where
      this cluster is the source.
  put:
    parameters:
    - description: Relationship identifier
      name: id
      required: true
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
      example_value: TO DO
      schema: TO DO
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Modify an existing replication relationship where this cluster is the
      source.
rest_endpoint: /v2/replication/source-relationships/{id}
permalink: /rest-api-guide/replication/v2_replication_source-relationships__id.html
sidebar: rest_api_guide_sidebar
---
