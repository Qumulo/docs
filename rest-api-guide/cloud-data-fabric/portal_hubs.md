---
category: /Cloud Data Fabric
methods:
  get:
    parameters: []
    preview: false
    response_body:
      schema: "{\n  \"description\": \"api_portal_hub_relationships\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"entries\": {\n      \"type\": \"\
        array\",\n      \"items\": {\n        \"description\": \"List of hub portals\"\
        ,\n        \"type\": \"object\",\n        \"properties\": {\n          \"\
        id\": {\n            \"description\": \"Hub portal ID\",\n            \"type\"\
        : \"number\"\n          },\n          \"spoke_type\": {\n            \"type\"\
        : \"string\",\n            \"enum\": [\n              \"SPOKE_READ_ONLY\"\
        ,\n              \"SPOKE_READ_WRITE\"\n            ],\n            \"description\"\
        : \"Type of the spoke portal:\\n * `SPOKE_READ_ONLY` - SPOKE_READ_ONLY,\\\
        n * `SPOKE_READ_WRITE` - SPOKE_READ_WRITE\"\n          },\n          \"state\"\
        : {\n            \"type\": \"string\",\n            \"enum\": [\n        \
        \      \"UNLINKED\",\n              \"PENDING\",\n              \"AUTHORIZED\"\
        ,\n              \"DELETING\"\n            ],\n            \"description\"\
        : \"State of the portal:\\n * `AUTHORIZED` - PORTAL_AUTHORIZED,\\n * `DELETING`\
        \ - PORTAL_DELETING,\\n * `PENDING` - PORTAL_PENDING,\\n * `UNLINKED` - PORTAL_UNLINKED\"\
        \n          },\n          \"status\": {\n            \"type\": \"string\"\
        ,\n            \"enum\": [\n              \"INACTIVE\",\n              \"\
        ACTIVE\",\n              \"DEGRADED\"\n            ],\n            \"description\"\
        : \"Status of the portal:\\n * `ACTIVE` - PORTAL_ACTIVE,\\n * `DEGRADED` -\
        \ PORTAL_DEGRADED,\\n * `INACTIVE` - PORTAL_INACTIVE\"\n          },\n   \
        \       \"root\": {\n            \"description\": \"Local hub portal root\
        \ directory file ID\",\n            \"type\": \"string\"\n          },\n \
        \         \"root_path\": {\n            \"description\": \"Local hub portal\
        \ root directory path\",\n            \"type\": \"string\"\n          },\n\
        \          \"spoke_cluster_uuid\": {\n            \"description\": \"UUID\
        \ of the cluster with the spoke portal\",\n            \"type\": \"string\"\
        \n          },\n          \"spoke_cluster_name\": {\n            \"description\"\
        : \"Name of the cluster with the spoke portal\",\n            \"type\": \"\
        string\"\n          },\n          \"spoke_address\": {\n            \"description\"\
        : \"IP address of a node in the cluster with the spoke portal (if in a relationship)\"\
        ,\n            \"type\": \"string\"\n          },\n          \"spoke_port\"\
        : {\n            \"description\": \"TCP port for the cluster with the spoke\
        \ portal (if in a relationship)\",\n            \"type\": \"number\"\n   \
        \       }\n        }\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: List the relationship status and configuration for all hub portals on
      the current cluster.
rest_endpoint: /v1/portal/hubs/
api_version: v1
permalink: /rest-api-guide/cloud-data-fabric/portal_hubs.html
sidebar: rest_api_guide_sidebar
redirect_from:
  - /rest-api-guide/global-namespace/portal_hubs.html
---
