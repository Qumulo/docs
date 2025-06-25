---
category: /Network Configuration V3
methods:
  get:
    summary: '[preview] Get the cluster-wide network configuration'
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"api_v3_cluster_network_management\",\n  \"\
        type\": \"object\",\n  \"properties\": {\n    \"managed_interfaces\": {\n\
        \      \"description\": \"The Linux virtual network interface devices that\
        \ Qumulo Core creates and manages.\",\n      \"type\": \"object\",\n     \
        \ \"properties\": {\n        \"frontend_bond_config\": {\n          \"description\"\
        : \"frontend_bond_config\",\n          \"type\": \"object\",\n          \"\
        properties\": {\n            \"interface_name\": {\n              \"description\"\
        : \"Name of the interface i.e. bond0\",\n              \"type\": \"string\"\
        \n            },\n            \"bonding_mode\": {\n              \"type\"\
        : \"string\",\n              \"enum\": [\n                \"ACTIVE_BACKUP\"\
        ,\n                \"IEEE_8023AD\"\n              ],\n              \"description\"\
        : \"Linux bonding mode on this interface.:\\n * `ACTIVE_BACKUP` - BONDING_MODE_ACTIVE_BACKUP,\\\
        n * `IEEE_8023AD` - BONDING_MODE_IEEE_8023AD\"\n            },\n         \
        \   \"mtu\": {\n              \"description\": \"Maximum transmission unit\
        \ of this interface.\",\n              \"type\": \"number\"\n            },\n\
        \            \"networks\": {\n              \"type\": \"array\",\n       \
        \       \"items\": {\n                \"description\": \"The ids of the network\
        \ configurations to apply to this interface.\",\n                \"type\"\
        : \"number\"\n              }\n            }\n          }\n        },\n  \
        \      \"frontend_vlans\": {\n          \"type\": \"array\",\n          \"\
        items\": {\n            \"description\": \"frontend_vlans\",\n           \
        \ \"type\": \"object\",\n            \"properties\": {\n              \"vlan_id\"\
        : {\n                \"description\": \"User assigned VLAN tag for network\
        \ configuration. 1-4094 are valid VLAN IDs and 0 is used for untagged networks.\"\
        ,\n                \"type\": \"number\"\n              },\n              \"\
        mtu\": {\n                \"description\": \"The maximum transmission unit\
        \ of this interface.\",\n                \"type\": \"number\"\n          \
        \    },\n              \"network_id\": {\n                \"description\"\
        : \"The id of the network configuration to apply to this interface.\",\n \
        \               \"type\": \"number\"\n              },\n              \"secondary_network_id\"\
        : {\n                \"description\": \"An optional secondary network id to\
        \ apply to this interface.\",\n                \"type\": \"number\"\n    \
        \          }\n            }\n          }\n        },\n        \"backend_bond_config\"\
        : {\n          \"description\": \"backend_bond_config\",\n          \"type\"\
        : \"object\",\n          \"properties\": {\n            \"interface_name\"\
        : {\n              \"description\": \"Name of the interface i.e. bond0\",\n\
        \              \"type\": \"string\"\n            },\n            \"bonding_mode\"\
        : {\n              \"type\": \"string\",\n              \"enum\": [\n    \
        \            \"ACTIVE_BACKUP\",\n                \"IEEE_8023AD\"\n       \
        \       ],\n              \"description\": \"Linux bonding mode on this interface.:\\\
        n * `ACTIVE_BACKUP` - BONDING_MODE_ACTIVE_BACKUP,\\n * `IEEE_8023AD` - BONDING_MODE_IEEE_8023AD\"\
        \n            },\n            \"mtu\": {\n              \"description\": \"\
        Maximum transmission unit of this interface.\",\n              \"type\": \"\
        number\"\n            },\n            \"networks\": {\n              \"type\"\
        : \"array\",\n              \"items\": {\n                \"description\"\
        : \"The ids of the network configurations to apply to this interface.\",\n\
        \                \"type\": \"number\"\n              }\n            }\n  \
        \        }\n        }\n      }\n    },\n    \"frontend_networks\": {\n   \
        \   \"type\": \"array\",\n      \"items\": {\n        \"description\": \"\
        The list of networks applied to interfaces that serve client traffic.\",\n\
        \        \"type\": \"object\",\n        \"properties\": {\n          \"id\"\
        : {\n            \"description\": \"Unique identifier for this network configuration.\"\
        ,\n            \"type\": \"number\"\n          },\n          \"name\": {\n\
        \            \"description\": \"Unique name for this network configuration.\"\
        ,\n            \"type\": \"string\"\n          },\n          \"tenant_id\"\
        : {\n            \"description\": \"The tenant ID of the tenant that the network\
        \ is a part of.\",\n            \"type\": \"number\"\n          },\n     \
        \     \"api_v3_network_addresses\": {\n            \"description\": \"api_v3_network_addresses\"\
        ,\n            \"type\": \"object\",\n            \"properties\": {\n    \
        \          \"type\": {\n                \"type\": \"string\",\n          \
        \      \"enum\": [\n                  \"DHCP\",\n                  \"STATIC\"\
        ,\n                  \"HOST\"\n                ],\n                \"description\"\
        : \"type:\\n * `DHCP` - API_V3_NETWORK_ADDRESSES_DHCP,\\n * `HOST` - API_V3_NETWORK_ADDRESSES_HOST,\\\
        n * `STATIC` - API_V3_NETWORK_ADDRESSES_STATIC\"\n              },\n     \
        \         \"dhcp_addresses\": {\n                \"description\": \"Value\
        \ present when type is API_V3_NETWORK_ADDRESSES_DHCP.\",\n               \
        \ \"type\": \"object\",\n                \"properties\": {\n             \
        \     \"floating_ip_ranges\": {\n                    \"type\": \"array\",\n\
        \                    \"items\": {\n                      \"description\":\
        \ \"floating_ip_ranges\",\n                      \"type\": \"string\"\n  \
        \                  }\n                  },\n                  \"netmask\"\
        : {\n                    \"description\": \"netmask\",\n                 \
        \   \"type\": \"string\"\n                  }\n                }\n       \
        \       },\n              \"static_addresses\": {\n                \"description\"\
        : \"Value present when type is API_V3_NETWORK_ADDRESSES_STATIC.\",\n     \
        \           \"type\": \"object\",\n                \"properties\": {\n   \
        \               \"default_gateway\": {\n                    \"description\"\
        : \"default_gateway\",\n                    \"type\": \"string\"\n       \
        \           },\n                  \"ip_ranges\": {\n                    \"\
        type\": \"array\",\n                    \"items\": {\n                   \
        \   \"description\": \"ip_ranges\",\n                      \"type\": \"string\"\
        \n                    }\n                  },\n                  \"floating_ip_ranges\"\
        : {\n                    \"type\": \"array\",\n                    \"items\"\
        : {\n                      \"description\": \"floating_ip_ranges\",\n    \
        \                  \"type\": \"string\"\n                    }\n         \
        \         },\n                  \"netmask\": {\n                    \"description\"\
        : \"netmask\",\n                    \"type\": \"string\"\n               \
        \   }\n                }\n              },\n              \"host_addresses\"\
        : {\n                \"description\": \"Value present when type is API_V3_NETWORK_ADDRESSES_HOST.\"\
        ,\n                \"type\": \"object\",\n                \"properties\":\
        \ {\n                  \"floating_ip_ranges\": {\n                    \"type\"\
        : \"array\",\n                    \"items\": {\n                      \"description\"\
        : \"floating_ip_ranges\",\n                      \"type\": \"string\"\n  \
        \                  }\n                  },\n                  \"netmask\"\
        : {\n                    \"description\": \"netmask\",\n                 \
        \   \"type\": \"string\"\n                  }\n                }\n       \
        \       }\n            }\n          }\n        }\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: true
  put:
    summary: '[preview] Overwrite the current cluster network configuration.'
    parameters:
    - name: If-Match
      description: ETag for expected version
      required: false
    response_body: {}
    responses:
    - code: '202'
      description: Return value on success
    preview: true
    request_body:
      schema: "{\n  \"description\": \"api_v3_cluster_network_management\",\n  \"\
        type\": \"object\",\n  \"properties\": {\n    \"managed_interfaces\": {\n\
        \      \"description\": \"The Linux virtual network interface devices that\
        \ Qumulo Core creates and manages.\",\n      \"type\": \"object\",\n     \
        \ \"properties\": {\n        \"frontend_bond_config\": {\n          \"description\"\
        : \"frontend_bond_config\",\n          \"type\": \"object\",\n          \"\
        properties\": {\n            \"interface_name\": {\n              \"description\"\
        : \"Name of the interface i.e. bond0\",\n              \"type\": \"string\"\
        \n            },\n            \"bonding_mode\": {\n              \"type\"\
        : \"string\",\n              \"enum\": [\n                \"ACTIVE_BACKUP\"\
        ,\n                \"IEEE_8023AD\"\n              ],\n              \"description\"\
        : \"Linux bonding mode on this interface.:\\n * `ACTIVE_BACKUP` - BONDING_MODE_ACTIVE_BACKUP,\\\
        n * `IEEE_8023AD` - BONDING_MODE_IEEE_8023AD\"\n            },\n         \
        \   \"mtu\": {\n              \"description\": \"Maximum transmission unit\
        \ of this interface.\",\n              \"type\": \"number\"\n            },\n\
        \            \"networks\": {\n              \"type\": \"array\",\n       \
        \       \"items\": {\n                \"description\": \"The ids of the network\
        \ configurations to apply to this interface.\",\n                \"type\"\
        : \"number\"\n              }\n            }\n          }\n        },\n  \
        \      \"frontend_vlans\": {\n          \"type\": \"array\",\n          \"\
        items\": {\n            \"description\": \"frontend_vlans\",\n           \
        \ \"type\": \"object\",\n            \"properties\": {\n              \"vlan_id\"\
        : {\n                \"description\": \"User assigned VLAN tag for network\
        \ configuration. 1-4094 are valid VLAN IDs and 0 is used for untagged networks.\"\
        ,\n                \"type\": \"number\"\n              },\n              \"\
        mtu\": {\n                \"description\": \"The maximum transmission unit\
        \ of this interface.\",\n                \"type\": \"number\"\n          \
        \    },\n              \"network_id\": {\n                \"description\"\
        : \"The id of the network configuration to apply to this interface.\",\n \
        \               \"type\": \"number\"\n              },\n              \"secondary_network_id\"\
        : {\n                \"description\": \"An optional secondary network id to\
        \ apply to this interface.\",\n                \"type\": \"number\"\n    \
        \          }\n            }\n          }\n        },\n        \"backend_bond_config\"\
        : {\n          \"description\": \"backend_bond_config\",\n          \"type\"\
        : \"object\",\n          \"properties\": {\n            \"interface_name\"\
        : {\n              \"description\": \"Name of the interface i.e. bond0\",\n\
        \              \"type\": \"string\"\n            },\n            \"bonding_mode\"\
        : {\n              \"type\": \"string\",\n              \"enum\": [\n    \
        \            \"ACTIVE_BACKUP\",\n                \"IEEE_8023AD\"\n       \
        \       ],\n              \"description\": \"Linux bonding mode on this interface.:\\\
        n * `ACTIVE_BACKUP` - BONDING_MODE_ACTIVE_BACKUP,\\n * `IEEE_8023AD` - BONDING_MODE_IEEE_8023AD\"\
        \n            },\n            \"mtu\": {\n              \"description\": \"\
        Maximum transmission unit of this interface.\",\n              \"type\": \"\
        number\"\n            },\n            \"networks\": {\n              \"type\"\
        : \"array\",\n              \"items\": {\n                \"description\"\
        : \"The ids of the network configurations to apply to this interface.\",\n\
        \                \"type\": \"number\"\n              }\n            }\n  \
        \        }\n        }\n      }\n    },\n    \"frontend_networks\": {\n   \
        \   \"type\": \"array\",\n      \"items\": {\n        \"description\": \"\
        The list of networks applied to interfaces that serve client traffic.\",\n\
        \        \"type\": \"object\",\n        \"properties\": {\n          \"id\"\
        : {\n            \"description\": \"Unique identifier for this network configuration.\"\
        ,\n            \"type\": \"number\"\n          },\n          \"name\": {\n\
        \            \"description\": \"Unique name for this network configuration.\"\
        ,\n            \"type\": \"string\"\n          },\n          \"tenant_id\"\
        : {\n            \"description\": \"The tenant ID of the tenant that the network\
        \ is a part of.\",\n            \"type\": \"number\"\n          },\n     \
        \     \"api_v3_network_addresses\": {\n            \"description\": \"api_v3_network_addresses\"\
        ,\n            \"type\": \"object\",\n            \"properties\": {\n    \
        \          \"type\": {\n                \"type\": \"string\",\n          \
        \      \"enum\": [\n                  \"DHCP\",\n                  \"STATIC\"\
        ,\n                  \"HOST\"\n                ],\n                \"description\"\
        : \"type:\\n * `DHCP` - API_V3_NETWORK_ADDRESSES_DHCP,\\n * `HOST` - API_V3_NETWORK_ADDRESSES_HOST,\\\
        n * `STATIC` - API_V3_NETWORK_ADDRESSES_STATIC\"\n              },\n     \
        \         \"dhcp_addresses\": {\n                \"description\": \"Value\
        \ present when type is API_V3_NETWORK_ADDRESSES_DHCP.\",\n               \
        \ \"type\": \"object\",\n                \"properties\": {\n             \
        \     \"floating_ip_ranges\": {\n                    \"type\": \"array\",\n\
        \                    \"items\": {\n                      \"description\":\
        \ \"floating_ip_ranges\",\n                      \"type\": \"string\"\n  \
        \                  }\n                  },\n                  \"netmask\"\
        : {\n                    \"description\": \"netmask\",\n                 \
        \   \"type\": \"string\"\n                  }\n                }\n       \
        \       },\n              \"static_addresses\": {\n                \"description\"\
        : \"Value present when type is API_V3_NETWORK_ADDRESSES_STATIC.\",\n     \
        \           \"type\": \"object\",\n                \"properties\": {\n   \
        \               \"default_gateway\": {\n                    \"description\"\
        : \"default_gateway\",\n                    \"type\": \"string\"\n       \
        \           },\n                  \"ip_ranges\": {\n                    \"\
        type\": \"array\",\n                    \"items\": {\n                   \
        \   \"description\": \"ip_ranges\",\n                      \"type\": \"string\"\
        \n                    }\n                  },\n                  \"floating_ip_ranges\"\
        : {\n                    \"type\": \"array\",\n                    \"items\"\
        : {\n                      \"description\": \"floating_ip_ranges\",\n    \
        \                  \"type\": \"string\"\n                    }\n         \
        \         },\n                  \"netmask\": {\n                    \"description\"\
        : \"netmask\",\n                    \"type\": \"string\"\n               \
        \   }\n                }\n              },\n              \"host_addresses\"\
        : {\n                \"description\": \"Value present when type is API_V3_NETWORK_ADDRESSES_HOST.\"\
        ,\n                \"type\": \"object\",\n                \"properties\":\
        \ {\n                  \"floating_ip_ranges\": {\n                    \"type\"\
        : \"array\",\n                    \"items\": {\n                      \"description\"\
        : \"floating_ip_ranges\",\n                      \"type\": \"string\"\n  \
        \                  }\n                  },\n                  \"netmask\"\
        : {\n                    \"description\": \"netmask\",\n                 \
        \   \"type\": \"string\"\n                  }\n                }\n       \
        \       }\n            }\n          }\n        }\n      }\n    }\n  }\n}"
rest_endpoint: /v3/network
api_version: v3
permalink: /rest-api-guide/network-configuration-v3/v3_network.html
sidebar: rest_api_guide_sidebar
---
