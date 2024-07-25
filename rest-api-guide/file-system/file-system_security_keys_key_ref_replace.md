---
category: /File System
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
      schema: "{\n  \"description\": \"api_change_lock_key_replace_request\",\n  \"\
        type\": \"object\",\n  \"properties\": {\n    \"replacement_key\": {\n   \
        \   \"description\": \"The replacement public key.\",\n      \"type\": \"\
        string\"\n    },\n    \"old_key_verification_signature\": {\n      \"description\"\
        : \"The key replacement challenge signed with the current private key.\",\n\
        \      \"type\": \"string\"\n    },\n    \"replacement_key_verification_signature\"\
        : {\n      \"description\": \"The key replacement challenge signed with the\
        \ replacement private key.\",\n      \"type\": \"string\"\n    }\n  }\n}"
    response_body:
      schema: "{\n  \"description\": \"api_change_lock_key\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"id\": {\n      \"description\": \"The identifier\
        \ associated with the specified key.\",\n      \"type\": \"string\"\n    },\n\
        \    \"name\": {\n      \"description\": \"The unique name of the specified\
        \ key.\",\n      \"type\": \"string\"\n    },\n    \"comment\": {\n      \"\
        description\": \"A descriptive comment about the specified key.\",\n     \
        \ \"type\": \"string\"\n    },\n    \"disabled\": {\n      \"description\"\
        : \"Specifies whether the key is disabled.\",\n      \"type\": \"boolean\"\
        \n    },\n    \"public_key\": {\n      \"description\": \"The contents of\
        \ the public key.\",\n      \"type\": \"string\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Replace the file system public key by using the name or identifier of
      the specified key.
rest_endpoint: /v1/file-system/security/keys/{key_ref}/replace
api_version: v1
permalink: /rest-api-guide/file-system/file-system_security_keys_key_ref_replace.html
sidebar: rest_api_guide_sidebar
---
