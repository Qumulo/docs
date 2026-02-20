---
category: /LDAP Server V1
methods:
  get:
    summary: Return the login names for the given UID number as found by issuing an
      LDAP query against the LDAP server configured
    parameters:
    - name: uid_number
      description: The UID number to use to lookup its login name
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
    preview: false
rest_endpoint: /v1/ldap/uid-number/{uid_number}/login-name
api_version: v1
permalink: /rest-api-guide/ldap-server-v1/ldap_uid-number_uid_number_login-name.html
sidebar: rest_api_guide_sidebar
redirect_from: /rest-api-guide/ldap-server/ldap_uid-number_uid_number_login-name.html
deprecated: false
---
