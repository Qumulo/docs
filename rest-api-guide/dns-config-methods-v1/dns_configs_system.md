---
category: /DNS Config Methods V1
methods:
  get:
    summary: Get the system's DNS configuration.
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"api_dns_config\",\n  \"type\": \"object\",\n\
        \  \"properties\": {\n    \"id\": {\n      \"description\": \"Unique identifier\
        \ for this DNS configuration.\",\n      \"type\": \"number\"\n    },\n   \
        \ \"dns_servers\": {\n      \"type\": \"array\",\n      \"items\": {\n   \
        \     \"description\": \"The list of DNS servers associated with this DNS\
        \ configuration.\",\n        \"type\": \"string\"\n      }\n    },\n    \"\
        dns_search_domains\": {\n      \"type\": \"array\",\n      \"items\": {\n\
        \        \"description\": \"The list of DNS search domains associated with\
        \ this DNS configuration.\",\n        \"type\": \"string\"\n      }\n    },\n\
        \    \"lookup_overrides\": {\n      \"type\": \"array\",\n      \"items\"\
        : {\n        \"description\": \"The list of DNS lookup overrides associated\
        \ with this DNS configuration.\",\n        \"type\": \"object\",\n       \
        \ \"properties\": {\n          \"ip_address\": {\n            \"description\"\
        : \"ip_address\",\n            \"type\": \"string\"\n          },\n      \
        \    \"aliases\": {\n            \"type\": \"array\",\n            \"items\"\
        : {\n              \"description\": \"aliases\",\n              \"type\":\
        \ \"string\"\n            }\n          }\n        }\n      }\n    }\n  }\n\
        }"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
  patch:
    summary: Update the system's DNS configuration.
    parameters:
    - name: If-Match
      description: ETag for expected version
      required: false
    response_body:
      schema: "{\n  \"description\": \"api_dns_config\",\n  \"type\": \"object\",\n\
        \  \"properties\": {\n    \"id\": {\n      \"description\": \"Unique identifier\
        \ for this DNS configuration.\",\n      \"type\": \"number\"\n    },\n   \
        \ \"dns_servers\": {\n      \"type\": \"array\",\n      \"items\": {\n   \
        \     \"description\": \"The list of DNS servers associated with this DNS\
        \ configuration.\",\n        \"type\": \"string\"\n      }\n    },\n    \"\
        dns_search_domains\": {\n      \"type\": \"array\",\n      \"items\": {\n\
        \        \"description\": \"The list of DNS search domains associated with\
        \ this DNS configuration.\",\n        \"type\": \"string\"\n      }\n    },\n\
        \    \"lookup_overrides\": {\n      \"type\": \"array\",\n      \"items\"\
        : {\n        \"description\": \"The list of DNS lookup overrides associated\
        \ with this DNS configuration.\",\n        \"type\": \"object\",\n       \
        \ \"properties\": {\n          \"ip_address\": {\n            \"description\"\
        : \"ip_address\",\n            \"type\": \"string\"\n          },\n      \
        \    \"aliases\": {\n            \"type\": \"array\",\n            \"items\"\
        : {\n              \"description\": \"aliases\",\n              \"type\":\
        \ \"string\"\n            }\n          }\n        }\n      }\n    }\n  }\n\
        }"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
    request_body:
      schema: "{\n  \"description\": \"api_system_dns_config_patch\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"dns_servers\": {\n      \"type\"\
        : \"array\",\n      \"items\": {\n        \"description\": \"The list of DNS\
        \ servers associated with this DNS configuration.\",\n        \"type\": \"\
        string\"\n      }\n    },\n    \"dns_search_domains\": {\n      \"type\":\
        \ \"array\",\n      \"items\": {\n        \"description\": \"The list of DNS\
        \ search domains associated with this DNS configuration.\",\n        \"type\"\
        : \"string\"\n      }\n    }\n  }\n}"
rest_endpoint: /v1/dns/configs/system
api_version: v1
permalink: /rest-api-guide/dns-config-methods-v1/dns_configs_system.html
sidebar: rest_api_guide_sidebar
redirect_from: /rest-api-guide/dns-config-methods/dns_configs_system.html
deprecated: false
---
