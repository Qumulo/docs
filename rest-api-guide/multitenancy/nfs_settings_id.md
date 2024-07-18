---
category: /multitenancy
methods:
  delete:
    parameters:
    - description: The tenant ID of the NFS settings.
      name: id
      required: true
    - description: ETag for expected version
      name: If-Match
      required: false
    response_body:
      description: Return value on success
      example_value: '"TO DO"'
      schema: '"TO DO"'
      status_code: '200'
    summary: Delete current NFS configuration, restoring the global settings for this
      tenant.
  get:
    parameters:
    - description: The tenant ID of the NFS settings.
      name: id
      required: true
    response_body:
      description: Return value on success
      example_value: '"TO DO"'
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
      status_code: '200'
    summary: Retrieve current tenant-specific NFS configuration.
  patch:
    parameters:
    - description: The tenant ID of the NFS settings.
      name: id
      required: true
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
      example_value: '"TO DO"'
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
      description: Return value on success
      example_value: '"TO DO"'
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
      status_code: '200'
    summary: Modify current tenant-specific NFS configuration.
  put:
    parameters:
    - description: The tenant ID of the NFS settings.
      name: id
      required: true
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
      example_value: '"TO DO"'
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
      description: Return value on success
      example_value: '"TO DO"'
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
      status_code: '200'
    summary: Set current tenant-specific NFS configuration.
rest_endpoint: /v1/multitenancy/nfs/settings/{id}
permalink: /rest-api-guide/multitenancy/nfs_settings_id.html
sidebar: rest_api_guide_sidebar
---
