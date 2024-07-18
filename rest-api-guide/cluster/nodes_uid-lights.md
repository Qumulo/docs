---
category: /cluster
methods:
  get:
    parameters: []
    response_body:
      description: Return value on success
      example_value: '"TO DO"'
      schema: "{\n  \"type\": \"array\",\n  \"items\": {\n    \"description\": \"\
        api_node_uid_light_status\",\n    \"type\": \"object\",\n    \"properties\"\
        : {\n      \"id\": {\n        \"description\": \"Integer ID of the node being\
        \ reported.\",\n        \"type\": \"number\"\n      },\n      \"light_visible\"\
        : {\n        \"description\": \"Visibility of the node identification light\"\
        ,\n        \"type\": \"boolean\"\n      }\n    }\n  }\n}"
      status_code: '200'
    summary: List the status of the identification lights for nodes.
rest_endpoint: /v1/cluster/nodes/uid-lights/
permalink: /rest-api-guide/cluster/nodes_uid-lights.html
sidebar: rest_api_guide_sidebar
---
