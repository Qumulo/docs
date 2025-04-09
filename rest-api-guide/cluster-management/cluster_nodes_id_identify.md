---
category: /Cluster Management
methods:
  post:
    summary: Turn the identification light on the node on or off. There may be a slight
      delay for the change to take effect.
    parameters:
    - name: id
      description: The unique ID of the node
      required: true
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    preview: false
    request_body:
      schema: "{\n  \"description\": \"api_node_uid_light\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"light_visible\": {\n      \"description\": \"\
        Visibility of the node identifier light\",\n      \"type\": \"boolean\"\n\
        \    }\n  }\n}"
rest_endpoint: /v1/cluster/nodes/{id}/identify
api_version: v1
permalink: /rest-api-guide/cluster-management/cluster_nodes_id_identify.html
sidebar: rest_api_guide_sidebar
---
