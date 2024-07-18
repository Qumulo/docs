---
category: /ad
methods:
  get:
    parameters:
    - description: The GID to use to look up its SIDs
      name: gid
      required: true
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Return the SIDs for the given GID as found by issuing an AD query against
      the current domain the cluster is joined to.
rest_endpoint: /v1/ad/gids/{gid}/sids/
permalink: /rest-api-guide/ad/sids.html
sidebar: rest_api_guide_sidebar
---
