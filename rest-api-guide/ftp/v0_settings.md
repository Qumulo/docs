---
category: /ftp
methods:
  get:
    parameters: []
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Retrieve the current FTP server settings. To see server status on all
      nodes, use Get FTP Server Status.
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
    summary: Modify the current FTP server settings. To see server status on all nodes,
      use Get FTP Server Status.
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
    summary: Modify the current FTP server settings. To see server status on all nodes,
      use Get FTP Server Status.
rest_endpoint: /v0/ftp/settings
permalink: /rest-api-guide/ftp/v0_settings.html
sidebar: rest_api_guide_sidebar
---
