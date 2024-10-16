---
category: /Cluster Settings
methods:
  get:
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"api_cluster_ssl_ciphers\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"tls_1_2\": {\n      \"type\": \"array\"\
        ,\n      \"items\": {\n        \"description\": \"Cipher suites for the TLS\
        \ 1.2 protocol\",\n        \"type\": \"string\"\n      }\n    },\n    \"tls_1_3\"\
        : {\n      \"type\": \"array\",\n      \"items\": {\n        \"description\"\
        : \"Cipher suites for the TLS 1.3 protocol\",\n        \"type\": \"string\"\
        \n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Get the SSL cipher suites that are accepted for TLS 1.2 and TLS 1.3 connections.
  put:
    parameters:
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
      schema: "{\n  \"description\": \"api_cluster_ssl_ciphers\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"tls_1_2\": {\n      \"type\": \"array\"\
        ,\n      \"items\": {\n        \"description\": \"Cipher suites for the TLS\
        \ 1.2 protocol\",\n        \"type\": \"string\"\n      }\n    },\n    \"tls_1_3\"\
        : {\n      \"type\": \"array\",\n      \"items\": {\n        \"description\"\
        : \"Cipher suites for the TLS 1.3 protocol\",\n        \"type\": \"string\"\
        \n      }\n    }\n  }\n}"
    response_body:
      schema: "{\n  \"description\": \"api_cluster_ssl_ciphers\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"tls_1_2\": {\n      \"type\": \"array\"\
        ,\n      \"items\": {\n        \"description\": \"Cipher suites for the TLS\
        \ 1.2 protocol\",\n        \"type\": \"string\"\n      }\n    },\n    \"tls_1_3\"\
        : {\n      \"type\": \"array\",\n      \"items\": {\n        \"description\"\
        : \"Cipher suites for the TLS 1.3 protocol\",\n        \"type\": \"string\"\
        \n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Set the SSL cipher suites that are accepted for TLS 1.2 and TLS 1.3 connections.
      Note that ciphers required by Qumulo Core to function cannot be removed.
rest_endpoint: /v2/cluster/settings/ssl/ciphers
api_version: v2
permalink: /rest-api-guide/cluster-settings/v2_cluster_settings_ssl_ciphers.html
sidebar: rest_api_guide_sidebar
---
