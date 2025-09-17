---
category: /Cloud Data Fabric
methods:
  get:
    summary: '[preview] List the relationship status and configuration for all hub
      portals on the current cluster.'
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"v2_portal_hubs\",\n  \"type\": \"object\",\n\
        \  \"properties\": {\n    \"entries\": {\n      \"type\": \"array\",\n   \
        \   \"items\": {\n        \"description\": \"List of hub portals\",\n    \
        \    \"type\": \"object\",\n        \"properties\": {\n          \"id\": {\n\
        \            \"description\": \"Hub portal ID\",\n            \"type\": \"\
        number\"\n          },\n          \"type\": {\n            \"type\": \"string\"\
        ,\n            \"enum\": [\n              \"PORTAL_READ_ONLY\",\n        \
        \      \"PORTAL_READ_WRITE\"\n            ],\n            \"description\"\
        : \"Type of the portal (read-only or read-write):\\n * `PORTAL_READ_ONLY`\
        \ - PORTAL_READ_ONLY,\\n * `PORTAL_READ_WRITE` - PORTAL_READ_WRITE\"\n   \
        \       },\n          \"state\": {\n            \"type\": \"string\",\n  \
        \          \"enum\": [\n              \"PENDING\",\n              \"ACCEPTED\"\
        ,\n              \"DELETING\"\n            ],\n            \"description\"\
        : \"State of the portal:\\n * `ACCEPTED` - API_PORTAL_ACCEPTED,\\n * `DELETING`\
        \ - API_PORTAL_DELETING,\\n * `PENDING` - API_PORTAL_PENDING\"\n         \
        \ },\n          \"status\": {\n            \"type\": \"string\",\n       \
        \     \"enum\": [\n              \"INACTIVE\",\n              \"ACTIVE\",\n\
        \              \"DEGRADED\"\n            ],\n            \"description\":\
        \ \"Status of the portal:\\n * `ACTIVE` - PORTAL_ACTIVE,\\n * `DEGRADED` -\
        \ PORTAL_DEGRADED,\\n * `INACTIVE` - PORTAL_INACTIVE\"\n          },\n   \
        \       \"spoke_host\": {\n            \"description\": \"IP address of a\
        \ node in the remote cluster\",\n            \"type\": \"object\",\n     \
        \       \"properties\": {\n              \"address\": {\n                \"\
        description\": \"address\",\n                \"type\": \"string\"\n      \
        \        },\n              \"port\": {\n                \"description\": \"\
        port\",\n                \"type\": \"number\"\n              }\n         \
        \   }\n          },\n          \"spoke_cluster_uuid\": {\n            \"description\"\
        : \"UUID of the cluster with the spoke portal\",\n            \"type\": \"\
        string\"\n          },\n          \"spoke_cluster_name\": {\n            \"\
        description\": \"Name of the cluster with the spoke portal\",\n          \
        \  \"type\": \"string\"\n          },\n          \"pending_roots\": {\n  \
        \          \"type\": \"array\",\n            \"items\": {\n              \"\
        description\": \"Set of hub root directories that are pending authorization\"\
        ,\n              \"type\": \"string\"\n            }\n          },\n     \
        \     \"authorized_roots\": {\n            \"type\": \"array\",\n        \
        \    \"items\": {\n              \"description\": \"Set of hub root directories\
        \ that are authorized for access\",\n              \"type\": \"string\"\n\
        \            }\n          }\n        }\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: true
rest_endpoint: /v2/portal/hubs/
api_version: v2
permalink: /rest-api-guide/cloud-data-fabric/v2_portal_hubs.html
sidebar: rest_api_guide_sidebar
---
