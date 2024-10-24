---
category: /Upgrade
methods:
  post:
    parameters: []
    request_body:
      schema: "{\n  \"description\": \"api_verify_request\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"image_path\": {\n      \"description\": \"image_path\"\
        ,\n      \"type\": \"string\"\n    }\n  }\n}"
    response_body:
      schema: "{\n  \"description\": \"upgrade_verify_result\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"target_version\": {\n      \"description\":\
        \ \"target_version\",\n      \"type\": \"string\"\n    },\n    \"upgrade_type\"\
        : {\n      \"type\": \"string\",\n      \"enum\": [\n        \"SOFTWARE_ONLY\"\
        ,\n        \"SOFTWARE_AND_PLATFORM\"\n      ],\n      \"description\": \"\
        upgrade_type:\\n * `SOFTWARE_AND_PLATFORM` - SOFTWARE_AND_PLATFORM,\\n * `SOFTWARE_ONLY`\
        \ - SOFTWARE_ONLY\"\n    },\n    \"error\": {\n      \"description\": \"error\"\
        ,\n      \"type\": \"string\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Verify that the given image can be used to upgrade the cluster and retrieve
      details about the upgrade that will occur.
rest_endpoint: /v2/upgrade/verify-image
api_version: v2
permalink: /rest-api-guide/upgrade/v2_upgrade_verify-image.html
sidebar: rest_api_guide_sidebar
---
