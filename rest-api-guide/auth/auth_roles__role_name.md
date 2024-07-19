---
category: /auth
methods:
  delete:
    parameters:
    - description: The name of the role (This page URL-encodes the name for you)
      name: role_name
      required: true
    - description: ETag for expected version
      name: If-Match
      required: false
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Delete a role.
  get:
    parameters:
    - description: The name of the role (This page URL-encodes the name for you)
      name: role_name
      required: true
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Retrieve information about the role.
  patch:
    parameters:
    - description: The name of the role (This page URL-encodes the name for you)
      name: role_name
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
    summary: Modify fields on a role.
  put:
    parameters:
    - description: The name of the role (This page URL-encodes the name for you)
      name: role_name
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
    summary: Modify a role.
rest_endpoint: /v1/auth/roles/{role_name}
permalink: /rest-api-guide/auth/auth_roles__role_name.html
sidebar: rest_api_guide_sidebar
---