---
category: /groups
methods:
  get:
    parameters:
    - description: The group's unique ID
      name: group_id
      required: true
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: List members of a group, which are among the local users. Refer to the
      'Modify user' method for a description of the returned fields.
  post:
    parameters:
    - description: The group's unique ID
      name: group_id
      required: true
    request_body:
      example_value: TO DO
      schema: TO DO
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Add a member to a group. Refer to the 'Modify user' method for a description
      of the returned fields.
rest_endpoint: /v1/groups/{group_id}/members/
permalink: /rest-api-guide/groups/members.html
sidebar: rest_api_guide_sidebar
---
