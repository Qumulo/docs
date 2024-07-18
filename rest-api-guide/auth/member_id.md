---
category: /auth
methods:
  delete:
    parameters:
    - description: The name of the role (This page URL-encodes the name for you)
      name: role_name
      required: true
    - description: The member's unique ID
      name: member_id
      required: true
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Remove a member from a role
  get:
    parameters:
    - description: The name of the role (This page URL-encodes the name for you)
      name: role_name
      required: true
    - description: The member's unique ID
      name: member_id
      required: true
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Get information about the member of the role.
rest_endpoint: /v1/auth/roles/{role_name}/members/{member_id}
permalink: /rest-api-guide/auth/member_id.html
sidebar: rest_api_command_guide_sidebar
---
