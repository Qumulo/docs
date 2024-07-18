---
category: /cluster
methods:
  get:
    parameters: []
    response_body:
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"api_node_replacement_plan\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"nodes_to_be_replaced\": {\n      \"\
        type\": \"array\",\n      \"items\": {\n        \"description\": \"Nodes selected\
        \ for replacement.\",\n        \"type\": \"number\"\n      }\n    },\n   \
        \ \"nodes_currently_being_replaced\": {\n      \"type\": \"array\",\n    \
        \  \"items\": {\n        \"description\": \"Nodes currently in process of\
        \ being replaced.\",\n        \"type\": \"number\"\n      }\n    },\n    \"\
        target_stripe_config\": {\n      \"description\": \"The target EC stripe config.\
        \ If this value is empty, it indicates that the cluster's stripe config will\
        \ remain unchanged throughout the node replacement.\",\n      \"type\": \"\
        object\",\n      \"properties\": {\n        \"blocks_per_stripe\": {\n   \
        \       \"description\": \"Number of blocks per EC stripe including parity.\"\
        ,\n          \"type\": \"number\"\n        },\n        \"data_blocks_per_stripe\"\
        : {\n          \"description\": \"The number of data blocks per stripe.\"\
        ,\n          \"type\": \"number\"\n        }\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Get the current node replacement plan. This plan lists the nodes pending
      replacement and nodes currently in process of being replaced.
  post:
    parameters: []
    request_body:
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"api_cluster_node_replacement_request\",\n \
        \ \"type\": \"object\",\n  \"properties\": {\n    \"nodes_to_be_replaced\"\
        : {\n      \"type\": \"array\",\n      \"items\": {\n        \"description\"\
        : \"Nodes selected for replacement.\",\n        \"type\": \"number\"\n   \
        \   }\n    },\n    \"target_stripe_config\": {\n      \"description\": \"\
        The optional target EC stripe config.\",\n      \"type\": \"object\",\n  \
        \    \"properties\": {\n        \"blocks_per_stripe\": {\n          \"description\"\
        : \"Number of blocks per EC stripe including parity.\",\n          \"type\"\
        : \"number\"\n        },\n        \"data_blocks_per_stripe\": {\n        \
        \  \"description\": \"The number of data blocks per stripe.\",\n         \
        \ \"type\": \"number\"\n        }\n      }\n    }\n  }\n}"
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    summary: To initiate node replacement, specify the nodes to replace.
rest_endpoint: /v1/cluster/node-replacement-plan/
permalink: /rest-api-guide/cluster/node-replacement-plan.html
sidebar: rest_api_guide_sidebar
---
