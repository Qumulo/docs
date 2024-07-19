---
category: /multitenancy
methods:
  get:
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"api_nfs_settings\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"v4_enabled\": {\n      \"description\": \"Whether\
        \ NFSv4 is enabled\",\n      \"type\": \"boolean\"\n    },\n    \"krb5_enabled\"\
        : {\n      \"description\": \"Whether Kerberos5 is enabled\",\n      \"type\"\
        : \"boolean\"\n    },\n    \"krb5p_enabled\": {\n      \"description\": \"\
        Whether Kerberos5p (privacy) is enabled\",\n      \"type\": \"boolean\"\n\
        \    },\n    \"krb5i_enabled\": {\n      \"description\": \"Whether Kerberos5i\
        \ (integrity) is enabled\",\n      \"type\": \"boolean\"\n    },\n    \"auth_sys_enabled\"\
        : {\n      \"description\": \"Whether AUTH_SYS is enabled\",\n      \"type\"\
        : \"boolean\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Retrieve global NFS configuration.
  patch:
    parameters:
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
      schema: "{\n  \"description\": \"api_nfs_settings_patch\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"v4_enabled\": {\n      \"description\": \"Whether\
        \ NFSv4 is enabled\",\n      \"type\": \"boolean\"\n    },\n    \"krb5_enabled\"\
        : {\n      \"description\": \"Whether Kerberos5 is enabled\",\n      \"type\"\
        : \"boolean\"\n    },\n    \"krb5p_enabled\": {\n      \"description\": \"\
        Whether Kerberos5p (privacy) is enabled\",\n      \"type\": \"boolean\"\n\
        \    },\n    \"krb5i_enabled\": {\n      \"description\": \"Whether Kerberos5i\
        \ (integrity) is enabled\",\n      \"type\": \"boolean\"\n    },\n    \"auth_sys_enabled\"\
        : {\n      \"description\": \"Whether AUTH_SYS is enabled\",\n      \"type\"\
        : \"boolean\"\n    }\n  }\n}"
    response_body:
      schema: "{\n  \"description\": \"api_nfs_settings\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"v4_enabled\": {\n      \"description\": \"Whether\
        \ NFSv4 is enabled\",\n      \"type\": \"boolean\"\n    },\n    \"krb5_enabled\"\
        : {\n      \"description\": \"Whether Kerberos5 is enabled\",\n      \"type\"\
        : \"boolean\"\n    },\n    \"krb5p_enabled\": {\n      \"description\": \"\
        Whether Kerberos5p (privacy) is enabled\",\n      \"type\": \"boolean\"\n\
        \    },\n    \"krb5i_enabled\": {\n      \"description\": \"Whether Kerberos5i\
        \ (integrity) is enabled\",\n      \"type\": \"boolean\"\n    },\n    \"auth_sys_enabled\"\
        : {\n      \"description\": \"Whether AUTH_SYS is enabled\",\n      \"type\"\
        : \"boolean\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Modify global NFS configuration.
  put:
    parameters:
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
      schema: "{\n  \"description\": \"api_nfs_settings\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"v4_enabled\": {\n      \"description\": \"Whether\
        \ NFSv4 is enabled\",\n      \"type\": \"boolean\"\n    },\n    \"krb5_enabled\"\
        : {\n      \"description\": \"Whether Kerberos5 is enabled\",\n      \"type\"\
        : \"boolean\"\n    },\n    \"krb5p_enabled\": {\n      \"description\": \"\
        Whether Kerberos5p (privacy) is enabled\",\n      \"type\": \"boolean\"\n\
        \    },\n    \"krb5i_enabled\": {\n      \"description\": \"Whether Kerberos5i\
        \ (integrity) is enabled\",\n      \"type\": \"boolean\"\n    },\n    \"auth_sys_enabled\"\
        : {\n      \"description\": \"Whether AUTH_SYS is enabled\",\n      \"type\"\
        : \"boolean\"\n    }\n  }\n}"
    response_body:
      schema: "{\n  \"description\": \"api_nfs_settings\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"v4_enabled\": {\n      \"description\": \"Whether\
        \ NFSv4 is enabled\",\n      \"type\": \"boolean\"\n    },\n    \"krb5_enabled\"\
        : {\n      \"description\": \"Whether Kerberos5 is enabled\",\n      \"type\"\
        : \"boolean\"\n    },\n    \"krb5p_enabled\": {\n      \"description\": \"\
        Whether Kerberos5p (privacy) is enabled\",\n      \"type\": \"boolean\"\n\
        \    },\n    \"krb5i_enabled\": {\n      \"description\": \"Whether Kerberos5i\
        \ (integrity) is enabled\",\n      \"type\": \"boolean\"\n    },\n    \"auth_sys_enabled\"\
        : {\n      \"description\": \"Whether AUTH_SYS is enabled\",\n      \"type\"\
        : \"boolean\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Set global NFS configuration.
rest_endpoint: /v1/multitenancy/nfs/global-settings
api_version: v1
permalink: /rest-api-guide/multitenancy/nfs_global-settings.html
sidebar: rest_api_guide_sidebar
---
