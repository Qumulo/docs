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
    summary: Get configuration of an interface.
  patch:
    parameters:
    - description: The unique ID of the network interface
      name: interface_id
      required: true
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
      example_value: TO DO
      schema: TO DO
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '202'
    summary: Update a subset of an interface configuration. Changes in interface MTU
      will be applied to the untagged STATIC network as well as the interface.
  put:
    parameters:
    - description: The unique ID of the network interface
      name: interface_id
      required: true
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
      example_value: TO DO
      schema: TO DO
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '202'
    summary: Set configuration of an interface. Changes in interface MTU will be applied
      to the untagged STATIC network as well as the interface.
rest_endpoint: /v2/network/interfaces/{interface_id}
permalink: /rest-api-guide/network/v2_network_interfaces_interface_id.html
sidebar: rest_api_command_guide_sidebar
---
