---
category: /Cloud Data Fabric V2
methods:
  post:
    summary: '[preview] Authorize the specified hub root directory for the specified
      hub portal. This allows the spoke portal to access the data in the hub root
      directory.'
    parameters:
    - name: id
      description: Portal ID
      required: true
    - name: dir
      description: Directory ID
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
        \ ],\n      \"description\": \"State of the portal:\\n * `ACCEPTED` - A portal\
        \ that is in an active relationship.,\\n * `DELETING` - A portal in the process\
        \ of synchronizing outstanding changes before deletion.,\\n * `PENDING` -\
        \ A portal not yet in an active relationship.\"\n    },\n    \"status\": {\n\
        \      \"type\": \"string\",\n      \"enum\": [\n        \"INACTIVE\",\n \
        \       \"ACTIVE\",\n        \"DEGRADED\"\n      ],\n      \"description\"\
        : \"Status of the portal:\\n * `ACTIVE` - A fully connected portal ready for\
        \ use.,\\n * `DEGRADED` - A portal missing one or more connections with the\
        \ other cluster in the relationship.,\\n * `INACTIVE` - A portal that is not\
        \ ready for use.\"\n    },\n    \"spoke_hosts\": {\n      \"type\": \"array\"\
        ,\n      \"items\": {\n        \"description\": \"IP addresses and TCP ports\
        \ of nodes in the remote cluster\",\n        \"type\": \"object\",\n     \
        \   \"properties\": {\n          \"address\": {\n            \"description\"\
        : \"address\",\n            \"type\": \"string\"\n          },\n         \
        \ \"port\": {\n            \"description\": \"port\",\n            \"type\"\
        : \"number\"\n          }\n        }\n      }\n    },\n    \"spoke_cluster_uuid\"\
        : {\n      \"description\": \"UUID of the cluster with the spoke portal\"\
        ,\n      \"type\": \"string\"\n    },\n    \"spoke_cluster_name\": {\n   \
        \   \"description\": \"Name of the cluster with the spoke portal\",\n    \
        \  \"type\": \"string\"\n    },\n    \"pending_roots\": {\n      \"type\"\
        : \"array\",\n      \"items\": {\n        \"description\": \"Set of hub root\
        \ directories that are pending authorization\",\n        \"type\": \"string\"\
        \n      }\n    },\n    \"authorized_roots\": {\n      \"type\": \"array\"\
        ,\n      \"items\": {\n        \"description\": \"Set of hub root directories\
        \ that are authorized for access\",\n        \"type\": \"string\"\n      }\n\
        \    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: true
  delete:
    summary: '[preview] Deny access to the specified hub root directory for the specified
      hub portal. This action does not affect the data in the hub root directory.'
    parameters:
    - name: id
      description: Portal ID
      required: true
    - name: dir
      description: Directory ID
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
        \ ],\n      \"description\": \"State of the portal:\\n * `ACCEPTED` - A portal\
        \ that is in an active relationship.,\\n * `DELETING` - A portal in the process\
        \ of synchronizing outstanding changes before deletion.,\\n * `PENDING` -\
        \ A portal not yet in an active relationship.\"\n    },\n    \"status\": {\n\
        \      \"type\": \"string\",\n      \"enum\": [\n        \"INACTIVE\",\n \
        \       \"ACTIVE\",\n        \"DEGRADED\"\n      ],\n      \"description\"\
        : \"Status of the portal:\\n * `ACTIVE` - A fully connected portal ready for\
        \ use.,\\n * `DEGRADED` - A portal missing one or more connections with the\
        \ other cluster in the relationship.,\\n * `INACTIVE` - A portal that is not\
        \ ready for use.\"\n    },\n    \"spoke_hosts\": {\n      \"type\": \"array\"\
        ,\n      \"items\": {\n        \"description\": \"IP addresses and TCP ports\
        \ of nodes in the remote cluster\",\n        \"type\": \"object\",\n     \
        \   \"properties\": {\n          \"address\": {\n            \"description\"\
        : \"address\",\n            \"type\": \"string\"\n          },\n         \
        \ \"port\": {\n            \"description\": \"port\",\n            \"type\"\
        : \"number\"\n          }\n        }\n      }\n    },\n    \"spoke_cluster_uuid\"\
        : {\n      \"description\": \"UUID of the cluster with the spoke portal\"\
        ,\n      \"type\": \"string\"\n    },\n    \"spoke_cluster_name\": {\n   \
        \   \"description\": \"Name of the cluster with the spoke portal\",\n    \
        \  \"type\": \"string\"\n    },\n    \"pending_roots\": {\n      \"type\"\
        : \"array\",\n      \"items\": {\n        \"description\": \"Set of hub root\
        \ directories that are pending authorization\",\n        \"type\": \"string\"\
        \n      }\n    },\n    \"authorized_roots\": {\n      \"type\": \"array\"\
        ,\n      \"items\": {\n        \"description\": \"Set of hub root directories\
        \ that are authorized for access\",\n        \"type\": \"string\"\n      }\n\
        \    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: true
rest_endpoint: /v2/portal/hubs/{id}/roots/{dir}
api_version: v2
permalink: /rest-api-guide/cloud-data-fabric-v2/v2_portal_hubs_id_roots_dir.html
sidebar: rest_api_guide_sidebar
redirect_from: /rest-api-guide/cloud-data-fabric/v2_portal_hubs_id_roots_dir.html
deprecated: false
---
