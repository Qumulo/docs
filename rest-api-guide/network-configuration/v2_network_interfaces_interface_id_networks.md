---
category: /Network Configuration
methods:
  get:
    parameters:
    - description: The unique ID of the network interface
      name: interface_id
      required: true
    response_body:
      schema: "{\n  \"type\": \"array\",\n  \"items\": {\n    \"description\": \"\
        api_network_config_v2\",\n    \"type\": \"object\",\n    \"properties\": {\n\
        \      \"name\": {\n        \"description\": \"name\",\n        \"type\":\
        \ \"string\"\n      },\n      \"id\": {\n        \"description\": \"id\",\n\
        \        \"type\": \"number\"\n      },\n      \"assigned_by\": {\n      \
        \  \"type\": \"string\",\n        \"enum\": [\n          \"DHCP\",\n     \
        \     \"STATIC\",\n          \"LINK_LOCAL\"\n        ],\n        \"description\"\
        : \"assigned_by:\\n * `DHCP` - NETWORK_ASSIGNED_BY_DHCP,\\n * `LINK_LOCAL`\
        \ - NETWORK_ASSIGNED_BY_LINK_LOCAL,\\n * `STATIC` - NETWORK_ASSIGNED_BY_STATIC\"\
        \n      },\n      \"floating_ip_ranges\": {\n        \"type\": \"array\",\n\
        \        \"items\": {\n          \"description\": \"floating_ip_ranges\",\n\
        \          \"type\": \"string\"\n        }\n      },\n      \"dns_servers\"\
        : {\n        \"type\": \"array\",\n        \"items\": {\n          \"description\"\
        : \"dns_servers\",\n          \"type\": \"string\"\n        }\n      },\n\
        \      \"dns_search_domains\": {\n        \"type\": \"array\",\n        \"\
        items\": {\n          \"description\": \"dns_search_domains\",\n         \
        \ \"type\": \"string\"\n        }\n      },\n      \"ip_ranges\": {\n    \
        \    \"type\": \"array\",\n        \"items\": {\n          \"description\"\
        : \"ip_ranges\",\n          \"type\": \"string\"\n        }\n      },\n  \
        \    \"netmask\": {\n        \"description\": \"netmask\",\n        \"type\"\
        : \"string\"\n      },\n      \"mtu\": {\n        \"description\": \"mtu\"\
        ,\n        \"type\": \"number\"\n      },\n      \"vlan_id\": {\n        \"\
        description\": \"User assigned VLAN tag for network configuration. 1-4094\
        \ are valid VLAN IDs and 0 is used for untagged networks.\",\n        \"type\"\
        : \"number\"\n      },\n      \"tenant_id\": {\n        \"description\": \"\
        The tenant ID of the tenant that the network is a part of.\",\n        \"\
        type\": \"number\"\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
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
    summary: Add a network configuration to the interface. If the network being added
      is an untagged STATIC network, the MTU will be computed based on the interface
      configuration.
rest_endpoint: /v2/network/interfaces/{interface_id}/networks/
api_version: v2
permalink: /rest-api-guide/network-configuration/v2_network_interfaces_interface_id_networks.html
sidebar: rest_api_guide_sidebar
---
