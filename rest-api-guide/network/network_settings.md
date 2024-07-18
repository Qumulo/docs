---
category: /network
methods:
  get:
    parameters: []
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Get global networking configuration for the whole cluster. This API is
      deprecated in favor of /v2/network/interfaces/ and /v2/network/interfaces/1/networks/.
  patch:
    parameters: []
    request_body:
      example_value: TO DO
      schema: TO DO
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '202'
    summary: Update networking configuration for the whole cluster. This API is deprecated
      in favor of /v2/network/interfaces/ and /v2/network/interfaces/1/networks/.
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
      status_code: '202'
    summary: Change networking configuration for the whole cluster. This API is deprecated
      in favor of /v2/network/interfaces/ and /v2/network/interfaces/1/networks/.
rest_endpoint: /v1/network/settings
permalink: /rest-api-guide/network/network_settings.html
sidebar: rest_api_guide_sidebar
---
