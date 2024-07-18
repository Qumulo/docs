---
category: /dns
methods:
  get:
    parameters: []
    response_body:
      description: Return value on success
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"api_dns_lookup_override_config\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"lookup_overrides\": {\n      \"\
        type\": \"array\",\n      \"items\": {\n        \"description\": \"lookup_overrides\"\
        ,\n        \"type\": \"object\",\n        \"properties\": {\n          \"\
        ip_address\": {\n            \"description\": \"ip_address\",\n          \
        \  \"type\": \"string\"\n          },\n          \"aliases\": {\n        \
        \    \"type\": \"array\",\n            \"items\": {\n              \"description\"\
        : \"aliases\",\n              \"type\": \"string\"\n            }\n      \
        \    }\n        }\n      }\n    }\n  }\n}"
      status_code: '200'
    summary: List the DNS lookup overrides configured on the cluster. These rules
      override any lookup results from the configured DNS servers and serve as static
      mappings between IP address and hostname
  put:
    parameters:
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"api_dns_lookup_override_config\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"lookup_overrides\": {\n      \"\
        type\": \"array\",\n      \"items\": {\n        \"description\": \"lookup_overrides\"\
        ,\n        \"type\": \"object\",\n        \"properties\": {\n          \"\
        ip_address\": {\n            \"description\": \"ip_address\",\n          \
        \  \"type\": \"string\"\n          },\n          \"aliases\": {\n        \
        \    \"type\": \"array\",\n            \"items\": {\n              \"description\"\
        : \"aliases\",\n              \"type\": \"string\"\n            }\n      \
        \    }\n        }\n      }\n    }\n  }\n}"
    response_body:
      description: Return value on success
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"api_dns_lookup_override_config\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"lookup_overrides\": {\n      \"\
        type\": \"array\",\n      \"items\": {\n        \"description\": \"lookup_overrides\"\
        ,\n        \"type\": \"object\",\n        \"properties\": {\n          \"\
        ip_address\": {\n            \"description\": \"ip_address\",\n          \
        \  \"type\": \"string\"\n          },\n          \"aliases\": {\n        \
        \    \"type\": \"array\",\n            \"items\": {\n              \"description\"\
        : \"aliases\",\n              \"type\": \"string\"\n            }\n      \
        \    }\n        }\n      }\n    }\n  }\n}"
      status_code: '200'
    summary: Overwrite the DNS lookup overrides configured on the cluster. These rules
      override any lookup results from the configured DNS servers and serve as static
      mappings between IP address and hostname
rest_endpoint: /v1/dns/lookup-override-config
permalink: /rest-api-guide/dns/lookup-override-config.html
sidebar: rest_api_guide_sidebar
---
