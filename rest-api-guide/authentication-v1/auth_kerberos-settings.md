---
category: /Authentication V1
methods:
  get:
    summary: Get the Kerberos settings
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"kerberos_config\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"use_alt_security_identities_mapping\": {\n \
        \     \"description\": \"use_alt_security_identities_mapping\",\n      \"\
        type\": \"boolean\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
  put:
    summary: Set the Kerberos settings
    parameters:
    - name: If-Match
      description: ETag for expected version
      required: false
    response_body:
      schema: "{\n  \"description\": \"kerberos_config\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"use_alt_security_identities_mapping\": {\n \
        \     \"description\": \"use_alt_security_identities_mapping\",\n      \"\
        type\": \"boolean\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
    request_body:
      schema: "{\n  \"description\": \"kerberos_config\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"use_alt_security_identities_mapping\": {\n \
        \     \"description\": \"use_alt_security_identities_mapping\",\n      \"\
        type\": \"boolean\"\n    }\n  }\n}"
rest_endpoint: /v1/auth/kerberos-settings
api_version: v1
permalink: /rest-api-guide/authentication-v1/auth_kerberos-settings.html
sidebar: rest_api_guide_sidebar
redirect_from: /rest-api-guide/authentication/auth_kerberos-settings.html
deprecated: false
---
