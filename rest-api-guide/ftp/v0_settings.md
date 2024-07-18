---
category: /ftp
methods:
  get:
    parameters: []
    response_body:
      description: Return value on success
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"ftp_api_config\",\n  \"type\": \"object\",\n\
        \  \"properties\": {\n    \"enabled\": {\n      \"description\": \"When enabled,\
        \ the cluster allows FTP connections.\",\n      \"type\": \"boolean\"\n  \
        \  },\n    \"check_remote_host\": {\n      \"description\": \"When enabled,\
        \ the cluster ensures that all connections for a session come from the same\
        \ host. Disabling this allows for FXP.\",\n      \"type\": \"boolean\"\n \
        \   },\n    \"log_operations\": {\n      \"description\": \"log_operations\"\
        ,\n      \"type\": \"boolean\"\n    },\n    \"chroot_users\": {\n      \"\
        description\": \"chroot_users\",\n      \"type\": \"boolean\"\n    },\n  \
        \  \"allow_unencrypted_connections\": {\n      \"description\": \"allow_unencrypted_connections\"\
        ,\n      \"type\": \"boolean\"\n    },\n    \"expand_wildcards\": {\n    \
        \  \"description\": \"When enabled, LIST and NLST commands support posix-like\
        \ shell wild cards on the final directory component.\",\n      \"type\": \"\
        boolean\"\n    },\n    \"anonymous_user\": {\n      \"description\": \"anonymous_user\"\
        ,\n      \"type\": \"object\",\n      \"properties\": {\n        \"id_type\"\
        : {\n          \"type\": \"string\",\n          \"enum\": [\n            \"\
        LOCAL_USER\",\n            \"LOCAL_GROUP\",\n            \"NFS_GID\",\n  \
        \          \"NFS_UID\",\n            \"SMB_SID\",\n            \"INTERNAL\"\
        ,\n            \"QUMULO_OPERATOR\"\n          ],\n          \"description\"\
        : \"id_type:\\n * `INTERNAL` - INTERNAL,\\n * `LOCAL_GROUP` - LOCAL_GROUP,\\\
        n * `LOCAL_USER` - LOCAL_USER,\\n * `NFS_GID` - NFS_GID,\\n * `NFS_UID` -\
        \ NFS_UID,\\n * `QUMULO_OPERATOR` - QUMULO_OPERATOR,\\n * `SMB_SID` - SMB_SID\"\
        \n        },\n        \"id_value\": {\n          \"description\": \"id_value\"\
        ,\n          \"type\": \"string\"\n        }\n      }\n    },\n    \"greeting\"\
        : {\n      \"description\": \"Greeting to display with the 220 successful\
        \ connection message.\",\n      \"type\": \"string\"\n    }\n  }\n}"
      status_code: '200'
    summary: Retrieve the current FTP server settings. To see server status on all
      nodes, use Get FTP Server Status.
  patch:
    parameters:
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"ftp_api_config\",\n  \"type\": \"object\",\n\
        \  \"properties\": {\n    \"enabled\": {\n      \"description\": \"When enabled,\
        \ the cluster allows FTP connections.\",\n      \"type\": \"boolean\"\n  \
        \  },\n    \"check_remote_host\": {\n      \"description\": \"When enabled,\
        \ the cluster ensures that all connections for a session come from the same\
        \ host. Disabling this allows for FXP.\",\n      \"type\": \"boolean\"\n \
        \   },\n    \"log_operations\": {\n      \"description\": \"log_operations\"\
        ,\n      \"type\": \"boolean\"\n    },\n    \"chroot_users\": {\n      \"\
        description\": \"chroot_users\",\n      \"type\": \"boolean\"\n    },\n  \
        \  \"allow_unencrypted_connections\": {\n      \"description\": \"allow_unencrypted_connections\"\
        ,\n      \"type\": \"boolean\"\n    },\n    \"expand_wildcards\": {\n    \
        \  \"description\": \"When enabled, LIST and NLST commands support posix-like\
        \ shell wild cards on the final directory component.\",\n      \"type\": \"\
        boolean\"\n    },\n    \"anonymous_user\": {\n      \"description\": \"anonymous_user\"\
        ,\n      \"type\": \"object\",\n      \"properties\": {\n        \"id_type\"\
        : {\n          \"type\": \"string\",\n          \"enum\": [\n            \"\
        LOCAL_USER\",\n            \"LOCAL_GROUP\",\n            \"NFS_GID\",\n  \
        \          \"NFS_UID\",\n            \"SMB_SID\",\n            \"INTERNAL\"\
        ,\n            \"QUMULO_OPERATOR\"\n          ],\n          \"description\"\
        : \"id_type:\\n * `INTERNAL` - INTERNAL,\\n * `LOCAL_GROUP` - LOCAL_GROUP,\\\
        n * `LOCAL_USER` - LOCAL_USER,\\n * `NFS_GID` - NFS_GID,\\n * `NFS_UID` -\
        \ NFS_UID,\\n * `QUMULO_OPERATOR` - QUMULO_OPERATOR,\\n * `SMB_SID` - SMB_SID\"\
        \n        },\n        \"id_value\": {\n          \"description\": \"id_value\"\
        ,\n          \"type\": \"string\"\n        }\n      }\n    },\n    \"greeting\"\
        : {\n      \"description\": \"Greeting to display with the 220 successful\
        \ connection message.\",\n      \"type\": \"string\"\n    }\n  }\n}"
    response_body:
      description: Return value on success
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"ftp_api_config\",\n  \"type\": \"object\",\n\
        \  \"properties\": {\n    \"enabled\": {\n      \"description\": \"When enabled,\
        \ the cluster allows FTP connections.\",\n      \"type\": \"boolean\"\n  \
        \  },\n    \"check_remote_host\": {\n      \"description\": \"When enabled,\
        \ the cluster ensures that all connections for a session come from the same\
        \ host. Disabling this allows for FXP.\",\n      \"type\": \"boolean\"\n \
        \   },\n    \"log_operations\": {\n      \"description\": \"log_operations\"\
        ,\n      \"type\": \"boolean\"\n    },\n    \"chroot_users\": {\n      \"\
        description\": \"chroot_users\",\n      \"type\": \"boolean\"\n    },\n  \
        \  \"allow_unencrypted_connections\": {\n      \"description\": \"allow_unencrypted_connections\"\
        ,\n      \"type\": \"boolean\"\n    },\n    \"expand_wildcards\": {\n    \
        \  \"description\": \"When enabled, LIST and NLST commands support posix-like\
        \ shell wild cards on the final directory component.\",\n      \"type\": \"\
        boolean\"\n    },\n    \"anonymous_user\": {\n      \"description\": \"anonymous_user\"\
        ,\n      \"type\": \"object\",\n      \"properties\": {\n        \"id_type\"\
        : {\n          \"type\": \"string\",\n          \"enum\": [\n            \"\
        LOCAL_USER\",\n            \"LOCAL_GROUP\",\n            \"NFS_GID\",\n  \
        \          \"NFS_UID\",\n            \"SMB_SID\",\n            \"INTERNAL\"\
        ,\n            \"QUMULO_OPERATOR\"\n          ],\n          \"description\"\
        : \"id_type:\\n * `INTERNAL` - INTERNAL,\\n * `LOCAL_GROUP` - LOCAL_GROUP,\\\
        n * `LOCAL_USER` - LOCAL_USER,\\n * `NFS_GID` - NFS_GID,\\n * `NFS_UID` -\
        \ NFS_UID,\\n * `QUMULO_OPERATOR` - QUMULO_OPERATOR,\\n * `SMB_SID` - SMB_SID\"\
        \n        },\n        \"id_value\": {\n          \"description\": \"id_value\"\
        ,\n          \"type\": \"string\"\n        }\n      }\n    },\n    \"greeting\"\
        : {\n      \"description\": \"Greeting to display with the 220 successful\
        \ connection message.\",\n      \"type\": \"string\"\n    }\n  }\n}"
      status_code: '200'
    summary: Modify the current FTP server settings. To see server status on all nodes,
      use Get FTP Server Status.
  put:
    parameters:
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"ftp_api_config\",\n  \"type\": \"object\",\n\
        \  \"properties\": {\n    \"enabled\": {\n      \"description\": \"When enabled,\
        \ the cluster allows FTP connections.\",\n      \"type\": \"boolean\"\n  \
        \  },\n    \"check_remote_host\": {\n      \"description\": \"When enabled,\
        \ the cluster ensures that all connections for a session come from the same\
        \ host. Disabling this allows for FXP.\",\n      \"type\": \"boolean\"\n \
        \   },\n    \"log_operations\": {\n      \"description\": \"log_operations\"\
        ,\n      \"type\": \"boolean\"\n    },\n    \"chroot_users\": {\n      \"\
        description\": \"chroot_users\",\n      \"type\": \"boolean\"\n    },\n  \
        \  \"allow_unencrypted_connections\": {\n      \"description\": \"allow_unencrypted_connections\"\
        ,\n      \"type\": \"boolean\"\n    },\n    \"expand_wildcards\": {\n    \
        \  \"description\": \"When enabled, LIST and NLST commands support posix-like\
        \ shell wild cards on the final directory component.\",\n      \"type\": \"\
        boolean\"\n    },\n    \"anonymous_user\": {\n      \"description\": \"anonymous_user\"\
        ,\n      \"type\": \"object\",\n      \"properties\": {\n        \"id_type\"\
        : {\n          \"type\": \"string\",\n          \"enum\": [\n            \"\
        LOCAL_USER\",\n            \"LOCAL_GROUP\",\n            \"NFS_GID\",\n  \
        \          \"NFS_UID\",\n            \"SMB_SID\",\n            \"INTERNAL\"\
        ,\n            \"QUMULO_OPERATOR\"\n          ],\n          \"description\"\
        : \"id_type:\\n * `INTERNAL` - INTERNAL,\\n * `LOCAL_GROUP` - LOCAL_GROUP,\\\
        n * `LOCAL_USER` - LOCAL_USER,\\n * `NFS_GID` - NFS_GID,\\n * `NFS_UID` -\
        \ NFS_UID,\\n * `QUMULO_OPERATOR` - QUMULO_OPERATOR,\\n * `SMB_SID` - SMB_SID\"\
        \n        },\n        \"id_value\": {\n          \"description\": \"id_value\"\
        ,\n          \"type\": \"string\"\n        }\n      }\n    },\n    \"greeting\"\
        : {\n      \"description\": \"Greeting to display with the 220 successful\
        \ connection message.\",\n      \"type\": \"string\"\n    }\n  }\n}"
    response_body:
      description: Return value on success
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"ftp_api_config\",\n  \"type\": \"object\",\n\
        \  \"properties\": {\n    \"enabled\": {\n      \"description\": \"When enabled,\
        \ the cluster allows FTP connections.\",\n      \"type\": \"boolean\"\n  \
        \  },\n    \"check_remote_host\": {\n      \"description\": \"When enabled,\
        \ the cluster ensures that all connections for a session come from the same\
        \ host. Disabling this allows for FXP.\",\n      \"type\": \"boolean\"\n \
        \   },\n    \"log_operations\": {\n      \"description\": \"log_operations\"\
        ,\n      \"type\": \"boolean\"\n    },\n    \"chroot_users\": {\n      \"\
        description\": \"chroot_users\",\n      \"type\": \"boolean\"\n    },\n  \
        \  \"allow_unencrypted_connections\": {\n      \"description\": \"allow_unencrypted_connections\"\
        ,\n      \"type\": \"boolean\"\n    },\n    \"expand_wildcards\": {\n    \
        \  \"description\": \"When enabled, LIST and NLST commands support posix-like\
        \ shell wild cards on the final directory component.\",\n      \"type\": \"\
        boolean\"\n    },\n    \"anonymous_user\": {\n      \"description\": \"anonymous_user\"\
        ,\n      \"type\": \"object\",\n      \"properties\": {\n        \"id_type\"\
        : {\n          \"type\": \"string\",\n          \"enum\": [\n            \"\
        LOCAL_USER\",\n            \"LOCAL_GROUP\",\n            \"NFS_GID\",\n  \
        \          \"NFS_UID\",\n            \"SMB_SID\",\n            \"INTERNAL\"\
        ,\n            \"QUMULO_OPERATOR\"\n          ],\n          \"description\"\
        : \"id_type:\\n * `INTERNAL` - INTERNAL,\\n * `LOCAL_GROUP` - LOCAL_GROUP,\\\
        n * `LOCAL_USER` - LOCAL_USER,\\n * `NFS_GID` - NFS_GID,\\n * `NFS_UID` -\
        \ NFS_UID,\\n * `QUMULO_OPERATOR` - QUMULO_OPERATOR,\\n * `SMB_SID` - SMB_SID\"\
        \n        },\n        \"id_value\": {\n          \"description\": \"id_value\"\
        ,\n          \"type\": \"string\"\n        }\n      }\n    },\n    \"greeting\"\
        : {\n      \"description\": \"Greeting to display with the 220 successful\
        \ connection message.\",\n      \"type\": \"string\"\n    }\n  }\n}"
      status_code: '200'
    summary: Modify the current FTP server settings. To see server status on all nodes,
      use Get FTP Server Status.
rest_endpoint: /v0/ftp/settings
permalink: /rest-api-guide/ftp/v0_settings.html
sidebar: rest_api_guide_sidebar
---
