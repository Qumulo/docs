---
category: /Nexus Configuration V1
methods:
  get:
    summary: Retrieve current Nexus registration status
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"nexus_registration_status\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"nexus_enabled\": {\n      \"description\"\
        : \"nexus_enabled\",\n      \"type\": \"boolean\"\n    },\n    \"registration_status\"\
        : {\n      \"type\": \"string\",\n      \"enum\": [\n        \"NONE\",\n \
        \       \"PENDING_REGISTRATION\",\n        \"ERROR_REGISTERING\",\n      \
        \  \"REGISTERED\"\n      ],\n      \"description\": \"registration_status:\\\
        n * `ERROR_REGISTERING` - ERROR_REGISTERING,\\n * `NONE` - NONE,\\n * `PENDING_REGISTRATION`\
        \ - PENDING_REGISTRATION,\\n * `REGISTERED` - REGISTERED\"\n    },\n    \"\
        secret_created_at\": {\n      \"description\": \"secret_created_at\",\n  \
        \    \"type\": \"string\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
  put:
    summary: Register cluster with Nexus using a join key
    parameters:
    - name: If-Match
      description: ETag for expected version
      required: false
    response_body:
      schema: "{\n  \"description\": \"nexus_registration_status\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"nexus_enabled\": {\n      \"description\"\
        : \"nexus_enabled\",\n      \"type\": \"boolean\"\n    },\n    \"registration_status\"\
        : {\n      \"type\": \"string\",\n      \"enum\": [\n        \"NONE\",\n \
        \       \"PENDING_REGISTRATION\",\n        \"ERROR_REGISTERING\",\n      \
        \  \"REGISTERED\"\n      ],\n      \"description\": \"registration_status:\\\
        n * `ERROR_REGISTERING` - ERROR_REGISTERING,\\n * `NONE` - NONE,\\n * `PENDING_REGISTRATION`\
        \ - PENDING_REGISTRATION,\\n * `REGISTERED` - REGISTERED\"\n    },\n    \"\
        secret_created_at\": {\n      \"description\": \"secret_created_at\",\n  \
        \    \"type\": \"string\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
    request_body:
      schema: "{\n  \"description\": \"nexus_registration_put\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"join_key\": {\n      \"description\": \"join_key\"\
        ,\n      \"type\": \"string\"\n    }\n  }\n}"
  delete:
    summary: Forget current Nexus registration secrets
    parameters:
    - name: If-Match
      description: ETag for expected version
      required: false
    response_body:
      schema: "{\n  \"description\": \"nexus_registration_status\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"nexus_enabled\": {\n      \"description\"\
        : \"nexus_enabled\",\n      \"type\": \"boolean\"\n    },\n    \"registration_status\"\
        : {\n      \"type\": \"string\",\n      \"enum\": [\n        \"NONE\",\n \
        \       \"PENDING_REGISTRATION\",\n        \"ERROR_REGISTERING\",\n      \
        \  \"REGISTERED\"\n      ],\n      \"description\": \"registration_status:\\\
        n * `ERROR_REGISTERING` - ERROR_REGISTERING,\\n * `NONE` - NONE,\\n * `PENDING_REGISTRATION`\
        \ - PENDING_REGISTRATION,\\n * `REGISTERED` - REGISTERED\"\n    },\n    \"\
        secret_created_at\": {\n      \"description\": \"secret_created_at\",\n  \
        \    \"type\": \"string\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
rest_endpoint: /v1/nexus/registration
api_version: v1
permalink: /rest-api-guide/nexus-configuration-v1/nexus_registration.html
sidebar: rest_api_guide_sidebar
deprecated: false
---
