---
category: /cluster
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
    summary: Delete the SSL certificate authority the cluster trusts when authenticating
      outbound connections.
  get:
    parameters: []
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Get the SSL certificate authority the cluster trusts when authenticating
      outbound connections.
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
    summary: Set the SSL certificate authority the cluster trusts when authenticating
      outbound connections.
rest_endpoint: /v2/cluster/settings/ssl/ca-certificate
sidebar: rest_api_command_guide_sidebar
---
