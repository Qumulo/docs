---
category: /files
methods:
  delete:
    parameters:
    - description: Directory ID (uint64)
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
    summary: Delete the quota for a given directory.
  get:
    parameters:
    - description: Directory ID (uint64)
      name: id
      required: true
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Get the directory quota for a directory and its limit in bytes
  put:
    parameters:
    - description: Directory ID (uint64)
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
    summary: Modify the quota for a given directory.
rest_endpoint: /v1/files/quotas/{id}
permalink: /rest-api-guide/files/files_quotas__id.html
sidebar: rest_api_guide_sidebar
---
