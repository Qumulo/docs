---
category: /Active Directory V1
methods:
  get:
    summary: Return the SIDs for the given UID as found by issuing an AD query against
      the current domain the cluster is joined to.
    parameters:
    - name: uid
      description: The UID to use to look up its SIDs
      required: true
    response_body:
      schema: "{\n  \"type\": \"array\",\n  \"items\": {\n    \"type\": \"string\"\
        \n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
rest_endpoint: /v1/ad/uids/{uid}/sids/
api_version: v1
permalink: /rest-api-guide/active-directory-v1/ad_uids_uid_sids.html
sidebar: rest_api_guide_sidebar
redirect_from: /rest-api-guide/active-directory/ad_uids_uid_sids.html
---
