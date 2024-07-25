---
category: /Active Directory
methods:
  post:
    parameters: []
    request_body:
      schema: "{\n  \"description\": \"ad_domain_join_args\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"domain\": {\n      \"description\": \"domain\"\
        ,\n      \"type\": \"string\"\n    },\n    \"domain_netbios\": {\n      \"\
        description\": \"domain_netbios\",\n      \"type\": \"string\"\n    },\n \
        \   \"user\": {\n      \"description\": \"user\",\n      \"type\": \"string\"\
        \n    },\n    \"password\": {\n      \"description\": \"password\",\n    \
        \  \"type\": \"string\",\n      \"format\": \"password\"\n    },\n    \"ou\"\
        : {\n      \"description\": \"OU\",\n      \"type\": \"string\"\n    },\n\
        \    \"search_trusted_domains\": {\n      \"description\": \"Allows the cluster\
        \ to search trusted domains for user information.\",\n      \"type\": \"boolean\"\
        \n    },\n    \"use_ad_posix_attributes\": {\n      \"description\": \"Use\
        \ AD POSIX attributes\",\n      \"type\": \"boolean\"\n    },\n    \"base_dn\"\
        : {\n      \"description\": \"Base DN\",\n      \"type\": \"string\"\n   \
        \ },\n    \"dns_config_id\": {\n      \"description\": \"The unique ID of\
        \ the DNS configuration to use for joining this AD domain\",\n      \"type\"\
        : \"number\"\n    }\n  }\n}"
    response_body: {}
    responses:
    - code: '202'
      description: Return value on success
    summary: Joins the cluster to an Active Directory domain.
rest_endpoint: /v1/ad/join
api_version: v1
permalink: /rest-api-guide/active-directory/ad_join.html
sidebar: rest_api_guide_sidebar
---
