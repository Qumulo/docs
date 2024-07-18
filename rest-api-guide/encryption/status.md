---
category: /encryption
methods:
  get:
    parameters: []
    response_body:
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"encryption_status_api_response\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"status\": {\n      \"type\": \"\
        string\",\n      \"enum\": [\n        \"Encrypted\",\n        \"Not Encrypted\"\
        \n      ],\n      \"description\": \"Whether or not encryption at rest is\
        \ enabled:\\n * `Encrypted` - ENCRYPTION_STATUS_ENCRYPTED,\\n * `Not Encrypted`\
        \ - ENCRYPTION_STATUS_NOT_ENCRYPTED\"\n    },\n    \"last_key_rotation_time\"\
        : {\n      \"description\": \"When encryption at rest is enabled, the time\
        \ at which the current master key became active\",\n      \"type\": \"string\"\
        \n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: View the status of encryption at rest.
rest_endpoint: /v1/encryption/status
permalink: /rest-api-guide/encryption/status.html
sidebar: rest_api_guide_sidebar
---
