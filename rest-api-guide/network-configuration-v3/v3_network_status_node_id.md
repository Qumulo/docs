---
category: /Network Configuration V3
methods:
  get:
    summary: '[preview] Retrieve the network status of a node'
    parameters:
    - name: node_id
      description: The unique ID of the node
      required: true
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    preview: true
rest_endpoint: /v3/network/status/{node_id}
api_version: v3
permalink: /rest-api-guide/network-configuration-v3/v3_network_status_node_id.html
sidebar: rest_api_guide_sidebar
---
