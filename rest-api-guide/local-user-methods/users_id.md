---
category: /Local User Methods
methods:
  delete:
    parameters:
    - description: The user's unique ID
      name: id
      required: true
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    summary: Delete a local user.
  get:
    parameters:
    - description: The user's unique ID
      name: id
      required: true
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
    summary: Retrieve information about a single local user. Refer to the 'Modify
      user' method for a description of the returned fields.
  put:
    parameters:
    - description: The user's unique ID
      name: id
      required: true
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
      schema: "{\n  \"description\": \"api_user_put\",\n  \"type\": \"object\",\n\
        \  \"properties\": {\n    \"id\": {\n      \"description\": \"The user's unique\
        \ ID\",\n      \"type\": \"string\"\n    },\n    \"name\": {\n      \"description\"\
        : \"The user's account name\",\n      \"type\": \"string\"\n    },\n    \"\
        primary_group\": {\n      \"description\": \"The user group's unique ID\"\
        ,\n      \"type\": \"string\"\n    },\n    \"uid\": {\n      \"description\"\
        : \"The user's NFS UID\",\n      \"type\": \"string\"\n    },\n    \"home_directory\"\
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
    summary: Modify a local user.
rest_endpoint: /v1/users/{id}
api_version: v1
permalink: /rest-api-guide/local-user-methods/users_id.html
sidebar: rest_api_guide_sidebar
---
