---
category: /smb
methods:
  delete:
    parameters:
    - description: A unique identifier of the SMB share, either share ID or name
      name: ref
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
    - description: A unique identifier of the SMB share, either share ID or name
      name: ref
      required: true
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Retrieve the specified SMB share. Refer to the 'Modify SMB Share' method
      for a description of the returned fields.
  patch:
    parameters:
    - description: A unique identifier of the SMB share, either share ID or name
      name: ref
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
    summary: Modify select fields in an SMB share.
  put:
    parameters:
    - description: A unique identifier of the SMB share, either share ID or name
      name: ref
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
rest_endpoint: /v2/smb/shares/{ref}
sidebar: rest_api_command_guide_sidebar
---
