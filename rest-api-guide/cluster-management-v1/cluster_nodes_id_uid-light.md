---
category: /Cluster Management V1
methods:
  get:
    summary: Status of the identification (UID) light for this node.
    parameters:
    - name: id
      description: The unique ID of the node
      required: true
    response_body:
      schema: "{\n  \"description\": \"api_node_uid_light\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"light_visible\": {\n      \"description\": \"\
        Visibility of the node identifier light\",\n      \"type\": \"boolean\"\n\
        \    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
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
rest_endpoint: /v1/cluster/nodes/{id}/uid-light
api_version: v1
permalink: /rest-api-guide/cluster-management-v1/cluster_nodes_id_uid-light.html
sidebar: rest_api_guide_sidebar
redirect_from: /rest-api-guide/cluster-management/cluster_nodes_id_uid-light.html
---
