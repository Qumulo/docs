---
category: /s3
methods:
  get:
    parameters:
    - description: Filters access keys by the given user identity if specified.
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
    summary: List all S3 access keys present in the system.
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
    summary: Create a new S3 access key for the provided user identity. To add a new
      key, a user must have fewer than two keys.
rest_endpoint: /v1/s3/access-keys/
permalink: /rest-api-guide/s3/access-keys.html
sidebar: rest_api_command_guide_sidebar
---
