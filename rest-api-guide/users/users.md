---
category: /users
methods:
  get:
    parameters: []
    response_body:
      schema: "{\n  \"type\": \"array\",\n  \"items\": {\n    \"description\": \"\
        api_user\",\n    \"type\": \"object\",\n    \"properties\": {\n      \"id\"\
        : {\n        \"description\": \"The user's unique id\",\n        \"type\"\
        : \"string\"\n      },\n      \"name\": {\n        \"description\": \"The\
        \ user's account name\",\n        \"type\": \"string\"\n      },\n      \"\
        primary_group\": {\n        \"description\": \"The unique ID of the user's\
        \ group\",\n        \"type\": \"string\"\n      },\n      \"sid\": {\n   \
        \     \"description\": \"The users's SID\",\n        \"type\": \"string\"\n\
        \      },\n      \"uid\": {\n        \"description\": \"The user's NFS uid\"\
        ,\n        \"type\": \"string\"\n      },\n      \"home_directory\": {\n \
        \       \"description\": \"The path to the user's home directory\",\n    \
        \    \"type\": \"string\"\n      },\n      \"can_change_password\": {\n  \
        \      \"description\": \"Specifies whether the user can change the password\"\
        ,\n        \"type\": \"boolean\"\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: List all users in the local user database. Refer to the 'Modify user'
      method for a description of the returned fields.
  post:
    parameters: []
    request_body:
      schema: "{\n  \"description\": \"api_user_post\",\n  \"type\": \"object\",\n\
        \  \"properties\": {\n    \"name\": {\n      \"description\": \"The user's\
        \ account name\",\n      \"type\": \"string\"\n    },\n    \"primary_group\"\
        : {\n      \"description\": \"The unique ID of the user's group\",\n     \
        \ \"type\": \"string\"\n    },\n    \"uid\": {\n      \"description\": \"\
        The user's NFS uid\",\n      \"type\": \"string\"\n    },\n    \"home_directory\"\
        : {\n      \"description\": \"The user's home directory path\",\n      \"\
        type\": \"string\"\n    },\n    \"password\": {\n      \"description\": \"\
        The user's password\",\n      \"type\": \"string\",\n      \"format\": \"\
        password\"\n    }\n  }\n}"
    response_body:
      schema: "{\n  \"description\": \"api_user\",\n  \"type\": \"object\",\n  \"\
        properties\": {\n    \"id\": {\n      \"description\": \"The user's unique\
        \ id\",\n      \"type\": \"string\"\n    },\n    \"name\": {\n      \"description\"\
        : \"The user's account name\",\n      \"type\": \"string\"\n    },\n    \"\
        primary_group\": {\n      \"description\": \"The unique ID of the user's group\"\
        ,\n      \"type\": \"string\"\n    },\n    \"sid\": {\n      \"description\"\
        : \"The users's SID\",\n      \"type\": \"string\"\n    },\n    \"uid\": {\n\
        \      \"description\": \"The user's NFS uid\",\n      \"type\": \"string\"\
        \n    },\n    \"home_directory\": {\n      \"description\": \"The path to\
        \ the user's home directory\",\n      \"type\": \"string\"\n    },\n    \"\
        can_change_password\": {\n      \"description\": \"Specifies whether the user\
        \ can change the password\",\n      \"type\": \"boolean\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Add a user.
rest_endpoint: /v1/users/
permalink: /rest-api-guide/users/users.html
sidebar: rest_api_guide_sidebar
---
