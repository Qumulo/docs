---
category: /Encryption at Rest V2
methods:
  post:
    parameters: []
    request_body:
      schema: "{\n  \"description\": \"encryption_api_v2_create_kmip_key\",\n  \"\
        type\": \"object\",\n  \"properties\": {\n    \"kms_config\": {\n      \"\
        description\": \"The Key Management Server server parameters. If this is omitted\
        \ and a Key Management Server is already configured, the parameters from the\
        \ existing configuration will be used. It is an error to omit this field if\
        \ Key Management Server is not already configured on the cluster.\",\n   \
        \   \"type\": \"object\",\n      \"properties\": {\n        \"server_ca_cert\"\
        : {\n          \"description\": \"The Certificate Authority certificate that\
        \ Qumulo Core uses to validate the certificate that the Key Management Server\
        \ presents to client TLS connections.\",\n          \"type\": \"string\"\n\
        \        },\n        \"client_cert\": {\n          \"description\": \"The\
        \ client certificate that Qumulo Core uses to authenticate the cluster to\
        \ the Key Management Server.\",\n          \"type\": \"string\"\n        },\n\
        \        \"client_private_key\": {\n          \"description\": \"The private\
        \ key that corresponds to the specified client certificate.\",\n         \
        \ \"type\": \"string\"\n        },\n        \"hostname\": {\n          \"\
        description\": \"The hostname of the Key Management Server.\",\n         \
        \ \"type\": \"string\"\n        },\n        \"port\": {\n          \"description\"\
        : \"The port number of the Key Management Server, 5696 by default.\",\n  \
        \        \"type\": \"number\"\n        }\n      }\n    },\n    \"key_name\"\
        : {\n      \"description\": \"The name of the key that will be created in\
        \ the Key Management Server.\",\n      \"type\": \"string\"\n    }\n  }\n}"
    response_body:
      schema: "{\n  \"description\": \"encryption_api_v2_create_kmip_key_result\"\
        ,\n  \"type\": \"object\",\n  \"properties\": {\n    \"key_id\": {\n     \
        \ \"description\": \"The key id of the newly created key on the Key Management\
        \ Server.\",\n      \"type\": \"string\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Create a Key in the Key Management Server.
rest_endpoint: /v2/encryption/external-kms/keys/create
api_version: v2
permalink: /rest-api-guide/encryption-at-rest-v2/v2_encryption_external-kms_keys_create.html
sidebar: rest_api_guide_sidebar
---
