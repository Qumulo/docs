---
category: /file-system
methods:
  post:
    parameters:
    - description: The name or identifier of the key to replace.
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
    summary: Replace the file system public key by using the name or identifier of
      the specified key.
rest_endpoint: /v1/file-system/security/keys/{key_ref}/replace
permalink: /rest-api-guide/file-system/file-system_security_keys__key_ref_replace.html
sidebar: rest_api_guide_sidebar
---
