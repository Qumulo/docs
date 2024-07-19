---
category: /ldap
methods:
  get:
    parameters:
    - description: The UID number to use to lookup its login name
      name: uid_number
      required: true
    response_body:
      schema: "{\n  \"description\": \"api_ldap_uid_number_to_login_names\",\n  \"\
        type\": \"object\",\n  \"properties\": {\n    \"uid_number\": {\n      \"\
        description\": \"uid_number\",\n      \"type\": \"number\"\n    },\n    \"\
        login_names\": {\n      \"type\": \"array\",\n      \"items\": {\n       \
        \ \"description\": \"login_names\",\n        \"type\": \"string\"\n      }\n\
        \    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Return the login names for the given UID number as found by issuing an
      LDAP query against the LDAP server configured
rest_endpoint: /v1/ldap/uid-number/{uid_number}/login-name
permalink: /rest-api-guide/ldap/uid-number_uid_number_login-name.html
sidebar: rest_api_guide_sidebar
---
