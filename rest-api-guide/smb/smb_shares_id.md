---
category: /smb
methods:
  delete:
    parameters:
    - description: The unique ID of the SMB share
      name: id
      required: true
    - description: ETag for expected version
      name: If-Match
      required: false
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Delete an SMB share. Not undoable.
  get:
    parameters:
    - description: The unique ID of the SMB share
      name: id
      required: true
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Retrieve the specified SMB share. Refer to the 'Modify SMB share' method
      for a description of the returned fields.
  put:
    parameters:
    - description: The unique ID of the SMB share
      name: id
      required: true
    - description: Specifies whether the file system path can be created if it does
        not already exist.
      name: allow-fs-path-create
      required: false
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
    summary: Modify an SMB share's options.
rest_endpoint: /v1/smb/shares/{id}
permalink: /rest-api-guide/smb/smb_shares_id.html
sidebar: rest_api_command_guide_sidebar
---
