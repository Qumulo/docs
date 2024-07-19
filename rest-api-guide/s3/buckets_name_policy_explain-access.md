---
category: /s3
methods:
  post:
    parameters:
    - description: Bucket name
      name: name
      required: true
    request_body:
      schema: "{\n  \"description\": \"api_bucket_policy_access_explanation_options\"\
        ,\n  \"type\": \"object\",\n  \"properties\": {\n    \"identity\": {\n   \
        \   \"description\": \"The identity to explain bucket access for, if None\
        \ then return access for an anonymous user.\",\n      \"type\": \"object\"\
        ,\n      \"properties\": {\n        \"domain\": {\n          \"type\": \"\
        string\",\n          \"enum\": [\n            \"LOCAL\",\n            \"API_NULL_DOMAIN\"\
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
        \ \"name\",\n          \"type\": \"string\"\n        }\n      }\n    }\n \
        \ }\n}"
    response_body:
      schema: "{\n  \"description\": \"api_bucket_policy_access_explanation\",\n \
        \ \"type\": \"object\",\n  \"properties\": {\n    \"allowed_actions\": {\n\
        \      \"type\": \"array\",\n      \"items\": {\n        \"description\":\
        \ \"The complete set of API actions that the user is permitted to perform\
        \ on the specified bucket.\",\n        \"type\": \"string\"\n      }\n   \
        \ },\n    \"identity\": {\n      \"description\": \"The identity the explanation\
        \ pertains to.\",\n      \"type\": \"object\",\n      \"properties\": {\n\
        \        \"domain\": {\n          \"type\": \"string\",\n          \"enum\"\
        : [\n            \"LOCAL\",\n            \"API_NULL_DOMAIN\",\n          \
        \  \"WORLD\",\n            \"POSIX_USER\",\n            \"POSIX_GROUP\",\n\
        \            \"ACTIVE_DIRECTORY\",\n            \"API_INVALID_DOMAIN\",\n\
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
        \    \"rbac_allowed_actions\": {\n      \"type\": \"array\",\n      \"items\"\
        : {\n        \"description\": \"The set of actions the users RBAC roles gives\
        \ them permission to perform.\",\n        \"type\": \"string\"\n      }\n\
        \    },\n    \"statement_access\": {\n      \"type\": \"array\",\n      \"\
        items\": {\n        \"description\": \"The access that each statement provides\
        \ the identity, none if the statement does not apply to the identity.\",\n\
        \        \"type\": \"object\",\n        \"properties\": {\n          \"allow\"\
        : {\n            \"description\": \"Does the current statement allow or deny\
        \ access?\",\n            \"type\": \"boolean\"\n          },\n          \"\
        actions\": {\n            \"type\": \"array\",\n            \"items\": {\n\
        \              \"description\": \"The set of API actions to which the current\
        \ statement refers.\",\n              \"type\": \"string\"\n            }\n\
        \          }\n        }\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Explains the access of an identity due to the bucket policy.
rest_endpoint: /v1/s3/buckets/{name}/policy/explain-access
permalink: /rest-api-guide/s3/buckets_name_policy_explain-access.html
sidebar: rest_api_guide_sidebar
---
