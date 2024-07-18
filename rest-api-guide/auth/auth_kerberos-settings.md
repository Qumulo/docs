---
category: /auth
methods:
  get:
    parameters: []
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Get the Kerberos settings
  put:
    parameters:
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
    summary: Set the Kerberos settings
rest_endpoint: /v1/auth/kerberos-settings
permalink: /rest-api-guide/auth/auth_kerberos-settings.html
sidebar: rest_api_command_guide_sidebar
---
