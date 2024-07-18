---
category: /support
methods:
  get:
    parameters: []
    response_body:
      description: Return value on success
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"vpn_keys\",\n  \"type\": \"object\",\n  \"\
        properties\": {\n    \"mqvpn_client_crt\": {\n      \"description\": \"mqvpn_client_crt\"\
        ,\n      \"type\": \"string\"\n    },\n    \"mqvpn_client_key\": {\n     \
        \ \"description\": \"mqvpn_client_key\",\n      \"type\": \"string\"\n   \
        \ },\n    \"qumulo_ca_crt\": {\n      \"description\": \"qumulo_ca_crt\",\n\
        \      \"type\": \"string\"\n    }\n  }\n}"
      status_code: '200'
    summary: Get VPN keys.
  patch:
    parameters: []
    request_body:
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"vpn_keys_patch\",\n  \"type\": \"object\",\n\
        \  \"properties\": {\n    \"mqvpn_client_crt\": {\n      \"description\":\
        \ \"mqvpn_client_crt\",\n      \"type\": \"string\"\n    },\n    \"mqvpn_client_key\"\
        : {\n      \"description\": \"mqvpn_client_key\",\n      \"type\": \"string\"\
        \n    },\n    \"qumulo_ca_crt\": {\n      \"description\": \"qumulo_ca_crt\"\
        ,\n      \"type\": \"string\"\n    }\n  }\n}"
    response_body:
      description: Return value on success
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"vpn_keys\",\n  \"type\": \"object\",\n  \"\
        properties\": {\n    \"mqvpn_client_crt\": {\n      \"description\": \"mqvpn_client_crt\"\
        ,\n      \"type\": \"string\"\n    },\n    \"mqvpn_client_key\": {\n     \
        \ \"description\": \"mqvpn_client_key\",\n      \"type\": \"string\"\n   \
        \ },\n    \"qumulo_ca_crt\": {\n      \"description\": \"qumulo_ca_crt\",\n\
        \      \"type\": \"string\"\n    }\n  }\n}"
      status_code: '200'
    summary: Set VPN keys.
  put:
    parameters: []
    request_body:
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"vpn_keys\",\n  \"type\": \"object\",\n  \"\
        properties\": {\n    \"mqvpn_client_crt\": {\n      \"description\": \"mqvpn_client_crt\"\
        ,\n      \"type\": \"string\"\n    },\n    \"mqvpn_client_key\": {\n     \
        \ \"description\": \"mqvpn_client_key\",\n      \"type\": \"string\"\n   \
        \ },\n    \"qumulo_ca_crt\": {\n      \"description\": \"qumulo_ca_crt\",\n\
        \      \"type\": \"string\"\n    }\n  }\n}"
    response_body:
      description: Return value on success
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"vpn_keys\",\n  \"type\": \"object\",\n  \"\
        properties\": {\n    \"mqvpn_client_crt\": {\n      \"description\": \"mqvpn_client_crt\"\
        ,\n      \"type\": \"string\"\n    },\n    \"mqvpn_client_key\": {\n     \
        \ \"description\": \"mqvpn_client_key\",\n      \"type\": \"string\"\n   \
        \ },\n    \"qumulo_ca_crt\": {\n      \"description\": \"qumulo_ca_crt\",\n\
        \      \"type\": \"string\"\n    }\n  }\n}"
      status_code: '200'
    summary: Set VPN keys.
rest_endpoint: /v1/support/vpn-keys
permalink: /rest-api-guide/support/vpn-keys.html
sidebar: rest_api_guide_sidebar
---
