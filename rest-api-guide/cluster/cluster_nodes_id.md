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
    summary: Retrieve node-specific info, such as serial number, mac address, uuid,
      etc
rest_endpoint: /v1/cluster/nodes/{id}
permalink: /rest-api-guide/cluster/cluster_nodes_id.html
sidebar: rest_api_command_guide_sidebar
---
