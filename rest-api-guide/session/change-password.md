---
category: /session
methods:
  post:
    parameters: []
    request_body:
      schema: "{\n  \"description\": \"password_change\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"old_password\": {\n      \"description\": \"\
        The current password\",\n      \"type\": \"string\",\n      \"format\": \"\
        password\"\n    },\n    \"new_password\": {\n      \"description\": \"The\
        \ new password\",\n      \"type\": \"string\",\n      \"format\": \"password\"\
        \n    }\n  }\n}"
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    summary: Change the password for the logged in user.
rest_endpoint: /v1/session/change-password
permalink: /rest-api-guide/session/change-password.html
sidebar: rest_api_guide_sidebar
---
