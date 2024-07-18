---
category: /cluster
methods:
  get:
    parameters:
    - description: The unique ID of the node
      name: id
      required: true
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Status of the identification (UID) light for this node.
  post:
    parameters:
    - description: The unique ID of the node
      name: id
      required: true
    request_body:
      example_value: TO DO
      schema: TO DO
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Turn the identification light on the node on or off. There may be a slight
      delay for the change to take effect.
rest_endpoint: /v1/cluster/nodes/{id}/uid-light
permalink: /rest-api-guide/cluster/uid-light.html
sidebar: rest_api_command_guide_sidebar
---
