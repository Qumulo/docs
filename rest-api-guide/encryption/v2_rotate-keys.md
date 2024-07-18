---
category: /encryption
methods:
  post:
    parameters: []
    request_body:
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"api_encryption_rotate_key_v2\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"key_id\": {\n      \"description\"\
        : \"The unique ID of the master key for at-rest encryption that Qumulo Core\
        \ uses if a Key Management Server is in use.\",\n      \"type\": \"string\"\
        \n    }\n  }\n}"
    response_body:
      description: Return value on success
      example_value: '"TO DO"'
      schema: '"TO DO"'
      status_code: '200'
    summary: Rotate the encryption at rest keys.
rest_endpoint: /v2/encryption/rotate-keys
permalink: /rest-api-guide/encryption/v2_rotate-keys.html
sidebar: rest_api_guide_sidebar
---
