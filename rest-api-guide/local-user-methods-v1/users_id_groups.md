---
category: /Local User Methods V1
methods:
  get:
    summary: Retrieve group membership of a specific user. Refer to the 'Modify group'
      method for a description of the returned fields. Returns an empty array if the
      provided user is not a local user.
    parameters:
    - name: id
      description: The user's unique ID
      required: true
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
    preview: false
rest_endpoint: /v1/users/{id}/groups/
api_version: v1
permalink: /rest-api-guide/local-user-methods-v1/users_id_groups.html
sidebar: rest_api_guide_sidebar
redirect_from: /rest-api-guide/local-user-methods/users_id_groups.html
deprecated: false
---
