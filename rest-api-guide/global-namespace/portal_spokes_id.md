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
    summary: Delete the specified spoke portal from the current cluster.
  get:
    parameters:
    - description: Portal ID
      name: id
      required: true
    response_body:
      schema: "{\n  \"description\": \"api_portal_spoke_relationship\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"id\": {\n      \"description\":\
        \ \"Spoke portal ID\",\n      \"type\": \"number\"\n    },\n    \"spoke_root\"\
        : {\n      \"description\": \"Local spoke portal root directory file ID\"\
        ,\n      \"type\": \"string\"\n    },\n    \"spoke_root_path\": {\n      \"\
        description\": \"Local spoke portal root directory path\",\n      \"type\"\
        : \"string\"\n    },\n    \"state\": {\n      \"type\": \"string\",\n    \
        \  \"enum\": [\n        \"UNLINKED\",\n        \"PENDING\",\n        \"ACTIVE\"\
        ,\n        \"ENDED\"\n      ],\n      \"description\": \"State of the portal:\\\
        n * `ACTIVE` - PORTAL_ACTIVE,\\n * `ENDED` - PORTAL_ENDED,\\n * `PENDING`\
        \ - PORTAL_PENDING,\\n * `UNLINKED` - PORTAL_UNLINKED\"\n    },\n    \"hub_root\"\
        : {\n      \"description\": \"Remote hub portal root directory (if in a relationship)\"\
        ,\n      \"type\": \"string\"\n    },\n    \"hub_address\": {\n      \"description\"\
        : \"IP address of a node in the cluster with the hub portal (if in a relationship)\"\
        ,\n      \"type\": \"string\"\n    },\n    \"hub_port\": {\n      \"description\"\
        : \"TCP port for the cluster with the hub portal (if in a relationship)\"\
        ,\n      \"type\": \"number\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Retrieve the relationship status and configuration for the specified
      spoke portal.
  patch:
    parameters:
    - description: Portal ID
      name: id
      required: true
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
      schema: "{\n  \"description\": \"api_portal_spoke_relationship_patch\",\n  \"\
        type\": \"object\",\n  \"properties\": {\n    \"id\": {\n      \"description\"\
        : \"Spoke portal ID\",\n      \"type\": \"number\"\n    },\n    \"spoke_root\"\
        : {\n      \"description\": \"Local spoke portal root directory file ID\"\
        ,\n      \"type\": \"string\"\n    },\n    \"spoke_root_path\": {\n      \"\
        description\": \"Local spoke portal root directory path\",\n      \"type\"\
        : \"string\"\n    },\n    \"state\": {\n      \"type\": \"string\",\n    \
        \  \"enum\": [\n        \"UNLINKED\",\n        \"PENDING\",\n        \"ACTIVE\"\
        ,\n        \"ENDED\"\n      ],\n      \"description\": \"State of the portal:\\\
        n * `ACTIVE` - PORTAL_ACTIVE,\\n * `ENDED` - PORTAL_ENDED,\\n * `PENDING`\
        \ - PORTAL_PENDING,\\n * `UNLINKED` - PORTAL_UNLINKED\"\n    },\n    \"hub_root\"\
        : {\n      \"description\": \"Remote hub portal root directory (if in a relationship)\"\
        ,\n      \"type\": \"string\"\n    },\n    \"hub_address\": {\n      \"description\"\
        : \"IP address of a node in the cluster with the hub portal (if in a relationship)\"\
        ,\n      \"type\": \"string\"\n    },\n    \"hub_port\": {\n      \"description\"\
        : \"TCP port for the cluster with the hub portal (if in a relationship)\"\
        ,\n      \"type\": \"number\"\n    }\n  }\n}"
    response_body:
      schema: "{\n  \"description\": \"api_portal_spoke_relationship\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"id\": {\n      \"description\":\
        \ \"Spoke portal ID\",\n      \"type\": \"number\"\n    },\n    \"spoke_root\"\
        : {\n      \"description\": \"Local spoke portal root directory file ID\"\
        ,\n      \"type\": \"string\"\n    },\n    \"spoke_root_path\": {\n      \"\
        description\": \"Local spoke portal root directory path\",\n      \"type\"\
        : \"string\"\n    },\n    \"state\": {\n      \"type\": \"string\",\n    \
        \  \"enum\": [\n        \"UNLINKED\",\n        \"PENDING\",\n        \"ACTIVE\"\
        ,\n        \"ENDED\"\n      ],\n      \"description\": \"State of the portal:\\\
        n * `ACTIVE` - PORTAL_ACTIVE,\\n * `ENDED` - PORTAL_ENDED,\\n * `PENDING`\
        \ - PORTAL_PENDING,\\n * `UNLINKED` - PORTAL_UNLINKED\"\n    },\n    \"hub_root\"\
        : {\n      \"description\": \"Remote hub portal root directory (if in a relationship)\"\
        ,\n      \"type\": \"string\"\n    },\n    \"hub_address\": {\n      \"description\"\
        : \"IP address of a node in the cluster with the hub portal (if in a relationship)\"\
        ,\n      \"type\": \"string\"\n    },\n    \"hub_port\": {\n      \"description\"\
        : \"TCP port for the cluster with the hub portal (if in a relationship)\"\
        ,\n      \"type\": \"number\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Change configuration for the specified spoke portal.
rest_endpoint: /v1/portal/spokes/{id}
api_version: v1
permalink: /rest-api-guide/global-namespace/portal_spokes_id.html
sidebar: rest_api_guide_sidebar
---
