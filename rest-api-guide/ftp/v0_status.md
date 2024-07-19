---
category: /ftp
methods:
  get:
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"ftp_status\",\n  \"type\": \"object\",\n  \"\
        properties\": {\n    \"settings\": {\n      \"description\": \"The current\
        \ FTP server settings.\",\n      \"type\": \"object\",\n      \"properties\"\
        : {\n        \"enabled\": {\n          \"description\": \"When enabled, the\
        \ cluster allows FTP connections.\",\n          \"type\": \"boolean\"\n  \
        \      },\n        \"check_remote_host\": {\n          \"description\": \"\
        When enabled, the cluster ensures that all connections for a session come\
        \ from the same host. Disabling this allows for FXP.\",\n          \"type\"\
        : \"boolean\"\n        },\n        \"log_operations\": {\n          \"description\"\
        : \"log_operations\",\n          \"type\": \"boolean\"\n        },\n     \
        \   \"chroot_users\": {\n          \"description\": \"chroot_users\",\n  \
        \        \"type\": \"boolean\"\n        },\n        \"allow_unencrypted_connections\"\
        : {\n          \"description\": \"allow_unencrypted_connections\",\n     \
        \     \"type\": \"boolean\"\n        },\n        \"expand_wildcards\": {\n\
        \          \"description\": \"When enabled, LIST and NLST commands support\
        \ posix-like shell wild cards on the final directory component.\",\n     \
        \     \"type\": \"boolean\"\n        },\n        \"anonymous_user\": {\n \
        \         \"description\": \"anonymous_user\",\n          \"type\": \"object\"\
        ,\n          \"properties\": {\n            \"id_type\": {\n             \
        \ \"type\": \"string\",\n              \"enum\": [\n                \"LOCAL_USER\"\
        ,\n                \"LOCAL_GROUP\",\n                \"NFS_GID\",\n      \
        \          \"NFS_UID\",\n                \"SMB_SID\",\n                \"\
        INTERNAL\",\n                \"QUMULO_OPERATOR\"\n              ],\n     \
        \         \"description\": \"id_type:\\n * `INTERNAL` - INTERNAL,\\n * `LOCAL_GROUP`\
        \ - LOCAL_GROUP,\\n * `LOCAL_USER` - LOCAL_USER,\\n * `NFS_GID` - NFS_GID,\\\
        n * `NFS_UID` - NFS_UID,\\n * `QUMULO_OPERATOR` - QUMULO_OPERATOR,\\n * `SMB_SID`\
        \ - SMB_SID\"\n            },\n            \"id_value\": {\n             \
        \ \"description\": \"id_value\",\n              \"type\": \"string\"\n   \
        \         }\n          }\n        },\n        \"greeting\": {\n          \"\
        description\": \"Greeting to display with the 220 successful connection message.\"\
        ,\n          \"type\": \"string\"\n        }\n      }\n    },\n    \"statuses\"\
        : {\n      \"type\": \"array\",\n      \"items\": {\n        \"description\"\
        : \"The current FTP server status on each node.\",\n        \"type\": \"object\"\
        ,\n        \"properties\": {\n          \"node_id\": {\n            \"description\"\
        : \"node_id\",\n            \"type\": \"number\"\n          },\n         \
        \ \"status\": {\n            \"description\": \"The status of the server on\
        \ this node.\",\n            \"type\": \"string\"\n          }\n        }\n\
        \      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Retrieve the current FTP server settings and the status of the server
      on each node.
rest_endpoint: /v0/ftp/status
permalink: /rest-api-guide/ftp/v0_status.html
sidebar: rest_api_guide_sidebar
---
