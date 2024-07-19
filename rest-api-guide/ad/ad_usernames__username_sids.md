---
category: /ad
methods:
  get:
    parameters:
    - description: The username to use to look up SIDs
      name: username
      required: true
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Return the SIDs for the given username as found by querying the domain
      controller for the domain the cluster is joined to.
rest_endpoint: /v1/ad/usernames/{username}/sids/
permalink: /rest-api-guide/ad/ad_usernames__username_sids.html
sidebar: rest_api_guide_sidebar
---