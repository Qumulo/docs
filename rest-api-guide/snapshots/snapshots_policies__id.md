---
category: /snapshots
methods:
  delete:
    parameters:
    - description: Policy identifier
      name: id
      required: true
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Deletes a snapshot policy.
  get:
    parameters:
    - description: Policy identifier
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
    - description: Policy identifier
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
    - description: Policy identifier
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
rest_endpoint: /v1/snapshots/policies/{id}
permalink: /rest-api-guide/snapshots/snapshots_policies__id.html
sidebar: rest_api_guide_sidebar
---
