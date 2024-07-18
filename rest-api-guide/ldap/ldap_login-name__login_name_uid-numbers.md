---
category: /ldap
methods:
  get:
    parameters:
    - description: The login name to use to lookup its UID numbers
      name: login_name
      required: true
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Return the UID Numbers of the given login name. This is found by issuing
      an LDAP query against the LDAP server configured
rest_endpoint: /v1/ldap/login-name/{login_name}/uid-numbers
permalink: /rest-api-guide/ldap/ldap_login-name__login_name_uid-numbers.html
sidebar: rest_api_guide_sidebar
---
