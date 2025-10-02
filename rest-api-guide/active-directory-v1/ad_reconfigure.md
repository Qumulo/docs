---
category: /Active Directory V1
methods:
  post:
    summary: Enables/disables POSIX attributes, sets Base DN.
    parameters: []
    response_body: {}
    responses:
    - code: '202'
      description: Return value on success
    preview: false
    request_body:
      schema: "{\n  \"description\": \"ad_domain_reconfigure_args\",\n  \"type\":\
        \ \"object\",\n  \"properties\": {\n    \"domain\": {\n      \"description\"\
        : \"domain\",\n      \"type\": \"string\"\n    },\n    \"search_trusted_domains\"\
        : {\n      \"description\": \"Allows the cluster to search trusted domains\
        \ for user information.\",\n      \"type\": \"boolean\"\n    },\n    \"use_ad_posix_attributes\"\
        : {\n      \"description\": \"use_ad_posix_attributes\",\n      \"type\":\
        \ \"boolean\"\n    },\n    \"base_dn\": {\n      \"description\": \"base_dn\"\
        ,\n      \"type\": \"string\"\n    },\n    \"domain_controllers\": {\n   \
        \   \"description\": \"A comma-separated list of domain controllers (DCs)\
        \ to use with the specified AD domain.\",\n      \"type\": \"string\"\n  \
        \  },\n    \"dns_config_id\": {\n      \"description\": \"The unique ID of\
        \ the DNS configuration to use for reconfiguring this AD domain\",\n     \
        \ \"type\": \"number\"\n    }\n  }\n}"
rest_endpoint: /v1/ad/reconfigure
api_version: v1
permalink: /rest-api-guide/active-directory-v1/ad_reconfigure.html
sidebar: rest_api_guide_sidebar
redirect_from: /rest-api-guide/active-directory/ad_reconfigure.html
---
