---
category: /Local Group Methods
methods:
  get:
    parameters:
    - description: The group's unique ID
      name: group_id
      required: true
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
    summary: List members of a group, which are among the local users. Refer to the
      'Modify user' method for a description of the returned fields.
  post:
    parameters:
    - description: The group's unique ID
      name: group_id
      required: true
    request_body:
      schema: "{\n  \"description\": \"api_member_auth_id\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"member_id\": {\n      \"description\": \"Unique\
        \ ID of a user\",\n      \"type\": \"string\"\n    }\n  }\n}"
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
    summary: Add a member to a group. Refer to the 'Modify user' method for a description
      of the returned fields.
rest_endpoint: /v1/groups/{group_id}/members/
api_version: v1
permalink: /rest-api-guide/local-group-methods/groups_group_id_members.html
sidebar: rest_api_guide_sidebar
---
