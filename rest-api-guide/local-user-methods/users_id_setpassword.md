---
category: /Local User Methods
methods:
  post:
    summary: Set a local user's password.
    parameters:
    - name: id
      description: The user's unique ID
      required: true
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    preview: false
    request_body:
      schema: "{\n  \"description\": \"new_password\",\n  \"type\": \"object\",\n\
        \  \"properties\": {\n    \"new_password\": {\n      \"description\": \"new_password\"\
        ,\n      \"type\": \"string\",\n      \"format\": \"password\"\n    }\n  }\n\
        }"
rest_endpoint: /v1/users/{id}/setpassword
api_version: v1
permalink: /rest-api-guide/local-user-methods/users_id_setpassword.html
sidebar: rest_api_guide_sidebar
---
