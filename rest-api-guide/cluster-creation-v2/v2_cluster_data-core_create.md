---
category: /Cluster Creation V2
methods:
  post:
    summary: Create a stratus data core cluster with the given set of node UUIDs and
      admin password.
    parameters: []
    response_body: {}
    responses:
    - code: '202'
      description: Return value on success
    preview: false
    request_body:
      schema: "{\n  \"description\": \"api_cluster_creation_data_core_request_v2\"\
        ,\n  \"type\": \"object\",\n  \"properties\": {\n    \"eula_accepted\": {\n\
        \      \"description\": \"The user accepts the End User License Agreement\"\
        ,\n      \"type\": \"boolean\"\n    },\n    \"cluster_name\": {\n      \"\
        description\": \"Name of the cluster\",\n      \"type\": \"string\"\n    },\n\
        \    \"node_uuids\": {\n      \"type\": \"array\",\n      \"items\": {\n \
        \       \"description\": \"List of node uuids to form a cluster with\",\n\
        \        \"type\": \"string\"\n      }\n    },\n    \"admin_password\": {\n\
        \      \"description\": \"The administrator password\",\n      \"type\": \"\
        string\",\n      \"format\": \"password\"\n    },\n    \"blocks_per_stripe\"\
        : {\n      \"description\": \"Number of blocks per stripe in the cluster's\
        \ erasure coding configuration\",\n      \"type\": \"number\"\n    },\n  \
        \  \"max_drive_failures\": {\n      \"description\": \"The maximum number\
        \ of drive failures this cluster will be able to sustain\",\n      \"type\"\
        : \"number\"\n    },\n    \"max_node_failures\": {\n      \"description\"\
        : \"The maximum number of node failures this cluster will be able to sustain\"\
        ,\n      \"type\": \"number\"\n    }\n  }\n}"
rest_endpoint: /v2/cluster/data-core/create
api_version: v2
permalink: /rest-api-guide/cluster-creation-v2/v2_cluster_data-core_create.html
sidebar: rest_api_guide_sidebar
---
