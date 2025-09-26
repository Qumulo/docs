---
category: /Active Directory V1
methods:
  get:
    summary: Return the UID for the given SID as found by issuing an AD query against
      the current domain the cluster is joined to.
    parameters:
    - name: sid
      description: The SID to use to look up a UID
      required: true
    response_body:
      schema: "{\n  \"description\": \"api_ad_uid\",\n  \"type\": \"object\",\n  \"\
        properties\": {\n    \"uid\": {\n      \"description\": \"uid\",\n      \"\
        type\": \"number\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
rest_endpoint: /v1/ad/sids/{sid}/uid
api_version: v1
permalink: /rest-api-guide/active-directory-v1/ad_sids_sid_uid.html
sidebar: rest_api_guide_sidebar
redirect_from: /rest-api-guide/active-directory/ad_sids_sid_uid.html
---
