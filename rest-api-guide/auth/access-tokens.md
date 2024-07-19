---
category: /auth
methods:
  get:
    parameters:
    - description: Filters access tokens by user identity if specified.
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
      schema: "{\n  \"description\": \"api_access_token_metadata_list_model\",\n \
        \ \"type\": \"object\",\n  \"properties\": {\n    \"entries\": {\n      \"\
        type\": \"array\",\n      \"items\": {\n        \"description\": \"entries\"\
        ,\n        \"type\": \"object\",\n        \"properties\": {\n          \"\
        id\": {\n            \"description\": \"The access token's identifier for\
        \ management APIs.\",\n            \"type\": \"string\"\n          },\n  \
        \        \"user\": {\n            \"description\": \"The user that the access\
        \ token was created for.\",\n            \"type\": \"object\",\n         \
        \   \"properties\": {\n              \"domain\": {\n                \"type\"\
        : \"string\",\n                \"enum\": [\n                  \"LOCAL\",\n\
        \                  \"API_NULL_DOMAIN\",\n                  \"WORLD\",\n  \
        \                \"POSIX_USER\",\n                  \"POSIX_GROUP\",\n   \
        \               \"ACTIVE_DIRECTORY\",\n                  \"API_INVALID_DOMAIN\"\
        ,\n                  \"API_RESERVED_DOMAIN\",\n                  \"API_INTERNAL_DOMAIN\"\
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
        \n              }\n            }\n          },\n          \"creator\": {\n\
        \            \"description\": \"The user that created the access token.\"\
        ,\n            \"type\": \"object\",\n            \"properties\": {\n    \
        \          \"domain\": {\n                \"type\": \"string\",\n        \
        \        \"enum\": [\n                  \"LOCAL\",\n                  \"API_NULL_DOMAIN\"\
        ,\n                  \"WORLD\",\n                  \"POSIX_USER\",\n     \
        \             \"POSIX_GROUP\",\n                  \"ACTIVE_DIRECTORY\",\n\
        \                  \"API_INVALID_DOMAIN\",\n                  \"API_RESERVED_DOMAIN\"\
        ,\n                  \"API_INTERNAL_DOMAIN\",\n                  \"API_OPERATOR_DOMAIN\"\
        ,\n                  \"API_CREATOR_DOMAIN\"\n                ],\n        \
        \        \"description\": \"domain:\\n * `ACTIVE_DIRECTORY` - ACTIVE_DIRECTORY,\\\
        n * `API_CREATOR_DOMAIN` - API_CREATOR_DOMAIN,\\n * `API_INTERNAL_DOMAIN`\
        \ - API_INTERNAL_DOMAIN,\\n * `API_INVALID_DOMAIN` - API_INVALID_DOMAIN,\\\
        n * `API_NULL_DOMAIN` - API_NULL_DOMAIN,\\n * `API_OPERATOR_DOMAIN` - API_OPERATOR_DOMAIN,\\\
        n * `API_RESERVED_DOMAIN` - API_RESERVED_DOMAIN,\\n * `LOCAL` - LOCAL,\\n\
        \ * `POSIX_GROUP` - POSIX_GROUP,\\n * `POSIX_USER` - POSIX_USER,\\n * `WORLD`\
        \ - WORLD\"\n              },\n              \"auth_id\": {\n            \
        \    \"description\": \"auth_id\",\n                \"type\": \"string\"\n\
        \              },\n              \"uid\": {\n                \"description\"\
        : \"uid\",\n                \"type\": \"number\"\n              },\n     \
        \         \"gid\": {\n                \"description\": \"gid\",\n        \
        \        \"type\": \"number\"\n              },\n              \"sid\": {\n\
        \                \"description\": \"sid\",\n                \"type\": \"string\"\
        \n              },\n              \"name\": {\n                \"description\"\
        : \"name\",\n                \"type\": \"string\"\n              }\n     \
        \       }\n          },\n          \"creation_time\": {\n            \"description\"\
        : \"The time that the access token was created.\",\n            \"type\":\
        \ \"string\"\n          },\n          \"expiration_time\": {\n           \
        \ \"description\": \"The time after which the access token is expired.\",\n\
        \            \"type\": \"string\"\n          },\n          \"enabled\": {\n\
        \            \"description\": \"This access token can be used to authenticate.\"\
        ,\n            \"type\": \"boolean\"\n          }\n        }\n      }\n  \
        \  }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: List all access tokens for the cluster.
  post:
    parameters: []
    request_body:
      schema: "{\n  \"description\": \"api_create_access_token_request\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"user\": {\n      \"description\"\
        : \"User to create an access token for.\",\n      \"type\": \"object\",\n\
        \      \"properties\": {\n        \"domain\": {\n          \"type\": \"string\"\
        ,\n          \"enum\": [\n            \"LOCAL\",\n            \"API_NULL_DOMAIN\"\
        ,\n            \"WORLD\",\n            \"POSIX_USER\",\n            \"POSIX_GROUP\"\
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
        \    \"expiration_time\": {\n      \"description\": \"The time after which\
        \ the access token is expired.\",\n      \"type\": \"string\"\n    }\n  }\n\
        }"
    response_body:
      schema: "{\n  \"description\": \"api_access_token\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"id\": {\n      \"description\": \"The access\
        \ token's identifier for management APIs.\",\n      \"type\": \"string\"\n\
        \    },\n    \"bearer_token\": {\n      \"description\": \"The bearer token\
        \ for authenticating over REST. Can be used in qq, REST bindings, or an HTTP\
        \ Authorization header.\",\n      \"type\": \"string\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Create an access token for the specified user.
rest_endpoint: /v1/auth/access-tokens/
api_version: v1
permalink: /rest-api-guide/auth/access-tokens.html
sidebar: rest_api_guide_sidebar
---
