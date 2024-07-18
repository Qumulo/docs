---
category: /auth
methods:
  delete:
    parameters:
    - description: ETag for expected version
      name: If-Match
      required: false
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    summary: Delete the current Kerberos keytab configuration
  get:
    parameters: []
    response_body:
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"kerberos_keytab\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"entries\": {\n      \"type\": \"array\",\n \
        \     \"items\": {\n        \"description\": \"entries\",\n        \"type\"\
        : \"object\",\n        \"properties\": {\n          \"principal\": {\n   \
        \         \"description\": \"principal\",\n            \"type\": \"string\"\
        \n          },\n          \"version\": {\n            \"description\": \"\
        version\",\n            \"type\": \"number\"\n          },\n          \"enctype\"\
        : {\n            \"type\": \"string\",\n            \"enum\": [\n        \
        \      \"KERBEROS_ENCRYPTION_TYPE_NULL\",\n              \"KERBEROS_ENCRYPTION_TYPE_DES_CBC_CRC\"\
        ,\n              \"KERBEROS_ENCRYPTION_TYPE_DES_CBC_MD4\",\n             \
        \ \"KERBEROS_ENCRYPTION_TYPE_DES_CBC_MD5\",\n              \"KERBEROS_ENCRYPTION_TYPE_DES3_CBC_MD5\"\
        ,\n              \"KERBEROS_ENCRYPTION_TYPE_OLD_DES3_CBC_SHA1\",\n       \
        \       \"KERBEROS_ENCRYPTION_TYPE_SIGN_DSA_GENERATE\",\n              \"\
        KERBEROS_ENCRYPTION_TYPE_ENCRYPT_RSA_PRIV\",\n              \"KERBEROS_ENCRYPTION_TYPE_ENCRYPT_RSA_PUB\"\
        ,\n              \"KERBEROS_ENCRYPTION_TYPE_DES3_CBC_SHA1\",\n           \
        \   \"KERBEROS_ENCRYPTION_TYPE_AES128_CTS_HMAC_SHA1_96\",\n              \"\
        KERBEROS_ENCRYPTION_TYPE_AES256_CTS_HMAC_SHA1_96\",\n              \"KERBEROS_ENCRYPTION_TYPE_AES128_CTS_HMAC_SHA256_128\"\
        ,\n              \"KERBEROS_ENCRYPTION_TYPE_AES256_CTS_HMAC_SHA384_192\",\n\
        \              \"KERBEROS_ENCRYPTION_TYPE_ARCFOUR_HMAC_MD5\",\n          \
        \    \"KERBEROS_ENCRYPTION_TYPE_ARCFOUR_HMAC_MD5_56\",\n              \"KERBEROS_ENCRYPTION_TYPE_ENCTYPE_PK_CROSS\"\
        ,\n              \"KERBEROS_ENCRYPTION_TYPE_ARCFOUR_MD4\",\n             \
        \ \"KERBEROS_ENCRYPTION_TYPE_ARCFOUR_HMAC_OLD\",\n              \"KERBEROS_ENCRYPTION_TYPE_ARCFOUR_HMAC_OLD_EXP\"\
        ,\n              \"KERBEROS_ENCRYPTION_TYPE_DES_CBC_NONE\",\n            \
        \  \"KERBEROS_ENCRYPTION_TYPE_DES3_CBC_NONE\",\n              \"KERBEROS_ENCRYPTION_TYPE_DES_CFB64_NONE\"\
        ,\n              \"KERBEROS_ENCRYPTION_TYPE_DES_PCBC_NONE\",\n           \
        \   \"KERBEROS_ENCRYPTION_TYPE_DIGEST_MD5_NONE\",\n              \"KERBEROS_ENCRYPTION_TYPE_CRAM_MD5_NONE\"\
        \n            ],\n            \"description\": \"enctype:\\n * `KERBEROS_ENCRYPTION_TYPE_AES128_CTS_HMAC_SHA1_96`\
        \ - KERBEROS_ENCRYPTION_TYPE_AES128_CTS_HMAC_SHA1_96,\\n * `KERBEROS_ENCRYPTION_TYPE_AES128_CTS_HMAC_SHA256_128`\
        \ - KERBEROS_ENCRYPTION_TYPE_AES128_CTS_HMAC_SHA256_128,\\n * `KERBEROS_ENCRYPTION_TYPE_AES256_CTS_HMAC_SHA1_96`\
        \ - KERBEROS_ENCRYPTION_TYPE_AES256_CTS_HMAC_SHA1_96,\\n * `KERBEROS_ENCRYPTION_TYPE_AES256_CTS_HMAC_SHA384_192`\
        \ - KERBEROS_ENCRYPTION_TYPE_AES256_CTS_HMAC_SHA384_192,\\n * `KERBEROS_ENCRYPTION_TYPE_ARCFOUR_HMAC_MD5`\
        \ - KERBEROS_ENCRYPTION_TYPE_ARCFOUR_HMAC_MD5,\\n * `KERBEROS_ENCRYPTION_TYPE_ARCFOUR_HMAC_MD5_56`\
        \ - KERBEROS_ENCRYPTION_TYPE_ARCFOUR_HMAC_MD5_56,\\n * `KERBEROS_ENCRYPTION_TYPE_ARCFOUR_HMAC_OLD`\
        \ - KERBEROS_ENCRYPTION_TYPE_ARCFOUR_HMAC_OLD,\\n * `KERBEROS_ENCRYPTION_TYPE_ARCFOUR_HMAC_OLD_EXP`\
        \ - KERBEROS_ENCRYPTION_TYPE_ARCFOUR_HMAC_OLD_EXP,\\n * `KERBEROS_ENCRYPTION_TYPE_ARCFOUR_MD4`\
        \ - KERBEROS_ENCRYPTION_TYPE_ARCFOUR_MD4,\\n * `KERBEROS_ENCRYPTION_TYPE_CRAM_MD5_NONE`\
        \ - KERBEROS_ENCRYPTION_TYPE_CRAM_MD5_NONE,\\n * `KERBEROS_ENCRYPTION_TYPE_DES3_CBC_MD5`\
        \ - KERBEROS_ENCRYPTION_TYPE_DES3_CBC_MD5,\\n * `KERBEROS_ENCRYPTION_TYPE_DES3_CBC_NONE`\
        \ - KERBEROS_ENCRYPTION_TYPE_DES3_CBC_NONE,\\n * `KERBEROS_ENCRYPTION_TYPE_DES3_CBC_SHA1`\
        \ - KERBEROS_ENCRYPTION_TYPE_DES3_CBC_SHA1,\\n * `KERBEROS_ENCRYPTION_TYPE_DES_CBC_CRC`\
        \ - KERBEROS_ENCRYPTION_TYPE_DES_CBC_CRC,\\n * `KERBEROS_ENCRYPTION_TYPE_DES_CBC_MD4`\
        \ - KERBEROS_ENCRYPTION_TYPE_DES_CBC_MD4,\\n * `KERBEROS_ENCRYPTION_TYPE_DES_CBC_MD5`\
        \ - KERBEROS_ENCRYPTION_TYPE_DES_CBC_MD5,\\n * `KERBEROS_ENCRYPTION_TYPE_DES_CBC_NONE`\
        \ - KERBEROS_ENCRYPTION_TYPE_DES_CBC_NONE,\\n * `KERBEROS_ENCRYPTION_TYPE_DES_CFB64_NONE`\
        \ - KERBEROS_ENCRYPTION_TYPE_DES_CFB64_NONE,\\n * `KERBEROS_ENCRYPTION_TYPE_DES_PCBC_NONE`\
        \ - KERBEROS_ENCRYPTION_TYPE_DES_PCBC_NONE,\\n * `KERBEROS_ENCRYPTION_TYPE_DIGEST_MD5_NONE`\
        \ - KERBEROS_ENCRYPTION_TYPE_DIGEST_MD5_NONE,\\n * `KERBEROS_ENCRYPTION_TYPE_ENCRYPT_RSA_PRIV`\
        \ - KERBEROS_ENCRYPTION_TYPE_ENCRYPT_RSA_PRIV,\\n * `KERBEROS_ENCRYPTION_TYPE_ENCRYPT_RSA_PUB`\
        \ - KERBEROS_ENCRYPTION_TYPE_ENCRYPT_RSA_PUB,\\n * `KERBEROS_ENCRYPTION_TYPE_ENCTYPE_PK_CROSS`\
        \ - KERBEROS_ENCRYPTION_TYPE_ENCTYPE_PK_CROSS,\\n * `KERBEROS_ENCRYPTION_TYPE_NULL`\
        \ - KERBEROS_ENCRYPTION_TYPE_NULL,\\n * `KERBEROS_ENCRYPTION_TYPE_OLD_DES3_CBC_SHA1`\
        \ - KERBEROS_ENCRYPTION_TYPE_OLD_DES3_CBC_SHA1,\\n * `KERBEROS_ENCRYPTION_TYPE_SIGN_DSA_GENERATE`\
        \ - KERBEROS_ENCRYPTION_TYPE_SIGN_DSA_GENERATE\"\n          },\n         \
        \ \"key\": {\n            \"type\": \"array\",\n            \"items\": {\n\
        \              \"description\": \"key\",\n              \"type\": \"number\"\
        \n            }\n          }\n        }\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Get the entries from the current keytab configuration
  put:
    parameters:
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
      example_value: '"TO DO"'
      schema: "{\n  \"type\": \"object\"\n}"
    response_body:
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"kerberos_keytab\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"entries\": {\n      \"type\": \"array\",\n \
        \     \"items\": {\n        \"description\": \"entries\",\n        \"type\"\
        : \"object\",\n        \"properties\": {\n          \"principal\": {\n   \
        \         \"description\": \"principal\",\n            \"type\": \"string\"\
        \n          },\n          \"version\": {\n            \"description\": \"\
        version\",\n            \"type\": \"number\"\n          },\n          \"enctype\"\
        : {\n            \"type\": \"string\",\n            \"enum\": [\n        \
        \      \"KERBEROS_ENCRYPTION_TYPE_NULL\",\n              \"KERBEROS_ENCRYPTION_TYPE_DES_CBC_CRC\"\
        ,\n              \"KERBEROS_ENCRYPTION_TYPE_DES_CBC_MD4\",\n             \
        \ \"KERBEROS_ENCRYPTION_TYPE_DES_CBC_MD5\",\n              \"KERBEROS_ENCRYPTION_TYPE_DES3_CBC_MD5\"\
        ,\n              \"KERBEROS_ENCRYPTION_TYPE_OLD_DES3_CBC_SHA1\",\n       \
        \       \"KERBEROS_ENCRYPTION_TYPE_SIGN_DSA_GENERATE\",\n              \"\
        KERBEROS_ENCRYPTION_TYPE_ENCRYPT_RSA_PRIV\",\n              \"KERBEROS_ENCRYPTION_TYPE_ENCRYPT_RSA_PUB\"\
        ,\n              \"KERBEROS_ENCRYPTION_TYPE_DES3_CBC_SHA1\",\n           \
        \   \"KERBEROS_ENCRYPTION_TYPE_AES128_CTS_HMAC_SHA1_96\",\n              \"\
        KERBEROS_ENCRYPTION_TYPE_AES256_CTS_HMAC_SHA1_96\",\n              \"KERBEROS_ENCRYPTION_TYPE_AES128_CTS_HMAC_SHA256_128\"\
        ,\n              \"KERBEROS_ENCRYPTION_TYPE_AES256_CTS_HMAC_SHA384_192\",\n\
        \              \"KERBEROS_ENCRYPTION_TYPE_ARCFOUR_HMAC_MD5\",\n          \
        \    \"KERBEROS_ENCRYPTION_TYPE_ARCFOUR_HMAC_MD5_56\",\n              \"KERBEROS_ENCRYPTION_TYPE_ENCTYPE_PK_CROSS\"\
        ,\n              \"KERBEROS_ENCRYPTION_TYPE_ARCFOUR_MD4\",\n             \
        \ \"KERBEROS_ENCRYPTION_TYPE_ARCFOUR_HMAC_OLD\",\n              \"KERBEROS_ENCRYPTION_TYPE_ARCFOUR_HMAC_OLD_EXP\"\
        ,\n              \"KERBEROS_ENCRYPTION_TYPE_DES_CBC_NONE\",\n            \
        \  \"KERBEROS_ENCRYPTION_TYPE_DES3_CBC_NONE\",\n              \"KERBEROS_ENCRYPTION_TYPE_DES_CFB64_NONE\"\
        ,\n              \"KERBEROS_ENCRYPTION_TYPE_DES_PCBC_NONE\",\n           \
        \   \"KERBEROS_ENCRYPTION_TYPE_DIGEST_MD5_NONE\",\n              \"KERBEROS_ENCRYPTION_TYPE_CRAM_MD5_NONE\"\
        \n            ],\n            \"description\": \"enctype:\\n * `KERBEROS_ENCRYPTION_TYPE_AES128_CTS_HMAC_SHA1_96`\
        \ - KERBEROS_ENCRYPTION_TYPE_AES128_CTS_HMAC_SHA1_96,\\n * `KERBEROS_ENCRYPTION_TYPE_AES128_CTS_HMAC_SHA256_128`\
        \ - KERBEROS_ENCRYPTION_TYPE_AES128_CTS_HMAC_SHA256_128,\\n * `KERBEROS_ENCRYPTION_TYPE_AES256_CTS_HMAC_SHA1_96`\
        \ - KERBEROS_ENCRYPTION_TYPE_AES256_CTS_HMAC_SHA1_96,\\n * `KERBEROS_ENCRYPTION_TYPE_AES256_CTS_HMAC_SHA384_192`\
        \ - KERBEROS_ENCRYPTION_TYPE_AES256_CTS_HMAC_SHA384_192,\\n * `KERBEROS_ENCRYPTION_TYPE_ARCFOUR_HMAC_MD5`\
        \ - KERBEROS_ENCRYPTION_TYPE_ARCFOUR_HMAC_MD5,\\n * `KERBEROS_ENCRYPTION_TYPE_ARCFOUR_HMAC_MD5_56`\
        \ - KERBEROS_ENCRYPTION_TYPE_ARCFOUR_HMAC_MD5_56,\\n * `KERBEROS_ENCRYPTION_TYPE_ARCFOUR_HMAC_OLD`\
        \ - KERBEROS_ENCRYPTION_TYPE_ARCFOUR_HMAC_OLD,\\n * `KERBEROS_ENCRYPTION_TYPE_ARCFOUR_HMAC_OLD_EXP`\
        \ - KERBEROS_ENCRYPTION_TYPE_ARCFOUR_HMAC_OLD_EXP,\\n * `KERBEROS_ENCRYPTION_TYPE_ARCFOUR_MD4`\
        \ - KERBEROS_ENCRYPTION_TYPE_ARCFOUR_MD4,\\n * `KERBEROS_ENCRYPTION_TYPE_CRAM_MD5_NONE`\
        \ - KERBEROS_ENCRYPTION_TYPE_CRAM_MD5_NONE,\\n * `KERBEROS_ENCRYPTION_TYPE_DES3_CBC_MD5`\
        \ - KERBEROS_ENCRYPTION_TYPE_DES3_CBC_MD5,\\n * `KERBEROS_ENCRYPTION_TYPE_DES3_CBC_NONE`\
        \ - KERBEROS_ENCRYPTION_TYPE_DES3_CBC_NONE,\\n * `KERBEROS_ENCRYPTION_TYPE_DES3_CBC_SHA1`\
        \ - KERBEROS_ENCRYPTION_TYPE_DES3_CBC_SHA1,\\n * `KERBEROS_ENCRYPTION_TYPE_DES_CBC_CRC`\
        \ - KERBEROS_ENCRYPTION_TYPE_DES_CBC_CRC,\\n * `KERBEROS_ENCRYPTION_TYPE_DES_CBC_MD4`\
        \ - KERBEROS_ENCRYPTION_TYPE_DES_CBC_MD4,\\n * `KERBEROS_ENCRYPTION_TYPE_DES_CBC_MD5`\
        \ - KERBEROS_ENCRYPTION_TYPE_DES_CBC_MD5,\\n * `KERBEROS_ENCRYPTION_TYPE_DES_CBC_NONE`\
        \ - KERBEROS_ENCRYPTION_TYPE_DES_CBC_NONE,\\n * `KERBEROS_ENCRYPTION_TYPE_DES_CFB64_NONE`\
        \ - KERBEROS_ENCRYPTION_TYPE_DES_CFB64_NONE,\\n * `KERBEROS_ENCRYPTION_TYPE_DES_PCBC_NONE`\
        \ - KERBEROS_ENCRYPTION_TYPE_DES_PCBC_NONE,\\n * `KERBEROS_ENCRYPTION_TYPE_DIGEST_MD5_NONE`\
        \ - KERBEROS_ENCRYPTION_TYPE_DIGEST_MD5_NONE,\\n * `KERBEROS_ENCRYPTION_TYPE_ENCRYPT_RSA_PRIV`\
        \ - KERBEROS_ENCRYPTION_TYPE_ENCRYPT_RSA_PRIV,\\n * `KERBEROS_ENCRYPTION_TYPE_ENCRYPT_RSA_PUB`\
        \ - KERBEROS_ENCRYPTION_TYPE_ENCRYPT_RSA_PUB,\\n * `KERBEROS_ENCRYPTION_TYPE_ENCTYPE_PK_CROSS`\
        \ - KERBEROS_ENCRYPTION_TYPE_ENCTYPE_PK_CROSS,\\n * `KERBEROS_ENCRYPTION_TYPE_NULL`\
        \ - KERBEROS_ENCRYPTION_TYPE_NULL,\\n * `KERBEROS_ENCRYPTION_TYPE_OLD_DES3_CBC_SHA1`\
        \ - KERBEROS_ENCRYPTION_TYPE_OLD_DES3_CBC_SHA1,\\n * `KERBEROS_ENCRYPTION_TYPE_SIGN_DSA_GENERATE`\
        \ - KERBEROS_ENCRYPTION_TYPE_SIGN_DSA_GENERATE\"\n          },\n         \
        \ \"key\": {\n            \"type\": \"array\",\n            \"items\": {\n\
        \              \"description\": \"key\",\n              \"type\": \"number\"\
        \n            }\n          }\n        }\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Set the Kerberos keytab from a generated keytab file. This API also accepts
      a kerberos keytab in the JSON form returned by the corresponding GET request.
rest_endpoint: /v1/auth/kerberos-keytab
permalink: /rest-api-guide/auth/kerberos-keytab.html
sidebar: rest_api_guide_sidebar
---
