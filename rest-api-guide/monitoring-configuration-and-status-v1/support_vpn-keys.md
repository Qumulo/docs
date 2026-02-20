---
category: /Monitoring Configuration and Status V1
methods:
  get:
    summary: Get VPN keys.
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"vpn_keys\",\n  \"type\": \"object\",\n  \"\
        properties\": {\n    \"mqvpn_client_crt\": {\n      \"description\": \"mqvpn_client_crt\"\
        ,\n      \"type\": \"string\"\n    },\n    \"mqvpn_client_key\": {\n     \
        \ \"description\": \"mqvpn_client_key\",\n      \"type\": \"string\"\n   \
        \ },\n    \"qumulo_ca_crt\": {\n      \"description\": \"qumulo_ca_crt\",\n\
        \      \"type\": \"string\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
  put:
    summary: Set VPN keys.
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"vpn_keys\",\n  \"type\": \"object\",\n  \"\
        properties\": {\n    \"mqvpn_client_crt\": {\n      \"description\": \"mqvpn_client_crt\"\
        ,\n      \"type\": \"string\"\n    },\n    \"mqvpn_client_key\": {\n     \
        \ \"description\": \"mqvpn_client_key\",\n      \"type\": \"string\"\n   \
        \ },\n    \"qumulo_ca_crt\": {\n      \"description\": \"qumulo_ca_crt\",\n\
        \      \"type\": \"string\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
    request_body:
      schema: "{\n  \"description\": \"vpn_keys\",\n  \"type\": \"object\",\n  \"\
        properties\": {\n    \"mqvpn_client_crt\": {\n      \"description\": \"mqvpn_client_crt\"\
        ,\n      \"type\": \"string\"\n    },\n    \"mqvpn_client_key\": {\n     \
        \ \"description\": \"mqvpn_client_key\",\n      \"type\": \"string\"\n   \
        \ },\n    \"qumulo_ca_crt\": {\n      \"description\": \"qumulo_ca_crt\",\n\
        \      \"type\": \"string\"\n    }\n  }\n}"
  patch:
    summary: Set VPN keys.
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"vpn_keys\",\n  \"type\": \"object\",\n  \"\
        properties\": {\n    \"mqvpn_client_crt\": {\n      \"description\": \"mqvpn_client_crt\"\
        ,\n      \"type\": \"string\"\n    },\n    \"mqvpn_client_key\": {\n     \
        \ \"description\": \"mqvpn_client_key\",\n      \"type\": \"string\"\n   \
        \ },\n    \"qumulo_ca_crt\": {\n      \"description\": \"qumulo_ca_crt\",\n\
        \      \"type\": \"string\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
    request_body:
      schema: "{\n  \"description\": \"vpn_keys_patch\",\n  \"type\": \"object\",\n\
        \  \"properties\": {\n    \"mqvpn_client_crt\": {\n      \"description\":\
        \ \"mqvpn_client_crt\",\n      \"type\": \"string\"\n    },\n    \"mqvpn_client_key\"\
        : {\n      \"description\": \"mqvpn_client_key\",\n      \"type\": \"string\"\
        \n    },\n    \"qumulo_ca_crt\": {\n      \"description\": \"qumulo_ca_crt\"\
        ,\n      \"type\": \"string\"\n    }\n  }\n}"
rest_endpoint: /v1/support/vpn-keys
api_version: v1
permalink: /rest-api-guide/monitoring-configuration-and-status-v1/support_vpn-keys.html
sidebar: rest_api_guide_sidebar
redirect_from: /rest-api-guide/monitoring-configuration-and-status/support_vpn-keys.html
deprecated: false
---
