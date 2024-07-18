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
    summary: Get the current node replacement plan. This plan lists the nodes pending
      replacement and nodes currently in process of being replaced.
  post:
    parameters: []
    request_body:
      example_value: TO DO
      schema: TO DO
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: To initiate node replacement, specify the nodes to replace.
rest_endpoint: /v1/cluster/node-replacement-plan/
permalink: /rest-api-guide/cluster/cluster_node-replacement-plan.html
sidebar: rest_api_guide_sidebar
---
