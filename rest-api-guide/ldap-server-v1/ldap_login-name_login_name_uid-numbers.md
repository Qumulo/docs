---
category: /LDAP Server V1
methods:
  get:
    summary: Return the UID Numbers of the given login name. This is found by issuing
      an LDAP query against the LDAP server configured
    parameters:
    - name: login_name
      description: The login name to use to lookup its UID numbers
      required: true
    response_body:
      schema: "{\n  \"description\": \"api_ldap_login_name_to_uid_numbers\",\n  \"\
        type\": \"object\",\n  \"properties\": {\n    \"login_name\": {\n      \"\
        description\": \"login_name\",\n      \"type\": \"string\"\n    },\n    \"\
        uid_numbers\": {\n      \"type\": \"array\",\n      \"items\": {\n       \
        \ \"description\": \"uid_numbers\",\n        \"type\": \"number\"\n      }\n\
        \    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
rest_endpoint: /v1/ldap/login-name/{login_name}/uid-numbers
api_version: v1
permalink: /rest-api-guide/ldap-server-v1/ldap_login-name_login_name_uid-numbers.html
sidebar: rest_api_guide_sidebar
redirect_from: /rest-api-guide/ldap-server/ldap_login-name_login_name_uid-numbers.html
---
