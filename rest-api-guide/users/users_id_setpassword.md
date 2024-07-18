---
category: /users
methods:
  post:
    parameters:
    - description: The user's unique ID
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
    summary: Set a local user's password.
rest_endpoint: /v1/users/{id}/setpassword
permalink: /rest-api-guide/users/users_id_setpassword.html
sidebar: rest_api_command_guide_sidebar
---
