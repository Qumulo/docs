---
category: /Authentication V1
methods:
  put:
    summary: Replace the configured set of AD/LDAP static user defined mappings with
      the supplied set.
    parameters:
    - name: If-Match
      description: ETag for expected version
      required: false
    response_body:
      schema: "{\n  \"type\": \"array\",\n  \"items\": {\n    \"description\": \"\
        user_equivalence\",\n    \"type\": \"object\",\n    \"properties\": {\n  \
        \    \"down_level_logon_name\": {\n        \"description\": \"down_level_logon_name\"\
        ,\n        \"type\": \"string\"\n      },\n      \"ldap_name\": {\n      \
        \  \"description\": \"ldap_name\",\n        \"type\": \"string\"\n      }\n\
        \    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
    request_body:
      schema: "{\n  \"type\": \"array\",\n  \"items\": {\n    \"description\": \"\
        user_equivalence\",\n    \"type\": \"object\",\n    \"properties\": {\n  \
        \    \"down_level_logon_name\": {\n        \"description\": \"down_level_logon_name\"\
        ,\n        \"type\": \"string\"\n      },\n      \"ldap_name\": {\n      \
        \  \"description\": \"ldap_name\",\n        \"type\": \"string\"\n      }\n\
        \    }\n  }\n}"
  get:
    summary: Get the configured set of AD/LDAP static user defined mappings.
    parameters: []
    response_body:
      schema: "{\n  \"type\": \"array\",\n  \"items\": {\n    \"description\": \"\
        user_equivalence\",\n    \"type\": \"object\",\n    \"properties\": {\n  \
        \    \"down_level_logon_name\": {\n        \"description\": \"down_level_logon_name\"\
        ,\n        \"type\": \"string\"\n      },\n      \"ldap_name\": {\n      \
        \  \"description\": \"ldap_name\",\n        \"type\": \"string\"\n      }\n\
        \    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
rest_endpoint: /v1/auth/user-defined-mappings/
api_version: v1
permalink: /rest-api-guide/authentication-v1/auth_user-defined-mappings.html
sidebar: rest_api_guide_sidebar
redirect_from: /rest-api-guide/authentication/auth_user-defined-mappings.html
deprecated: false
---
