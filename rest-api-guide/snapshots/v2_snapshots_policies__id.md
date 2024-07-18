---
category: /snapshots
methods:
  delete:
    parameters:
    - description: Snapshot Policy Identifier
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
    summary: Deletes a snapshot policy.
  get:
    parameters:
    - description: Snapshot Policy Identifier
      name: id
      required: true
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Returns information about a specific snapshot policy.
  patch:
    parameters:
    - description: Snapshot Policy Identifier
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
    summary: Modifies a snapshot policy.
  put:
    parameters:
    - description: Snapshot Policy Identifier
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
    summary: Modifies a snapshot policy.
rest_endpoint: /v2/snapshots/policies/{id}
permalink: /rest-api-guide/snapshots/v2_snapshots_policies__id.html
sidebar: rest_api_guide_sidebar
---
