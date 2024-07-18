---
category: /encryption
methods:
  get:
    parameters: []
    response_body:
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"encryption_api_v2_key_store_response_union\"\
        ,\n  \"type\": \"object\",\n  \"properties\": {\n    \"type\": {\n      \"\
        type\": \"string\",\n      \"enum\": [\n        \"Local\",\n        \"KMS\"\
        \n      ],\n      \"description\": \"d:\\n * `KMS` - ENCRYPTION_TYPE_KMS,\\\
        n * `Local` - ENCRYPTION_TYPE_LOCAL\"\n    },\n    \"local_store\": {\n  \
        \    \"description\": \"Value present when type is ENCRYPTION_TYPE_LOCAL.\"\
        ,\n      \"type\": \"object\",\n      \"properties\": {\n        \"status\"\
        : {\n          \"type\": \"string\",\n          \"enum\": [\n            \"\
        Encrypted\",\n            \"Not Encrypted\"\n          ],\n          \"description\"\
        : \"Whether or not encryption at rest is enabled:\\n * `Encrypted` - ENCRYPTION_STATUS_ENCRYPTED,\\\
        n * `Not Encrypted` - ENCRYPTION_STATUS_NOT_ENCRYPTED\"\n        }\n     \
        \ }\n    },\n    \"kms_store\": {\n      \"description\": \"Value present\
        \ when type is ENCRYPTION_TYPE_KMS.\",\n      \"type\": \"object\",\n    \
        \  \"properties\": {\n        \"hostname\": {\n          \"description\":\
        \ \"The hostname of the Key Management Server.\",\n          \"type\": \"\
        string\"\n        },\n        \"port\": {\n          \"description\": \"The\
        \ port number of the Key Management Server, 5696 by default.\",\n        \
        \  \"type\": \"number\"\n        },\n        \"key_id\": {\n          \"description\"\
        : \"The unique ID of the master key for at-rest encryption that is stored\
        \ in the Key Management Server.\",\n          \"type\": \"string\"\n     \
        \   },\n        \"config_creation_time\": {\n          \"description\": \"\
        The time at which the current configuration became active.\",\n          \"\
        type\": \"string\"\n        }\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: View the active at-rest encryption configuration.
  put:
    parameters: []
    request_body:
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"encryption_api_v2_put_key_store_union\",\n\
        \  \"type\": \"object\",\n  \"properties\": {\n    \"type\": {\n      \"type\"\
        : \"string\",\n      \"enum\": [\n        \"Local\",\n        \"KMS\"\n  \
        \    ],\n      \"description\": \"d:\\n * `KMS` - ENCRYPTION_TYPE_KMS,\\n\
        \ * `Local` - ENCRYPTION_TYPE_LOCAL\"\n    },\n    \"kms_store\": {\n    \
        \  \"description\": \"Value present when type is ENCRYPTION_TYPE_KMS.\",\n\
        \      \"type\": \"object\",\n      \"properties\": {\n        \"server_ca_cert\"\
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
        \        \"type\": \"number\"\n        },\n        \"key_id\": {\n       \
        \   \"description\": \"The unique ID of the master key for at-rest encryption\
        \ that is stored in the Key Management Server.\",\n          \"type\": \"\
        string\"\n        }\n      }\n    }\n  }\n}"
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    summary: Update the active at-rest encryption configuration.
rest_endpoint: /v2/encryption/key-store
permalink: /rest-api-guide/encryption/v2_key-store.html
sidebar: rest_api_guide_sidebar
---
