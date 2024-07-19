---
category: /smb
methods:
  get:
    parameters:
    - description: 'List only sessions matching a user identity in the form of: [1]
        A name or a SID optionally qualified with a domain prefix (e.g local:name,
        S-1-1-0, name, world:Everyone, ldap_user:name, or ad:name), or [2] An ID type
        (e.g. uid:1001, auth_id:513, SID:S-1-1-0).)'
      name: identity
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
      schema: "{\n  \"description\": \"api_smb_sessions_get_response\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"session_infos\": {\n      \"type\"\
        : \"array\",\n      \"items\": {\n        \"description\": \"session_infos\"\
        ,\n        \"type\": \"object\",\n        \"properties\": {\n          \"\
        location\": {\n            \"description\": \"location\",\n            \"\
        type\": \"string\"\n          },\n          \"tenant_id\": {\n           \
        \ \"description\": \"tenant_id\",\n            \"type\": \"number\"\n    \
        \      },\n          \"originator\": {\n            \"description\": \"originator\"\
        ,\n            \"type\": \"string\"\n          },\n          \"server_address\"\
        : {\n            \"description\": \"server_address\",\n            \"type\"\
        : \"string\"\n          },\n          \"user\": {\n            \"description\"\
        : \"user\",\n            \"type\": \"object\",\n            \"properties\"\
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
        \n              }\n            }\n          },\n          \"num_opens\": {\n\
        \            \"description\": \"num_opens\",\n            \"type\": \"number\"\
        \n          },\n          \"time_open\": {\n            \"description\": \"\
        time_open\",\n            \"type\": \"object\",\n            \"properties\"\
        : {\n              \"nanoseconds\": {\n                \"description\": \"\
        nanoseconds\",\n                \"type\": \"string\"\n              }\n  \
        \          }\n          },\n          \"time_idle\": {\n            \"description\"\
        : \"time_idle\",\n            \"type\": \"object\",\n            \"properties\"\
        : {\n              \"nanoseconds\": {\n                \"description\": \"\
        nanoseconds\",\n                \"type\": \"string\"\n              }\n  \
        \          }\n          },\n          \"is_guest\": {\n            \"description\"\
        : \"is_guest\",\n            \"type\": \"boolean\"\n          },\n       \
        \   \"is_encrypted\": {\n            \"description\": \"is_encrypted\",\n\
        \            \"type\": \"boolean\"\n          },\n          \"share_names\"\
        : {\n            \"type\": \"array\",\n            \"items\": {\n        \
        \      \"description\": \"share_names\",\n              \"type\": \"string\"\
        \n            }\n          }\n        }\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Enumerate open sessions
rest_endpoint: /v1/smb/sessions/
permalink: /rest-api-guide/smb/sessions.html
sidebar: rest_api_guide_sidebar
---
