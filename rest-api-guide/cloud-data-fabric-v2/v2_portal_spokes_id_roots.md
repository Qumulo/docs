---
category: /Cloud Data Fabric V2
methods:
  post:
    summary: '[preview] Propose a spoke root directory for the specified spoke portal.
      This action creates a pending hub root directory on the paired remote hub portal.'
    parameters:
    - name: id
      description: Portal ID
      required: true
    response_body:
      schema: "{\n  \"description\": \"v2_portal_spoke\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"id\": {\n      \"description\": \"Spoke portal\
        \ ID\",\n      \"type\": \"number\"\n    },\n    \"type\": {\n      \"type\"\
        : \"string\",\n      \"enum\": [\n        \"PORTAL_READ_ONLY\",\n        \"\
        PORTAL_READ_WRITE\"\n      ],\n      \"description\": \"Type of the spoke\
        \ portal (read-only or read-write):\\n * `PORTAL_READ_ONLY` - PORTAL_READ_ONLY,\\\
        n * `PORTAL_READ_WRITE` - PORTAL_READ_WRITE\"\n    },\n    \"state\": {\n\
        \      \"type\": \"string\",\n      \"enum\": [\n        \"PENDING\",\n  \
        \      \"ACCEPTED\",\n        \"DELETING\"\n      ],\n      \"description\"\
        : \"State of the spoke portal:\\n * `ACCEPTED` - API_PORTAL_ACCEPTED,\\n *\
        \ `DELETING` - API_PORTAL_DELETING,\\n * `PENDING` - API_PORTAL_PENDING\"\n\
        \    },\n    \"status\": {\n      \"type\": \"string\",\n      \"enum\": [\n\
        \        \"INACTIVE\",\n        \"ACTIVE\",\n        \"DEGRADED\"\n      ],\n\
        \      \"description\": \"Status of the portal:\\n * `ACTIVE` - PORTAL_ACTIVE,\\\
        n * `DEGRADED` - PORTAL_DEGRADED,\\n * `INACTIVE` - PORTAL_INACTIVE\"\n  \
        \  },\n    \"hub_hosts\": {\n      \"type\": \"array\",\n      \"items\":\
        \ {\n        \"description\": \"IP addresses and TCP ports of nodes in the\
        \ remote cluster\",\n        \"type\": \"object\",\n        \"properties\"\
        : {\n          \"address\": {\n            \"description\": \"address\",\n\
        \            \"type\": \"string\"\n          },\n          \"port\": {\n \
        \           \"description\": \"port\",\n            \"type\": \"number\"\n\
        \          }\n        }\n      }\n    },\n    \"hub_id\": {\n      \"description\"\
        : \"Corresponding remote hub portal ID\",\n      \"type\": \"number\"\n  \
        \  },\n    \"hub_cluster_uuid\": {\n      \"description\": \"UUID of the cluster\
        \ with the hub portal\",\n      \"type\": \"string\"\n    },\n    \"roots\"\
        : {\n      \"type\": \"array\",\n      \"items\": {\n        \"description\"\
        : \"Map of spoke root directories to hub root directories\",\n        \"type\"\
        : \"object\",\n        \"properties\": {\n          \"local_root\": {\n  \
        \          \"description\": \"Local spoke root directory file ID\",\n    \
        \        \"type\": \"string\"\n          },\n          \"remote_root\": {\n\
        \            \"description\": \"Remote hub root directory file ID\",\n   \
        \         \"type\": \"string\"\n          },\n          \"authorized\": {\n\
        \            \"description\": \"Whether the spoke portal is authorized to\
        \ access the remote root\",\n            \"type\": \"boolean\"\n         \
        \ }\n        }\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: true
    request_body:
      schema: "{\n  \"description\": \"v2_portal_root_propose_request\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"spoke_root_path\": {\n      \"description\"\
        : \"Full path to the spoke portal root directory\",\n      \"type\": \"string\"\
        \n    },\n    \"hub_root_path\": {\n      \"description\": \"Full path to\
        \ the hub portal root directory\",\n      \"type\": \"string\"\n    }\n  }\n\
        }"
rest_endpoint: /v2/portal/spokes/{id}/roots/
api_version: v2
permalink: /rest-api-guide/cloud-data-fabric-v2/v2_portal_spokes_id_roots.html
sidebar: rest_api_guide_sidebar
redirect_from: /rest-api-guide/cloud-data-fabric/v2_portal_spokes_id_roots.html
---
