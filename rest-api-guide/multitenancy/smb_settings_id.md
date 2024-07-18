---
category: /multitenancy
methods:
  delete:
    parameters:
    - description: The tenant ID of the SMB settings.
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
    summary: Delete current SMB configuration, restoring the global settings for this
      tenant.
  get:
    parameters:
    - description: The tenant ID of the SMB settings.
      name: id
      required: true
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Retrieve current tenant-specific SMB configuration.
  patch:
    parameters:
    - description: The tenant ID of the SMB settings.
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
    summary: Modify current tenant-specific SMB configuration.
  put:
    parameters:
    - description: The tenant ID of the SMB settings.
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
    summary: Set current tenant-specific SMB configuration.
rest_endpoint: /v1/multitenancy/smb/settings/{id}
permalink: /rest-api-guide/multitenancy/smb_settings_id.html
sidebar: rest_api_guide_sidebar
---
