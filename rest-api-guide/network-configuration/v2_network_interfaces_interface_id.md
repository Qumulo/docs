---
category: /Network Configuration
methods:
  get:
    summary: Get configuration of an interface.
    parameters:
    - name: interface_id
      description: The unique ID of the network interface
      required: true
    response_body:
      schema: "{\n  \"description\": \"api_interface_config\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"id\": {\n      \"description\": \"Unique identifier\
        \ for this interface configuration\",\n      \"type\": \"number\"\n    },\n\
        \    \"name\": {\n      \"description\": \"Name of the configured interface\
        \ i.e. bond0\",\n      \"type\": \"string\"\n    },\n    \"default_gateway\"\
        : {\n      \"description\": \"Default IPv4 gateway on which all traffic generated\
        \ from nodes is sent out on this interface\",\n      \"type\": \"string\"\n\
        \    },\n    \"default_gateway_ipv6\": {\n      \"description\": \"Default\
        \ IPv6 gateway on which all traffic generated from nodes is sent out on this\
        \ interface\",\n      \"type\": \"string\"\n    },\n    \"bonding_mode\":\
        \ {\n      \"type\": \"string\",\n      \"enum\": [\n        \"ACTIVE_BACKUP\"\
        ,\n        \"IEEE_8023AD\"\n      ],\n      \"description\": \"Linux bonding\
        \ mode on this interface, if it is bonded.:\\n * `ACTIVE_BACKUP` - BONDING_MODE_ACTIVE_BACKUP,\\\
        n * `IEEE_8023AD` - BONDING_MODE_IEEE_8023AD\"\n    },\n    \"mtu\": {\n \
        \     \"description\": \"Maximum transmission unit configuration value\",\n\
        \      \"type\": \"number\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
  patch:
    summary: Update a subset of an interface configuration. Changes in interface MTU
      will be applied to the untagged STATIC network as well as the interface.
    parameters:
    - name: interface_id
      description: The unique ID of the network interface
      required: true
    - name: If-Match
      description: ETag for expected version
      required: false
    response_body: {}
    responses:
    - code: '202'
      description: Return value on success
    preview: false
    request_body:
      schema: "{\n  \"description\": \"api_interface_config\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"id\": {\n      \"description\": \"Unique identifier\
        \ for this interface configuration\",\n      \"type\": \"number\"\n    },\n\
        \    \"name\": {\n      \"description\": \"Name of the configured interface\
        \ i.e. bond0\",\n      \"type\": \"string\"\n    },\n    \"default_gateway\"\
        : {\n      \"description\": \"Default IPv4 gateway on which all traffic generated\
        \ from nodes is sent out on this interface\",\n      \"type\": \"string\"\n\
        \    },\n    \"default_gateway_ipv6\": {\n      \"description\": \"Default\
        \ IPv6 gateway on which all traffic generated from nodes is sent out on this\
        \ interface\",\n      \"type\": \"string\"\n    },\n    \"bonding_mode\":\
        \ {\n      \"type\": \"string\",\n      \"enum\": [\n        \"ACTIVE_BACKUP\"\
        ,\n        \"IEEE_8023AD\"\n      ],\n      \"description\": \"Linux bonding\
        \ mode on this interface, if it is bonded.:\\n * `ACTIVE_BACKUP` - BONDING_MODE_ACTIVE_BACKUP,\\\
        n * `IEEE_8023AD` - BONDING_MODE_IEEE_8023AD\"\n    },\n    \"mtu\": {\n \
        \     \"description\": \"Maximum transmission unit configuration value\",\n\
        \      \"type\": \"number\"\n    }\n  }\n}"
  put:
    summary: Set configuration of an interface. Changes in interface MTU will be applied
      to the untagged STATIC network as well as the interface.
    parameters:
    - name: interface_id
      description: The unique ID of the network interface
      required: true
    - name: If-Match
      description: ETag for expected version
      required: false
    response_body: {}
    responses:
    - code: '202'
      description: Return value on success
    preview: false
    request_body:
      schema: "{\n  \"description\": \"api_interface_config\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"id\": {\n      \"description\": \"Unique identifier\
        \ for this interface configuration\",\n      \"type\": \"number\"\n    },\n\
        \    \"name\": {\n      \"description\": \"Name of the configured interface\
        \ i.e. bond0\",\n      \"type\": \"string\"\n    },\n    \"default_gateway\"\
        : {\n      \"description\": \"Default IPv4 gateway on which all traffic generated\
        \ from nodes is sent out on this interface\",\n      \"type\": \"string\"\n\
        \    },\n    \"default_gateway_ipv6\": {\n      \"description\": \"Default\
        \ IPv6 gateway on which all traffic generated from nodes is sent out on this\
        \ interface\",\n      \"type\": \"string\"\n    },\n    \"bonding_mode\":\
        \ {\n      \"type\": \"string\",\n      \"enum\": [\n        \"ACTIVE_BACKUP\"\
        ,\n        \"IEEE_8023AD\"\n      ],\n      \"description\": \"Linux bonding\
        \ mode on this interface, if it is bonded.:\\n * `ACTIVE_BACKUP` - BONDING_MODE_ACTIVE_BACKUP,\\\
        n * `IEEE_8023AD` - BONDING_MODE_IEEE_8023AD\"\n    },\n    \"mtu\": {\n \
        \     \"description\": \"Maximum transmission unit configuration value\",\n\
        \      \"type\": \"number\"\n    }\n  }\n}"
rest_endpoint: /v2/network/interfaces/{interface_id}
api_version: v2
permalink: /rest-api-guide/network-configuration/v2_network_interfaces_interface_id.html
sidebar: rest_api_guide_sidebar
---
