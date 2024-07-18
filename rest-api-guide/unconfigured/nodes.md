---
category: /unconfigured
methods:
  get:
    parameters: []
    response_body:
      description: Return value on success
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"api_unconfigured_nodes_response\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"nodes\": {\n      \"type\": \"array\"\
        ,\n      \"items\": {\n        \"description\": \"nodes\",\n        \"type\"\
        : \"object\",\n        \"properties\": {\n          \"uuid\": {\n        \
        \    \"description\": \"Unique node identifier\",\n            \"type\": \"\
        string\"\n          },\n          \"label\": {\n            \"description\"\
        : \"Physically identifiable label assigned to the hardware\",\n          \
        \  \"type\": \"string\"\n          },\n          \"serial_number\": {\n  \
        \          \"description\": \"Node serial number\",\n            \"type\"\
        : \"string\"\n          },\n          \"model_number\": {\n            \"\
        description\": \"Node model number\",\n            \"type\": \"string\"\n\
        \          },\n          \"capacity_in_bytes\": {\n            \"description\"\
        : \"Raw capacity of the node\",\n            \"type\": \"string\"\n      \
        \    },\n          \"node_version\": {\n            \"description\": \"Version\"\
        ,\n            \"type\": \"object\",\n            \"properties\": {\n    \
        \          \"revision_id\": {\n                \"description\": \"revision_id\"\
        ,\n                \"type\": \"string\"\n              },\n              \"\
        build_id\": {\n                \"description\": \"build_id\",\n          \
        \      \"type\": \"string\"\n              },\n              \"flavor\": {\n\
        \                \"description\": \"flavor\",\n                \"type\": \"\
        string\"\n              },\n              \"build_date\": {\n            \
        \    \"description\": \"build_date\",\n                \"type\": \"string\"\
        \n              }\n            }\n          }\n        }\n      }\n    },\n\
        \    \"current_node_uuid\": {\n      \"description\": \"UUID of the current\
        \ node\",\n      \"type\": \"string\"\n    }\n  }\n}"
      status_code: '200'
    summary: List the unconfigured nodes discovered on the local network.
rest_endpoint: /v1/unconfigured/nodes/
permalink: /rest-api-guide/unconfigured/nodes.html
sidebar: rest_api_guide_sidebar
---
