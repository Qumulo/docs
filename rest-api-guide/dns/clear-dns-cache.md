---
category: /dns
methods:
  post:
    parameters: []
    request_body:
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"api_dns_clear_cache\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"dns_config_id\": {\n      \"description\": \"\
        dns_config_id\",\n      \"type\": \"number\"\n    },\n    \"skip_reverse_cache\"\
        : {\n      \"description\": \"When true, reverse lookup results will not be\
        \ cleared from the cache.\",\n      \"type\": \"boolean\"\n    },\n    \"\
        skip_forward_cache\": {\n      \"description\": \"When true, forward lookup\
        \ results will not be cleared from the cache.\",\n      \"type\": \"boolean\"\
        \n    }\n  }\n}"
    response_body:
      description: Return value on success
      example_value: '"TO DO"'
      schema: '"TO DO"'
      status_code: '200'
    summary: Clears the Qumulo local DNS cache
rest_endpoint: /v1/dns/clear-dns-cache
permalink: /rest-api-guide/dns/clear-dns-cache.html
sidebar: rest_api_guide_sidebar
---
