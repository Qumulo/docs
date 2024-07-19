---
category: /session
methods:
  get:
    parameters: []
    response_body:
      schema: "{\n  \"type\": \"array\",\n  \"items\": {\n    \"type\": \"string\"\
        \n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Retrieve a list of all the roles assigned to the current user, including
      those assigned to a group to which the current user belongs.
rest_endpoint: /v1/session/roles
api_version: v1
permalink: /rest-api-guide/session/roles.html
sidebar: rest_api_guide_sidebar
---
