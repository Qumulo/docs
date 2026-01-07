---
category: /Cloud Data Fabric V1
methods:
  post:
    summary: Propose a relationship from the specified unlinked spoke portal on the
      current cluster. This action creates a pending hub portal on the specified cluster.
    parameters:
    - name: id
      description: Portal ID
      required: true
    response_body:
      schema: "{\n  \"description\": \"v1_portal_spoke\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"id\": {\n      \"description\": \"Spoke portal\
        \ ID\",\n      \"type\": \"number\"\n    },\n    \"spoke_type\": {\n     \
        \ \"type\": \"string\",\n      \"enum\": [\n        \"SPOKE_READ_ONLY\",\n\
        \        \"SPOKE_READ_WRITE\"\n      ],\n      \"description\": \"Type of\
        \ the spoke portal:\\n * `SPOKE_READ_ONLY` - SPOKE_READ_ONLY,\\n * `SPOKE_READ_WRITE`\
        \ - SPOKE_READ_WRITE\"\n    },\n    \"state\": {\n      \"type\": \"string\"\
        ,\n      \"enum\": [\n        \"UNLINKED\",\n        \"PENDING\",\n      \
        \  \"AUTHORIZED\",\n        \"DELETING\"\n      ],\n      \"description\"\
        : \"State of the portal:\\n * `AUTHORIZED` - An authorized spoke portal or\
        \ hub portal that can be used for file system access.,\\n * `DELETING` - A\
        \ portal in the process of synchronizing outstanding changes before deletion.,\\\
        n * `PENDING` - A spoke portal or hub portal awaiting authorization. Hub portals\
        \ are created in this state.,\\n * `UNLINKED` - A newly created spoke portal\
        \ without a relationship with another cluster.\"\n    },\n    \"status\":\
        \ {\n      \"type\": \"string\",\n      \"enum\": [\n        \"INACTIVE\"\
        ,\n        \"ACTIVE\",\n        \"DEGRADED\"\n      ],\n      \"description\"\
        : \"Status of the portal:\\n * `ACTIVE` - A fully connected portal ready for\
        \ use.,\\n * `DEGRADED` - A portal missing one or more connections with the\
        \ other cluster in the relationship.,\\n * `INACTIVE` - A portal that is not\
        \ ready for use.\"\n    },\n    \"spoke_root\": {\n      \"description\":\
        \ \"Local spoke portal root directory file ID\",\n      \"type\": \"string\"\
        \n    },\n    \"spoke_root_path\": {\n      \"description\": \"Local spoke\
        \ portal root directory path\",\n      \"type\": \"string\"\n    },\n    \"\
        hub_id\": {\n      \"description\": \"Corresponding remote hub portal ID (if\
        \ in a relationship)\",\n      \"type\": \"number\"\n    },\n    \"hub_cluster_uuid\"\
        : {\n      \"description\": \"UUID of the cluster with the hub portal (if\
        \ in a relationship)\",\n      \"type\": \"string\"\n    },\n    \"hub_root\"\
        : {\n      \"description\": \"Remote hub portal root directory (if in a relationship)\"\
        ,\n      \"type\": \"string\"\n    },\n    \"hub_address\": {\n      \"description\"\
        : \"IP address of a node in the cluster with the hub portal (if in a relationship)\"\
        ,\n      \"type\": \"string\"\n    },\n    \"hub_port\": {\n      \"description\"\
        : \"TCP port for the cluster with the hub portal (if in a relationship)\"\
        ,\n      \"type\": \"number\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
    request_body:
      schema: "{\n  \"description\": \"v1_portal_propose_request\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"hub_root\": {\n      \"description\"\
        : \"Full path to the hub portal root directory\",\n      \"type\": \"string\"\
        \n    },\n    \"hub_address\": {\n      \"description\": \"IP address of a\
        \ node in the remote cluster\",\n      \"type\": \"string\"\n    },\n    \"\
        hub_port\": {\n      \"description\": \"TCP port for the remote cluster\"\
        ,\n      \"type\": \"number\"\n    }\n  }\n}"
rest_endpoint: /v1/portal/spokes/{id}/propose
api_version: v1
permalink: /rest-api-guide/cloud-data-fabric-v1/portal_spokes_id_propose.html
sidebar: rest_api_guide_sidebar
redirect_from: /rest-api-guide/cloud-data-fabric/portal_spokes_id_propose.html
---
