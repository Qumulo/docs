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
    response_body: {}
    responses:
    - code: '202'
      description: Return value on success
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
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"api_network_config_v2\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"name\": {\n      \"description\": \"name\",\n\
        \      \"type\": \"string\"\n    },\n    \"id\": {\n      \"description\"\
        : \"id\",\n      \"type\": \"number\"\n    },\n    \"assigned_by\": {\n  \
        \    \"type\": \"string\",\n      \"enum\": [\n        \"DHCP\",\n       \
        \ \"STATIC\",\n        \"LINK_LOCAL\"\n      ],\n      \"description\": \"\
        assigned_by:\\n * `DHCP` - NETWORK_ASSIGNED_BY_DHCP,\\n * `LINK_LOCAL` - NETWORK_ASSIGNED_BY_LINK_LOCAL,\\\
        n * `STATIC` - NETWORK_ASSIGNED_BY_STATIC\"\n    },\n    \"floating_ip_ranges\"\
        : {\n      \"type\": \"array\",\n      \"items\": {\n        \"description\"\
        : \"floating_ip_ranges\",\n        \"type\": \"string\"\n      }\n    },\n\
        \    \"dns_servers\": {\n      \"type\": \"array\",\n      \"items\": {\n\
        \        \"description\": \"dns_servers\",\n        \"type\": \"string\"\n\
        \      }\n    },\n    \"dns_search_domains\": {\n      \"type\": \"array\"\
        ,\n      \"items\": {\n        \"description\": \"dns_search_domains\",\n\
        \        \"type\": \"string\"\n      }\n    },\n    \"ip_ranges\": {\n   \
        \   \"type\": \"array\",\n      \"items\": {\n        \"description\": \"\
        ip_ranges\",\n        \"type\": \"string\"\n      }\n    },\n    \"netmask\"\
        : {\n      \"description\": \"netmask\",\n      \"type\": \"string\"\n   \
        \ },\n    \"mtu\": {\n      \"description\": \"mtu\",\n      \"type\": \"\
        number\"\n    },\n    \"vlan_id\": {\n      \"description\": \"User assigned\
        \ VLAN tag for network configuration. 1-4094 are valid VLAN IDs and 0 is used\
        \ for untagged networks.\",\n      \"type\": \"number\"\n    },\n    \"tenant_id\"\
        : {\n      \"description\": \"The tenant ID of the tenant that the network\
        \ is a part of.\",\n      \"type\": \"number\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
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
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"api_network_config_v2\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"name\": {\n      \"description\": \"name\",\n\
        \      \"type\": \"string\"\n    },\n    \"id\": {\n      \"description\"\
        : \"id\",\n      \"type\": \"number\"\n    },\n    \"assigned_by\": {\n  \
        \    \"type\": \"string\",\n      \"enum\": [\n        \"DHCP\",\n       \
        \ \"STATIC\",\n        \"LINK_LOCAL\"\n      ],\n      \"description\": \"\
        assigned_by:\\n * `DHCP` - NETWORK_ASSIGNED_BY_DHCP,\\n * `LINK_LOCAL` - NETWORK_ASSIGNED_BY_LINK_LOCAL,\\\
        n * `STATIC` - NETWORK_ASSIGNED_BY_STATIC\"\n    },\n    \"floating_ip_ranges\"\
        : {\n      \"type\": \"array\",\n      \"items\": {\n        \"description\"\
        : \"floating_ip_ranges\",\n        \"type\": \"string\"\n      }\n    },\n\
        \    \"dns_servers\": {\n      \"type\": \"array\",\n      \"items\": {\n\
        \        \"description\": \"dns_servers\",\n        \"type\": \"string\"\n\
        \      }\n    },\n    \"dns_search_domains\": {\n      \"type\": \"array\"\
        ,\n      \"items\": {\n        \"description\": \"dns_search_domains\",\n\
        \        \"type\": \"string\"\n      }\n    },\n    \"ip_ranges\": {\n   \
        \   \"type\": \"array\",\n      \"items\": {\n        \"description\": \"\
        ip_ranges\",\n        \"type\": \"string\"\n      }\n    },\n    \"netmask\"\
        : {\n      \"description\": \"netmask\",\n      \"type\": \"string\"\n   \
        \ },\n    \"mtu\": {\n      \"description\": \"mtu\",\n      \"type\": \"\
        number\"\n    },\n    \"vlan_id\": {\n      \"description\": \"User assigned\
        \ VLAN tag for network configuration. 1-4094 are valid VLAN IDs and 0 is used\
        \ for untagged networks.\",\n      \"type\": \"number\"\n    },\n    \"tenant_id\"\
        : {\n      \"description\": \"The tenant ID of the tenant that the network\
        \ is a part of.\",\n      \"type\": \"number\"\n    }\n  }\n}"
    response_body: {}
    responses:
    - code: '202'
      description: Return value on success
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
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"api_network_config_v2\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"name\": {\n      \"description\": \"name\",\n\
        \      \"type\": \"string\"\n    },\n    \"id\": {\n      \"description\"\
        : \"id\",\n      \"type\": \"number\"\n    },\n    \"assigned_by\": {\n  \
        \    \"type\": \"string\",\n      \"enum\": [\n        \"DHCP\",\n       \
        \ \"STATIC\",\n        \"LINK_LOCAL\"\n      ],\n      \"description\": \"\
        assigned_by:\\n * `DHCP` - NETWORK_ASSIGNED_BY_DHCP,\\n * `LINK_LOCAL` - NETWORK_ASSIGNED_BY_LINK_LOCAL,\\\
        n * `STATIC` - NETWORK_ASSIGNED_BY_STATIC\"\n    },\n    \"floating_ip_ranges\"\
        : {\n      \"type\": \"array\",\n      \"items\": {\n        \"description\"\
        : \"floating_ip_ranges\",\n        \"type\": \"string\"\n      }\n    },\n\
        \    \"dns_servers\": {\n      \"type\": \"array\",\n      \"items\": {\n\
        \        \"description\": \"dns_servers\",\n        \"type\": \"string\"\n\
        \      }\n    },\n    \"dns_search_domains\": {\n      \"type\": \"array\"\
        ,\n      \"items\": {\n        \"description\": \"dns_search_domains\",\n\
        \        \"type\": \"string\"\n      }\n    },\n    \"ip_ranges\": {\n   \
        \   \"type\": \"array\",\n      \"items\": {\n        \"description\": \"\
        ip_ranges\",\n        \"type\": \"string\"\n      }\n    },\n    \"netmask\"\
        : {\n      \"description\": \"netmask\",\n      \"type\": \"string\"\n   \
        \ },\n    \"mtu\": {\n      \"description\": \"mtu\",\n      \"type\": \"\
        number\"\n    },\n    \"vlan_id\": {\n      \"description\": \"User assigned\
        \ VLAN tag for network configuration. 1-4094 are valid VLAN IDs and 0 is used\
        \ for untagged networks.\",\n      \"type\": \"number\"\n    },\n    \"tenant_id\"\
        : {\n      \"description\": \"The tenant ID of the tenant that the network\
        \ is a part of.\",\n      \"type\": \"number\"\n    }\n  }\n}"
    response_body: {}
    responses:
    - code: '202'
      description: Return value on success
    summary: Set configuration of a network on an interface. MTU change will not be
      allowed if the network being updated is an untagged STATIC network. Please modify
      the interface config instead.
rest_endpoint: /v2/network/interfaces/{interface_id}/networks/{network_id}
permalink: /rest-api-guide/network/v2_interfaces_interface_id_networks_id.html
sidebar: rest_api_guide_sidebar
---
