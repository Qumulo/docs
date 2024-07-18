---
category: /network
methods:
  get:
    parameters:
    - description: The unique ID of the network interface
      name: interface_id
      required: true
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Get configurations of all networks configured on an interface. This will
      always include at least one network, and exactly one if it is assigned by DHCP.
      Network 1 is created by default, but it may be removed if other networks are
      created viastatic assignment.
  post:
    parameters:
    - description: The unique ID of the network interface
      name: interface_id
      required: true
    request_body:
      example_value: TO DO
      schema: TO DO
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '202'
    summary: Add a network configuration to the interface. If the network being added
      is an untagged STATIC network, the MTU will be computed based on the interface
      configuration.
rest_endpoint: /v2/network/interfaces/{interface_id}/networks/
permalink: /rest-api-guide/network/v2_network_interfaces_interface_id_networks.html
sidebar: rest_api_command_guide_sidebar
---
