---
category: /auth
methods:
  get:
    parameters:
    - description: The name of the role (This page URL-encodes the name for you)
      name: role_name
      required: true
    - description: Return entries after the given key (keys are returned in the paging
        object)
      name: after
      required: false
    - description: Return no more than this many entries; the system may choose a
        smaller limit.
      name: limit
      required: false
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: List all members of a role.
  post:
    parameters:
    - description: The name of the role (This page URL-encodes the name for you)
      name: role_name
      required: true
    request_body:
      example_value: TO DO
      schema: TO DO
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Assign a member to a role
rest_endpoint: /v1/auth/roles/{role_name}/members
permalink: /rest-api-guide/auth/members.html
sidebar: rest_api_guide_sidebar
---
