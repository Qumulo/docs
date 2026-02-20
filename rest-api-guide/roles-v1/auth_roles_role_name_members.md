---
category: /Roles V1
methods:
  get:
    summary: List all members of a role.
    parameters:
    - name: role_name
      description: The name of the role (This page URL-encodes the name for you)
      required: true
    - name: after
      description: Return entries after the given key (keys are returned in the paging
        object)
      required: false
    - name: limit
      description: Return no more than this many entries; the system may choose a
        smaller limit.
      required: false
    response_body:
      schema: "{\n  \"description\": \"members_model\",\n  \"type\": \"object\",\n\
        \  \"properties\": {\n    \"members\": {\n      \"description\": \"Members\
        \ of the role\",\n      \"type\": \"object\",\n      \"properties\": {},\n\
        \      \"additionalProperties\": {\n        \"description\": \"Members of\
        \ the role value\",\n        \"type\": \"object\",\n        \"properties\"\
        : {\n          \"domain\": {\n            \"type\": \"string\",\n        \
        \    \"enum\": [\n              \"LOCAL\",\n              \"API_NULL_DOMAIN\"\
        ,\n              \"WORLD\",\n              \"POSIX_USER\",\n             \
        \ \"POSIX_GROUP\",\n              \"ACTIVE_DIRECTORY\",\n              \"\
        API_INVALID_DOMAIN\",\n              \"API_RESERVED_DOMAIN\",\n          \
        \    \"API_INTERNAL_DOMAIN\",\n              \"API_OPERATOR_DOMAIN\",\n  \
        \            \"API_QUMULO_SUPPORT_DOMAIN\",\n              \"API_CREATOR_DOMAIN\"\
        \n            ],\n            \"description\": \"domain:\\n * `ACTIVE_DIRECTORY`\
        \ - ACTIVE_DIRECTORY,\\n * `API_CREATOR_DOMAIN` - API_CREATOR_DOMAIN,\\n *\
        \ `API_INTERNAL_DOMAIN` - API_INTERNAL_DOMAIN,\\n * `API_INVALID_DOMAIN` -\
        \ API_INVALID_DOMAIN,\\n * `API_NULL_DOMAIN` - API_NULL_DOMAIN,\\n * `API_OPERATOR_DOMAIN`\
        \ - API_OPERATOR_DOMAIN,\\n * `API_QUMULO_SUPPORT_DOMAIN` - API_QUMULO_SUPPORT_DOMAIN,\\\
        n * `API_RESERVED_DOMAIN` - API_RESERVED_DOMAIN,\\n * `LOCAL` - LOCAL,\\n\
        \ * `POSIX_GROUP` - POSIX_GROUP,\\n * `POSIX_USER` - POSIX_USER,\\n * `WORLD`\
        \ - WORLD\"\n          },\n          \"auth_id\": {\n            \"description\"\
        : \"auth_id\",\n            \"type\": \"string\"\n          },\n         \
        \ \"uid\": {\n            \"description\": \"uid\",\n            \"type\"\
        : \"number\"\n          },\n          \"gid\": {\n            \"description\"\
        : \"gid\",\n            \"type\": \"number\"\n          },\n          \"sid\"\
        : {\n            \"description\": \"sid\",\n            \"type\": \"string\"\
        \n          },\n          \"name\": {\n            \"description\": \"name\"\
        ,\n            \"type\": \"string\"\n          }\n        }\n      }\n   \
        \ }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
  post:
    summary: Assign a member to a role
    parameters:
    - name: role_name
      description: The name of the role (This page URL-encodes the name for you)
      required: true
    response_body:
      schema: "{\n  \"description\": \"api_identity\",\n  \"type\": \"object\",\n\
        \  \"properties\": {\n    \"domain\": {\n      \"type\": \"string\",\n   \
        \   \"enum\": [\n        \"LOCAL\",\n        \"API_NULL_DOMAIN\",\n      \
        \  \"WORLD\",\n        \"POSIX_USER\",\n        \"POSIX_GROUP\",\n       \
        \ \"ACTIVE_DIRECTORY\",\n        \"API_INVALID_DOMAIN\",\n        \"API_RESERVED_DOMAIN\"\
        ,\n        \"API_INTERNAL_DOMAIN\",\n        \"API_OPERATOR_DOMAIN\",\n  \
        \      \"API_QUMULO_SUPPORT_DOMAIN\",\n        \"API_CREATOR_DOMAIN\"\n  \
        \    ],\n      \"description\": \"domain:\\n * `ACTIVE_DIRECTORY` - ACTIVE_DIRECTORY,\\\
        n * `API_CREATOR_DOMAIN` - API_CREATOR_DOMAIN,\\n * `API_INTERNAL_DOMAIN`\
        \ - API_INTERNAL_DOMAIN,\\n * `API_INVALID_DOMAIN` - API_INVALID_DOMAIN,\\\
        n * `API_NULL_DOMAIN` - API_NULL_DOMAIN,\\n * `API_OPERATOR_DOMAIN` - API_OPERATOR_DOMAIN,\\\
        n * `API_QUMULO_SUPPORT_DOMAIN` - API_QUMULO_SUPPORT_DOMAIN,\\n * `API_RESERVED_DOMAIN`\
        \ - API_RESERVED_DOMAIN,\\n * `LOCAL` - LOCAL,\\n * `POSIX_GROUP` - POSIX_GROUP,\\\
        n * `POSIX_USER` - POSIX_USER,\\n * `WORLD` - WORLD\"\n    },\n    \"auth_id\"\
        : {\n      \"description\": \"auth_id\",\n      \"type\": \"string\"\n   \
        \ },\n    \"uid\": {\n      \"description\": \"uid\",\n      \"type\": \"\
        number\"\n    },\n    \"gid\": {\n      \"description\": \"gid\",\n      \"\
        type\": \"number\"\n    },\n    \"sid\": {\n      \"description\": \"sid\"\
        ,\n      \"type\": \"string\"\n    },\n    \"name\": {\n      \"description\"\
        : \"name\",\n      \"type\": \"string\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
    request_body:
      schema: "{\n  \"description\": \"api_identity\",\n  \"type\": \"object\",\n\
        \  \"properties\": {\n    \"domain\": {\n      \"type\": \"string\",\n   \
        \   \"enum\": [\n        \"LOCAL\",\n        \"API_NULL_DOMAIN\",\n      \
        \  \"WORLD\",\n        \"POSIX_USER\",\n        \"POSIX_GROUP\",\n       \
        \ \"ACTIVE_DIRECTORY\",\n        \"API_INVALID_DOMAIN\",\n        \"API_RESERVED_DOMAIN\"\
        ,\n        \"API_INTERNAL_DOMAIN\",\n        \"API_OPERATOR_DOMAIN\",\n  \
        \      \"API_QUMULO_SUPPORT_DOMAIN\",\n        \"API_CREATOR_DOMAIN\"\n  \
        \    ],\n      \"description\": \"domain:\\n * `ACTIVE_DIRECTORY` - ACTIVE_DIRECTORY,\\\
        n * `API_CREATOR_DOMAIN` - API_CREATOR_DOMAIN,\\n * `API_INTERNAL_DOMAIN`\
        \ - API_INTERNAL_DOMAIN,\\n * `API_INVALID_DOMAIN` - API_INVALID_DOMAIN,\\\
        n * `API_NULL_DOMAIN` - API_NULL_DOMAIN,\\n * `API_OPERATOR_DOMAIN` - API_OPERATOR_DOMAIN,\\\
        n * `API_QUMULO_SUPPORT_DOMAIN` - API_QUMULO_SUPPORT_DOMAIN,\\n * `API_RESERVED_DOMAIN`\
        \ - API_RESERVED_DOMAIN,\\n * `LOCAL` - LOCAL,\\n * `POSIX_GROUP` - POSIX_GROUP,\\\
        n * `POSIX_USER` - POSIX_USER,\\n * `WORLD` - WORLD\"\n    },\n    \"auth_id\"\
        : {\n      \"description\": \"auth_id\",\n      \"type\": \"string\"\n   \
        \ },\n    \"uid\": {\n      \"description\": \"uid\",\n      \"type\": \"\
        number\"\n    },\n    \"gid\": {\n      \"description\": \"gid\",\n      \"\
        type\": \"number\"\n    },\n    \"sid\": {\n      \"description\": \"sid\"\
        ,\n      \"type\": \"string\"\n    },\n    \"name\": {\n      \"description\"\
        : \"name\",\n      \"type\": \"string\"\n    }\n  }\n}"
rest_endpoint: /v1/auth/roles/{role_name}/members
api_version: v1
permalink: /rest-api-guide/roles-v1/auth_roles_role_name_members.html
sidebar: rest_api_guide_sidebar
redirect_from: /rest-api-guide/roles/auth_roles_role_name_members.html
deprecated: false
---
