---
category: /ad
methods:
  get:
    parameters:
    - description: The GID to use to look up its SIDs
      name: gid
      required: true
    response_body:
      schema: "{\n  \"type\": \"array\",\n  \"items\": {\n    \"type\": \"string\"\
        \n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Return the SIDs for the given GID as found by issuing an AD query against
      the current domain the cluster is joined to.
rest_endpoint: /v1/ad/gids/{gid}/sids/
permalink: /rest-api-guide/ad/gids_gid_sids.html
sidebar: rest_api_guide_sidebar
---
