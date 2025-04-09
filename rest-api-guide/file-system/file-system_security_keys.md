---
category: /File System
methods:
  get:
    summary: "List the file system\u2019s public keys."
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"api_change_lock_keys\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"entries\": {\n      \"type\": \"array\",\n \
        \     \"items\": {\n        \"description\": \"A list of the key\\u2019s properties.\"\
        ,\n        \"type\": \"object\",\n        \"properties\": {\n          \"\
        id\": {\n            \"description\": \"The identifier associated with the\
        \ specified key.\",\n            \"type\": \"string\"\n          },\n    \
        \      \"name\": {\n            \"description\": \"The unique name of the\
        \ specified key.\",\n            \"type\": \"string\"\n          },\n    \
        \      \"comment\": {\n            \"description\": \"A descriptive comment\
        \ about the specified key.\",\n            \"type\": \"string\"\n        \
        \  },\n          \"disabled\": {\n            \"description\": \"Specifies\
        \ whether the key is disabled.\",\n            \"type\": \"boolean\"\n   \
        \       },\n          \"public_key\": {\n            \"description\": \"The\
        \ contents of the public key.\",\n            \"type\": \"string\"\n     \
        \     }\n        }\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
  post:
    summary: Register a new file system public key.
    parameters: []
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
    preview: false
    request_body:
      schema: "{\n  \"description\": \"api_change_lock_key_create_request\",\n  \"\
        type\": \"object\",\n  \"properties\": {\n    \"name\": {\n      \"description\"\
        : \"The unique name of the specified key.\",\n      \"type\": \"string\"\n\
        \    },\n    \"comment\": {\n      \"description\": \"A descriptive comment\
        \ about the specified key.\",\n      \"type\": \"string\"\n    },\n    \"\
        public_key\": {\n      \"description\": \"The public key.\",\n      \"type\"\
        : \"string\"\n    },\n    \"verification_signature\": {\n      \"description\"\
        : \"The name of the key signed with the private key.\",\n      \"type\": \"\
        string\"\n    }\n  }\n}"
rest_endpoint: /v1/file-system/security/keys/
api_version: v1
permalink: /rest-api-guide/file-system/file-system_security_keys.html
sidebar: rest_api_guide_sidebar
---
