---
category: /auth
methods:
  delete:
    parameters:
    - description: Access Token ID
      name: id
      required: true
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Delete the specified access token.
  get:
    parameters:
    - description: Access Token ID
      name: id
      required: true
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Get metadata about the specified access token.
  patch:
    parameters:
    - description: Access Token ID
      name: id
      required: true
    request_body:
      example_value: TO DO
      schema: TO DO
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Modify metadata for the specified access token.
rest_endpoint: /v1/auth/access-tokens/{id}
permalink: /rest-api-guide/auth/auth_access-tokens__id.html
sidebar: rest_api_guide_sidebar
---
