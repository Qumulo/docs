---
category: /ad
methods:
  get:
    parameters:
    - description: The SID to use to look up a UID
      name: sid
      required: true
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Return the UID for the given SID as found by issuing an AD query against
      the current domain the cluster is joined to.
rest_endpoint: /v1/ad/sids/{sid}/uid
permalink: /rest-api-guide/ad/ad_sids__sid_uid.html
sidebar: rest_api_guide_sidebar
---
