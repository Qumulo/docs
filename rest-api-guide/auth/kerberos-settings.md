---
category: /auth
methods:
  get:
    parameters: []
    response_body:
      description: Return value on success
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"kerberos_config\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"use_alt_security_identities_mapping\": {\n \
        \     \"description\": \"use_alt_security_identities_mapping\",\n      \"\
        type\": \"boolean\"\n    }\n  }\n}"
      status_code: '200'
    summary: Get the Kerberos settings
  put:
    parameters:
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"kerberos_config\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"use_alt_security_identities_mapping\": {\n \
        \     \"description\": \"use_alt_security_identities_mapping\",\n      \"\
        type\": \"boolean\"\n    }\n  }\n}"
    response_body:
      description: Return value on success
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"kerberos_config\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"use_alt_security_identities_mapping\": {\n \
        \     \"description\": \"use_alt_security_identities_mapping\",\n      \"\
        type\": \"boolean\"\n    }\n  }\n}"
      status_code: '200'
    summary: Set the Kerberos settings
rest_endpoint: /v1/auth/kerberos-settings
permalink: /rest-api-guide/auth/kerberos-settings.html
sidebar: rest_api_guide_sidebar
---
