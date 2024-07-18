---
category: /cluster
methods:
  get:
    parameters: []
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: List nodes.
  post:
    parameters: []
    request_body:
      example_value: TO DO
      schema: TO DO
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '202'
    summary: Add one or more unconfigured nodes with the given node uuids and admin
      password. This endpoint is deprecated in favor of /v2/cluster/nodes.
rest_endpoint: /v1/cluster/nodes/
permalink: /rest-api-guide/cluster/nodes.html
sidebar: rest_api_guide_sidebar
---
