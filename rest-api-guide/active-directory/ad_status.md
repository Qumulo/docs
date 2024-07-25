---
category: /Active Directory
methods:
  get:
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"api_ad_status\",\n  \"type\": \"object\",\n\
        \  \"properties\": {\n    \"status\": {\n      \"type\": \"string\",\n   \
        \   \"enum\": [\n        \"NOT_IN_DOMAIN\",\n        \"JOINED_TO_DOMAIN\"\n\
        \      ],\n      \"description\": \"status:\\n * `JOINED_TO_DOMAIN` - JOINED_TO_DOMAIN,\\\
        n * `NOT_IN_DOMAIN` - NOT_IN_DOMAIN\"\n    },\n    \"domain\": {\n      \"\
        description\": \"domain\",\n      \"type\": \"string\"\n    },\n    \"ou\"\
        : {\n      \"description\": \"ou\",\n      \"type\": \"string\"\n    },\n\
        \    \"search_trusted_domains\": {\n      \"description\": \"search_trusted_domains\"\
        ,\n      \"type\": \"boolean\"\n    },\n    \"use_ad_posix_attributes\": {\n\
        \      \"description\": \"use_ad_posix_attributes\",\n      \"type\": \"boolean\"\
        \n    },\n    \"base_dn\": {\n      \"description\": \"base_dn\",\n      \"\
        type\": \"string\"\n    },\n    \"domain_netbios\": {\n      \"description\"\
        : \"domain_netbios\",\n      \"type\": \"string\"\n    },\n    \"dcs\": {\n\
        \      \"type\": \"array\",\n      \"items\": {\n        \"description\":\
        \ \"dcs\",\n        \"type\": \"object\",\n        \"properties\": {\n   \
        \       \"name\": {\n            \"description\": \"name\",\n            \"\
        type\": \"string\"\n          },\n          \"address\": {\n            \"\
        description\": \"address\",\n            \"type\": \"string\"\n          }\n\
        \        }\n      }\n    },\n    \"ldap_connection_states\": {\n      \"type\"\
        : \"array\",\n      \"items\": {\n        \"description\": \"ldap_connection_states\"\
        ,\n        \"type\": \"object\",\n        \"properties\": {\n          \"\
        node_id\": {\n            \"description\": \"node_id\",\n            \"type\"\
        : \"number\"\n          },\n          \"servers\": {\n            \"type\"\
        : \"array\",\n            \"items\": {\n              \"description\": \"\
        servers\",\n              \"type\": \"object\",\n              \"properties\"\
        : {\n                \"bind_uri\": {\n                  \"description\": \"\
        bind_uri\",\n                  \"type\": \"string\"\n                },\n\
        \                \"kdc_address\": {\n                  \"description\": \"\
        kdc_address\",\n                  \"type\": \"string\"\n                }\n\
        \              }\n            }\n          },\n          \"bind_domain\":\
        \ {\n            \"description\": \"bind_domain\",\n            \"type\":\
        \ \"string\"\n          },\n          \"bind_account\": {\n            \"\
        description\": \"bind_account\",\n            \"type\": \"string\"\n     \
        \     },\n          \"base_dn_vec\": {\n            \"type\": \"array\",\n\
        \            \"items\": {\n              \"description\": \"base_dn_vec\"\
        ,\n              \"type\": \"string\"\n            }\n          },\n     \
        \     \"health\": {\n            \"type\": \"string\",\n            \"enum\"\
        : [\n              \"NO_RECENT_ERROR\",\n              \"INTERMITTENT_ERROR\"\
        ,\n              \"SUSTAINED_ERROR\"\n            ],\n            \"description\"\
        : \"health:\\n * `INTERMITTENT_ERROR` - LDAP_HEALTH_INTERMITTENT_ERROR,\\\
        n * `NO_RECENT_ERROR` - LDAP_HEALTH_NO_RECENT_ERROR,\\n * `SUSTAINED_ERROR`\
        \ - LDAP_HEALTH_SUSTAINED_ERROR\"\n          }\n        }\n      }\n    }\n\
        \  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Get Active Directory configuration and status.
rest_endpoint: /v1/ad/status
api_version: v1
permalink: /rest-api-guide/active-directory/ad_status.html
sidebar: rest_api_guide_sidebar
---
