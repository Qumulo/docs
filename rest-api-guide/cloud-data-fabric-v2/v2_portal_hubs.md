---
category: /Cloud Data Fabric V2
methods:
  get:
    summary: List the relationship status and configuration for all hub portals on
      the current cluster.
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"v2_portal_hubs\",\n  \"type\": \"object\",\n\
        \  \"properties\": {\n    \"entries\": {\n      \"type\": \"array\",\n   \
        \   \"items\": {\n        \"description\": \"List of hub portals\",\n    \
        \    \"type\": \"object\",\n        \"properties\": {\n          \"id\": {\n\
        \            \"description\": \"Hub portal ID\",\n            \"type\": \"\
        number\"\n          },\n          \"type\": {\n            \"type\": \"string\"\
        ,\n            \"enum\": [\n              \"PORTAL_READ_ONLY\",\n        \
        \      \"PORTAL_READ_WRITE\",\n              \"PORTAL_PAUSED\",\n        \
        \      \"PORTAL_SUSPENDED\"\n            ],\n            \"description\":\
        \ \"Type of the portal (read-only or read-write):\\n * `PORTAL_PAUSED` - PORTAL_PAUSED,\\\
        n * `PORTAL_READ_ONLY` - PORTAL_READ_ONLY,\\n * `PORTAL_READ_WRITE` - PORTAL_READ_WRITE,\\\
        n * `PORTAL_SUSPENDED` - PORTAL_SUSPENDED\"\n          },\n          \"state\"\
        : {\n            \"type\": \"string\",\n            \"enum\": [\n        \
        \      \"PENDING\",\n              \"ACCEPTED\",\n              \"QUIESCING\"\
        ,\n              \"PAUSING\",\n              \"DELETING\"\n            ],\n\
        \            \"description\": \"State of the portal:\\n * `ACCEPTED` - A portal\
        \ that is in an active relationship.,\\n * `DELETING` - A portal in the process\
        \ of synchronizing outstanding changes before deletion.,\\n * `PAUSING` -\
        \ A portal closing spoke client state and synchronizing outstanding changes\
        \ before it becomes paused.,\\n * `PENDING` - A portal not yet in an active\
        \ relationship.,\\n * `QUIESCING` - A portal synchronizing outstanding changes\
        \ before it becomes read-only.\"\n          },\n          \"status\": {\n\
        \            \"type\": \"string\",\n            \"enum\": [\n            \
        \  \"INACTIVE\",\n              \"ACTIVE\",\n              \"DEGRADED\",\n\
        \              \"DISCONNECTED\"\n            ],\n            \"description\"\
        : \"Status of the portal:\\n * `ACTIVE` - A fully connected portal ready for\
        \ use.,\\n * `DEGRADED` - A portal whose quorum is missing a cluster other\
        \ than this relationship's peer.,\\n * `DISCONNECTED` - A portal whose quorum\
        \ is missing this relationship's own peer.,\\n * `INACTIVE` - A portal that\
        \ is not ready for use.\"\n          },\n          \"spoke_hosts\": {\n  \
        \          \"type\": \"array\",\n            \"items\": {\n              \"\
        description\": \"IP addresses and TCP ports of nodes in the remote cluster\"\
        ,\n              \"type\": \"object\",\n              \"properties\": {\n\
        \                \"address\": {\n                  \"description\": \"address\"\
        ,\n                  \"type\": \"string\"\n                },\n          \
        \      \"port\": {\n                  \"description\": \"port\",\n       \
        \           \"type\": \"number\"\n                }\n              }\n   \
        \         }\n          },\n          \"spoke_cluster_uuid\": {\n         \
        \   \"description\": \"UUID of the cluster with the spoke portal\",\n    \
        \        \"type\": \"string\"\n          },\n          \"spoke_cluster_name\"\
        : {\n            \"description\": \"Name of the cluster with the spoke portal\"\
        ,\n            \"type\": \"string\"\n          },\n          \"filesystem_uuid\"\
        : {\n            \"description\": \"UUID of the filesystem shared with the\
        \ spoke portal\",\n            \"type\": \"string\"\n          },\n      \
        \    \"pending_roots\": {\n            \"type\": \"array\",\n            \"\
        items\": {\n              \"description\": \"Set of hub root directories that\
        \ are pending authorization\",\n              \"type\": \"string\"\n     \
        \       }\n          },\n          \"authorized_roots\": {\n            \"\
        type\": \"array\",\n            \"items\": {\n              \"description\"\
        : \"Set of hub root directories that are authorized for access\",\n      \
        \        \"type\": \"string\"\n            }\n          }\n        }\n   \
        \   }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
rest_endpoint: /v2/portal/hubs/
api_version: v2
permalink: /rest-api-guide/cloud-data-fabric-v2/v2_portal_hubs.html
sidebar: rest_api_guide_sidebar
redirect_from: /rest-api-guide/cloud-data-fabric/v2_portal_hubs.html
deprecated: false
---
