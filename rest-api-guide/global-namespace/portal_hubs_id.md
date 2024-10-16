---
category: /Global Namespace
methods:
  delete:
    parameters:
    - description: Portal ID
      name: id
      required: true
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    summary: Delete the specified hub portal from the current cluster.
  get:
    parameters:
    - description: Portal ID
      name: id
      required: true
    response_body:
      schema: "{\n  \"description\": \"api_portal_hub_relationship\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"id\": {\n      \"description\":\
        \ \"Hub portal ID\",\n      \"type\": \"number\"\n    },\n    \"root\": {\n\
        \      \"description\": \"Local hub portal root directory file ID\",\n   \
        \   \"type\": \"string\"\n    },\n    \"root_path\": {\n      \"description\"\
        : \"Local hub portal root directory path\",\n      \"type\": \"string\"\n\
        \    },\n    \"state\": {\n      \"type\": \"string\",\n      \"enum\": [\n\
        \        \"UNLINKED\",\n        \"PENDING\",\n        \"ACTIVE\",\n      \
        \  \"ENDED\"\n      ],\n      \"description\": \"State of the portal:\\n *\
        \ `ACTIVE` - PORTAL_ACTIVE,\\n * `ENDED` - PORTAL_ENDED,\\n * `PENDING` -\
        \ PORTAL_PENDING,\\n * `UNLINKED` - PORTAL_UNLINKED\"\n    },\n    \"spoke_cluster_uuid\"\
        : {\n      \"description\": \"UUID of the cluster with the spoke portal\"\
        ,\n      \"type\": \"string\"\n    },\n    \"spoke_cluster_name\": {\n   \
        \   \"description\": \"Name of the cluster with the spoke portal\",\n    \
        \  \"type\": \"string\"\n    },\n    \"spoke_address\": {\n      \"description\"\
        : \"IP address of a node in the cluster with the spoke portal (if in a relationship)\"\
        ,\n      \"type\": \"string\"\n    },\n    \"spoke_port\": {\n      \"description\"\
        : \"TCP port for the cluster with the spoke portal (if in a relationship)\"\
        ,\n      \"type\": \"number\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Retrieve the relationship status and configuration for the specified
      hub portal.
  patch:
    parameters:
    - description: Portal ID
      name: id
      required: true
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
      schema: "{\n  \"description\": \"api_portal_hub_relationship_patch\",\n  \"\
        type\": \"object\",\n  \"properties\": {\n    \"id\": {\n      \"description\"\
        : \"Hub portal ID\",\n      \"type\": \"number\"\n    },\n    \"root\": {\n\
        \      \"description\": \"Local hub portal root directory file ID\",\n   \
        \   \"type\": \"string\"\n    },\n    \"root_path\": {\n      \"description\"\
        : \"Local hub portal root directory path\",\n      \"type\": \"string\"\n\
        \    },\n    \"state\": {\n      \"type\": \"string\",\n      \"enum\": [\n\
        \        \"UNLINKED\",\n        \"PENDING\",\n        \"ACTIVE\",\n      \
        \  \"ENDED\"\n      ],\n      \"description\": \"State of the portal:\\n *\
        \ `ACTIVE` - PORTAL_ACTIVE,\\n * `ENDED` - PORTAL_ENDED,\\n * `PENDING` -\
        \ PORTAL_PENDING,\\n * `UNLINKED` - PORTAL_UNLINKED\"\n    },\n    \"spoke_cluster_uuid\"\
        : {\n      \"description\": \"UUID of the cluster with the spoke portal\"\
        ,\n      \"type\": \"string\"\n    },\n    \"spoke_cluster_name\": {\n   \
        \   \"description\": \"Name of the cluster with the spoke portal\",\n    \
        \  \"type\": \"string\"\n    },\n    \"spoke_address\": {\n      \"description\"\
        : \"IP address of a node in the cluster with the spoke portal (if in a relationship)\"\
        ,\n      \"type\": \"string\"\n    },\n    \"spoke_port\": {\n      \"description\"\
        : \"TCP port for the cluster with the spoke portal (if in a relationship)\"\
        ,\n      \"type\": \"number\"\n    }\n  }\n}"
    response_body:
      schema: "{\n  \"description\": \"api_portal_hub_relationship\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"id\": {\n      \"description\":\
        \ \"Hub portal ID\",\n      \"type\": \"number\"\n    },\n    \"root\": {\n\
        \      \"description\": \"Local hub portal root directory file ID\",\n   \
        \   \"type\": \"string\"\n    },\n    \"root_path\": {\n      \"description\"\
        : \"Local hub portal root directory path\",\n      \"type\": \"string\"\n\
        \    },\n    \"state\": {\n      \"type\": \"string\",\n      \"enum\": [\n\
        \        \"UNLINKED\",\n        \"PENDING\",\n        \"ACTIVE\",\n      \
        \  \"ENDED\"\n      ],\n      \"description\": \"State of the portal:\\n *\
        \ `ACTIVE` - PORTAL_ACTIVE,\\n * `ENDED` - PORTAL_ENDED,\\n * `PENDING` -\
        \ PORTAL_PENDING,\\n * `UNLINKED` - PORTAL_UNLINKED\"\n    },\n    \"spoke_cluster_uuid\"\
        : {\n      \"description\": \"UUID of the cluster with the spoke portal\"\
        ,\n      \"type\": \"string\"\n    },\n    \"spoke_cluster_name\": {\n   \
        \   \"description\": \"Name of the cluster with the spoke portal\",\n    \
        \  \"type\": \"string\"\n    },\n    \"spoke_address\": {\n      \"description\"\
        : \"IP address of a node in the cluster with the spoke portal (if in a relationship)\"\
        ,\n      \"type\": \"string\"\n    },\n    \"spoke_port\": {\n      \"description\"\
        : \"TCP port for the cluster with the spoke portal (if in a relationship)\"\
        ,\n      \"type\": \"number\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Change configuration for the specified hub portal.
rest_endpoint: /v1/portal/hubs/{id}
api_version: v1
permalink: /rest-api-guide/global-namespace/portal_hubs_id.html
sidebar: rest_api_guide_sidebar
---
