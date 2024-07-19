---
category: /network
methods:
  get:
    parameters: []
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Returns floating IPs per node distribution based on the current network
      configuration. Returns status code 400 if the server is in DHCP mode.
rest_endpoint: /v1/network/floating-ip-allocation
permalink: /rest-api-guide/network/network_floating-ip-allocation.html
sidebar: rest_api_guide_sidebar
---