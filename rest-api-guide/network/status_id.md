---
category: /network
methods:
  get:
    parameters:
    - description: The unique ID of the node
      name: id
      required: true
    response_body:
      description: Return value on success
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"api_network_status_response\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"id\": {\n      \"description\":\
        \ \"Node ID\",\n      \"type\": \"number\"\n    },\n    \"node_name\": {\n\
        \      \"description\": \"Node name\",\n      \"type\": \"string\"\n    },\n\
        \    \"update_status\": {\n      \"type\": \"string\",\n      \"enum\": [\n\
        \        \"CHANGES_APPLIED\",\n        \"CHANGES_PENDING\",\n        \"UNAVAILABLE\"\
        \n      ],\n      \"description\": \"update_status:\\n * `CHANGES_APPLIED`\
        \ - UPDATE_STATUS_CHANGES_APPLIED,\\n * `CHANGES_PENDING` - UPDATE_STATUS_CHANGES_PENDING,\\\
        n * `UNAVAILABLE` - UPDATE_STATUS_UNAVAILABLE\"\n    },\n    \"network_status\"\
        : {\n      \"description\": \"network_status\",\n      \"type\": \"object\"\
        ,\n      \"properties\": {\n        \"id\": {\n          \"description\":\
        \ \"Node Id\",\n          \"type\": \"number\"\n        },\n        \"assigned_by\"\
        : {\n          \"type\": \"string\",\n          \"enum\": [\n            \"\
        DHCP\",\n            \"STATIC\",\n            \"LINK_LOCAL\"\n          ],\n\
        \          \"description\": \"How to assign IP address, either DHCP or STATIC:\\\
        n * `DHCP` - NETWORK_ASSIGNED_BY_DHCP,\\n * `LINK_LOCAL` - NETWORK_ASSIGNED_BY_LINK_LOCAL,\\\
        n * `STATIC` - NETWORK_ASSIGNED_BY_STATIC\"\n        },\n        \"address\"\
        : {\n          \"description\": \"The IPv4 or IPv6 address in 0.0.0.0 or ::\
        \ format\",\n          \"type\": \"string\"\n        },\n        \"floating_addresses\"\
        : {\n          \"type\": \"array\",\n          \"items\": {\n            \"\
        description\": \"Floating IPv4 or IPv6 addresses in 0.0.0.0 or :: format\"\
        ,\n            \"type\": \"string\"\n          }\n        },\n        \"netmask\"\
        : {\n          \"description\": \"The IPv4 or IPv6 netmask in 0.0.0.0 or ::\
        \ format, or the IPv4 or IPv6 subnet CIDR\",\n          \"type\": \"string\"\
        \n        },\n        \"gateway\": {\n          \"description\": \"The IPv4\
        \ gateway in 0.0.0.0 format\",\n          \"type\": \"string\"\n        },\n\
        \        \"gateway_ipv6\": {\n          \"description\": \"The IPv6 gateway\
        \ in :: format\",\n          \"type\": \"string\"\n        },\n        \"\
        dns_servers\": {\n          \"type\": \"array\",\n          \"items\": {\n\
        \            \"description\": \"The list of DNS servers\",\n            \"\
        type\": \"string\"\n          }\n        },\n        \"dns_search_domains\"\
        : {\n          \"type\": \"array\",\n          \"items\": {\n            \"\
        description\": \"The list of DNS search domains\",\n            \"type\":\
        \ \"string\"\n          }\n        },\n        \"mtu\": {\n          \"description\"\
        : \"The maximum transfer unit in bytes\",\n          \"type\": \"number\"\n\
        \        },\n        \"bonding_mode\": {\n          \"type\": \"string\",\n\
        \          \"enum\": [\n            \"ACTIVE_BACKUP\",\n            \"IEEE_8023AD\"\
        \n          ],\n          \"description\": \"Ethernet bonding mode (ACTIVE_BACKUP\
        \ or IEEE_8023AD), if the interface is bonded.:\\n * `ACTIVE_BACKUP` - BONDING_MODE_ACTIVE_BACKUP,\\\
        n * `IEEE_8023AD` - BONDING_MODE_IEEE_8023AD\"\n        }\n      }\n    },\n\
        \    \"network_details\": {\n      \"description\": \"network_details\",\n\
        \      \"type\": \"object\",\n      \"properties\": {\n        \"speed\":\
        \ {\n          \"description\": \"Network card speed in Mbps.\",\n       \
        \   \"type\": \"number\"\n        },\n        \"bytes_sent\": {\n        \
        \  \"description\": \"Bytes sent over the interface.\",\n          \"type\"\
        : \"string\"\n        },\n        \"bytes_received\": {\n          \"description\"\
        : \"Bytes received over the interface.\",\n          \"type\": \"string\"\n\
        \        },\n        \"cable_status\": {\n          \"type\": \"string\",\n\
        \          \"enum\": [\n            \"CONNECTED\",\n            \"DISCONNECTED\"\
        ,\n            \"UNKNOWN\"\n          ],\n          \"description\": \"Whether\
        \ network card is connected via cable.:\\n * `CONNECTED` - NETWORK_CABLE_CONNECTED,\\\
        n * `DISCONNECTED` - NETWORK_CABLE_DISCONNECTED,\\n * `UNKNOWN` - NETWORK_CABLE_UNKNOWN\"\
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
        type\": \"string\"\n        }\n      }\n    }\n  }\n}"
      status_code: '200'
    summary: This method retrieves the network configuration of the underlying system,
      including DHCP configuration, and status of any pending changes. This API is
      deprecated in favor of /v2/network/interfaces/1/status/{node_id}.
rest_endpoint: /v1/network/status/{id}
permalink: /rest-api-guide/network/status_id.html
sidebar: rest_api_guide_sidebar
---
