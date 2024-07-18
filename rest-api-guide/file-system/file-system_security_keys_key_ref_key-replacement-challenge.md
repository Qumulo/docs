---
category: /file-system
methods:
  get:
    parameters:
    - description: The name or identifier of the key for which to get a security challenge
        for key replacement.
      name: key_ref
      required: true
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Get file system public key replacement challenge by using the name or
      identifier of the specified key.
rest_endpoint: /v1/file-system/security/keys/{key_ref}/key-replacement-challenge
sidebar: rest_api_command_guide_sidebar
---
