---
category: /Shutdown V1
methods:
  post:
    summary: Restart the Qumulo Core container on a particular node.
    parameters:
    - name: node_id
      description: URI parameter node_id
      required: true
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    preview: false
rest_endpoint: /v1/shutdown/container-restart/{node_id}
api_version: v1
permalink: /rest-api-guide/shutdown-v1/shutdown_container-restart_node_id.html
sidebar: rest_api_guide_sidebar
redirect_from: /rest-api-guide/shutdown/shutdown_container-restart_node_id.html
deprecated: false
---
