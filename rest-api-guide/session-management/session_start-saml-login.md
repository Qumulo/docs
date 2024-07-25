---
category: /Session Management
methods:
  post:
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"api_saml_login_info\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"login_id\": {\n      \"description\": \"The\
        \ unique identifier for the pending login. Use the login_id with the check-saml-login\
        \ API.\",\n      \"type\": \"string\"\n    },\n    \"login_url\": {\n    \
        \  \"description\": \"The login URL to present to the user. To complete the\
        \ authentication process, the user must open the login URL in a browser.\"\
        ,\n      \"type\": \"string\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: This API resource supports the qq sso_login command. Begin an interactive
      SAML single sign-on (SSO) authentication process for the cluster. Return the
      login_id and login_url strings required for the user to complete the authentication
      process. If SSO is not enabled on the cluster, return saml_not_configured_error.
      To complete in-browser authentication, the caller must pass the login_url parameter
      to the user. The caller must use the login_id parameter to poll the retrieve-saml-login
      API for SAML SSO credentials until the user completes the authentication process
      in the browser, or until the 5-minute limit elapses.
rest_endpoint: /v1/session/start-saml-login
api_version: v1
permalink: /rest-api-guide/session-management/session_start-saml-login.html
sidebar: rest_api_guide_sidebar
---
