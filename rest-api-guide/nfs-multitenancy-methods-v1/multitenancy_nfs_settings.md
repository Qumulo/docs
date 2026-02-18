---
category: /NFS Multitenancy Methods V1
methods:
  get:
    summary: '[preview] Retrieve all tenant-specific NFS configurations.'
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"api_nfs_settings_map\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {},\n  \"additionalProperties\": {\n    \"description\"\
        : \"api_nfs_settings_map value\",\n    \"type\": \"object\",\n    \"properties\"\
        : {\n      \"v4_enabled\": {\n        \"description\": \"Whether NFSv4 is\
        \ enabled\",\n        \"type\": \"boolean\"\n      },\n      \"krb5_enabled\"\
        : {\n        \"description\": \"Whether Kerberos5 is enabled\",\n        \"\
        type\": \"boolean\"\n      },\n      \"krb5p_enabled\": {\n        \"description\"\
        : \"Whether Kerberos5p (privacy) is enabled\",\n        \"type\": \"boolean\"\
        \n      },\n      \"krb5i_enabled\": {\n        \"description\": \"Whether\
        \ Kerberos5i (integrity) is enabled\",\n        \"type\": \"boolean\"\n  \
        \    },\n      \"auth_sys_enabled\": {\n        \"description\": \"Whether\
        \ AUTH_SYS is enabled\",\n        \"type\": \"boolean\"\n      },\n      \"\
        idmap_domain\": {\n        \"description\": \"The domain used for mapping\
        \ NFSv4 string identities. The value must match what idmapd on the clients\
        \ expects for correct name resolution.\",\n        \"type\": \"string\"\n\
        \      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: true
rest_endpoint: /v1/multitenancy/nfs/settings/
api_version: v1
permalink: /rest-api-guide/nfs-multitenancy-methods-v1/multitenancy_nfs_settings.html
sidebar: rest_api_guide_sidebar
redirect_from: /rest-api-guide/nfs-multitenancy-methods/multitenancy_nfs_settings.html
---
