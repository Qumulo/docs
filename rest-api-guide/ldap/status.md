---
category: /ldap
methods:
  get:
    parameters: []
    response_body:
      schema: "{\n  \"type\": \"array\",\n  \"items\": {\n    \"description\": \"\
        api_ldap_connection_state\",\n    \"type\": \"object\",\n    \"properties\"\
        : {\n      \"node_id\": {\n        \"description\": \"node_id\",\n       \
        \ \"type\": \"number\"\n      },\n      \"servers\": {\n        \"type\":\
        \ \"array\",\n        \"items\": {\n          \"description\": \"servers\"\
        ,\n          \"type\": \"object\",\n          \"properties\": {\n        \
        \    \"bind_uri\": {\n              \"description\": \"bind_uri\",\n     \
        \         \"type\": \"string\"\n            },\n            \"kdc_address\"\
        : {\n              \"description\": \"kdc_address\",\n              \"type\"\
        : \"string\"\n            }\n          }\n        }\n      },\n      \"bind_domain\"\
        : {\n        \"description\": \"bind_domain\",\n        \"type\": \"string\"\
        \n      },\n      \"bind_account\": {\n        \"description\": \"bind_account\"\
        ,\n        \"type\": \"string\"\n      },\n      \"base_dn_vec\": {\n    \
        \    \"type\": \"array\",\n        \"items\": {\n          \"description\"\
        : \"base_dn_vec\",\n          \"type\": \"string\"\n        }\n      },\n\
        \      \"health\": {\n        \"type\": \"string\",\n        \"enum\": [\n\
        \          \"NO_RECENT_ERROR\",\n          \"INTERMITTENT_ERROR\",\n     \
        \     \"SUSTAINED_ERROR\"\n        ],\n        \"description\": \"health:\\\
        n * `INTERMITTENT_ERROR` - LDAP_HEALTH_INTERMITTENT_ERROR,\\n * `NO_RECENT_ERROR`\
        \ - LDAP_HEALTH_NO_RECENT_ERROR,\\n * `SUSTAINED_ERROR` - LDAP_HEALTH_SUSTAINED_ERROR\"\
        \n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Get LDAP connection status if applicable.
rest_endpoint: /v1/ldap/status
api_version: v1
permalink: /rest-api-guide/ldap/status.html
sidebar: rest_api_guide_sidebar
---
