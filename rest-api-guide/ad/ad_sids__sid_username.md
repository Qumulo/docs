---
category: /ad
methods:
  get:
    parameters:
    - description: The SID to use to looukup a username
      name: sid
      required: true
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Return the Username for the given SID as found by querying the domain
      controller for the domain the cluster is joined to.
rest_endpoint: /v1/ad/sids/{sid}/username
permalink: /rest-api-guide/ad/ad_sids__sid_username.html
sidebar: rest_api_guide_sidebar
---
