---
category: /nfs
methods:
  delete:
    parameters:
    - description: A unique identifier of the NFS export, either ID or export path
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
    summary: This method deletes an NFS export.
  get:
    parameters:
    - description: A unique identifier of the NFS export, either ID or export path
      name: ref
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
    - description: A unique identifier of the NFS export, either ID or export path
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
    summary: This method modifies individual attributes of a NFS export.
  put:
    parameters:
    - description: A unique identifier of the NFS export, either ID or export path
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
    summary: This method sets all attributes of a NFS export.
rest_endpoint: /v2/nfs/exports/{ref}
permalink: /rest-api-guide/nfs/v2_nfs_exports__ref.html
sidebar: rest_api_guide_sidebar
---
