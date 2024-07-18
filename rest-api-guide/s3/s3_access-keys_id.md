---
category: /s3
methods:
  delete:
    parameters:
    - description: Access Key ID
      name: id
      required: true
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Delete the key identified by the given Access Key ID the current user.
      Access is revoked immediately.
rest_endpoint: /v1/s3/access-keys/{id}
sidebar: rest_api_command_guide_sidebar
---
