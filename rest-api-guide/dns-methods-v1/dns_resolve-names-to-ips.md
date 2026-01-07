---
category: /DNS Methods V1
methods:
  post:
    summary: Resolve a list of hostnames to their set of associated IP addresses.
    parameters: []
    response_body:
      schema: "{\n  \"type\": \"array\",\n  \"items\": {\n    \"description\": \"\
        api_resolved_hostname\",\n    \"type\": \"object\",\n    \"properties\": {\n\
        \      \"hostname\": {\n        \"description\": \"The hostname which was\
        \ resolved\",\n        \"type\": \"string\"\n      },\n      \"ip_addresses\"\
        : {\n        \"type\": \"array\",\n        \"items\": {\n          \"description\"\
        : \"The IP addresses to which the hostname resolved\",\n          \"type\"\
        : \"string\"\n        }\n      },\n      \"result\": {\n        \"type\":\
        \ \"string\",\n        \"enum\": [\n          \"OK\",\n          \"ERROR\"\
        ,\n          \"NOT_FOUND\",\n          \"TIMEOUT\"\n        ],\n        \"\
        description\": \"The status of the resolution:\\n * `ERROR` - An error occurred\
        \ while resolving the hostname,\\n * `NOT_FOUND` - No hostname was found for\
        \ the IP address,\\n * `OK` - The hostname for the IP address was successfully\
        \ resolved,\\n * `TIMEOUT` - Timeout occurred before this address was resolved\"\
        \n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
    request_body:
      schema: "{\n  \"type\": \"array\",\n  \"items\": {\n    \"type\": \"string\"\
        \n  }\n}"
rest_endpoint: /v1/dns/resolve-names-to-ips
api_version: v1
permalink: /rest-api-guide/dns-methods-v1/dns_resolve-names-to-ips.html
sidebar: rest_api_guide_sidebar
redirect_from: /rest-api-guide/dns-methods/dns_resolve-names-to-ips.html
---
