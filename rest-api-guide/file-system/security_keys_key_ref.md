---
category: /file-system
methods:
  delete:
    parameters:
    - description: The name or identifier of the key.
      name: key_ref
      required: true
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    summary: Delete the file system public key by using the name or identifier of
      the specified key.
  get:
    parameters:
    - description: The name or identifier of the key.
      name: key_ref
      required: true
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
      schema: "{\n  \"description\": \"api_change_lock_key_patch\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"id\": {\n      \"description\": \"The\
        \ identifier associated with the specified key.\",\n      \"type\": \"string\"\
        \n    },\n    \"name\": {\n      \"description\": \"The unique name of the\
        \ specified key.\",\n      \"type\": \"string\"\n    },\n    \"comment\":\
        \ {\n      \"description\": \"A descriptive comment about the specified key.\"\
        ,\n      \"type\": \"string\"\n    },\n    \"disabled\": {\n      \"description\"\
        : \"Specifies whether the key is disabled.\",\n      \"type\": \"boolean\"\
        \n    },\n    \"public_key\": {\n      \"description\": \"The contents of\
        \ the public key.\",\n      \"type\": \"string\"\n    }\n  }\n}"
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
    summary: Put the file system public key by using the name or identifier of the
      specified key.
rest_endpoint: /v1/file-system/security/keys/{key_ref}
permalink: /rest-api-guide/file-system/security_keys_key_ref.html
sidebar: rest_api_guide_sidebar
---
