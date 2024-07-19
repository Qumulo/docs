---
category: /ad
methods:
  get:
    parameters:
    - description: The SID to use to look up the SIDs of all the groups that this
        SID belongs to (this includes all nested groups).
      name: sid
      required: true
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Return the SIDs of all the groups that the given SID is a member of,
      (including all nested groups).
rest_endpoint: /v1/ad/sids/{sid}/expanded-groups/
permalink: /rest-api-guide/ad/ad_sids__sid_expanded-groups.html
sidebar: rest_api_guide_sidebar
---