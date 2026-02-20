---
category: /Network Configuration V3
methods:
  get:
    summary: Get the backend interface names for all nodes in the cluster
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"node_id_string_map\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {},\n  \"additionalProperties\": {\n    \"description\"\
        : \"node_id_string_map value\",\n    \"type\": \"string\"\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
rest_endpoint: /v3/network/backend-interfaces
api_version: v3
permalink: /rest-api-guide/network-configuration-v3/v3_network_backend-interfaces.html
sidebar: rest_api_guide_sidebar
deprecated: false
---
