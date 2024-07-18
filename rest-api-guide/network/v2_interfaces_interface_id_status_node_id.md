---
category: /network
methods:
  get:
    parameters:
    - description: The unique ID of the network interface
      name: interface_id
      required: true
    - description: The unique ID of the node
      name: node_id
      required: true
    response_body:
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"api_interface_network_statuses\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"node_id\": {\n      \"description\"\
        : \"Node Id\",\n      \"type\": \"number\"\n    },\n    \"node_name\": {\n\
        \      \"description\": \"Node name\",\n      \"type\": \"string\"\n    },\n\
        \    \"update_status\": {\n      \"type\": \"string\",\n      \"enum\": [\n\
        \        \"CHANGES_APPLIED\",\n        \"CHANGES_PENDING\",\n        \"UNAVAILABLE\"\
        \n      ],\n      \"description\": \"update_status:\\n * `CHANGES_APPLIED`\
        \ - UPDATE_STATUS_CHANGES_APPLIED,\\n * `CHANGES_PENDING` - UPDATE_STATUS_CHANGES_PENDING,\\\
        n * `UNAVAILABLE` - UPDATE_STATUS_UNAVAILABLE\"\n    },\n    \"interface_details\"\
        : {\n      \"description\": \"interface_details\",\n      \"type\": \"object\"\
        ,\n      \"properties\": {\n        \"speed\": {\n          \"description\"\
        : \"Network card speed in Mbps.\",\n          \"type\": \"number\"\n     \
        \   },\n        \"bytes_sent\": {\n          \"description\": \"Bytes sent\
        \ over the interface.\",\n          \"type\": \"string\"\n        },\n   \
        \     \"bytes_received\": {\n          \"description\": \"Bytes received over\
        \ the interface.\",\n          \"type\": \"string\"\n        },\n        \"\
        cable_status\": {\n          \"type\": \"string\",\n          \"enum\": [\n\
        \            \"CONNECTED\",\n            \"DISCONNECTED\",\n            \"\
        UNKNOWN\"\n          ],\n          \"description\": \"Whether network card\
        \ is connected via cable.:\\n * `CONNECTED` - NETWORK_CABLE_CONNECTED,\\n\
        \ * `DISCONNECTED` - NETWORK_CABLE_DISCONNECTED,\\n * `UNKNOWN` - NETWORK_CABLE_UNKNOWN\"\
        \n        },\n        \"interface_status\": {\n          \"type\": \"string\"\
        ,\n          \"enum\": [\n            \"UP\",\n            \"DOWN\",\n   \
        \         \"MISSING\",\n            \"UNKNOWN\",\n            \"NOTPRESENT\"\
        ,\n            \"LOWERLAYERDOWN\",\n            \"TESTING\",\n           \
        \ \"DORMANT\"\n          ],\n          \"description\": \"Status of interface\
        \ connection.:\\n * `DORMANT` - NETWORK_INTERFACE_DORMANT,\\n * `DOWN` - NETWORK_INTERFACE_DOWN,\\\
        n * `LOWERLAYERDOWN` - NETWORK_INTERFACE_LOWER_LAYER_DOWN,\\n * `MISSING`\
        \ - NETWORK_INTERFACE_MISSING,\\n * `NOTPRESENT` - NETWORK_INTERFACE_NOT_PRESENT,\\\
        n * `TESTING` - NETWORK_INTERFACE_TESTING,\\n * `UNKNOWN` - NETWORK_INTERFACE_UNKNOWN,\\\
        n * `UP` - NETWORK_INTERFACE_UP\"\n        },\n        \"mac_address\": {\n\
        \          \"description\": \"MAC address.\",\n          \"type\": \"string\"\
        \n        },\n        \"timestamp\": {\n          \"description\": \"UNIX\
        \ epoch timestamp for when the network status was sampled.\",\n          \"\
        type\": \"string\"\n        }\n      }\n    },\n    \"interface_status\":\
        \ {\n      \"description\": \"interface_status\",\n      \"type\": \"object\"\
        ,\n      \"properties\": {\n        \"interface_id\": {\n          \"description\"\
        : \"Unique identifier for this interface configuration.\",\n          \"type\"\
        : \"number\"\n        },\n        \"name\": {\n          \"description\":\
        \ \"Name of the configured interface i.e. bond0.\",\n          \"type\": \"\
        string\"\n        },\n        \"default_gateway\": {\n          \"description\"\
        : \"IPv4 default gateway on which all traffic generated from nodes is sent\
        \ out on this interface.\",\n          \"type\": \"string\"\n        },\n\
        \        \"default_gateway_ipv6\": {\n          \"description\": \"IPv6 default\
        \ gateway on which all traffic generated from nodes is sent out on this interface.\"\
        ,\n          \"type\": \"string\"\n        },\n        \"bonding_mode\": {\n\
        \          \"type\": \"string\",\n          \"enum\": [\n            \"ACTIVE_BACKUP\"\
        ,\n            \"IEEE_8023AD\"\n          ],\n          \"description\": \"\
        Ethernet bonding mode (ACTIVE_BACKUP or IEEE_8023AD), if this interface is\
        \ bonded.:\\n * `ACTIVE_BACKUP` - BONDING_MODE_ACTIVE_BACKUP,\\n * `IEEE_8023AD`\
        \ - BONDING_MODE_IEEE_8023AD\"\n        },\n        \"mtu\": {\n         \
        \ \"description\": \"The maximum transfer unit in bytes\",\n          \"type\"\
        : \"number\"\n        }\n      }\n    },\n    \"network_statuses\": {\n  \
        \    \"type\": \"array\",\n      \"items\": {\n        \"description\": \"\
        network_statuses\",\n        \"type\": \"object\",\n        \"properties\"\
        : {\n          \"name\": {\n            \"description\": \"User-assigned network\
        \ configuration name\",\n            \"type\": \"string\"\n          },\n\
        \          \"assigned_by\": {\n            \"type\": \"string\",\n       \
        \     \"enum\": [\n              \"DHCP\",\n              \"STATIC\",\n  \
        \            \"LINK_LOCAL\"\n            ],\n            \"description\":\
        \ \"How to assign IP address, either DHCP, STATIC, or LINK_LOCAL:\\n * `DHCP`\
        \ - NETWORK_ASSIGNED_BY_DHCP,\\n * `LINK_LOCAL` - NETWORK_ASSIGNED_BY_LINK_LOCAL,\\\
        n * `STATIC` - NETWORK_ASSIGNED_BY_STATIC\"\n          },\n          \"address\"\
        : {\n            \"description\": \"The IPv4 or IPv6 address in 0.0.0.0 or\
        \ :: format\",\n            \"type\": \"string\"\n          },\n         \
        \ \"floating_addresses\": {\n            \"type\": \"array\",\n          \
        \  \"items\": {\n              \"description\": \"Floating IPv4 or IPv6 addresses\
        \ in 0.0.0.0 or :: format\",\n              \"type\": \"string\"\n       \
        \     }\n          },\n          \"dns_servers\": {\n            \"type\"\
        : \"array\",\n            \"items\": {\n              \"description\": \"\
        The list of DNS servers\",\n              \"type\": \"string\"\n         \
        \   }\n          },\n          \"dns_search_domains\": {\n            \"type\"\
        : \"array\",\n            \"items\": {\n              \"description\": \"\
        The list of DNS search domains\",\n              \"type\": \"string\"\n  \
        \          }\n          },\n          \"netmask\": {\n            \"description\"\
        : \"The IPv4 or IPv6 netmask in 0.0.0.0 or :: format, or the IPv4 or IPv6\
        \ subnet CIDR\",\n            \"type\": \"string\"\n          },\n       \
        \   \"mtu\": {\n            \"description\": \"The maximum transfer unit in\
        \ bytes\",\n            \"type\": \"number\"\n          },\n          \"vlan_id\"\
        : {\n            \"description\": \"User-assigned vlan_id tag for network\
        \ configuration.\",\n            \"type\": \"number\"\n          }\n     \
        \   }\n      }\n    },\n    \"aws_status\": {\n      \"description\": \"AWS\
        \ Network Status.\",\n      \"type\": \"object\",\n      \"properties\": {\n\
        \        \"eni_id\": {\n          \"description\": \"ID of the network interface.\"\
        ,\n          \"type\": \"string\"\n        },\n        \"device_number\":\
        \ {\n          \"description\": \"Device number of the interface.\",\n   \
        \       \"type\": \"number\"\n        },\n        \"private_ipv4_addresses\"\
        : {\n          \"type\": \"array\",\n          \"items\": {\n            \"\
        description\": \"All private IP addresses associated with the interface.\"\
        ,\n            \"type\": \"string\"\n          }\n        },\n        \"subnet_id\"\
        : {\n          \"description\": \"ID of the subnet for the interface.\",\n\
        \          \"type\": \"string\"\n        },\n        \"subnet_mask\": {\n\
        \          \"description\": \"Subnet mask of the interface.\",\n         \
        \ \"type\": \"string\"\n        },\n        \"vpc_id\": {\n          \"description\"\
        : \"ID of the VPC for the interface.\",\n          \"type\": \"string\"\n\
        \        },\n        \"security_groups\": {\n          \"type\": \"array\"\
        ,\n          \"items\": {\n            \"description\": \"Names of the security\
        \ groups applied.\",\n            \"type\": \"string\"\n          }\n    \
        \    }\n      }\n    },\n    \"azure_status\": {\n      \"description\": \"\
        Azure Network Status.\",\n      \"type\": \"object\",\n      \"properties\"\
        : {\n        \"private_ipv4_address\": {\n          \"description\": \"Private\
        \ IPv4 address of this instance.\",\n          \"type\": \"string\"\n    \
        \    },\n        \"network\": {\n          \"description\": \"Azure network\
        \ containing this instance.\",\n          \"type\": \"string\"\n        },\n\
        \        \"subnet_mask\": {\n          \"description\": \"Subnet mask of the\
        \ instance's network.\",\n          \"type\": \"string\"\n        }\n    \
        \  }\n    },\n    \"gcp_status\": {\n      \"description\": \"GCP Network\
        \ Status.\",\n      \"type\": \"object\",\n      \"properties\": {\n     \
        \   \"private_ipv4_address\": {\n          \"description\": \"Private IPv4\
        \ address of this instance.\",\n          \"type\": \"string\"\n        },\n\
        \        \"ip_aliases\": {\n          \"type\": \"array\",\n          \"items\"\
        : {\n            \"description\": \"List of IP aliases associated with this\
        \ instance.\",\n            \"type\": \"string\"\n          }\n        },\n\
        \        \"network\": {\n          \"description\": \"GCP network containing\
        \ this instance.\",\n          \"type\": \"string\"\n        },\n        \"\
        subnet_mask\": {\n          \"description\": \"Subnet mask of the instance's\
        \ network.\",\n          \"type\": \"string\"\n        }\n      }\n    }\n\
        \  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Retrieve the network status of a node on the underlying network interface
rest_endpoint: /v2/network/interfaces/{interface_id}/status/{node_id}
permalink: /rest-api-guide/network/v2_interfaces_interface_id_status_node_id.html
sidebar: rest_api_guide_sidebar
---
