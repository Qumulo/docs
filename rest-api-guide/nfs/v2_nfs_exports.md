---
category: /nfs
methods:
  get:
    parameters: []
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: This method lists NFS exports. Refer to the 'Modify NFS Export' method
      for a description of the returned fields.
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
    summary: This method adds an NFS export.
rest_endpoint: /v2/nfs/exports/
sidebar: rest_api_command_guide_sidebar
---
