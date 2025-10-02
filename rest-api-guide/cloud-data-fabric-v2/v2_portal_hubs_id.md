---
category: /Cloud Data Fabric V2
methods:
  get:
    summary: '[preview] Retrieve the relationship status and configuration for the
      specified hub portal.'
    parameters:
    - name: id
      description: Portal ID
      required: true
    response_body:
      schema: "{\n  \"description\": \"v2_portal_hub\",\n  \"type\": \"object\",\n\
        \  \"properties\": {\n    \"id\": {\n      \"description\": \"Hub portal ID\"\
        ,\n      \"type\": \"number\"\n    },\n    \"type\": {\n      \"type\": \"\
        string\",\n      \"enum\": [\n        \"PORTAL_READ_ONLY\",\n        \"PORTAL_READ_WRITE\"\
        \n      ],\n      \"description\": \"Type of the portal (read-only or read-write):\\\
        n * `PORTAL_READ_ONLY` - PORTAL_READ_ONLY,\\n * `PORTAL_READ_WRITE` - PORTAL_READ_WRITE\"\
        \n    },\n    \"state\": {\n      \"type\": \"string\",\n      \"enum\": [\n\
        \        \"PENDING\",\n        \"ACCEPTED\",\n        \"DELETING\"\n     \
        \ ],\n      \"description\": \"State of the portal:\\n * `ACCEPTED` - API_PORTAL_ACCEPTED,\\\
        n * `DELETING` - API_PORTAL_DELETING,\\n * `PENDING` - API_PORTAL_PENDING\"\
        \n    },\n    \"status\": {\n      \"type\": \"string\",\n      \"enum\":\
        \ [\n        \"INACTIVE\",\n        \"ACTIVE\",\n        \"DEGRADED\"\n  \
        \    ],\n      \"description\": \"Status of the portal:\\n * `ACTIVE` - PORTAL_ACTIVE,\\\
        n * `DEGRADED` - PORTAL_DEGRADED,\\n * `INACTIVE` - PORTAL_INACTIVE\"\n  \
        \  },\n    \"spoke_hosts\": {\n      \"type\": \"array\",\n      \"items\"\
        : {\n        \"description\": \"IP addresses and TCP ports of nodes in the\
        \ remote cluster\",\n        \"type\": \"object\",\n        \"properties\"\
        : {\n          \"address\": {\n            \"description\": \"address\",\n\
        \            \"type\": \"string\"\n          },\n          \"port\": {\n \
        \           \"description\": \"port\",\n            \"type\": \"number\"\n\
        \          }\n        }\n      }\n    },\n    \"spoke_cluster_uuid\": {\n\
        \      \"description\": \"UUID of the cluster with the spoke portal\",\n \
        \     \"type\": \"string\"\n    },\n    \"spoke_cluster_name\": {\n      \"\
        description\": \"Name of the cluster with the spoke portal\",\n      \"type\"\
        : \"string\"\n    },\n    \"pending_roots\": {\n      \"type\": \"array\"\
        ,\n      \"items\": {\n        \"description\": \"Set of hub root directories\
        \ that are pending authorization\",\n        \"type\": \"string\"\n      }\n\
        \    },\n    \"authorized_roots\": {\n      \"type\": \"array\",\n      \"\
        items\": {\n        \"description\": \"Set of hub root directories that are\
        \ authorized for access\",\n        \"type\": \"string\"\n      }\n    }\n\
        \  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: true
  delete:
    summary: '[preview] Delete the specified hub portal from the current cluster.'
    parameters:
    - name: id
      description: Portal ID
      required: true
    - name: force
      description: null
      required: false
    response_body: {}
    responses:
    - code: '202'
      description: Return value on success
    preview: true
  patch:
    summary: '[preview] Change configuration for the specified hub portal.'
    parameters:
    - name: id
      description: Portal ID
      required: true
    - name: If-Match
      description: ETag for expected version
      required: false
    response_body:
      schema: "{\n  \"description\": \"v2_portal_hub\",\n  \"type\": \"object\",\n\
        \  \"properties\": {\n    \"id\": {\n      \"description\": \"Hub portal ID\"\
        ,\n      \"type\": \"number\"\n    },\n    \"type\": {\n      \"type\": \"\
        string\",\n      \"enum\": [\n        \"PORTAL_READ_ONLY\",\n        \"PORTAL_READ_WRITE\"\
        \n      ],\n      \"description\": \"Type of the portal (read-only or read-write):\\\
        n * `PORTAL_READ_ONLY` - PORTAL_READ_ONLY,\\n * `PORTAL_READ_WRITE` - PORTAL_READ_WRITE\"\
        \n    },\n    \"state\": {\n      \"type\": \"string\",\n      \"enum\": [\n\
        \        \"PENDING\",\n        \"ACCEPTED\",\n        \"DELETING\"\n     \
        \ ],\n      \"description\": \"State of the portal:\\n * `ACCEPTED` - API_PORTAL_ACCEPTED,\\\
        n * `DELETING` - API_PORTAL_DELETING,\\n * `PENDING` - API_PORTAL_PENDING\"\
        \n    },\n    \"status\": {\n      \"type\": \"string\",\n      \"enum\":\
        \ [\n        \"INACTIVE\",\n        \"ACTIVE\",\n        \"DEGRADED\"\n  \
        \    ],\n      \"description\": \"Status of the portal:\\n * `ACTIVE` - PORTAL_ACTIVE,\\\
        n * `DEGRADED` - PORTAL_DEGRADED,\\n * `INACTIVE` - PORTAL_INACTIVE\"\n  \
        \  },\n    \"spoke_hosts\": {\n      \"type\": \"array\",\n      \"items\"\
        : {\n        \"description\": \"IP addresses and TCP ports of nodes in the\
        \ remote cluster\",\n        \"type\": \"object\",\n        \"properties\"\
        : {\n          \"address\": {\n            \"description\": \"address\",\n\
        \            \"type\": \"string\"\n          },\n          \"port\": {\n \
        \           \"description\": \"port\",\n            \"type\": \"number\"\n\
        \          }\n        }\n      }\n    },\n    \"spoke_cluster_uuid\": {\n\
        \      \"description\": \"UUID of the cluster with the spoke portal\",\n \
        \     \"type\": \"string\"\n    },\n    \"spoke_cluster_name\": {\n      \"\
        description\": \"Name of the cluster with the spoke portal\",\n      \"type\"\
        : \"string\"\n    },\n    \"pending_roots\": {\n      \"type\": \"array\"\
        ,\n      \"items\": {\n        \"description\": \"Set of hub root directories\
        \ that are pending authorization\",\n        \"type\": \"string\"\n      }\n\
        \    },\n    \"authorized_roots\": {\n      \"type\": \"array\",\n      \"\
        items\": {\n        \"description\": \"Set of hub root directories that are\
        \ authorized for access\",\n        \"type\": \"string\"\n      }\n    }\n\
        \  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: true
    request_body:
      schema: "{\n  \"description\": \"v2_portal_hub_patch\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"id\": {\n      \"description\": \"Hub portal\
        \ ID\",\n      \"type\": \"number\"\n    },\n    \"type\": {\n      \"type\"\
        : \"string\",\n      \"enum\": [\n        \"PORTAL_READ_ONLY\",\n        \"\
        PORTAL_READ_WRITE\"\n      ],\n      \"description\": \"Type of the portal\
        \ (read-only or read-write):\\n * `PORTAL_READ_ONLY` - PORTAL_READ_ONLY,\\\
        n * `PORTAL_READ_WRITE` - PORTAL_READ_WRITE\"\n    },\n    \"state\": {\n\
        \      \"type\": \"string\",\n      \"enum\": [\n        \"PENDING\",\n  \
        \      \"ACCEPTED\",\n        \"DELETING\"\n      ],\n      \"description\"\
        : \"State of the portal:\\n * `ACCEPTED` - API_PORTAL_ACCEPTED,\\n * `DELETING`\
        \ - API_PORTAL_DELETING,\\n * `PENDING` - API_PORTAL_PENDING\"\n    },\n \
        \   \"status\": {\n      \"type\": \"string\",\n      \"enum\": [\n      \
        \  \"INACTIVE\",\n        \"ACTIVE\",\n        \"DEGRADED\"\n      ],\n  \
        \    \"description\": \"Status of the portal:\\n * `ACTIVE` - PORTAL_ACTIVE,\\\
        n * `DEGRADED` - PORTAL_DEGRADED,\\n * `INACTIVE` - PORTAL_INACTIVE\"\n  \
        \  },\n    \"spoke_hosts\": {\n      \"type\": \"array\",\n      \"items\"\
        : {\n        \"description\": \"IP addresses and TCP ports of nodes in the\
        \ remote cluster\",\n        \"type\": \"object\",\n        \"properties\"\
        : {\n          \"address\": {\n            \"description\": \"address\",\n\
        \            \"type\": \"string\"\n          },\n          \"port\": {\n \
        \           \"description\": \"port\",\n            \"type\": \"number\"\n\
        \          }\n        }\n      }\n    },\n    \"spoke_cluster_uuid\": {\n\
        \      \"description\": \"UUID of the cluster with the spoke portal\",\n \
        \     \"type\": \"string\"\n    },\n    \"spoke_cluster_name\": {\n      \"\
        description\": \"Name of the cluster with the spoke portal\",\n      \"type\"\
        : \"string\"\n    },\n    \"pending_roots\": {\n      \"type\": \"array\"\
        ,\n      \"items\": {\n        \"description\": \"Set of hub root directories\
        \ that are pending authorization\",\n        \"type\": \"string\"\n      }\n\
        \    },\n    \"authorized_roots\": {\n      \"type\": \"array\",\n      \"\
        items\": {\n        \"description\": \"Set of hub root directories that are\
        \ authorized for access\",\n        \"type\": \"string\"\n      }\n    }\n\
        \  }\n}"
rest_endpoint: /v2/portal/hubs/{id}
api_version: v2
permalink: /rest-api-guide/cloud-data-fabric-v2/v2_portal_hubs_id.html
sidebar: rest_api_guide_sidebar
redirect_from: /rest-api-guide/cloud-data-fabric/v2_portal_hubs_id.html
---
