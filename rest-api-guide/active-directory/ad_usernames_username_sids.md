---
category: /Active Directory
methods:
  get:
    parameters:
    - description: The username to use to look up SIDs
      name: username
      required: true
    response_body:
      schema: "{\n  \"type\": \"array\",\n  \"items\": {\n    \"type\": \"string\"\
        \n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Return the SIDs for the given username as found by querying the domain
      controller for the domain the cluster is joined to.
rest_endpoint: /v1/ad/usernames/{username}/sids/
api_version: v1
permalink: /rest-api-guide/active-directory/ad_usernames_username_sids.html
sidebar: rest_api_guide_sidebar
---
