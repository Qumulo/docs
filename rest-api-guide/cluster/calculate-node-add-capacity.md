---
category: /cluster
methods:
  post:
    parameters: []
    request_body:
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"api_cluster_calculate_node_add_capacity_request\"\
        ,\n  \"type\": \"object\",\n  \"properties\": {\n    \"node_uuids\": {\n \
        \     \"type\": \"array\",\n      \"items\": {\n        \"description\": \"\
        Identifiers of nodes to add to existing cluster\",\n        \"type\": \"string\"\
        \n      }\n    },\n    \"node_ips\": {\n      \"type\": \"array\",\n     \
        \ \"items\": {\n        \"description\": \"IP addresses of nodes to add to\
        \ existing cluster\",\n        \"type\": \"string\"\n      }\n    }\n  }\n\
        }"
    response_body:
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"api_cluster_calculate_node_add_capacity_response\"\
        ,\n  \"type\": \"object\",\n  \"properties\": {\n    \"new_usable_capacity_in_bytes\"\
        : {\n      \"description\": \"The cluster's usable capacity (in bytes) after\
        \ node-add operations\",\n      \"type\": \"string\"\n    },\n    \"increase_from_current_usable_capacity_in_bytes\"\
        : {\n      \"description\": \"The increase of the cluster's usable capacity\
        \ (in bytes) after node-add operations\",\n      \"type\": \"string\"\n  \
        \  },\n    \"max_node_failures\": {\n      \"description\": \"The maximum\
        \ number of tolerable cluster node failures after node-add operations\",\n\
        \      \"type\": \"number\"\n    },\n    \"node_add_capacity_optimized_for_fault_tolerance\"\
        : {\n      \"description\": \"This field is only populated if it is possible\
        \ to optimize the cluster for increased node fault tolerance instead of usable\
        \ capacity during node-add operations. When populated, it shows the usable\
        \ cluster capacity and node fault tolerance for the optimized cluster.\",\n\
        \      \"type\": \"object\",\n      \"properties\": {\n        \"new_usable_capacity_in_bytes\"\
        : {\n          \"description\": \"The cluster's usable capacity (in bytes)\
        \ after node-add operations and optimization for increased node fault tolerance\"\
        ,\n          \"type\": \"string\"\n        },\n        \"increase_from_current_usable_capacity_in_bytes\"\
        : {\n          \"description\": \"The increase of the cluster's usable capacity\
        \ (in bytes) after node-add operations and optimization for increased node\
        \ fault tolerance\",\n          \"type\": \"string\"\n        },\n       \
        \ \"max_node_failures\": {\n          \"description\": \"The maximum number\
        \ of tolerable cluster node failures after node-add operations and optimization\
        \ for increased node fault tolerance\",\n          \"type\": \"number\"\n\
        \        }\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Calculate changes to cluster usable capacity from a proposed node-add
      operation. This endpoint is deprecated in favor of /v2/cluster/nodes/dry-run.
rest_endpoint: /v1/cluster/calculate-node-add-capacity
permalink: /rest-api-guide/cluster/calculate-node-add-capacity.html
sidebar: rest_api_guide_sidebar
---
