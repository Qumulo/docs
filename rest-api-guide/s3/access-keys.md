---
category: /s3
methods:
  get:
    parameters:
    - description: Filters access keys by the given user identity if specified.
      name: user
      required: false
    - description: Return entries after the given key (keys are returned in the paging
        object)
      name: after
      required: false
    - description: Return no more than this many entries; the system may choose a
        smaller limit.
      name: limit
      required: false
    response_body:
      schema: "{\n  \"description\": \"api_key_description_list_model\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"entries\": {\n      \"type\": \"\
        array\",\n      \"items\": {\n        \"description\": \"entries\",\n    \
        \    \"type\": \"object\",\n        \"properties\": {\n          \"access_key_id\"\
        : {\n            \"description\": \"The access key ID of the S3 credentials\
        \ to use in signed requests.\",\n            \"type\": \"string\"\n      \
        \    },\n          \"owner\": {\n            \"description\": \"The system\
        \ identity that the requests with the current credentials use for file system\
        \ operations.\",\n            \"type\": \"object\",\n            \"properties\"\
        : {\n              \"domain\": {\n                \"type\": \"string\",\n\
        \                \"enum\": [\n                  \"LOCAL\",\n             \
        \     \"API_NULL_DOMAIN\",\n                  \"WORLD\",\n               \
        \   \"POSIX_USER\",\n                  \"POSIX_GROUP\",\n                \
        \  \"ACTIVE_DIRECTORY\",\n                  \"API_INVALID_DOMAIN\",\n    \
        \              \"API_RESERVED_DOMAIN\",\n                  \"API_INTERNAL_DOMAIN\"\
        ,\n                  \"API_OPERATOR_DOMAIN\",\n                  \"API_CREATOR_DOMAIN\"\
        \n                ],\n                \"description\": \"domain:\\n * `ACTIVE_DIRECTORY`\
        \ - ACTIVE_DIRECTORY,\\n * `API_CREATOR_DOMAIN` - API_CREATOR_DOMAIN,\\n *\
        \ `API_INTERNAL_DOMAIN` - API_INTERNAL_DOMAIN,\\n * `API_INVALID_DOMAIN` -\
        \ API_INVALID_DOMAIN,\\n * `API_NULL_DOMAIN` - API_NULL_DOMAIN,\\n * `API_OPERATOR_DOMAIN`\
        \ - API_OPERATOR_DOMAIN,\\n * `API_RESERVED_DOMAIN` - API_RESERVED_DOMAIN,\\\
        n * `LOCAL` - LOCAL,\\n * `POSIX_GROUP` - POSIX_GROUP,\\n * `POSIX_USER` -\
        \ POSIX_USER,\\n * `WORLD` - WORLD\"\n              },\n              \"auth_id\"\
        : {\n                \"description\": \"auth_id\",\n                \"type\"\
        : \"string\"\n              },\n              \"uid\": {\n               \
        \ \"description\": \"uid\",\n                \"type\": \"number\"\n      \
        \        },\n              \"gid\": {\n                \"description\": \"\
        gid\",\n                \"type\": \"number\"\n              },\n         \
        \     \"sid\": {\n                \"description\": \"sid\",\n            \
        \    \"type\": \"string\"\n              },\n              \"name\": {\n \
        \               \"description\": \"name\",\n                \"type\": \"string\"\
        \n              }\n            }\n          },\n          \"creation_time\"\
        : {\n            \"description\": \"The creation time of the current credentials.\"\
        ,\n            \"type\": \"string\"\n          }\n        }\n      }\n   \
        \ }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: List all S3 access keys present in the system.
  post:
    parameters: []
    request_body:
      schema: "{\n  \"description\": \"api_key_creation_options\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"user\": {\n      \"description\": \"\
        user\",\n      \"type\": \"object\",\n      \"properties\": {\n        \"\
        domain\": {\n          \"type\": \"string\",\n          \"enum\": [\n    \
        \        \"LOCAL\",\n            \"API_NULL_DOMAIN\",\n            \"WORLD\"\
        ,\n            \"POSIX_USER\",\n            \"POSIX_GROUP\",\n           \
        \ \"ACTIVE_DIRECTORY\",\n            \"API_INVALID_DOMAIN\",\n           \
        \ \"API_RESERVED_DOMAIN\",\n            \"API_INTERNAL_DOMAIN\",\n       \
        \     \"API_OPERATOR_DOMAIN\",\n            \"API_CREATOR_DOMAIN\"\n     \
        \     ],\n          \"description\": \"domain:\\n * `ACTIVE_DIRECTORY` - ACTIVE_DIRECTORY,\\\
        n * `API_CREATOR_DOMAIN` - API_CREATOR_DOMAIN,\\n * `API_INTERNAL_DOMAIN`\
        \ - API_INTERNAL_DOMAIN,\\n * `API_INVALID_DOMAIN` - API_INVALID_DOMAIN,\\\
        n * `API_NULL_DOMAIN` - API_NULL_DOMAIN,\\n * `API_OPERATOR_DOMAIN` - API_OPERATOR_DOMAIN,\\\
        n * `API_RESERVED_DOMAIN` - API_RESERVED_DOMAIN,\\n * `LOCAL` - LOCAL,\\n\
        \ * `POSIX_GROUP` - POSIX_GROUP,\\n * `POSIX_USER` - POSIX_USER,\\n * `WORLD`\
        \ - WORLD\"\n        },\n        \"auth_id\": {\n          \"description\"\
        : \"auth_id\",\n          \"type\": \"string\"\n        },\n        \"uid\"\
        : {\n          \"description\": \"uid\",\n          \"type\": \"number\"\n\
        \        },\n        \"gid\": {\n          \"description\": \"gid\",\n   \
        \       \"type\": \"number\"\n        },\n        \"sid\": {\n          \"\
        description\": \"sid\",\n          \"type\": \"string\"\n        },\n    \
        \    \"name\": {\n          \"description\": \"name\",\n          \"type\"\
        : \"string\"\n        }\n      }\n    }\n  }\n}"
    response_body:
      schema: "{\n  \"description\": \"api_created_key\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"access_key_id\": {\n      \"description\": \"\
        The access key ID of the S3 credentials to use in signed requests.\",\n  \
        \    \"type\": \"string\"\n    },\n    \"owner\": {\n      \"description\"\
        : \"The system identity which the requests with the current credentials use\
        \ for file system operations.\",\n      \"type\": \"object\",\n      \"properties\"\
        : {\n        \"domain\": {\n          \"type\": \"string\",\n          \"\
        enum\": [\n            \"LOCAL\",\n            \"API_NULL_DOMAIN\",\n    \
        \        \"WORLD\",\n            \"POSIX_USER\",\n            \"POSIX_GROUP\"\
        ,\n            \"ACTIVE_DIRECTORY\",\n            \"API_INVALID_DOMAIN\",\n\
        \            \"API_RESERVED_DOMAIN\",\n            \"API_INTERNAL_DOMAIN\"\
        ,\n            \"API_OPERATOR_DOMAIN\",\n            \"API_CREATOR_DOMAIN\"\
        \n          ],\n          \"description\": \"domain:\\n * `ACTIVE_DIRECTORY`\
        \ - ACTIVE_DIRECTORY,\\n * `API_CREATOR_DOMAIN` - API_CREATOR_DOMAIN,\\n *\
        \ `API_INTERNAL_DOMAIN` - API_INTERNAL_DOMAIN,\\n * `API_INVALID_DOMAIN` -\
        \ API_INVALID_DOMAIN,\\n * `API_NULL_DOMAIN` - API_NULL_DOMAIN,\\n * `API_OPERATOR_DOMAIN`\
        \ - API_OPERATOR_DOMAIN,\\n * `API_RESERVED_DOMAIN` - API_RESERVED_DOMAIN,\\\
        n * `LOCAL` - LOCAL,\\n * `POSIX_GROUP` - POSIX_GROUP,\\n * `POSIX_USER` -\
        \ POSIX_USER,\\n * `WORLD` - WORLD\"\n        },\n        \"auth_id\": {\n\
        \          \"description\": \"auth_id\",\n          \"type\": \"string\"\n\
        \        },\n        \"uid\": {\n          \"description\": \"uid\",\n   \
        \       \"type\": \"number\"\n        },\n        \"gid\": {\n          \"\
        description\": \"gid\",\n          \"type\": \"number\"\n        },\n    \
        \    \"sid\": {\n          \"description\": \"sid\",\n          \"type\":\
        \ \"string\"\n        },\n        \"name\": {\n          \"description\":\
        \ \"name\",\n          \"type\": \"string\"\n        }\n      }\n    },\n\
        \    \"secret_access_key\": {\n      \"description\": \"The secret access\
        \ key to use as the signing key in requests that use the current credentials.\"\
        ,\n      \"type\": \"string\"\n    },\n    \"creation_time\": {\n      \"\
        description\": \"The creation time of the current credentials.\",\n      \"\
        type\": \"string\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Create a new S3 access key for the provided user identity. To add a new
      key, a user must have fewer than two keys.
rest_endpoint: /v1/s3/access-keys/
api_version: v1
permalink: /rest-api-guide/s3/access-keys.html
sidebar: rest_api_guide_sidebar
---
