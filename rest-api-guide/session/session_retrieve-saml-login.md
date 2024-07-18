---
category: /session
methods:
  post:
    parameters: []
    request_body:
      example_value: TO DO
      schema: TO DO
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: This API resource supports the qq sso_login command.Check the status
      of the in-progress SAML single sign-on (SSO) authentication process that start-saml-login
      begins. When a user completes the authentication process, return the bearer_token
      with which a user can perform subsequent API requests. When the caller retrieves
      the bearer_token, future calls with the same saml_login_id return the 404 Not
      Found error. If authentication for login_id is pending, instruct the caller
      to check again later by returning an empty bearer_token. If the login_id has
      expired within the 5-minute limit, return the 401 Unauthorized error. If the
      caller has already retrieved the login-id, return the 404 Not Found error.If
      the provided verification code mismatches with the expected code, return the
      400 Bad Request error.
rest_endpoint: /v1/session/retrieve-saml-login
sidebar: rest_api_command_guide_sidebar
---
