---
category: /cluster
methods:
  get:
    parameters:
    - description: The unique ID of the disk slot
      name: id
      required: true
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Retrieve info about the disk slot, such as its capacity, type, model,
      etc.
  patch:
    parameters:
    - description: The unique ID of the disk slot
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
    summary: Control the slot's locate LED.
rest_endpoint: /v1/cluster/slots/{id}
permalink: /rest-api-guide/cluster/slots_id.html
sidebar: rest_api_guide_sidebar
---
