---
category: /smb
methods:
  post:
    parameters: []
    request_body:
      example_value: '"TO DO"'
      schema: "{\n  \"type\": \"array\",\n  \"items\": {\n    \"description\": \"\
        api_smb_session_info\",\n    \"type\": \"object\",\n    \"properties\": {\n\
        \      \"location\": {\n        \"description\": \"location\",\n        \"\
        type\": \"string\"\n      },\n      \"tenant_id\": {\n        \"description\"\
        : \"tenant_id\",\n        \"type\": \"number\"\n      },\n      \"originator\"\
        : {\n        \"description\": \"originator\",\n        \"type\": \"string\"\
        \n      },\n      \"server_address\": {\n        \"description\": \"server_address\"\
        ,\n        \"type\": \"string\"\n      },\n      \"user\": {\n        \"description\"\
        : \"user\",\n        \"type\": \"object\",\n        \"properties\": {\n  \
        \        \"domain\": {\n            \"type\": \"string\",\n            \"\
        enum\": [\n              \"LOCAL\",\n              \"API_NULL_DOMAIN\",\n\
        \              \"WORLD\",\n              \"POSIX_USER\",\n              \"\
        POSIX_GROUP\",\n              \"ACTIVE_DIRECTORY\",\n              \"API_INVALID_DOMAIN\"\
        ,\n              \"API_RESERVED_DOMAIN\",\n              \"API_INTERNAL_DOMAIN\"\
        ,\n              \"API_OPERATOR_DOMAIN\",\n              \"API_CREATOR_DOMAIN\"\
        \n            ],\n            \"description\": \"domain:\\n * `ACTIVE_DIRECTORY`\
        \ - ACTIVE_DIRECTORY,\\n * `API_CREATOR_DOMAIN` - API_CREATOR_DOMAIN,\\n *\
        \ `API_INTERNAL_DOMAIN` - API_INTERNAL_DOMAIN,\\n * `API_INVALID_DOMAIN` -\
        \ API_INVALID_DOMAIN,\\n * `API_NULL_DOMAIN` - API_NULL_DOMAIN,\\n * `API_OPERATOR_DOMAIN`\
        \ - API_OPERATOR_DOMAIN,\\n * `API_RESERVED_DOMAIN` - API_RESERVED_DOMAIN,\\\
        n * `LOCAL` - LOCAL,\\n * `POSIX_GROUP` - POSIX_GROUP,\\n * `POSIX_USER` -\
        \ POSIX_USER,\\n * `WORLD` - WORLD\"\n          },\n          \"auth_id\"\
        : {\n            \"description\": \"auth_id\",\n            \"type\": \"string\"\
        \n          },\n          \"uid\": {\n            \"description\": \"uid\"\
        ,\n            \"type\": \"number\"\n          },\n          \"gid\": {\n\
        \            \"description\": \"gid\",\n            \"type\": \"number\"\n\
        \          },\n          \"sid\": {\n            \"description\": \"sid\"\
        ,\n            \"type\": \"string\"\n          },\n          \"name\": {\n\
        \            \"description\": \"name\",\n            \"type\": \"string\"\n\
        \          }\n        }\n      },\n      \"num_opens\": {\n        \"description\"\
        : \"num_opens\",\n        \"type\": \"number\"\n      },\n      \"time_open\"\
        : {\n        \"description\": \"time_open\",\n        \"type\": \"object\"\
        ,\n        \"properties\": {\n          \"nanoseconds\": {\n            \"\
        description\": \"nanoseconds\",\n            \"type\": \"string\"\n      \
        \    }\n        }\n      },\n      \"time_idle\": {\n        \"description\"\
        : \"time_idle\",\n        \"type\": \"object\",\n        \"properties\": {\n\
        \          \"nanoseconds\": {\n            \"description\": \"nanoseconds\"\
        ,\n            \"type\": \"string\"\n          }\n        }\n      },\n  \
        \    \"is_guest\": {\n        \"description\": \"is_guest\",\n        \"type\"\
        : \"boolean\"\n      },\n      \"is_encrypted\": {\n        \"description\"\
        : \"is_encrypted\",\n        \"type\": \"boolean\"\n      },\n      \"share_names\"\
        : {\n        \"type\": \"array\",\n        \"items\": {\n          \"description\"\
        : \"share_names\",\n          \"type\": \"string\"\n        }\n      }\n \
        \   }\n  }\n}"
    response_body:
      example_value: '"TO DO"'
      schema: "{\n  \"type\": \"array\",\n  \"items\": {\n    \"description\": \"\
        api_smb2_session_close_result\",\n    \"type\": \"object\",\n    \"properties\"\
        : {\n      \"error_message\": {\n        \"description\": \"error_message\"\
        ,\n        \"type\": \"string\"\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: The request body must contain a list of sessions to close, as returned
      from GET /v1/smb/sessions.
rest_endpoint: /v1/smb/sessions/close
permalink: /rest-api-guide/smb/sessions_close.html
sidebar: rest_api_guide_sidebar
---
