---
category: /network
methods:
  get:
    parameters:
    - description: Netmask to apply to the try and/or floating range arguments, overriding
        whatever is currently configured. Required if network is currently in DHCP
        mode.
      name: netmask
      required: false
    - description: Comma-separated static IP range(s) to try. Defaults to currently
        configured static IP range.
      name: try
      required: false
    - description: Comma-separated floating IP range(s) to try. Defaults to currently
        configured floating IP range.
      name: floating
      required: false
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Returns total/used/available numbers of IPs based on the current network
      configuration. Returns status code 400 if the server is in DHCP mode unless
      the try/floating query parameters are provided.
rest_endpoint: /v1/network/static-ip-allocation
permalink: /rest-api-guide/network/static-ip-allocation.html
sidebar: rest_api_command_guide_sidebar
---
