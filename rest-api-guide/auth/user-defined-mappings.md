---
category: /auth
methods:
  get:
    parameters: []
    response_body:
      description: Return value on success
      example_value: '"TO DO"'
      schema: "{\n  \"type\": \"array\",\n  \"items\": {\n    \"description\": \"\
        user_equivalence\",\n    \"type\": \"object\",\n    \"properties\": {\n  \
        \    \"down_level_logon_name\": {\n        \"description\": \"down_level_logon_name\"\
        ,\n        \"type\": \"string\"\n      },\n      \"ldap_name\": {\n      \
        \  \"description\": \"ldap_name\",\n        \"type\": \"string\"\n      }\n\
        \    }\n  }\n}"
      status_code: '200'
    summary: Get the configured set of AD/LDAP static user defined mappings.
  put:
    parameters:
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
      example_value: '"TO DO"'
      schema: "{\n  \"type\": \"array\",\n  \"items\": {\n    \"description\": \"\
        user_equivalence\",\n    \"type\": \"object\",\n    \"properties\": {\n  \
        \    \"down_level_logon_name\": {\n        \"description\": \"down_level_logon_name\"\
        ,\n        \"type\": \"string\"\n      },\n      \"ldap_name\": {\n      \
        \  \"description\": \"ldap_name\",\n        \"type\": \"string\"\n      }\n\
        \    }\n  }\n}"
    response_body:
      description: Return value on success
      example_value: '"TO DO"'
      schema: "{\n  \"type\": \"array\",\n  \"items\": {\n    \"description\": \"\
        user_equivalence\",\n    \"type\": \"object\",\n    \"properties\": {\n  \
        \    \"down_level_logon_name\": {\n        \"description\": \"down_level_logon_name\"\
        ,\n        \"type\": \"string\"\n      },\n      \"ldap_name\": {\n      \
        \  \"description\": \"ldap_name\",\n        \"type\": \"string\"\n      }\n\
        \    }\n  }\n}"
      status_code: '200'
    summary: Replace the configured set of AD/LDAP static user defined mappings with
      the supplied set.
rest_endpoint: /v1/auth/user-defined-mappings/
permalink: /rest-api-guide/auth/user-defined-mappings.html
sidebar: rest_api_guide_sidebar
---
