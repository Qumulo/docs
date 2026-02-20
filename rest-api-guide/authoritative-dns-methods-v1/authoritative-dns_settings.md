---
category: /Authoritative DNS Methods V1
methods:
  get:
    summary: Retrieve current Authoritative DNS Configuration
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"authoritative_dns_config\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"enabled\": {\n      \"description\"\
        : \"enabled\",\n      \"type\": \"boolean\"\n    },\n    \"fqdn\": {\n   \
        \   \"description\": \"fqdn\",\n      \"type\": \"string\"\n    },\n    \"\
        host_restrictions\": {\n      \"description\": \"host_restrictions\",\n  \
        \    \"type\": \"string\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
  patch:
    summary: Modify current Authoritative DNS configuration.
    parameters:
    - name: If-Match
      description: ETag for expected version
      required: false
    response_body:
      schema: "{\n  \"description\": \"authoritative_dns_config\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"enabled\": {\n      \"description\"\
        : \"enabled\",\n      \"type\": \"boolean\"\n    },\n    \"fqdn\": {\n   \
        \   \"description\": \"fqdn\",\n      \"type\": \"string\"\n    },\n    \"\
        host_restrictions\": {\n      \"description\": \"host_restrictions\",\n  \
        \    \"type\": \"string\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
    request_body:
      schema: "{\n  \"description\": \"api_authoritative_dns_config_patch\",\n  \"\
        type\": \"object\",\n  \"properties\": {\n    \"enabled\": {\n      \"description\"\
        : \"enabled\",\n      \"type\": \"boolean\"\n    },\n    \"fqdn\": {\n   \
        \   \"description\": \"fqdn\",\n      \"type\": \"string\"\n    },\n    \"\
        host_restrictions\": {\n      \"description\": \"host_restrictions\",\n  \
        \    \"type\": \"string\"\n    }\n  }\n}"
rest_endpoint: /v1/authoritative-dns/settings
api_version: v1
permalink: /rest-api-guide/authoritative-dns-methods-v1/authoritative-dns_settings.html
sidebar: rest_api_guide_sidebar
deprecated: false
---
