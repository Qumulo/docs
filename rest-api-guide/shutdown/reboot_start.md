---
category: /shutdown
methods:
  post:
    parameters: []
    request_body:
      schema: "{\n  \"description\": \"api_reboot_start_options\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"is_rolling\": {\n      \"description\"\
        : \"If true, kick off a rolling reboot, otherwise do it concurrently. Defaults\
        \ to false\",\n      \"type\": \"boolean\"\n    },\n    \"num_nodes_to_reboot\"\
        : {\n      \"description\": \"If the number of nodes to reboot is configured\
        \ and rolling reboot is enabled, your cluster reboots the specified number\
        \ of nodes at a time. The number of nodes must be greater than 0 and less\
        \ than or equal to the number of node failures that your cluster permits.\
        \ By default, the value is the number of permitted node failures minus 1 (1\
        \ node minimum).\",\n      \"type\": \"number\"\n    }\n  }\n}"
    response_body: {}
    responses:
    - code: '202'
      description: Return value on success
    summary: Start a reboot cycle with the Reboot Manager system.
rest_endpoint: /v1/shutdown/reboot/start
api_version: v1
permalink: /rest-api-guide/shutdown/reboot_start.html
sidebar: rest_api_guide_sidebar
---
