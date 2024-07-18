---
category: /auth
methods:
  get:
    parameters:
    - description: Filters access tokens by user identity if specified.
      name: user
      required: false
    - description: Return entries after the given key (keys are returned in the paging
        object)
      name: after
      required: false
    - description: Return no more than this many entries; the system may choose a
        smaller limit.
      name: limit
      required: false
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: List all access tokens for the cluster.
  post:
    parameters: []
    request_body:
      example_value: TO DO
      schema: TO DO
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Create an access token for the specified user.
rest_endpoint: /v1/auth/access-tokens/
permalink: /rest-api-guide/auth/auth_access-tokens.html
sidebar: rest_api_command_guide_sidebar
---
