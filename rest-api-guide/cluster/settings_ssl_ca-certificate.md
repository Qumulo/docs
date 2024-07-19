---
category: /cluster
methods:
  delete:
    parameters:
    - description: ETag for expected version
      name: If-Match
      required: false
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    summary: Delete the SSL certificate authority the cluster trusts when authenticating
      outbound connections.
  get:
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"api_cluster_ssl_ca_certificate_settings\",\n\
        \  \"type\": \"object\",\n  \"properties\": {\n    \"ca_certificate\": {\n\
        \      \"description\": \"Public certificate of the certificate authority\
        \ to trust for outbound connections\",\n      \"type\": \"string\"\n    }\n\
        \  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Get the SSL certificate authority the cluster trusts when authenticating
      outbound connections.
  put:
    parameters:
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
      schema: "{\n  \"description\": \"api_cluster_ssl_ca_certificate_settings\",\n\
        \  \"type\": \"object\",\n  \"properties\": {\n    \"ca_certificate\": {\n\
        \      \"description\": \"Public certificate of the certificate authority\
        \ to trust for outbound connections\",\n      \"type\": \"string\"\n    }\n\
        \  }\n}"
    response_body:
      schema: "{\n  \"description\": \"api_cluster_ssl_ca_certificate_settings\",\n\
        \  \"type\": \"object\",\n  \"properties\": {\n    \"ca_certificate\": {\n\
        \      \"description\": \"Public certificate of the certificate authority\
        \ to trust for outbound connections\",\n      \"type\": \"string\"\n    }\n\
        \  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Set the SSL certificate authority the cluster trusts when authenticating
      outbound connections.
rest_endpoint: /v2/cluster/settings/ssl/ca-certificate
api_version: v2
permalink: /rest-api-guide/cluster/settings_ssl_ca-certificate.html
sidebar: rest_api_guide_sidebar
---
