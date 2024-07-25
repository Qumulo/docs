---
category: /Network Configuration V1
methods:
  get:
    parameters: []
    response_body:
      schema: "{\n  \"type\": \"array\",\n  \"items\": {\n    \"description\": \"\
        api_node_floating_ips\",\n    \"type\": \"object\",\n    \"properties\": {\n\
        \      \"id\": {\n        \"description\": \"Node Id\",\n        \"type\"\
        : \"number\"\n      },\n      \"floating_addresses\": {\n        \"type\"\
        : \"array\",\n        \"items\": {\n          \"description\": \"Floating\
        \ IPv4 or IPv6 addresses in 0.0.0.0 or :: format\",\n          \"type\": \"\
        string\"\n        }\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Returns floating IPs per node distribution based on the current network
      configuration. Returns status code 400 if the server is in DHCP mode.
rest_endpoint: /v1/network/floating-ip-allocation
api_version: v1
permalink: /rest-api-guide/network-configuration-v1/network_floating-ip-allocation.html
sidebar: rest_api_guide_sidebar
---
