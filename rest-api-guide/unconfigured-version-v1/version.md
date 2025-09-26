---
category: /Unconfigured Version V1
methods:
  get:
    summary: Retrieve the version of the appliance.
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"api_version_info\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"revision_id\": {\n      \"description\": \"\
        revision_id\",\n      \"type\": \"string\"\n    },\n    \"build_id\": {\n\
        \      \"description\": \"build_id\",\n      \"type\": \"string\"\n    },\n\
        \    \"flavor\": {\n      \"description\": \"flavor\",\n      \"type\": \"\
        string\"\n    },\n    \"build_date\": {\n      \"description\": \"build_date\"\
        ,\n      \"type\": \"string\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
rest_endpoint: /v1/version
api_version: v1
permalink: /rest-api-guide/unconfigured-version-v1/version.html
sidebar: rest_api_guide_sidebar
redirect_from: /rest-api-guide/unconfigured-version/version.html
---
