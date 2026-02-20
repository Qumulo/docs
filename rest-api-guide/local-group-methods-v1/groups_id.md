---
category: /Local Group Methods V1
methods:
  get:
    summary: Retrieve the attributes of a group. Refer to the 'Modify group' method
      for a description of the returned fields.
    parameters:
    - name: id
      description: The group's unique ID
      required: true
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
    preview: false
  put:
    summary: Modify a group. The 'id' field must match the id in the URI.
    parameters:
    - name: id
      description: The group's unique ID
      required: true
    - name: If-Match
      description: ETag for expected version
      required: false
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
    preview: false
    request_body:
      schema: "{\n  \"description\": \"api_group_put\",\n  \"type\": \"object\",\n\
        \  \"properties\": {\n    \"id\": {\n      \"description\": \"The group's\
        \ unique id\",\n      \"type\": \"string\"\n    },\n    \"name\": {\n    \
        \  \"description\": \"The group name\",\n      \"type\": \"string\"\n    },\n\
        \    \"gid\": {\n      \"description\": \"The group's NFS gid\",\n      \"\
        type\": \"string\"\n    }\n  }\n}"
  delete:
    summary: Delete a group.
    parameters:
    - name: id
      description: The group's unique ID
      required: true
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    preview: false
rest_endpoint: /v1/groups/{id}
api_version: v1
permalink: /rest-api-guide/local-group-methods-v1/groups_id.html
sidebar: rest_api_guide_sidebar
redirect_from: /rest-api-guide/local-group-methods/groups_id.html
deprecated: false
---
