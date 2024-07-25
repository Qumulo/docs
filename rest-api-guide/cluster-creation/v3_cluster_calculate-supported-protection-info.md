---
category: /Cluster Creation
methods:
  post:
    parameters: []
    request_body:
      schema: "{\n  \"description\": \"api_supported_protection_info_request_v2\"\
        ,\n  \"type\": \"object\",\n  \"properties\": {\n    \"node_uuids\": {\n \
        \     \"type\": \"array\",\n      \"items\": {\n        \"description\": \"\
        List of unconfigured node UUIDs to query supported protection levels and capacities\"\
        ,\n        \"type\": \"string\"\n      }\n    },\n    \"node_ips\": {\n  \
        \    \"type\": \"array\",\n      \"items\": {\n        \"description\": \"\
        List of unconfigured node IPs to query supported protection levels and capacities\"\
        ,\n        \"type\": \"string\"\n      }\n    }\n  }\n}"
    response_body:
      schema: "{\n  \"description\": \"api_supported_protection_configs\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"supported_configs\": {\n      \"\
        type\": \"array\",\n      \"items\": {\n        \"description\": \"Vector\
        \ of supported protection configurations\",\n        \"type\": \"object\"\
        ,\n        \"properties\": {\n          \"blocks_per_stripe\": {\n       \
        \     \"description\": \"Number of blocks per stripe for this stripe config\"\
        ,\n            \"type\": \"number\"\n          },\n          \"max_drive_failures\"\
        : {\n            \"description\": \"Number of simultaneous drive failures\
        \ supported for this stripe config\",\n            \"type\": \"number\"\n\
        \          },\n          \"max_node_failures\": {\n            \"description\"\
        : \"Number of simultaneous node failures supported for this stripe config\"\
        ,\n            \"type\": \"number\"\n          },\n          \"max_cluster_node_count\"\
        : {\n            \"description\": \"The max amount of nodes supported to guarantee\
        \ data safety with this stripe config\",\n            \"type\": \"number\"\
        \n          },\n          \"usable_capacity_in_bytes\": {\n            \"\
        description\": \"The usable capacity in bytes if the node/SKU configuration\
        \ uses this stripe config\",\n            \"type\": \"string\"\n         \
        \ }\n        }\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Returns list of supported data protection stripe configuration(s). This
      includes the stripe width and usable capacity using that width. For use with
      unconfigured nodes only.
rest_endpoint: /v3/cluster/calculate-supported-protection-info
api_version: v3
permalink: /rest-api-guide/cluster-creation/v3_cluster_calculate-supported-protection-info.html
sidebar: rest_api_guide_sidebar
---
