---
category: /Cluster Creation V2
methods:
  post:
    summary: Create an unprotected single-node edge device given an admin password.
    parameters: []
    response_body: {}
    responses:
    - code: '202'
      description: Return value on success
    preview: false
    request_body:
      schema: "{\n  \"description\": \"api_cluster_creation_unprotected_request_v2\"\
        ,\n  \"type\": \"object\",\n  \"properties\": {\n    \"eula_accepted\": {\n\
        \      \"description\": \"The user accepts the End User License Agreement\"\
        ,\n      \"type\": \"boolean\"\n    },\n    \"name\": {\n      \"description\"\
        : \"The name of the Edge Device\",\n      \"type\": \"string\"\n    },\n \
        \   \"admin_password\": {\n      \"description\": \"The administrator password\"\
        ,\n      \"type\": \"string\",\n      \"format\": \"password\"\n    }\n  }\n\
        }"
rest_endpoint: /v2/cluster/unprotected-edge/create
api_version: v2
permalink: /rest-api-guide/cluster-creation-v2/v2_cluster_unprotected-edge_create.html
sidebar: rest_api_guide_sidebar
---
