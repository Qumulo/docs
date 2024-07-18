---
category: /ldap
methods:
  get:
    parameters:
    - description: The login name to use to lookup its GID numbers
      name: login_name
      required: true
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Query the LDAP server for the gid numbers for all the groups of which
      the given login name is a member. This returns a vector of results in the case
      that the given login name maps to multiple uid numbers.
rest_endpoint: /v1/ldap/login-name/{login_name}/gid-numbers
permalink: /rest-api-guide/ldap/ldap_login-name_login_name_gid-numbers.html
sidebar: rest_api_command_guide_sidebar
---
