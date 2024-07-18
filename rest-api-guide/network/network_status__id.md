---
category: /network
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
    summary: This method retrieves the network configuration of the underlying system,
      including DHCP configuration, and status of any pending changes. This API is
      deprecated in favor of /v2/network/interfaces/1/status/{node_id}.
rest_endpoint: /v1/network/status/{id}
permalink: /rest-api-guide/network/network_status__id.html
sidebar: rest_api_guide_sidebar
---
