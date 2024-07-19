---
category: /cluster
methods:
  get:
    parameters: []
    response_body:
      schema: "{\n  \"type\": \"array\",\n  \"items\": {\n    \"description\": \"\
        api_node\",\n    \"type\": \"object\",\n    \"properties\": {\n      \"id\"\
        : {\n        \"description\": \"id\",\n        \"type\": \"number\"\n    \
        \  },\n      \"node_status\": {\n        \"description\": \"Status of the\
        \ node\",\n        \"type\": \"string\"\n      },\n      \"node_name\": {\n\
        \        \"description\": \"User friendly node name\",\n        \"type\":\
        \ \"string\"\n      },\n      \"uuid\": {\n        \"description\": \"Unique\
        \ node identifier\",\n        \"type\": \"string\"\n      },\n      \"label\"\
        : {\n        \"description\": \"Physically identifiable label assigned to\
        \ the hardware\",\n        \"type\": \"string\"\n      },\n      \"model_number\"\
        : {\n        \"description\": \"Node model number\",\n        \"type\": \"\
        string\"\n      },\n      \"serial_number\": {\n        \"description\": \"\
        Serial number\",\n        \"type\": \"string\"\n      },\n      \"mac_address\"\
        : {\n        \"description\": \"MAC address for the first network interface\
        \ on this node\",\n        \"type\": \"string\"\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: List nodes.
  post:
    parameters: []
    request_body:
      schema: "{\n  \"description\": \"api_cluster_nodes_modify_request_v1\",\n  \"\
        type\": \"object\",\n  \"properties\": {\n    \"node_uuids\": {\n      \"\
        type\": \"array\",\n      \"items\": {\n        \"description\": \"Identifiers\
        \ of nodes to add to existing cluster\",\n        \"type\": \"string\"\n \
        \     }\n    },\n    \"node_ips\": {\n      \"type\": \"array\",\n      \"\
        items\": {\n        \"description\": \"IP addresses of nodes to add to existing\
        \ cluster\",\n        \"type\": \"string\"\n      }\n    },\n    \"optimize_node_fault_tolerance_over_usable_capacity\"\
        : {\n      \"description\": \"True to trade-off some increase in usable capacity\
        \ for increased node fault tolerance. Defaults to False.\",\n      \"type\"\
        : \"boolean\"\n    }\n  }\n}"
    response_body: {}
    responses:
    - code: '202'
      description: Return value on success
    summary: Add one or more unconfigured nodes with the given node uuids and admin
      password. This endpoint is deprecated in favor of /v2/cluster/nodes.
rest_endpoint: /v1/cluster/nodes/
api_version: v1
permalink: /rest-api-guide/cluster/nodes.html
sidebar: rest_api_guide_sidebar
---
