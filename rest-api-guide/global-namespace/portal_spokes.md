---
category: /Global Namespace
methods:
  get:
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"api_portal_spoke_relationships\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"entries\": {\n      \"type\": \"\
        array\",\n      \"items\": {\n        \"description\": \"List of spoke portals\"\
        ,\n        \"type\": \"object\",\n        \"properties\": {\n          \"\
        id\": {\n            \"description\": \"Spoke portal ID\",\n            \"\
        type\": \"number\"\n          },\n          \"state\": {\n            \"type\"\
        : \"string\",\n            \"enum\": [\n              \"UNLINKED\",\n    \
        \          \"PENDING\",\n              \"ACTIVE\",\n              \"ENDED\"\
        \n            ],\n            \"description\": \"State of the portal:\\n *\
        \ `ACTIVE` - PORTAL_ACTIVE,\\n * `ENDED` - PORTAL_ENDED,\\n * `PENDING` -\
        \ PORTAL_PENDING,\\n * `UNLINKED` - PORTAL_UNLINKED\"\n          },\n    \
        \      \"spoke_type\": {\n            \"type\": \"string\",\n            \"\
        enum\": [\n              \"SPOKE_READ_ONLY\",\n              \"SPOKE_READ_WRITE\"\
        \n            ],\n            \"description\": \"Type of the spoke portal:\\\
        n * `SPOKE_READ_ONLY` - SPOKE_READ_ONLY,\\n * `SPOKE_READ_WRITE` - SPOKE_READ_WRITE\"\
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
    summary: '[preview] List the relationship status and configuration for all spoke
      portals on the current cluster.'
  post:
    parameters: []
    request_body:
      schema: "{\n  \"description\": \"api_portal_create_request\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"spoke_root\": {\n      \"description\"\
        : \"Full path to the spoke portal root directory\",\n      \"type\": \"string\"\
        \n    },\n    \"is_writable_spoke\": {\n      \"description\": \"Whether the\
        \ spoke portal is writable. Default to false. In-development feature.\",\n\
        \      \"type\": \"boolean\"\n    }\n  }\n}"
    response_body:
      schema: "{\n  \"type\": \"number\"\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: '[preview] Create a spoke portal in the UNLINKED state in the current
      cluster. It is now possible to propose a relationship between this spoke portal
      and a hub portal on another cluster.'
rest_endpoint: /v1/portal/spokes/
api_version: v1
permalink: /rest-api-guide/global-namespace/portal_spokes.html
sidebar: rest_api_guide_sidebar
---
