---
category: /Cluster Settings
methods:
  put:
    summary: Set the SSL certificate authority the cluster trusts when authenticating
      outbound connections.
    parameters:
    - name: If-Match
      description: ETag for expected version
      required: false
    response_body:
      schema: "{\n  \"description\": \"api_cluster_ssl_ca_certificate_settings\",\n\
        \  \"type\": \"object\",\n  \"properties\": {\n    \"ca_certificate\": {\n\
        \      \"description\": \"Public certificate of the certificate authority\
        \ to trust for outbound connections\",\n      \"type\": \"string\"\n    }\n\
        \  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
    request_body:
      schema: "{\n  \"description\": \"api_cluster_ssl_ca_certificate_settings\",\n\
        \  \"type\": \"object\",\n  \"properties\": {\n    \"ca_certificate\": {\n\
        \      \"description\": \"Public certificate of the certificate authority\
        \ to trust for outbound connections\",\n      \"type\": \"string\"\n    }\n\
        \  }\n}"
  get:
    summary: Get the SSL certificate authority the cluster trusts when authenticating
      outbound connections.
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
    preview: false
  delete:
    summary: Delete the SSL certificate authority the cluster trusts when authenticating
      outbound connections.
    parameters:
    - name: If-Match
      description: ETag for expected version
      required: false
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    preview: false
rest_endpoint: /v2/cluster/settings/ssl/ca-certificate
api_version: v2
permalink: /rest-api-guide/cluster-settings/v2_cluster_settings_ssl_ca-certificate.html
sidebar: rest_api_guide_sidebar
---
