---
category: /network
methods:
  get:
    parameters:
    - description: The unique ID of the network interface
      name: interface_id
      required: true
    - description: The unique ID of the node
      name: node_id
      required: true
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Retrieve the network status of a node on the underlying network interface
rest_endpoint: /v2/network/interfaces/{interface_id}/status/{node_id}
permalink: /rest-api-guide/network/node_id.html
sidebar: rest_api_guide_sidebar
---
