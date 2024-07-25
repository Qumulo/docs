---
category: /Active Directory
methods:
  get:
    parameters:
    - description: The sAMAccountName to use to look up AD users or groups.
      name: username
      required: true
    response_body:
      schema: "{\n  \"type\": \"array\",\n  \"items\": {\n    \"description\": \"\
        ad_ldap_object\",\n    \"type\": \"object\",\n    \"properties\": {\n    \
        \  \"dn\": {\n        \"description\": \"dn\",\n        \"type\": \"string\"\
        \n      },\n      \"sid\": {\n        \"description\": \"sid\",\n        \"\
        type\": \"string\"\n      },\n      \"uid\": {\n        \"description\": \"\
        uid\",\n        \"type\": \"number\"\n      },\n      \"gid\": {\n       \
        \ \"description\": \"gid\",\n        \"type\": \"number\"\n      },\n    \
        \  \"name\": {\n        \"description\": \"name\",\n        \"type\": \"string\"\
        \n      },\n      \"groups\": {\n        \"type\": \"array\",\n        \"\
        items\": {\n          \"description\": \"groups\",\n          \"type\": \"\
        string\"\n        }\n      },\n      \"primary_group_sid\": {\n        \"\
        description\": \"primary_group_sid\",\n        \"type\": \"string\"\n    \
        \  },\n      \"classes\": {\n        \"type\": \"array\",\n        \"items\"\
        : {\n          \"description\": \"classes\",\n          \"type\": \"string\"\
        \n        }\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Return any AD account objects that have the given sAMAccountName.
rest_endpoint: /v1/ad/usernames/{username}/objects/
api_version: v1
permalink: /rest-api-guide/active-directory/ad_usernames_username_objects.html
sidebar: rest_api_guide_sidebar
---
