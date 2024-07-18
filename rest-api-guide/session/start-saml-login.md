---
category: /session
methods:
  post:
    parameters: []
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: This API resource supports the qq sso_login command. Begin an interactive
      SAML single sign-on (SSO) authentication process for the cluster. Return the
      login_id and login_url strings required for the user to complete the authentication
      process. If SSO is not enabled on the cluster, return saml_not_configured_error.
      To complete in-browser authentication, the caller must pass the login_url parameter
      to the user. The caller must use the login_id parameter to poll the retrieve-saml-login
      API for SAML SSO credentials until the user completes the authentication process
      in the browser, or until the 5-minute limit elapses.
rest_endpoint: /v1/session/start-saml-login
permalink: /rest-api-guide/session/start-saml-login.html
sidebar: rest_api_guide_sidebar
---
