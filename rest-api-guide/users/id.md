---
category: /users
methods:
  delete:
    parameters:
    - description: The user's unique ID
      name: id
      required: true
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Delete a local user.
  get:
    parameters:
    - description: The user's unique ID
      name: id
      required: true
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Retrieve information about a single local user. Refer to the 'Modify
      user' method for a description of the returned fields.
  put:
    parameters:
    - description: The user's unique ID
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
    summary: Modify a local user.
rest_endpoint: /v1/users/{id}
permalink: /rest-api-guide/users/id.html
sidebar: rest_api_command_guide_sidebar
---
