---
category: /smb
methods:
  get:
    parameters: []
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: List all SMB shares. Refer to the 'Modify SMB share' method for a description
      of the returned fields.
  post:
    parameters:
    - description: Specifies whether the file system path can be created if it does
        not already exist.
      name: allow-fs-path-create
      required: false
    request_body:
      example_value: TO DO
      schema: TO DO
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Add an SMB share with given options.
rest_endpoint: /v1/smb/shares/
sidebar: rest_api_command_guide_sidebar
---
