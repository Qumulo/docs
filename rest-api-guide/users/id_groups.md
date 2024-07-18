---
category: /users
methods:
  get:
    parameters:
    - description: The user's unique ID
      name: id
      required: true
    response_body:
      description: Return value on success
      example_value: '"TO DO"'
      schema: "{\n  \"type\": \"array\",\n  \"items\": {\n    \"description\": \"\
        api_group\",\n    \"type\": \"object\",\n    \"properties\": {\n      \"id\"\
        : {\n        \"description\": \"The group's unique id\",\n        \"type\"\
        : \"string\"\n      },\n      \"name\": {\n        \"description\": \"The\
        \ group name\",\n        \"type\": \"string\"\n      },\n      \"sid\": {\n\
        \        \"description\": \"The group's SID\",\n        \"type\": \"string\"\
        \n      },\n      \"gid\": {\n        \"description\": \"The group's NFS gid\"\
        ,\n        \"type\": \"string\"\n      }\n    }\n  }\n}"
      status_code: '200'
    summary: Retrieve group membership of a specific user. Refer to the 'Modify group'
      method for a description of the returned fields. Returns an empty array if the
      provided user is not a local user.
rest_endpoint: /v1/users/{id}/groups/
permalink: /rest-api-guide/users/id_groups.html
sidebar: rest_api_guide_sidebar
---
