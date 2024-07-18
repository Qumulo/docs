---
category: /network
methods:
  get:
    parameters:
    - description: The unique ID of the network interface
      name: id
      required: true
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Retrieve the network statuses of all nodes on the underlying network
      interface
rest_endpoint: /v2/network/interfaces/{id}/status/
permalink: /rest-api-guide/network/v2_network_interfaces_id_status.html
sidebar: rest_api_command_guide_sidebar
---
