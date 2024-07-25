---
category: /LDAP Server
methods:
  get:
    parameters:
    - description: The login name to use to lookup its GID numbers
      name: login_name
      required: true
    response_body:
      schema: "{\n  \"description\": \"api_ldap_login_name_to_gid_numbers\",\n  \"\
        type\": \"object\",\n  \"properties\": {\n    \"login_name\": {\n      \"\
        description\": \"login_name\",\n      \"type\": \"string\"\n    },\n    \"\
        uid_numbers_to_gid_numbers\": {\n      \"type\": \"array\",\n      \"items\"\
        : {\n        \"description\": \"uid_numbers_to_gid_numbers\",\n        \"\
        type\": \"object\",\n        \"properties\": {\n          \"uid_number\":\
        \ {\n            \"description\": \"uid_number\",\n            \"type\": \"\
        number\"\n          },\n          \"gid_numbers\": {\n            \"type\"\
        : \"array\",\n            \"items\": {\n              \"description\": \"\
        gid_numbers\",\n              \"type\": \"number\"\n            }\n      \
        \    }\n        }\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Query the LDAP server for the gid numbers for all the groups of which
      the given login name is a member. This returns a vector of results in the case
      that the given login name maps to multiple uid numbers.
rest_endpoint: /v1/ldap/login-name/{login_name}/gid-numbers
api_version: v1
permalink: /rest-api-guide/ldap-server/ldap_login-name_login_name_gid-numbers.html
sidebar: rest_api_guide_sidebar
---
