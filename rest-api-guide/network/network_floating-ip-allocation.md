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
sidebar: rest_api_command_guide_sidebar
---
