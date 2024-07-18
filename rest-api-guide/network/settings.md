---
category: /network
methods:
  get:
    parameters: []
    response_body:
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"api_cluster_network_config_v1\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"assigned_by\": {\n      \"type\"\
        : \"string\",\n      \"enum\": [\n        \"DHCP\",\n        \"STATIC\",\n\
        \        \"LINK_LOCAL\"\n      ],\n      \"description\": \"How to assign\
        \ IP address, either DHCP or STATIC:\\n * `DHCP` - NETWORK_ASSIGNED_BY_DHCP,\\\
        n * `LINK_LOCAL` - NETWORK_ASSIGNED_BY_LINK_LOCAL,\\n * `STATIC` - NETWORK_ASSIGNED_BY_STATIC\"\
        \n    },\n    \"ip_ranges\": {\n      \"type\": \"array\",\n      \"items\"\
        : {\n        \"description\": \"(STATIC only) Comma-separated list of IP ranges\"\
        ,\n        \"type\": \"string\"\n      }\n    },\n    \"floating_ip_ranges\"\
        : {\n      \"type\": \"array\",\n      \"items\": {\n        \"description\"\
        : \"(STATIC only) Comma-separated list of floating IP ranges\",\n        \"\
        type\": \"string\"\n      }\n    },\n    \"netmask\": {\n      \"description\"\
        : \"(STATIC only) The IPv4 or IPv6 netmask in 0.0.0.0 or :: format, or the\
        \ IPv4 or IPv6 subnet CIDR\",\n      \"type\": \"string\"\n    },\n    \"\
        gateway\": {\n      \"description\": \"(STATIC only) The IPv4 gateway in 0.0.0.0\
        \ format\",\n      \"type\": \"string\"\n    },\n    \"gateway_ipv6\": {\n\
        \      \"description\": \"(STATIC only) The IPv6 gateway in :: format\",\n\
        \      \"type\": \"string\"\n    },\n    \"dns_servers\": {\n      \"type\"\
        : \"array\",\n      \"items\": {\n        \"description\": \"(STATIC only)\
        \ The list of DNS servers\",\n        \"type\": \"string\"\n      }\n    },\n\
        \    \"dns_search_domains\": {\n      \"type\": \"array\",\n      \"items\"\
        : {\n        \"description\": \"(STATIC only) The list of DNS search domains\"\
        ,\n        \"type\": \"string\"\n      }\n    },\n    \"mtu\": {\n      \"\
        description\": \"(STATIC only) The maximum transfer unit (MTU) in bytes\"\
        ,\n      \"type\": \"number\"\n    },\n    \"bonding_mode\": {\n      \"type\"\
        : \"string\",\n      \"enum\": [\n        \"ACTIVE_BACKUP\",\n        \"IEEE_8023AD\"\
        \n      ],\n      \"description\": \"Ethernet bonding mode (ACTIVE_BACKUP\
        \ or IEEE_8023AD), if the interface is bonded.:\\n * `ACTIVE_BACKUP` - BONDING_MODE_ACTIVE_BACKUP,\\\
        n * `IEEE_8023AD` - BONDING_MODE_IEEE_8023AD\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Get global networking configuration for the whole cluster. This API is
      deprecated in favor of /v2/network/interfaces/ and /v2/network/interfaces/1/networks/.
  patch:
    parameters: []
    request_body:
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"api_cluster_network_config_v1\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"assigned_by\": {\n      \"type\"\
        : \"string\",\n      \"enum\": [\n        \"DHCP\",\n        \"STATIC\",\n\
        \        \"LINK_LOCAL\"\n      ],\n      \"description\": \"How to assign\
        \ IP address, either DHCP or STATIC:\\n * `DHCP` - NETWORK_ASSIGNED_BY_DHCP,\\\
        n * `LINK_LOCAL` - NETWORK_ASSIGNED_BY_LINK_LOCAL,\\n * `STATIC` - NETWORK_ASSIGNED_BY_STATIC\"\
        \n    },\n    \"ip_ranges\": {\n      \"type\": \"array\",\n      \"items\"\
        : {\n        \"description\": \"(STATIC only) Comma-separated list of IP ranges\"\
        ,\n        \"type\": \"string\"\n      }\n    },\n    \"floating_ip_ranges\"\
        : {\n      \"type\": \"array\",\n      \"items\": {\n        \"description\"\
        : \"(STATIC only) Comma-separated list of floating IP ranges\",\n        \"\
        type\": \"string\"\n      }\n    },\n    \"netmask\": {\n      \"description\"\
        : \"(STATIC only) The IPv4 or IPv6 netmask in 0.0.0.0 or :: format, or the\
        \ IPv4 or IPv6 subnet CIDR\",\n      \"type\": \"string\"\n    },\n    \"\
        gateway\": {\n      \"description\": \"(STATIC only) The IPv4 gateway in 0.0.0.0\
        \ format\",\n      \"type\": \"string\"\n    },\n    \"gateway_ipv6\": {\n\
        \      \"description\": \"(STATIC only) The IPv6 gateway in :: format\",\n\
        \      \"type\": \"string\"\n    },\n    \"dns_servers\": {\n      \"type\"\
        : \"array\",\n      \"items\": {\n        \"description\": \"(STATIC only)\
        \ The list of DNS servers\",\n        \"type\": \"string\"\n      }\n    },\n\
        \    \"dns_search_domains\": {\n      \"type\": \"array\",\n      \"items\"\
        : {\n        \"description\": \"(STATIC only) The list of DNS search domains\"\
        ,\n        \"type\": \"string\"\n      }\n    },\n    \"mtu\": {\n      \"\
        description\": \"(STATIC only) The maximum transfer unit (MTU) in bytes\"\
        ,\n      \"type\": \"number\"\n    },\n    \"bonding_mode\": {\n      \"type\"\
        : \"string\",\n      \"enum\": [\n        \"ACTIVE_BACKUP\",\n        \"IEEE_8023AD\"\
        \n      ],\n      \"description\": \"Ethernet bonding mode (ACTIVE_BACKUP\
        \ or IEEE_8023AD), if the interface is bonded.:\\n * `ACTIVE_BACKUP` - BONDING_MODE_ACTIVE_BACKUP,\\\
        n * `IEEE_8023AD` - BONDING_MODE_IEEE_8023AD\"\n    }\n  }\n}"
    response_body: {}
    responses:
    - code: '202'
      description: Return value on success
    summary: Update networking configuration for the whole cluster. This API is deprecated
      in favor of /v2/network/interfaces/ and /v2/network/interfaces/1/networks/.
  put:
    parameters:
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"api_cluster_network_config_v1\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"assigned_by\": {\n      \"type\"\
        : \"string\",\n      \"enum\": [\n        \"DHCP\",\n        \"STATIC\",\n\
        \        \"LINK_LOCAL\"\n      ],\n      \"description\": \"How to assign\
        \ IP address, either DHCP or STATIC:\\n * `DHCP` - NETWORK_ASSIGNED_BY_DHCP,\\\
        n * `LINK_LOCAL` - NETWORK_ASSIGNED_BY_LINK_LOCAL,\\n * `STATIC` - NETWORK_ASSIGNED_BY_STATIC\"\
        \n    },\n    \"ip_ranges\": {\n      \"type\": \"array\",\n      \"items\"\
        : {\n        \"description\": \"(STATIC only) Comma-separated list of IP ranges\"\
        ,\n        \"type\": \"string\"\n      }\n    },\n    \"floating_ip_ranges\"\
        : {\n      \"type\": \"array\",\n      \"items\": {\n        \"description\"\
        : \"(STATIC only) Comma-separated list of floating IP ranges\",\n        \"\
        type\": \"string\"\n      }\n    },\n    \"netmask\": {\n      \"description\"\
        : \"(STATIC only) The IPv4 or IPv6 netmask in 0.0.0.0 or :: format, or the\
        \ IPv4 or IPv6 subnet CIDR\",\n      \"type\": \"string\"\n    },\n    \"\
        gateway\": {\n      \"description\": \"(STATIC only) The IPv4 gateway in 0.0.0.0\
        \ format\",\n      \"type\": \"string\"\n    },\n    \"gateway_ipv6\": {\n\
        \      \"description\": \"(STATIC only) The IPv6 gateway in :: format\",\n\
        \      \"type\": \"string\"\n    },\n    \"dns_servers\": {\n      \"type\"\
        : \"array\",\n      \"items\": {\n        \"description\": \"(STATIC only)\
        \ The list of DNS servers\",\n        \"type\": \"string\"\n      }\n    },\n\
        \    \"dns_search_domains\": {\n      \"type\": \"array\",\n      \"items\"\
        : {\n        \"description\": \"(STATIC only) The list of DNS search domains\"\
        ,\n        \"type\": \"string\"\n      }\n    },\n    \"mtu\": {\n      \"\
        description\": \"(STATIC only) The maximum transfer unit (MTU) in bytes\"\
        ,\n      \"type\": \"number\"\n    },\n    \"bonding_mode\": {\n      \"type\"\
        : \"string\",\n      \"enum\": [\n        \"ACTIVE_BACKUP\",\n        \"IEEE_8023AD\"\
        \n      ],\n      \"description\": \"Ethernet bonding mode (ACTIVE_BACKUP\
        \ or IEEE_8023AD), if the interface is bonded.:\\n * `ACTIVE_BACKUP` - BONDING_MODE_ACTIVE_BACKUP,\\\
        n * `IEEE_8023AD` - BONDING_MODE_IEEE_8023AD\"\n    }\n  }\n}"
    response_body: {}
    responses:
    - code: '202'
      description: Return value on success
    summary: Change networking configuration for the whole cluster. This API is deprecated
      in favor of /v2/network/interfaces/ and /v2/network/interfaces/1/networks/.
rest_endpoint: /v1/network/settings
permalink: /rest-api-guide/network/settings.html
sidebar: rest_api_guide_sidebar
---
