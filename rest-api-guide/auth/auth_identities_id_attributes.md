---
category: /auth
methods:
  delete:
    parameters:
    - description: URI parameter id
      name: id
      required: true
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Delete the identity attributes for an identity.
  get:
    parameters:
    - description: URI parameter id
      name: id
      required: true
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Get the identity attributes for an identity.
  put:
    parameters:
    - description: URI parameter id
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
    summary: Set the identity attributes for an identity.
rest_endpoint: /v1/auth/identities/{id}/attributes
sidebar: rest_api_command_guide_sidebar
---
