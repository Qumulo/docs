---
category: /file-system
methods:
  get:
    parameters: []
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Get FS notify related settings.
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
    summary: Set FS notify related settings.
rest_endpoint: /v1/file-system/settings/notify
permalink: /rest-api-guide/file-system/settings_notify.html
sidebar: rest_api_guide_sidebar
---
