---
category: /file-system
methods:
  delete:
    parameters:
    - description: The name or identifier of the key.
      name: key_ref
      required: true
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Delete the file system public key by using the name or identifier of
      the specified key.
  get:
    parameters:
    - description: The name or identifier of the key.
      name: key_ref
      required: true
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Get the file system public key by using the name or identifier of the
      specified key.
  patch:
    parameters:
    - description: The name or identifier of the key.
      name: key_ref
      required: true
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
    summary: Patch the file system public key by using the name or identifier of the
      specified key.
  put:
    parameters:
    - description: The name or identifier of the key.
      name: key_ref
      required: true
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
    summary: Put the file system public key by using the name or identifier of the
      specified key.
rest_endpoint: /v1/file-system/security/keys/{key_ref}
sidebar: rest_api_command_guide_sidebar
---
