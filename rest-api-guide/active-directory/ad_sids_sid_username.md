---
category: /Active Directory
methods:
  get:
    summary: Return the Username for the given SID as found by querying the domain
      controller for the domain the cluster is joined to.
    parameters:
    - name: sid
      description: The SID to use to looukup a username
      required: true
    response_body:
      schema: "{\n  \"type\": \"string\"\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
rest_endpoint: /v1/ad/sids/{sid}/username
api_version: v1
permalink: /rest-api-guide/active-directory/ad_sids_sid_username.html
sidebar: rest_api_guide_sidebar
---
