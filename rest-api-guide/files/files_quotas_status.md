---
category: /files
methods:
  get:
    parameters:
    - description: Return entries after the given key (keys are returned in the paging
        object)
      name: after
      required: false
    - description: Return no more than this many entries; the system may choose a
        smaller limit.
      name: limit
      required: false
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: List all directory quotas and their corresponding directories' paths
      and cumulative sizes.
rest_endpoint: /v1/files/quotas/status/
sidebar: rest_api_command_guide_sidebar
---
