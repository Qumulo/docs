---
category: /web-ui
methods:
  get:
    parameters: []
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Return settings (such as the inactivity timeout) that the Web UI uses.
      Because the Web UI can apply these settings before the user logs in, this method
      doesn't require authentication.
  patch:
    parameters:
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
      example_value: TO DO
      schema: TO DO
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Replace individual Web UI settings. These settings take effect immediately
      for new Web UI sessions.
  put:
    parameters:
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
      example_value: TO DO
      schema: TO DO
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Replace all the settings that the Web UI uses. These settings take effect
      immediately for new UI sessions.
rest_endpoint: /v1/web-ui/settings
permalink: /rest-api-guide/web-ui/settings.html
sidebar: rest_api_guide_sidebar
---
