---
category: /auth
methods:
  delete:
    parameters:
    - description: ETag for expected version
      name: If-Match
      required: false
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Delete the current Kerberos keytab configuration
  get:
    parameters: []
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Get the entries from the current keytab configuration
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
    summary: Set the Kerberos keytab from a generated keytab file. This API also accepts
      a kerberos keytab in the JSON form returned by the corresponding GET request.
rest_endpoint: /v1/auth/kerberos-keytab
permalink: /rest-api-guide/auth/kerberos-keytab.html
sidebar: rest_api_command_guide_sidebar
---
