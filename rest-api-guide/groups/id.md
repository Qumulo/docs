---
category: /groups
methods:
  delete:
    parameters:
    - description: The group's unique ID
      name: id
      required: true
    response_body:
      description: Return value on success
      example_value: '"TO DO"'
      schema: '"TO DO"'
      status_code: '200'
    summary: Delete a group.
  get:
    parameters:
    - description: The group's unique ID
      name: id
      required: true
    response_body:
      description: Return value on success
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"api_group\",\n  \"type\": \"object\",\n  \"\
        properties\": {\n    \"id\": {\n      \"description\": \"The group's unique\
        \ id\",\n      \"type\": \"string\"\n    },\n    \"name\": {\n      \"description\"\
        : \"The group name\",\n      \"type\": \"string\"\n    },\n    \"sid\": {\n\
        \      \"description\": \"The group's SID\",\n      \"type\": \"string\"\n\
        \    },\n    \"gid\": {\n      \"description\": \"The group's NFS gid\",\n\
        \      \"type\": \"string\"\n    }\n  }\n}"
      status_code: '200'
    summary: Retrieve the attributes of a group. Refer to the 'Modify group' method
      for a description of the returned fields.
  put:
    parameters:
    - description: The group's unique ID
      name: id
      required: true
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"api_group_put\",\n  \"type\": \"object\",\n\
        \  \"properties\": {\n    \"id\": {\n      \"description\": \"The group's\
        \ unique id\",\n      \"type\": \"string\"\n    },\n    \"name\": {\n    \
        \  \"description\": \"The group name\",\n      \"type\": \"string\"\n    },\n\
        \    \"gid\": {\n      \"description\": \"The group's NFS gid\",\n      \"\
        type\": \"string\"\n    }\n  }\n}"
    response_body:
      description: Return value on success
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"api_group\",\n  \"type\": \"object\",\n  \"\
        properties\": {\n    \"id\": {\n      \"description\": \"The group's unique\
        \ id\",\n      \"type\": \"string\"\n    },\n    \"name\": {\n      \"description\"\
        : \"The group name\",\n      \"type\": \"string\"\n    },\n    \"sid\": {\n\
        \      \"description\": \"The group's SID\",\n      \"type\": \"string\"\n\
        \    },\n    \"gid\": {\n      \"description\": \"The group's NFS gid\",\n\
        \      \"type\": \"string\"\n    }\n  }\n}"
      status_code: '200'
    summary: Modify a group. The 'id' field must match the id in the URI.
rest_endpoint: /v1/groups/{id}
permalink: /rest-api-guide/groups/id.html
sidebar: rest_api_guide_sidebar
---
