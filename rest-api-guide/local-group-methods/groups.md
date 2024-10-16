---
category: /Local Group Methods
methods:
  get:
    parameters: []
    response_body:
      schema: "{\n  \"type\": \"array\",\n  \"items\": {\n    \"description\": \"\
        api_group\",\n    \"type\": \"object\",\n    \"properties\": {\n      \"id\"\
        : {\n        \"description\": \"The group's unique id\",\n        \"type\"\
        : \"string\"\n      },\n      \"name\": {\n        \"description\": \"The\
        \ group name\",\n        \"type\": \"string\"\n      },\n      \"sid\": {\n\
        \        \"description\": \"The group's SID\",\n        \"type\": \"string\"\
        \n      },\n      \"gid\": {\n        \"description\": \"The group's NFS gid\"\
        ,\n        \"type\": \"string\"\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: List all groups. Refer to the 'Modify group' method for a description
      of the returned fields.
  post:
    parameters: []
    request_body:
      schema: "{\n  \"description\": \"api_group_post\",\n  \"type\": \"object\",\n\
        \  \"properties\": {\n    \"name\": {\n      \"description\": \"The group\
        \ name\",\n      \"type\": \"string\"\n    },\n    \"gid\": {\n      \"description\"\
        : \"The group's NFS gid\",\n      \"type\": \"string\"\n    }\n  }\n}"
    response_body:
      schema: "{\n  \"description\": \"api_group\",\n  \"type\": \"object\",\n  \"\
        properties\": {\n    \"id\": {\n      \"description\": \"The group's unique\
        \ id\",\n      \"type\": \"string\"\n    },\n    \"name\": {\n      \"description\"\
        : \"The group name\",\n      \"type\": \"string\"\n    },\n    \"sid\": {\n\
        \      \"description\": \"The group's SID\",\n      \"type\": \"string\"\n\
        \    },\n    \"gid\": {\n      \"description\": \"The group's NFS gid\",\n\
        \      \"type\": \"string\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Add a group.
rest_endpoint: /v1/groups/
api_version: v1
permalink: /rest-api-guide/local-group-methods/groups.html
sidebar: rest_api_guide_sidebar
---
