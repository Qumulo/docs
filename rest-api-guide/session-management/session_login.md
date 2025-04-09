---
category: /Session Management
methods:
  post:
    summary: Authenticate the user. To authenticate subsequent requests, provide the
      bearer token from the response in the Authorization header.
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"credentials\",\n  \"type\": \"object\",\n \
        \ \"properties\": {\n    \"bearer_token\": {\n      \"description\": \"bearer_token\"\
        ,\n      \"type\": \"string\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
    request_body:
      schema: "{\n  \"description\": \"login\",\n  \"type\": \"object\",\n  \"properties\"\
        : {\n    \"username\": {\n      \"description\": \"The username to authenticate\
        \ with\",\n      \"type\": \"string\"\n    },\n    \"password\": {\n     \
        \ \"description\": \"The password to authenticate with\",\n      \"type\"\
        : \"string\",\n      \"format\": \"password\"\n    }\n  }\n}"
rest_endpoint: /v1/session/login
api_version: v1
permalink: /rest-api-guide/session-management/session_login.html
sidebar: rest_api_guide_sidebar
---
