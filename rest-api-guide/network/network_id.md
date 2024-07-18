---
category: /network
methods:
  delete:
    parameters:
    - description: The unique ID of the network interface
      name: interface_id
      required: true
    - description: The unique ID of the virtual network
      name: network_id
      required: true
    - description: ETag for expected version
      name: If-Match
      required: false
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '202'
    summary: Delete configuration of a network on an interface.
  get:
    parameters:
    - description: The unique ID of the network interface
      name: interface_id
      required: true
    - description: The unique ID of the virtual network
      name: network_id
      required: true
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Get configuration of a network on an interface.
  patch:
    parameters:
    - description: The unique ID of the network interface
      name: interface_id
      required: true
    - description: The unique ID of the virtual network
      name: network_id
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
    summary: Update a subset of configuration of a network on an interface. MTU change
      will not be allowed if the network being updated is an untagged STATIC network.
      Please modify the interface config instead.
  put:
    parameters:
    - description: The unique ID of the network interface
      name: interface_id
      required: true
    - description: The unique ID of the virtual network
      name: network_id
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
    summary: Set configuration of a network on an interface. MTU change will not be
      allowed if the network being updated is an untagged STATIC network. Please modify
      the interface config instead.
rest_endpoint: /v2/network/interfaces/{interface_id}/networks/{network_id}
permalink: /rest-api-guide/network/network_id.html
sidebar: rest_api_guide_sidebar
---
