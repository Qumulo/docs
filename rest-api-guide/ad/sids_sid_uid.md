---
category: /ad
methods:
  get:
    parameters:
    - description: The SID to use to look up a UID
      name: sid
      required: true
    response_body:
      schema: "{\n  \"description\": \"api_ad_uid\",\n  \"type\": \"object\",\n  \"\
        properties\": {\n    \"uid\": {\n      \"description\": \"uid\",\n      \"\
        type\": \"number\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Return the UID for the given SID as found by issuing an AD query against
      the current domain the cluster is joined to.
rest_endpoint: /v1/ad/sids/{sid}/uid
permalink: /rest-api-guide/ad/sids_sid_uid.html
sidebar: rest_api_guide_sidebar
---
