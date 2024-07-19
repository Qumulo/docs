---
category: /session
methods:
  post:
    parameters: []
    request_body:
      schema: "{\n  \"description\": \"login\",\n  \"type\": \"object\",\n  \"properties\"\
        : {\n    \"username\": {\n      \"description\": \"The username to authenticate\
        \ with\",\n      \"type\": \"string\"\n    },\n    \"password\": {\n     \
        \ \"description\": \"The password to authenticate with\",\n      \"type\"\
        : \"string\",\n      \"format\": \"password\"\n    }\n  }\n}"
    response_body:
      schema: "{\n  \"description\": \"credentials\",\n  \"type\": \"object\",\n \
        \ \"properties\": {\n    \"bearer_token\": {\n      \"description\": \"bearer_token\"\
        ,\n      \"type\": \"string\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Authenticate the user. To authenticate subsequent requests, provide the
      bearer token from the response in the Authorization header.
rest_endpoint: /v1/session/login
permalink: /rest-api-guide/session/login.html
sidebar: rest_api_guide_sidebar
---