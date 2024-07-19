---
category: /identity
methods:
  post:
    parameters: []
    request_body:
      schema: "{\n  \"description\": \"api_identity\",\n  \"type\": \"object\",\n\
        \  \"properties\": {\n    \"domain\": {\n      \"type\": \"string\",\n   \
        \   \"enum\": [\n        \"LOCAL\",\n        \"API_NULL_DOMAIN\",\n      \
        \  \"WORLD\",\n        \"POSIX_USER\",\n        \"POSIX_GROUP\",\n       \
        \ \"ACTIVE_DIRECTORY\",\n        \"API_INVALID_DOMAIN\",\n        \"API_RESERVED_DOMAIN\"\
        ,\n        \"API_INTERNAL_DOMAIN\",\n        \"API_OPERATOR_DOMAIN\",\n  \
        \      \"API_CREATOR_DOMAIN\"\n      ],\n      \"description\": \"domain:\\\
        n * `ACTIVE_DIRECTORY` - ACTIVE_DIRECTORY,\\n * `API_CREATOR_DOMAIN` - API_CREATOR_DOMAIN,\\\
        n * `API_INTERNAL_DOMAIN` - API_INTERNAL_DOMAIN,\\n * `API_INVALID_DOMAIN`\
        \ - API_INVALID_DOMAIN,\\n * `API_NULL_DOMAIN` - API_NULL_DOMAIN,\\n * `API_OPERATOR_DOMAIN`\
        \ - API_OPERATOR_DOMAIN,\\n * `API_RESERVED_DOMAIN` - API_RESERVED_DOMAIN,\\\
        n * `LOCAL` - LOCAL,\\n * `POSIX_GROUP` - POSIX_GROUP,\\n * `POSIX_USER` -\
        \ POSIX_USER,\\n * `WORLD` - WORLD\"\n    },\n    \"auth_id\": {\n      \"\
        description\": \"auth_id\",\n      \"type\": \"string\"\n    },\n    \"uid\"\
        : {\n      \"description\": \"uid\",\n      \"type\": \"number\"\n    },\n\
        \    \"gid\": {\n      \"description\": \"gid\",\n      \"type\": \"number\"\
        \n    },\n    \"sid\": {\n      \"description\": \"sid\",\n      \"type\"\
        : \"string\"\n    },\n    \"name\": {\n      \"description\": \"name\",\n\
        \      \"type\": \"string\"\n    }\n  }\n}"
    response_body:
      schema: "{\n  \"description\": \"api_identity\",\n  \"type\": \"object\",\n\
        \  \"properties\": {\n    \"domain\": {\n      \"type\": \"string\",\n   \
        \   \"enum\": [\n        \"LOCAL\",\n        \"API_NULL_DOMAIN\",\n      \
        \  \"WORLD\",\n        \"POSIX_USER\",\n        \"POSIX_GROUP\",\n       \
        \ \"ACTIVE_DIRECTORY\",\n        \"API_INVALID_DOMAIN\",\n        \"API_RESERVED_DOMAIN\"\
        ,\n        \"API_INTERNAL_DOMAIN\",\n        \"API_OPERATOR_DOMAIN\",\n  \
        \      \"API_CREATOR_DOMAIN\"\n      ],\n      \"description\": \"domain:\\\
        n * `ACTIVE_DIRECTORY` - ACTIVE_DIRECTORY,\\n * `API_CREATOR_DOMAIN` - API_CREATOR_DOMAIN,\\\
        n * `API_INTERNAL_DOMAIN` - API_INTERNAL_DOMAIN,\\n * `API_INVALID_DOMAIN`\
        \ - API_INVALID_DOMAIN,\\n * `API_NULL_DOMAIN` - API_NULL_DOMAIN,\\n * `API_OPERATOR_DOMAIN`\
        \ - API_OPERATOR_DOMAIN,\\n * `API_RESERVED_DOMAIN` - API_RESERVED_DOMAIN,\\\
        n * `LOCAL` - LOCAL,\\n * `POSIX_GROUP` - POSIX_GROUP,\\n * `POSIX_USER` -\
        \ POSIX_USER,\\n * `WORLD` - WORLD\"\n    },\n    \"auth_id\": {\n      \"\
        description\": \"auth_id\",\n      \"type\": \"string\"\n    },\n    \"uid\"\
        : {\n      \"description\": \"uid\",\n      \"type\": \"number\"\n    },\n\
        \    \"gid\": {\n      \"description\": \"gid\",\n      \"type\": \"number\"\
        \n    },\n    \"sid\": {\n      \"description\": \"sid\",\n      \"type\"\
        : \"string\"\n    },\n    \"name\": {\n      \"description\": \"name\",\n\
        \      \"type\": \"string\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Search for identity and populate all fields.
rest_endpoint: /v1/identity/find
api_version: v1
permalink: /rest-api-guide/identity/find.html
sidebar: rest_api_guide_sidebar
---
