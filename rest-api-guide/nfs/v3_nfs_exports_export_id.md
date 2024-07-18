---
category: /nfs
methods:
  delete:
    parameters:
    - description: The unique NFS export ID.
      name: export_id
      required: true
    - description: ETag for expected version
      name: If-Match
      required: false
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: This method deletes an NFS export.
  get:
    parameters:
    - description: The unique NFS export ID.
      name: export_id
      required: true
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: This method retrieves the specified NFS export. Refer to the 'Modify
      NFS Export' method for a description of the returned fields.
  patch:
    parameters:
    - description: The unique NFS export ID.
      name: export_id
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
    summary: This method modifies individual attributes of an NFS export.
  put:
    parameters:
    - description: The unique NFS export ID.
      name: export_id
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
    summary: This method sets all attributes of an NFS export.
rest_endpoint: /v3/nfs/exports/{export_id}
sidebar: rest_api_command_guide_sidebar
---
