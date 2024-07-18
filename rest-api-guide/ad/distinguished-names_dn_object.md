---
category: /ad
methods:
  get:
    parameters:
    - description: The distinguished name to use to look up an AD user or group.
      name: dn
      required: true
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Return the AD account object that has the given distinguished name.
rest_endpoint: /v1/ad/distinguished-names/{dn}/object
permalink: /rest-api-guide/ad/distinguished-names_dn_object.html
sidebar: rest_api_guide_sidebar
---
