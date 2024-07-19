---
category: /cluster
methods:
  post:
    parameters: []
    request_body:
      schema: "{\n  \"description\": \"api_cluster_nodes_modify_request_v2\",\n  \"\
        type\": \"object\",\n  \"properties\": {\n    \"node_uuids\": {\n      \"\
        type\": \"array\",\n      \"items\": {\n        \"description\": \"The UUIDs\
        \ of the unconfigured nodes to add to the cluster\",\n        \"type\": \"\
        string\"\n      }\n    },\n    \"node_ips\": {\n      \"type\": \"array\"\
        ,\n      \"items\": {\n        \"description\": \"The IP addresses of the\
        \ unconfigured nodes to add to the cluster\",\n        \"type\": \"string\"\
        \n      }\n    },\n    \"nodes_to_replace\": {\n      \"type\": \"array\"\
        ,\n      \"items\": {\n        \"description\": \"The configured nodes to\
        \ replace. Note: These nodes must be a subset of the node replacement plan.\"\
        ,\n        \"type\": \"number\"\n      }\n    },\n    \"target_max_node_failures\"\
        : {\n      \"description\": \"The minimum node-fault-tolerance level for the\
        \ resulting cluster configuration. Note: In certain cases, a lower node-fault-tolerance\
        \ level can result in higher usable capacity.\",\n      \"type\": \"number\"\
        \n    },\n    \"target_stripe_config\": {\n      \"description\": \"The final\
        \ stripe configuration to use.\",\n      \"type\": \"object\",\n      \"properties\"\
        : {\n        \"blocks_per_stripe\": {\n          \"description\": \"Number\
        \ of blocks per EC stripe including parity.\",\n          \"type\": \"number\"\
        \n        },\n        \"data_blocks_per_stripe\": {\n          \"description\"\
        : \"The number of data blocks per stripe.\",\n          \"type\": \"number\"\
        \n        }\n      }\n    }\n  }\n}"
    response_body: {}
    responses:
    - code: '202'
      description: Return value on success
    summary: Modify the composition of the cluster by adding unconfigured nodes or
      replacing configured nodes.
rest_endpoint: /v2/cluster/nodes/
permalink: /rest-api-guide/cluster/v2_nodes.html
sidebar: rest_api_guide_sidebar
---
