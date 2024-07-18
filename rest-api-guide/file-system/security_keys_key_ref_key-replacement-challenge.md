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
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"api_change_lock_key_replace_challenge\",\n\
        \  \"type\": \"object\",\n  \"properties\": {\n    \"challenge\": {\n    \
        \  \"description\": \"The security challenge for replacing the specified key.\"\
        ,\n      \"type\": \"string\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Get file system public key replacement challenge by using the name or
      identifier of the specified key.
rest_endpoint: /v1/file-system/security/keys/{key_ref}/key-replacement-challenge
permalink: /rest-api-guide/file-system/security_keys_key_ref_key-replacement-challenge.html
sidebar: rest_api_guide_sidebar
---
