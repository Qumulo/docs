---
category: /Monitoring Configuration and Status
methods:
  get:
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"api_certificate_signing_request\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"request\": {\n      \"description\"\
        : \"request\",\n      \"type\": \"string\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Get a certificate signing request for the generated private key. This
      returns empty if no private key was generated or if a manual private key is
      used.
rest_endpoint: /v1/support/vpn/key/certificate-signing-request
api_version: v1
permalink: /rest-api-guide/monitoring-configuration-and-status/support_vpn_key_certificate-signing-request.html
sidebar: rest_api_guide_sidebar
---
