---
category: /dns
methods:
  get:
    parameters: []
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
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
      example_value: TO DO
      schema: TO DO
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Overwrite the DNS lookup overrides configured on the cluster. These rules
      override any lookup results from the configured DNS servers and serve as static
      mappings between IP address and hostname
rest_endpoint: /v1/dns/lookup-override-config
permalink: /rest-api-guide/dns/dns_lookup-override-config.html
sidebar: rest_api_guide_sidebar
---