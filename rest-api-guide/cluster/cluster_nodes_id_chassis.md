---
category: /cluster
methods:
  get:
    parameters:
    - description: The unique ID of the node
      name: id
      required: true
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: List the status of the chassis for a node. This API is deprecated in
      favor of /v1/cluster/nodes/<id>/uid-light and /v2/metrics/endpoints/default/data
      for PSU information
rest_endpoint: /v1/cluster/nodes/{id}/chassis
sidebar: rest_api_command_guide_sidebar
---
