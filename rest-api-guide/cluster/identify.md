---
category: /cluster
methods:
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
rest_endpoint: /v1/cluster/nodes/{id}/identify
permalink: /rest-api-guide/cluster/identify.html
sidebar: rest_api_guide_sidebar
---
