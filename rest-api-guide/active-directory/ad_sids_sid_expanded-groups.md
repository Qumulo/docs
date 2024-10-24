---
category: /Active Directory
methods:
  get:
    parameters:
    - description: The SID to use to look up the SIDs of all the groups that this
        SID belongs to (this includes all nested groups).
      name: sid
      required: true
    response_body:
      schema: "{\n  \"type\": \"array\",\n  \"items\": {\n    \"description\": \"\
        api_ad_group_sid\",\n    \"type\": \"object\",\n    \"properties\": {\n  \
        \    \"sid\": {\n        \"description\": \"sid\",\n        \"type\": \"string\"\
        \n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Return the SIDs of all the groups that the given SID is a member of,
      (including all nested groups).
rest_endpoint: /v1/ad/sids/{sid}/expanded-groups/
api_version: v1
permalink: /rest-api-guide/active-directory/ad_sids_sid_expanded-groups.html
sidebar: rest_api_guide_sidebar
---
