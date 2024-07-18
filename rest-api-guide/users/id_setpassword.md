---
category: /users
methods:
  post:
    parameters:
    - description: The user's unique ID
      name: id
      required: true
    request_body:
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"new_password\",\n  \"type\": \"object\",\n\
        \  \"properties\": {\n    \"new_password\": {\n      \"description\": \"new_password\"\
        ,\n      \"type\": \"string\",\n      \"format\": \"password\"\n    }\n  }\n\
        }"
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    summary: Set a local user's password.
rest_endpoint: /v1/users/{id}/setpassword
permalink: /rest-api-guide/users/id_setpassword.html
sidebar: rest_api_guide_sidebar
---
