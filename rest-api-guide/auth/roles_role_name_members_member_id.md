---
category: /auth
methods:
  delete:
    parameters:
    - description: The name of the role (This page URL-encodes the name for you)
      name: role_name
      required: true
    - description: The member's unique ID
      name: member_id
      required: true
    response_body:
      description: Return value on success
      example_value: '"TO DO"'
      schema: '"TO DO"'
      status_code: '200'
    summary: Remove a member from a role
  get:
    parameters:
    - description: The name of the role (This page URL-encodes the name for you)
      name: role_name
      required: true
    - description: The member's unique ID
      name: member_id
      required: true
    response_body:
      description: Return value on success
      example_value: '"TO DO"'
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
      status_code: '200'
    summary: Get information about the member of the role.
rest_endpoint: /v1/auth/roles/{role_name}/members/{member_id}
permalink: /rest-api-guide/auth/roles_role_name_members_member_id.html
sidebar: rest_api_guide_sidebar
---
