---
category: /multitenancy
methods:
  delete:
    parameters:
    - description: The tenant ID of the NFS settings.
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
    summary: Delete current NFS configuration, restoring the global settings for this
      tenant.
  get:
    parameters:
    - description: The tenant ID of the NFS settings.
      name: id
      required: true
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Retrieve current tenant-specific NFS configuration.
  patch:
    parameters:
    - description: The tenant ID of the NFS settings.
      name: id
      required: true
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
    summary: Modify current tenant-specific NFS configuration.
  put:
    parameters:
    - description: The tenant ID of the NFS settings.
      name: id
      required: true
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
    summary: Set current tenant-specific NFS configuration.
rest_endpoint: /v1/multitenancy/nfs/settings/{id}
sidebar: rest_api_command_guide_sidebar
---
