---
category: /Shutdown
methods:
  post:
    parameters:
    - description: URI parameter node_id
      name: node_id
      required: true
    preview: false
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    summary: Reboot a single node.
rest_endpoint: /v1/shutdown/reboot/{node_id}
api_version: v1
permalink: /rest-api-guide/shutdown/shutdown_reboot_node_id.html
sidebar: rest_api_guide_sidebar
---
