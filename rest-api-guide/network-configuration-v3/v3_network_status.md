---
category: /Network Configuration V3
methods:
  get:
    summary: Retrieve the network statuses of all nodes in the cluster
    parameters: []
    response_body:
      schema: "{\n  \"type\": \"array\",\n  \"items\": {\n    \"description\": \"\
        api_node_network_status\",\n    \"type\": \"object\",\n    \"properties\"\
        : {\n      \"node_id\": {\n        \"description\": \"Unique identifier for\
        \ the node.\",\n        \"type\": \"number\"\n      },\n      \"node_name\"\
        : {\n        \"description\": \"Human-readable name of the node.\",\n    \
        \    \"type\": \"string\"\n      },\n      \"managed_interface_statuses\"\
        : {\n        \"type\": \"array\",\n        \"items\": {\n          \"description\"\
        : \"Status of all managed network interfaces on this node.\",\n          \"\
        type\": \"object\",\n          \"properties\": {\n            \"name\": {\n\
        \              \"description\": \"Name of the interface.\",\n            \
        \  \"type\": \"string\"\n            },\n            \"status\": {\n     \
        \         \"type\": \"string\",\n              \"enum\": [\n             \
        \   \"APPLIED\",\n                \"PENDING\",\n                \"FAILED\"\
        \n              ],\n              \"description\": \"Current application status\
        \ of the interface.:\\n * `APPLIED` - APPLICATION_STATUS_APPLIED,\\n * `FAILED`\
        \ - APPLICATION_STATUS_FAILED,\\n * `PENDING` - APPLICATION_STATUS_PENDING\"\
        \n            },\n            \"details\": {\n              \"description\"\
        : \"Additional details about the interface status.\",\n              \"type\"\
        : \"string\"\n            }\n          }\n        }\n      },\n      \"network_statuses\"\
        : {\n        \"description\": \"Status of all network configurations on this\
        \ node.\",\n        \"type\": \"object\",\n        \"properties\": {},\n \
        \       \"additionalProperties\": {\n          \"description\": \"Status of\
        \ all network configurations on this node. value\",\n          \"type\": \"\
        object\",\n          \"properties\": {\n            \"name\": {\n        \
        \      \"description\": \"Human readable name of this network configuration.\"\
        ,\n              \"type\": \"string\"\n            },\n            \"status\"\
        : {\n              \"type\": \"string\",\n              \"enum\": [\n    \
        \            \"APPLIED\",\n                \"PENDING\",\n                \"\
        FAILED\"\n              ],\n              \"description\": \"Current application\
        \ status of the network configuration.:\\n * `APPLIED` - APPLICATION_STATUS_APPLIED,\\\
        n * `FAILED` - APPLICATION_STATUS_FAILED,\\n * `PENDING` - APPLICATION_STATUS_PENDING\"\
        \n            },\n            \"details\": {\n              \"description\"\
        : \"Additional details about the network configuration status.\",\n      \
        \        \"type\": \"string\"\n            }\n          }\n        }\n   \
        \   },\n      \"devices\": {\n        \"type\": \"array\",\n        \"items\"\
        : {\n          \"description\": \"All detected network devices on this node.\"\
        ,\n          \"type\": \"object\",\n          \"properties\": {\n        \
        \    \"name\": {\n              \"description\": \"Name of the network device.\"\
        ,\n              \"type\": \"string\"\n            },\n            \"permanent_mac_address\"\
        : {\n              \"description\": \"Permanent hardware MAC address of the\
        \ device.\",\n              \"type\": \"string\"\n            },\n       \
        \     \"mac_address\": {\n              \"description\": \"Current MAC address\
        \ of the device.\",\n              \"type\": \"string\"\n            },\n\
        \            \"speed\": {\n              \"description\": \"Link speed in\
        \ Mbps.\",\n              \"type\": \"string\"\n            },\n         \
        \   \"bytes_sent\": {\n              \"description\": \"Total bytes transmitted\
        \ on this device.\",\n              \"type\": \"string\"\n            },\n\
        \            \"bytes_received\": {\n              \"description\": \"Total\
        \ bytes received on this device.\",\n              \"type\": \"string\"\n\
        \            },\n            \"cable_status\": {\n              \"type\":\
        \ \"string\",\n              \"enum\": [\n                \"CONNECTED\",\n\
        \                \"DISCONNECTED\",\n                \"UNKNOWN\"\n        \
        \      ],\n              \"description\": \"Cable connection status of the\
        \ device.:\\n * `CONNECTED` - NETWORK_CABLE_CONNECTED,\\n * `DISCONNECTED`\
        \ - NETWORK_CABLE_DISCONNECTED,\\n * `UNKNOWN` - NETWORK_CABLE_UNKNOWN\"\n\
        \            },\n            \"interface_status\": {\n              \"type\"\
        : \"string\",\n              \"enum\": [\n                \"UP\",\n      \
        \          \"DOWN\",\n                \"MISSING\",\n                \"UNKNOWN\"\
        ,\n                \"NOTPRESENT\",\n                \"LOWERLAYERDOWN\",\n\
        \                \"TESTING\",\n                \"DORMANT\"\n             \
        \ ],\n              \"description\": \"Operational status of the network interface.:\\\
        n * `DORMANT` - NETWORK_INTERFACE_DORMANT,\\n * `DOWN` - NETWORK_INTERFACE_DOWN,\\\
        n * `LOWERLAYERDOWN` - NETWORK_INTERFACE_LOWER_LAYER_DOWN,\\n * `MISSING`\
        \ - NETWORK_INTERFACE_MISSING,\\n * `NOTPRESENT` - NETWORK_INTERFACE_NOT_PRESENT,\\\
        n * `TESTING` - NETWORK_INTERFACE_TESTING,\\n * `UNKNOWN` - NETWORK_INTERFACE_UNKNOWN,\\\
        n * `UP` - NETWORK_INTERFACE_UP\"\n            },\n            \"mtu\": {\n\
        \              \"description\": \"Maximum transmission unit in bytes.\",\n\
        \              \"type\": \"number\"\n            },\n            \"bonding_mode\"\
        : {\n              \"type\": \"string\",\n              \"enum\": [\n    \
        \            \"ACTIVE_BACKUP\",\n                \"IEEE_8023AD\"\n       \
        \       ],\n              \"description\": \"Bonding mode if this device is\
        \ part of a bond.:\\n * `ACTIVE_BACKUP` - BONDING_MODE_ACTIVE_BACKUP,\\n *\
        \ `IEEE_8023AD` - BONDING_MODE_IEEE_8023AD\"\n            },\n           \
        \ \"vlan_id\": {\n              \"description\": \"VLAN ID if this device\
        \ is a VLAN interface.\",\n              \"type\": \"number\"\n          \
        \  },\n            \"timestamp\": {\n              \"description\": \"Timestamp\
        \ when this status was captured.\",\n              \"type\": \"string\"\n\
        \            },\n            \"api_network_specific_fields\": {\n        \
        \      \"description\": \"api_network_specific_fields\",\n              \"\
        type\": \"object\",\n              \"properties\": {\n                \"type\"\
        : {\n                  \"type\": \"string\",\n                  \"enum\":\
        \ [\n                    \"FRONTEND\",\n                    \"BACKEND\",\n\
        \                    \"FRONTEND_AND_BACKEND\",\n                    \"UNDERLYING\"\
        ,\n                    \"NONE\"\n                  ],\n                  \"\
        description\": \"use_for:\\n * `BACKEND` - USE_FOR_BACKEND,\\n * `FRONTEND`\
        \ - USE_FOR_FRONTEND,\\n * `FRONTEND_AND_BACKEND` - USE_FOR_FRONTEND_AND_BACKEND,\\\
        n * `NONE` - USE_FOR_NONE,\\n * `UNDERLYING` - USE_FOR_UNDERLYING\"\n    \
        \            },\n                \"qumulo_ip_addresses\": {\n            \
        \      \"type\": \"array\",\n                  \"items\": {\n            \
        \        \"description\": \"Value present when type is USE_FOR_FRONTEND, USE_FOR_BACKEND,\
        \ or USE_FOR_FRONTEND_AND_BACKEND.\",\n                    \"type\": \"object\"\
        ,\n                    \"properties\": {\n                      \"network_id\"\
        : {\n                        \"description\": \"Unique identifier for this\
        \ network configuration\",\n                        \"type\": \"number\"\n\
        \                      },\n                      \"assigned_by\": {\n    \
        \                    \"type\": \"string\",\n                        \"enum\"\
        : [\n                          \"DHCP\",\n                          \"STATIC\"\
        ,\n                          \"LINK_LOCAL\",\n                          \"\
        HOST\"\n                        ],\n                        \"description\"\
        : \"How networks are assigned: DHCP, STATIC, or HOST:\\n * `DHCP` - NETWORK_ASSIGNED_BY_DHCP,\\\
        n * `HOST` - NETWORK_ASSIGNED_BY_HOST,\\n * `LINK_LOCAL` - NETWORK_ASSIGNED_BY_LINK_LOCAL,\\\
        n * `STATIC` - NETWORK_ASSIGNED_BY_STATIC\"\n                      },\n  \
        \                    \"netmask\": {\n                        \"description\"\
        : \"The IPv4 or IPv6 netmask\",\n                        \"type\": \"string\"\
        \n                      },\n                      \"address\": {\n       \
        \                 \"description\": \"The IPv4 or IPv6 address assigned to\
        \ this interface\",\n                        \"type\": \"string\"\n      \
        \                },\n                      \"floating_addresses\": {\n   \
        \                     \"type\": \"array\",\n                        \"items\"\
        : {\n                          \"description\": \"Floating IP addresses in\
        \ 0.0.0.0 or :: format\",\n                          \"type\": \"string\"\n\
        \                        }\n                      },\n                   \
        \   \"gateway\": {\n                        \"description\": \"Default gateway\
        \ address for this network\",\n                        \"type\": \"string\"\
        \n                      }\n                    }\n                  }\n  \
        \              },\n                \"host_routable_ip_addresses\": {\n   \
        \               \"type\": \"array\",\n                  \"items\": {\n   \
        \                 \"description\": \"Value present when type is USE_FOR_FRONTEND,\
        \ USE_FOR_BACKEND, or USE_FOR_FRONTEND_AND_BACKEND.\",\n                 \
        \   \"type\": \"string\"\n                  }\n                },\n      \
        \          \"upper_interface_name\": {\n                  \"description\"\
        : \"Value present when type is USE_FOR_UNDERLYING.\",\n                  \"\
        type\": \"string\"\n                },\n                \"addresses\": {\n\
        \                  \"type\": \"array\",\n                  \"items\": {\n\
        \                    \"description\": \"Value present when type is USE_FOR_NONE.\"\
        ,\n                    \"type\": \"string\"\n                  }\n       \
        \         }\n              }\n            }\n          }\n        }\n    \
        \  },\n      \"environment\": {\n        \"description\": \"Detected network\
        \ environment settings.\",\n        \"type\": \"object\",\n        \"properties\"\
        : {\n          \"dns_servers\": {\n            \"type\": \"array\",\n    \
        \        \"items\": {\n              \"description\": \"List of DNS server\
        \ addresses.\",\n              \"type\": \"string\"\n            }\n     \
        \     },\n          \"dns_search_domains\": {\n            \"type\": \"array\"\
        ,\n            \"items\": {\n              \"description\": \"List of DNS\
        \ search domains.\",\n              \"type\": \"string\"\n            }\n\
        \          },\n          \"systemwide_default_gateways\": {\n            \"\
        type\": \"array\",\n            \"items\": {\n              \"description\"\
        : \"System-wide default gateway addresses.\",\n              \"type\": \"\
        string\"\n            }\n          }\n        }\n      },\n      \"api_cloud_provider_status\"\
        : {\n        \"description\": \"api_cloud_provider_status\",\n        \"type\"\
        : \"object\",\n        \"properties\": {\n          \"type\": {\n        \
        \    \"type\": \"string\",\n            \"enum\": [\n              \"AWS\"\
        ,\n              \"AZURE\",\n              \"GCP\"\n            ],\n     \
        \       \"description\": \"type:\\n * `AWS` - AWS cloud provider,\\n * `AZURE`\
        \ - Azure cloud provider,\\n * `GCP` - GCP cloud provider\"\n          },\n\
        \          \"aws_status\": {\n            \"description\": \"Value present\
        \ when type is API_CLOUD_PROVIDER_STATUS_AWS.\",\n            \"type\": \"\
        object\",\n            \"properties\": {\n              \"eni_id\": {\n  \
        \              \"description\": \"ID of the network interface.\",\n      \
        \          \"type\": \"string\"\n              },\n              \"device_number\"\
        : {\n                \"description\": \"Device number of the interface.\"\
        ,\n                \"type\": \"number\"\n              },\n              \"\
        private_ipv4_addresses\": {\n                \"type\": \"array\",\n      \
        \          \"items\": {\n                  \"description\": \"All private\
        \ IP addresses associated with the interface.\",\n                  \"type\"\
        : \"string\"\n                }\n              },\n              \"subnet_id\"\
        : {\n                \"description\": \"ID of the subnet for the interface.\"\
        ,\n                \"type\": \"string\"\n              },\n              \"\
        subnet_mask\": {\n                \"description\": \"Subnet mask of the interface.\"\
        ,\n                \"type\": \"string\"\n              },\n              \"\
        vpc_id\": {\n                \"description\": \"ID of the VPC for the interface.\"\
        ,\n                \"type\": \"string\"\n              },\n              \"\
        security_groups\": {\n                \"type\": \"array\",\n             \
        \   \"items\": {\n                  \"description\": \"Names of the security\
        \ groups applied.\",\n                  \"type\": \"string\"\n           \
        \     }\n              }\n            }\n          },\n          \"azure_status\"\
        : {\n            \"description\": \"Value present when type is API_CLOUD_PROVIDER_STATUS_AZURE.\"\
        ,\n            \"type\": \"object\",\n            \"properties\": {\n    \
        \          \"private_ipv4_address\": {\n                \"description\": \"\
        Private IPv4 address of this instance.\",\n                \"type\": \"string\"\
        \n              },\n              \"network\": {\n                \"description\"\
        : \"Azure network containing this instance.\",\n                \"type\":\
        \ \"string\"\n              },\n              \"subnet_mask\": {\n       \
        \         \"description\": \"Subnet mask of the instance's network.\",\n \
        \               \"type\": \"string\"\n              }\n            }\n   \
        \       },\n          \"gcp_status\": {\n            \"description\": \"Value\
        \ present when type is API_CLOUD_PROVIDER_STATUS_GCP.\",\n            \"type\"\
        : \"object\",\n            \"properties\": {\n              \"private_ipv4_address\"\
        : {\n                \"description\": \"Private IPv4 address of this instance.\"\
        ,\n                \"type\": \"string\"\n              },\n              \"\
        ip_aliases\": {\n                \"type\": \"array\",\n                \"\
        items\": {\n                  \"description\": \"List of IP aliases associated\
        \ with this instance.\",\n                  \"type\": \"string\"\n       \
        \         }\n              },\n              \"network\": {\n            \
        \    \"description\": \"GCP network containing this instance.\",\n       \
        \         \"type\": \"string\"\n              },\n              \"subnet_mask\"\
        : {\n                \"description\": \"Subnet mask of the instance's network.\"\
        ,\n                \"type\": \"string\"\n              }\n            }\n\
        \          }\n        }\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
rest_endpoint: /v3/network/status
api_version: v3
permalink: /rest-api-guide/network-configuration-v3/v3_network_status.html
sidebar: rest_api_guide_sidebar
---
