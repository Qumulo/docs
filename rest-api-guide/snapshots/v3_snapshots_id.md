---
category: /snapshots
methods:
  delete:
    parameters:
    - description: Snapshot identifier
      name: id
      required: true
    - description: ETag for expected version
      name: If-Match
      required: false
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '202'
    summary: Deletes a snapshot.
  get:
    parameters:
    - description: Snapshot identifier
      name: id
      required: true
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Returns information about a specific snapshot.
  patch:
    parameters:
    - description: Snapshot identifier
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
    summary: Modifies a snapshot.
  put:
    parameters:
    - description: Snapshot identifier
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
    summary: Modifies a snapshot.
rest_endpoint: /v3/snapshots/{id}
permalink: /rest-api-guide/snapshots/v3_snapshots_id.html
sidebar: rest_api_command_guide_sidebar
---
