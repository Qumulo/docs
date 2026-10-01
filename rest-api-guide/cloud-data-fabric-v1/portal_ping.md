---
category: /Cloud Data Fabric V1
methods:
  post:
    summary: '[preview] Returns a connectivity report for each node to each provided
      remote host.'
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"v1_portal_ping_result\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"results\": {\n      \"type\": \"array\",\n \
        \     \"items\": {\n        \"description\": \"results\",\n        \"type\"\
        : \"object\",\n        \"properties\": {\n          \"node\": {\n        \
        \    \"description\": \"Node that attempted the connection\",\n          \
        \  \"type\": \"number\"\n          },\n          \"host\": {\n           \
        \ \"description\": \"Remote host that was tested\",\n            \"type\"\
        : \"object\",\n            \"properties\": {\n              \"address\": {\n\
        \                \"description\": \"address\",\n                \"type\":\
        \ \"string\"\n              },\n              \"port\": {\n              \
        \  \"description\": \"port\",\n                \"type\": \"number\"\n    \
        \          }\n            }\n          },\n          \"state\": {\n      \
        \      \"type\": \"string\",\n            \"enum\": [\n              \"reachable\"\
        ,\n              \"unreachable\",\n              \"rejected\"\n          \
        \  ],\n            \"description\": \"Whether the host answered, could not\
        \ be reached, or answered and rejected the connection:\\n * `reachable` -\
        \ HOST_REACHABLE,\\n * `rejected` - HOST_REJECTED,\\n * `unreachable` - HOST_UNREACHABLE\"\
        \n          },\n          \"ping_ms\": {\n            \"description\": \"\
        Connection round trip time reported in milliseconds\",\n            \"type\"\
        : \"number\"\n          },\n          \"unreachable_reason\": {\n        \
        \    \"description\": \"Why the connection was unreachable or rejected.\"\
        ,\n            \"type\": \"string\"\n          }\n        }\n      }\n   \
        \ }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: true
    request_body:
      schema: "{\n  \"description\": \"v1_portal_ping_request\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"hosts\": {\n      \"type\": \"array\",\n   \
        \   \"items\": {\n        \"description\": \"IP addresses and TCP ports of\
        \ nodes in the remote cluster\",\n        \"type\": \"object\",\n        \"\
        properties\": {\n          \"address\": {\n            \"description\": \"\
        address\",\n            \"type\": \"string\"\n          },\n          \"port\"\
        : {\n            \"description\": \"port\",\n            \"type\": \"number\"\
        \n          }\n        }\n      }\n    },\n    \"peer_uuid\": {\n      \"\
        description\": \"Optional UUID of the peer cluster for verification\",\n \
        \     \"type\": \"string\"\n    },\n    \"sample_count\": {\n      \"description\"\
        : \"Number of calls to average each round trip over\",\n      \"type\": \"\
        string\"\n    }\n  }\n}"
rest_endpoint: /v1/portal/ping
api_version: v1
permalink: /rest-api-guide/cloud-data-fabric-v1/portal_ping.html
sidebar: rest_api_guide_sidebar
deprecated: false
---
