---
category: /cluster
methods:
  get:
    parameters: []
    response_body:
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"api_protection_status\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"blocks_per_stripe\": {\n      \"description\"\
        : \"The total number of blocks per stripe, including parity.\",\n      \"\
        type\": \"number\"\n    },\n    \"data_blocks_per_stripe\": {\n      \"description\"\
        : \"The number of data blocks per stripe.\",\n      \"type\": \"number\"\n\
        \    },\n    \"protection_system_type\": {\n      \"description\": \"The data\
        \ protection type for this cluster.\",\n      \"type\": \"string\"\n    },\n\
        \    \"max_node_failures\": {\n      \"description\": \"The maximum number\
        \ of node failures this cluster can sustain and remain operational.\",\n \
        \     \"type\": \"number\"\n    },\n    \"max_drive_failures\": {\n      \"\
        description\": \"The maximum number of drive failures this cluster can sustain\
        \ and remain operational.\",\n      \"type\": \"number\"\n    },\n    \"max_drive_spares\"\
        : {\n      \"description\": \"DEPRECATED: The approximate number of drives\
        \ of sparing space that this cluster has reserved for reprotect.\",\n    \
        \  \"type\": \"number\"\n    },\n    \"remaining_node_failures\": {\n    \
        \  \"description\": \"The number of node failures this cluster can currently\
        \ sustain and remain operational.\",\n      \"type\": \"number\"\n    },\n\
        \    \"remaining_drive_failures\": {\n      \"description\": \"The number\
        \ of drive failures this cluster can currently sustain and remain operational.\"\
        ,\n      \"type\": \"number\"\n    },\n    \"pending_configuration\": {\n\
        \      \"description\": \"The configuration to which this cluster is being\
        \ changed.\",\n      \"type\": \"object\",\n      \"properties\": {\n    \
        \    \"blocks_per_stripe\": {\n          \"description\": \"Number of blocks\
        \ per stripe for this stripe config\",\n          \"type\": \"number\"\n \
        \       },\n        \"max_drive_failures\": {\n          \"description\":\
        \ \"Number of simultaneous drive failures supported for this stripe config\"\
        ,\n          \"type\": \"number\"\n        },\n        \"max_node_failures\"\
        : {\n          \"description\": \"Number of simultaneous node failures supported\
        \ for this stripe config\",\n          \"type\": \"number\"\n        }\n \
        \     }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Gets detailed status information for the data protection of the cluster.
rest_endpoint: /v1/cluster/protection/status
permalink: /rest-api-guide/cluster/protection_status.html
sidebar: rest_api_guide_sidebar
---
