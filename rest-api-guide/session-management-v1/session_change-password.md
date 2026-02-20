---
category: /Session Management V1
methods:
  post:
    summary: Change the password for the logged in user.
    parameters: []
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    preview: false
    request_body:
      schema: "{\n  \"description\": \"password_change\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"old_password\": {\n      \"description\": \"\
        The current password\",\n      \"type\": \"string\",\n      \"format\": \"\
        password\"\n    },\n    \"new_password\": {\n      \"description\": \"The\
        \ new password\",\n      \"type\": \"string\",\n      \"format\": \"password\"\
        \n    }\n  }\n}"
rest_endpoint: /v1/session/change-password
api_version: v1
permalink: /rest-api-guide/session-management-v1/session_change-password.html
sidebar: rest_api_guide_sidebar
redirect_from: /rest-api-guide/session-management/session_change-password.html
deprecated: false
---
