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
      schema: "{\n  \"description\": \"api_static_ip_allocation_summary\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"total_ips\": {\n      \"description\"\
        : \"Total number of IP addresses in the given IP ranges\",\n      \"type\"\
        : \"number\"\n    },\n    \"used_ips\": {\n      \"description\": \"Number\
        \ of IP addresses currently assigned to nodes\",\n      \"type\": \"number\"\
        \n    },\n    \"available_ips\": {\n      \"description\": \"Number of IP\
        \ addresses available; can be negative\",\n      \"type\": \"number\"\n  \
        \  },\n    \"total_floating_ips\": {\n      \"description\": \"Total floating\
        \ ips\",\n      \"type\": \"number\"\n    },\n    \"surplus_floating_ips\"\
        : {\n      \"description\": \"Floating ip count too small or large\",\n  \
        \    \"type\": \"number\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Returns total/used/available numbers of IPs based on the current network
      configuration. Returns status code 400 if the server is in DHCP mode unless
      the try/floating query parameters are provided.
rest_endpoint: /v1/network/static-ip-allocation
permalink: /rest-api-guide/network/static-ip-allocation.html
sidebar: rest_api_guide_sidebar
---
