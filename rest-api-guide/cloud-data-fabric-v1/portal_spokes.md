---
category: /Cloud Data Fabric V1
methods:
  post:
    summary: Create a spoke portal in the UNLINKED state in the current cluster. It
      is now possible to propose a relationship between this spoke portal and a hub
      portal on another cluster.
    parameters: []
    response_body:
      schema: "{\n  \"type\": \"number\"\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
    request_body:
      schema: "{\n  \"description\": \"v1_portal_create_request\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"spoke_root\": {\n      \"description\"\
        : \"Full path to the spoke portal root directory\",\n      \"type\": \"string\"\
        \n    },\n    \"is_writable_spoke\": {\n      \"description\": \"Whether the\
        \ spoke portal is writable. Default to false. In-development feature.\",\n\
        \      \"type\": \"boolean\"\n    }\n  }\n}"
  get:
    summary: List the relationship status and configuration for all spoke portals
      on the current cluster.
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"v1_portal_spokes\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"entries\": {\n      \"type\": \"array\",\n \
        \     \"items\": {\n        \"description\": \"List of spoke portals\",\n\
        \        \"type\": \"object\",\n        \"properties\": {\n          \"id\"\
        : {\n            \"description\": \"Spoke portal ID\",\n            \"type\"\
        : \"number\"\n          },\n          \"spoke_type\": {\n            \"type\"\
        : \"string\",\n            \"enum\": [\n              \"SPOKE_READ_ONLY\"\
        ,\n              \"SPOKE_READ_WRITE\"\n            ],\n            \"description\"\
        : \"Type of the spoke portal:\\n * `SPOKE_READ_ONLY` - SPOKE_READ_ONLY,\\\
        n * `SPOKE_READ_WRITE` - SPOKE_READ_WRITE\"\n          },\n          \"state\"\
        : {\n            \"type\": \"string\",\n            \"enum\": [\n        \
        \      \"UNLINKED\",\n              \"PENDING\",\n              \"AUTHORIZED\"\
        ,\n              \"DELETING\"\n            ],\n            \"description\"\
        : \"State of the portal:\\n * `AUTHORIZED` - An authorized spoke portal or\
        \ hub portal that can be used for file system access.,\\n * `DELETING` - A\
        \ portal in the process of synchronizing outstanding changes before deletion.,\\\
        n * `PENDING` - A spoke portal or hub portal awaiting authorization. Hub portals\
        \ are created in this state.,\\n * `UNLINKED` - A newly created spoke portal\
        \ without a relationship with another cluster.\"\n          },\n         \
        \ \"status\": {\n            \"type\": \"string\",\n            \"enum\":\
        \ [\n              \"INACTIVE\",\n              \"ACTIVE\",\n            \
        \  \"DEGRADED\"\n            ],\n            \"description\": \"Status of\
        \ the portal:\\n * `ACTIVE` - A fully connected portal ready for use.,\\n\
        \ * `DEGRADED` - A portal missing one or more connections with the other cluster\
        \ in the relationship.,\\n * `INACTIVE` - A portal that is not ready for use.\"\
        \n          },\n          \"spoke_root\": {\n            \"description\":\
        \ \"Local spoke portal root directory file ID\",\n            \"type\": \"\
        string\"\n          },\n          \"spoke_root_path\": {\n            \"description\"\
        : \"Local spoke portal root directory path\",\n            \"type\": \"string\"\
        \n          },\n          \"hub_id\": {\n            \"description\": \"Corresponding\
        \ remote hub portal ID (if in a relationship)\",\n            \"type\": \"\
        number\"\n          },\n          \"hub_cluster_uuid\": {\n            \"\
        description\": \"UUID of the cluster with the hub portal (if in a relationship)\"\
        ,\n            \"type\": \"string\"\n          },\n          \"hub_root\"\
        : {\n            \"description\": \"Remote hub portal root directory (if in\
        \ a relationship)\",\n            \"type\": \"string\"\n          },\n   \
        \       \"hub_address\": {\n            \"description\": \"IP address of a\
        \ node in the cluster with the hub portal (if in a relationship)\",\n    \
        \        \"type\": \"string\"\n          },\n          \"hub_port\": {\n \
        \           \"description\": \"TCP port for the cluster with the hub portal\
        \ (if in a relationship)\",\n            \"type\": \"number\"\n          }\n\
        \        }\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
rest_endpoint: /v1/portal/spokes/
api_version: v1
permalink: /rest-api-guide/cloud-data-fabric-v1/portal_spokes.html
sidebar: rest_api_guide_sidebar
redirect_from: /rest-api-guide/cloud-data-fabric/portal_spokes.html
deprecated: true
---
