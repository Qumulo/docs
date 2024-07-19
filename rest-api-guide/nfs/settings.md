---
category: /nfs
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
    summary: Retrieve current NFS server configuration.
  patch:
    parameters: []
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
    summary: Modify current NFS server configuration.
  put:
    parameters: []
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
    summary: Modify current NFS server configuration.
rest_endpoint: /v2/nfs/settings
api_version: v2
permalink: /rest-api-guide/nfs/settings.html
sidebar: rest_api_guide_sidebar
---
