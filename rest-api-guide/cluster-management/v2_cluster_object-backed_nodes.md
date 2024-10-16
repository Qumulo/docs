---
category: /Cluster Management
methods:
  get:
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"api_cluster_object_backed_nodes_get_response\"\
        ,\n  \"type\": \"object\",\n  \"properties\": {\n    \"membership\": {\n \
        \     \"description\": \"The list of nodes that are currently in the cluster\
        \ (ordered by node id).\",\n      \"type\": \"object\",\n      \"properties\"\
        : {\n        \"node_ips_and_fault_domains\": {\n          \"type\": \"array\"\
        ,\n          \"items\": {\n            \"description\": \"The IP addresses\
        \ and fault domains of the nodes in the cluster.\",\n            \"type\"\
        : \"object\",\n            \"properties\": {\n              \"node_ip\": {\n\
        \                \"description\": \"node_ip\",\n                \"type\":\
        \ \"string\"\n              },\n              \"fault_domain_id\": {\n   \
        \             \"description\": \"fault_domain_id\",\n                \"type\"\
        : \"number\"\n              }\n            }\n          }\n        }\n   \
        \   }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: List all object backed nodes in the cluster.
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
    response_body: {}
    responses:
    - code: '202'
      description: Return value on success
    summary: Modify the composition of the object backed cluster by adding unconfigured
      nodes or replacing configured nodes. Allows for the specification of fault domains
      on added or replaced nodes.
rest_endpoint: /v2/cluster/object-backed/nodes
api_version: v2
permalink: /rest-api-guide/cluster-management/v2_cluster_object-backed_nodes.html
sidebar: rest_api_guide_sidebar
---
