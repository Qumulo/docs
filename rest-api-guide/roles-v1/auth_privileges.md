---
category: /Roles V1
methods:
  get:
    summary: Get information about all privileges.
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"string_string_map\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {},\n  \"additionalProperties\": {\n    \"description\"\
        : \"string_string_map value\",\n    \"type\": \"string\"\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
rest_endpoint: /v1/auth/privileges/
api_version: v1
permalink: /rest-api-guide/roles-v1/auth_privileges.html
sidebar: rest_api_guide_sidebar
redirect_from: /rest-api-guide/roles/auth_privileges.html
---
