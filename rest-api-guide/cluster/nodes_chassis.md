---
category: /cluster
methods:
  get:
    parameters: []
    response_body:
      example_value: '"TO DO"'
      schema: "{\n  \"type\": \"array\",\n  \"items\": {\n    \"description\": \"\
        api_node_chassis\",\n    \"type\": \"object\",\n    \"properties\": {\n  \
        \    \"id\": {\n        \"description\": \"id\",\n        \"type\": \"number\"\
        \n      },\n      \"light_visible\": {\n        \"description\": \"Visibility\
        \ of the node identifier light\",\n        \"type\": \"boolean\"\n      },\n\
        \      \"psu_statuses\": {\n        \"type\": \"array\",\n        \"items\"\
        : {\n          \"description\": \"psu_statuses\",\n          \"type\": \"\
        object\",\n          \"properties\": {\n            \"name\": {\n        \
        \      \"description\": \"name\",\n              \"type\": \"string\"\n  \
        \          },\n            \"state\": {\n              \"type\": \"string\"\
        ,\n              \"enum\": [\n                \"UNKNOWN\",\n             \
        \   \"MISSING\",\n                \"NO AC\",\n                \"GOOD\",\n\
        \                \"FAILED\",\n                \"PREFAIL\"\n              ],\n\
        \              \"description\": \"state:\\n * `FAILED` - PSU_STATE_FAILED,\\\
        n * `GOOD` - PSU_STATE_GOOD,\\n * `MISSING` - PSU_STATE_MISSING,\\n * `NO\
        \ AC` - PSU_STATE_NO_AC,\\n * `PREFAIL` - PSU_STATE_PREFAIL,\\n * `UNKNOWN`\
        \ - PSU_STATE_UNKNOWN\"\n            },\n            \"location\": {\n   \
        \           \"type\": \"string\",\n              \"enum\": [\n           \
        \     \"right\",\n                \"left\",\n                \"top\",\n  \
        \              \"bottom\"\n              ],\n              \"description\"\
        : \"location:\\n * `bottom` - PSU_LOCATION_BOTTOM,\\n * `left` - PSU_LOCATION_LEFT,\\\
        n * `right` - PSU_LOCATION_RIGHT,\\n * `top` - PSU_LOCATION_TOP\"\n      \
        \      }\n          }\n        }\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: List the status of the chassis for nodes. This API is deprecated in favor
      of /v1/cluster/nodes/uid-lights and /v2/metrics/endpoints/default/data for PSU
      information
rest_endpoint: /v1/cluster/nodes/chassis/
permalink: /rest-api-guide/cluster/nodes_chassis.html
sidebar: rest_api_guide_sidebar
---
