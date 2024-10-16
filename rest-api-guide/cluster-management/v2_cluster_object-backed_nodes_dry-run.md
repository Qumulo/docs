---
category: /Cluster Management
methods:
  post:
    parameters: []
    request_body:
      schema: "{\n  \"description\": \"api_cluster_object_backed_nodes_modify_request_v2\"\
        ,\n  \"type\": \"object\",\n  \"properties\": {\n    \"target_membership\"\
        : {\n      \"description\": \"The nodes that should be in the cluster after\
        \ the modification. The nodes that must be added or removed are implicitly\
        \ derived from the target membership and the current membership of the cluster.\"\
        ,\n      \"type\": \"object\",\n      \"properties\": {\n        \"node_ips_and_fault_domains\"\
        : {\n          \"type\": \"array\",\n          \"items\": {\n            \"\
        description\": \"The IP addresses and fault domains of the nodes in the cluster.\"\
        ,\n            \"type\": \"object\",\n            \"properties\": {\n    \
        \          \"node_ip\": {\n                \"description\": \"node_ip\",\n\
        \                \"type\": \"string\"\n              },\n              \"\
        fault_domain_id\": {\n                \"description\": \"fault_domain_id\"\
        ,\n                \"type\": \"number\"\n              }\n            }\n\
        \          }\n        }\n      }\n    }\n  }\n}"
    response_body:
      schema: "{\n  \"description\": \"api_cluster_object_backed_modify_dry_run_response\"\
        ,\n  \"type\": \"object\",\n  \"properties\": {\n    \"target_membership\"\
        : {\n      \"type\": \"array\",\n      \"items\": {\n        \"description\"\
        : \"The IP addresses and fault domains of the nodes that should be in the\
        \ cluster after the modification.\",\n        \"type\": \"object\",\n    \
        \    \"properties\": {\n          \"node_ip\": {\n            \"description\"\
        : \"node_ip\",\n            \"type\": \"string\"\n          },\n         \
        \ \"fault_domain_id\": {\n            \"description\": \"fault_domain_id\"\
        ,\n            \"type\": \"number\"\n          }\n        }\n      }\n   \
        \ },\n    \"current_membership\": {\n      \"type\": \"array\",\n      \"\
        items\": {\n        \"description\": \"The nodes that are currently in the\
        \ cluster.\",\n        \"type\": \"object\",\n        \"properties\": {\n\
        \          \"node_id\": {\n            \"description\": \"node_id\",\n   \
        \         \"type\": \"number\"\n          },\n          \"node_ip\": {\n \
        \           \"description\": \"node_ip\",\n            \"type\": \"string\"\
        \n          },\n          \"fault_domain_id\": {\n            \"description\"\
        : \"fault_domain_id\",\n            \"type\": \"number\"\n          }\n  \
        \      }\n      }\n    },\n    \"nodes_being_added\": {\n      \"type\": \"\
        array\",\n      \"items\": {\n        \"description\": \"The IP addresses\
        \ of the nodes that are being added to the cluster during the modification.\"\
        ,\n        \"type\": \"object\",\n        \"properties\": {\n          \"\
        node_ip\": {\n            \"description\": \"node_ip\",\n            \"type\"\
        : \"string\"\n          },\n          \"fault_domain_id\": {\n           \
        \ \"description\": \"fault_domain_id\",\n            \"type\": \"number\"\n\
        \          }\n        }\n      }\n    },\n    \"nodes_being_removed\": {\n\
        \      \"type\": \"array\",\n      \"items\": {\n        \"description\":\
        \ \"The nodes that are being removed from the cluster during the modification.\"\
        ,\n        \"type\": \"object\",\n        \"properties\": {\n          \"\
        node_id\": {\n            \"description\": \"node_id\",\n            \"type\"\
        : \"number\"\n          },\n          \"node_ip\": {\n            \"description\"\
        : \"node_ip\",\n            \"type\": \"string\"\n          },\n         \
        \ \"fault_domain_id\": {\n            \"description\": \"fault_domain_id\"\
        ,\n            \"type\": \"number\"\n          }\n        }\n      }\n   \
        \ }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Validate a node-add, node-remove, or node replacement operation and,
      if it succeeds, return the projected fault domain counts.
rest_endpoint: /v2/cluster/object-backed/nodes/dry-run
api_version: v2
permalink: /rest-api-guide/cluster-management/v2_cluster_object-backed_nodes_dry-run.html
sidebar: rest_api_guide_sidebar
---
