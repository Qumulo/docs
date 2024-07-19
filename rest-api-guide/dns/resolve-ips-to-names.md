---
category: /dns
methods:
  post:
    parameters: []
    request_body:
      schema: "{\n  \"type\": \"array\",\n  \"items\": {\n    \"type\": \"string\"\
        \n  }\n}"
    response_body:
      schema: "{\n  \"type\": \"array\",\n  \"items\": {\n    \"description\": \"\
        api_resolved_ip\",\n    \"type\": \"object\",\n    \"properties\": {\n   \
        \   \"ip_address\": {\n        \"description\": \"The IP address which was\
        \ resolved\",\n        \"type\": \"string\"\n      },\n      \"hostname\"\
        : {\n        \"description\": \"The resolved name of the IP address\",\n \
        \       \"type\": \"string\"\n      },\n      \"result\": {\n        \"type\"\
        : \"string\",\n        \"enum\": [\n          \"OK\",\n          \"ERROR\"\
        ,\n          \"NOT_FOUND\",\n          \"TIMEOUT\"\n        ],\n        \"\
        description\": \"The status of the resolution:\\n * `ERROR` - DNS_RESOLUTION_ERROR,\\\
        n * `NOT_FOUND` - DNS_RESOLUTION_NOT_FOUND,\\n * `OK` - DNS_RESOLUTION_OK,\\\
        n * `TIMEOUT` - DNS_RESOLUTION_TIMEOUT\"\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Resolve a list of IP addresses to canonical hostnames.
rest_endpoint: /v1/dns/resolve-ips-to-names
api_version: v1
permalink: /rest-api-guide/dns/resolve-ips-to-names.html
sidebar: rest_api_guide_sidebar
---
