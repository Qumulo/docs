---
category: /ad
methods:
  get:
    parameters:
    - description: The group SID to use to look up a GID
      name: sid
      required: true
    response_body:
      schema: "{\n  \"description\": \"api_ad_gid\",\n  \"type\": \"object\",\n  \"\
        properties\": {\n    \"gid\": {\n      \"description\": \"gid\",\n      \"\
        type\": \"number\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Return the GID for the given group SID as found by issuing an AD query
      against the current domain the cluster is joined to.
rest_endpoint: /v1/ad/sids/{sid}/gid
api_version: v1
permalink: /rest-api-guide/ad/sids_sid_gid.html
sidebar: rest_api_guide_sidebar
---
