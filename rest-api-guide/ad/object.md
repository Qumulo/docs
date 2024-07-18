---
category: /ad
methods:
  get:
    parameters:
    - description: The SID to use to look up an AD user or group.
      name: sid
      required: true
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Return the AD account object that has the given SID.
rest_endpoint: /v1/ad/sids/{sid}/object
permalink: /rest-api-guide/ad/object.html
sidebar: rest_api_command_guide_sidebar
---
