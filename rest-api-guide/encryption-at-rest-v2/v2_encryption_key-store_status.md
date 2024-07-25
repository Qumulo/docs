---
category: /Encryption at Rest V2
methods:
  get:
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"encryption_api_v2_status_response\",\n  \"\
        type\": \"object\",\n  \"properties\": {\n    \"type\": {\n      \"type\"\
        : \"string\",\n      \"enum\": [\n        \"Local\",\n        \"KMS\"\n  \
        \    ],\n      \"description\": \"Does the cluster connect to a Key Management\
        \ Server?:\\n * `KMS` - ENCRYPTION_TYPE_KMS,\\n * `Local` - ENCRYPTION_TYPE_LOCAL\"\
        \n    },\n    \"status\": {\n      \"type\": \"string\",\n      \"enum\":\
        \ [\n        \"Not Encrypted\",\n        \"Encrypted\",\n        \"Configuration\
        \ Corrupted\",\n        \"KMS Available\",\n        \"KMS Authentication Error\"\
        ,\n        \"Cannot connect to KMS server.\",\n        \"KMS Key Not Found\"\
        ,\n        \"KMS Key Inactive\"\n      ],\n      \"description\": \"Is the\
        \ Key Management Server accessible?:\\n * `Cannot connect to KMS server.`\
        \ - ENCRYPTION_CONFIG_STATUS_KMS_CANNOT_CONNECT,\\n * `Configuration Corrupted`\
        \ - ENCRYPTION_CONFIG_STATUS_CONFIG_CORRUPTED,\\n * `Encrypted` - ENCRYPTION_CONFIG_STATUS_LOCAL,\\\
        n * `KMS Authentication Error` - ENCRYPTION_CONFIG_STATUS_KMS_AUTHENTICATION_ERROR,\\\
        n * `KMS Available` - ENCRYPTION_CONFIG_STATUS_KMS_AVAILABLE,\\n * `KMS Key\
        \ Inactive` - ENCRYPTION_CONFIG_STATUS_KMS_KEY_INACTIVE,\\n * `KMS Key Not\
        \ Found` - ENCRYPTION_CONFIG_STATUS_KMS_KEY_NOT_FOUND,\\n * `Not Encrypted`\
        \ - ENCRYPTION_CONFIG_STATUS_NOT_ENCRYPTED\"\n    },\n    \"ca_cert_expiry\"\
        : {\n      \"description\": \"The expiry date for the Key Management Server\
        \ Certificate Authority certificate.\",\n      \"type\": \"string\"\n    },\n\
        \    \"client_cert_expiry\": {\n      \"description\": \"The expiry date for\
        \ the client certificate.\",\n      \"type\": \"string\"\n    },\n    \"last_key_rotation_time\"\
        : {\n      \"description\": \"The time at which the current encryption key\
        \ became active.\",\n      \"type\": \"string\"\n    },\n    \"last_status_update_time\"\
        : {\n      \"description\": \"The time at which this status of the configuration\
        \ was last updated.\",\n      \"type\": \"string\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: View the status of at-rest encryption.
rest_endpoint: /v2/encryption/key-store/status
api_version: v2
permalink: /rest-api-guide/encryption-at-rest-v2/v2_encryption_key-store_status.html
sidebar: rest_api_guide_sidebar
---
