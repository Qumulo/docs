---
category: /Active Directory
methods:
  get:
    parameters:
    - description: The UID to use to look up its SIDs
      name: uid
      required: true
    response_body:
      schema: "{\n  \"type\": \"array\",\n  \"items\": {\n    \"type\": \"string\"\
        \n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Return the SIDs for the given UID as found by issuing an AD query against
      the current domain the cluster is joined to.
rest_endpoint: /v1/ad/uids/{uid}/sids/
api_version: v1
permalink: /rest-api-guide/active-directory/ad_uids_uid_sids.html
sidebar: rest_api_guide_sidebar
---
