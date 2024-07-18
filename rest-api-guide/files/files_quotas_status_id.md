---
category: /files
methods:
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
    summary: Get the directory quota for a directory, its limit in bytes, and current
      capacity usage.
rest_endpoint: /v1/files/quotas/status/{id}
sidebar: rest_api_command_guide_sidebar
---
