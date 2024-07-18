---
category: /groups
methods:
  delete:
    parameters:
    - description: The group's unique ID
      name: group_id
      required: true
    - description: The user's unique ID
      name: member_id
      required: true
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Remove a member from a group.
rest_endpoint: /v1/groups/{group_id}/members/{member_id}
permalink: /rest-api-guide/groups/member_id.html
sidebar: rest_api_guide_sidebar
---
