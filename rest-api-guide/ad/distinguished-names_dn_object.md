---
category: /ad
methods:
  get:
    parameters:
    - description: The distinguished name to use to look up an AD user or group.
      name: dn
      required: true
    response_body:
      schema: "{\n  \"description\": \"ad_ldap_object\",\n  \"type\": \"object\",\n\
        \  \"properties\": {\n    \"dn\": {\n      \"description\": \"dn\",\n    \
        \  \"type\": \"string\"\n    },\n    \"sid\": {\n      \"description\": \"\
        sid\",\n      \"type\": \"string\"\n    },\n    \"uid\": {\n      \"description\"\
        : \"uid\",\n      \"type\": \"number\"\n    },\n    \"gid\": {\n      \"description\"\
        : \"gid\",\n      \"type\": \"number\"\n    },\n    \"name\": {\n      \"\
        description\": \"name\",\n      \"type\": \"string\"\n    },\n    \"groups\"\
        : {\n      \"type\": \"array\",\n      \"items\": {\n        \"description\"\
        : \"groups\",\n        \"type\": \"string\"\n      }\n    },\n    \"primary_group_sid\"\
        : {\n      \"description\": \"primary_group_sid\",\n      \"type\": \"string\"\
        \n    },\n    \"classes\": {\n      \"type\": \"array\",\n      \"items\"\
        : {\n        \"description\": \"classes\",\n        \"type\": \"string\"\n\
        \      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Return the AD account object that has the given distinguished name.
rest_endpoint: /v1/ad/distinguished-names/{dn}/object
api_version: v1
permalink: /rest-api-guide/ad/distinguished-names_dn_object.html
sidebar: rest_api_guide_sidebar
---
