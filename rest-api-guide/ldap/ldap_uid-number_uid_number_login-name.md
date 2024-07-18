---
category: /ldap
methods:
  get:
    parameters:
    - description: The UID number to use to lookup its login name
      name: uid_number
      required: true
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Return the login names for the given UID number as found by issuing an
      LDAP query against the LDAP server configured
rest_endpoint: /v1/ldap/uid-number/{uid_number}/login-name
sidebar: rest_api_command_guide_sidebar
---
