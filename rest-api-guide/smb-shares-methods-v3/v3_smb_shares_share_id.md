---
category: /SMB Shares Methods V3
methods:
  get:
    summary: '[preview] Retrieve the specified SMB share. Refer to the ''Modify SMB
      Share'' method for a description of the returned fields.'
    parameters:
    - name: share_id
      description: The unique ID of the SMB share.
      required: true
    response_body:
      schema: "{\n  \"description\": \"api_smb_share_v3\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"id\": {\n      \"description\": \"The unique\
        \ ID of the SMB share\",\n      \"type\": \"string\"\n    },\n    \"share_name\"\
        : {\n      \"description\": \"The SMB share name\",\n      \"type\": \"string\"\
        \n    },\n    \"tenant_id\": {\n      \"description\": \"The tenant ID of\
        \ the tenant that the SMB share is a part of\",\n      \"type\": \"number\"\
        \n    },\n    \"fs_path\": {\n      \"description\": \"The filesystem path\
        \ to SMB share\",\n      \"type\": \"string\"\n    },\n    \"description\"\
        : {\n      \"description\": \"Description of this SMB share\",\n      \"type\"\
        : \"string\"\n    },\n    \"permissions\": {\n      \"type\": \"array\",\n\
        \      \"items\": {\n        \"description\": \"The access control list (ACL)\
        \ for this SMB share\",\n        \"type\": \"object\",\n        \"properties\"\
        : {\n          \"type\": {\n            \"type\": \"string\",\n          \
        \  \"enum\": [\n              \"ALLOWED\",\n              \"DENIED\"\n   \
        \         ],\n            \"description\": \"Type of permissions entry (ALLOWED\
        \ or DENIED):\\n * `ALLOWED` - The permissions entry rights are allowed to\
        \ the trustee,\\n * `DENIED` - The permissions entry rights are denied to\
        \ the trustee\"\n          },\n          \"trustee\": {\n            \"description\"\
        : \"User/group to apply the permissions entry to\",\n            \"type\"\
        : \"object\",\n            \"properties\": {\n              \"domain\": {\n\
        \                \"type\": \"string\",\n                \"enum\": [\n    \
        \              \"LOCAL\",\n                  \"API_NULL_DOMAIN\",\n      \
        \            \"WORLD\",\n                  \"POSIX_USER\",\n             \
        \     \"POSIX_GROUP\",\n                  \"ACTIVE_DIRECTORY\",\n        \
        \          \"API_INVALID_DOMAIN\",\n                  \"API_RESERVED_DOMAIN\"\
        ,\n                  \"API_INTERNAL_DOMAIN\",\n                  \"API_OPERATOR_DOMAIN\"\
        ,\n                  \"API_QUMULO_SUPPORT_DOMAIN\",\n                  \"\
        API_CREATOR_DOMAIN\"\n                ],\n                \"description\"\
        : \"domain:\\n * `ACTIVE_DIRECTORY` - ACTIVE_DIRECTORY,\\n * `API_CREATOR_DOMAIN`\
        \ - API_CREATOR_DOMAIN,\\n * `API_INTERNAL_DOMAIN` - API_INTERNAL_DOMAIN,\\\
        n * `API_INVALID_DOMAIN` - API_INVALID_DOMAIN,\\n * `API_NULL_DOMAIN` - API_NULL_DOMAIN,\\\
        n * `API_OPERATOR_DOMAIN` - API_OPERATOR_DOMAIN,\\n * `API_QUMULO_SUPPORT_DOMAIN`\
        \ - API_QUMULO_SUPPORT_DOMAIN,\\n * `API_RESERVED_DOMAIN` - API_RESERVED_DOMAIN,\\\
        n * `LOCAL` - LOCAL,\\n * `POSIX_GROUP` - POSIX_GROUP,\\n * `POSIX_USER` -\
        \ POSIX_USER,\\n * `WORLD` - WORLD\"\n              },\n              \"auth_id\"\
        : {\n                \"description\": \"auth_id\",\n                \"type\"\
        : \"string\"\n              },\n              \"uid\": {\n               \
        \ \"description\": \"uid\",\n                \"type\": \"number\"\n      \
        \        },\n              \"gid\": {\n                \"description\": \"\
        gid\",\n                \"type\": \"number\"\n              },\n         \
        \     \"sid\": {\n                \"description\": \"sid\",\n            \
        \    \"type\": \"string\"\n              },\n              \"name\": {\n \
        \               \"description\": \"name\",\n                \"type\": \"string\"\
        \n              }\n            }\n          },\n          \"rights\": {\n\
        \            \"type\": \"array\",\n            \"items\": {\n            \
        \  \"type\": \"string\",\n              \"enum\": [\n                \"READ_DATA\"\
        ,\n                \"READ_EA\",\n                \"READ_ATTR\",\n        \
        \        \"READ_ACL\",\n                \"WRITE_EA\",\n                \"\
        WRITE_ATTR\",\n                \"WRITE_ACL\",\n                \"CHANGE_OWNER\"\
        ,\n                \"WRITE_GROUP\",\n                \"DELETE\",\n       \
        \         \"EXECUTE\",\n                \"MODIFY\",\n                \"EXTEND\"\
        ,\n                \"DELETE_CHILD\",\n                \"SYNCHRONIZE\",\n \
        \               \"READ\",\n                \"WRITE\",\n                \"\
        CHANGE_PERMISSIONS\"\n              ],\n              \"description\": \"\
        Rights pertaining to the permissions entry:\\n * `CHANGE_OWNER` - Owner write\
        \ access,\\n * `CHANGE_PERMISSIONS` - Rights to change permissions on file\
        \ objects,\\n * `DELETE` - Delete access,\\n * `DELETE_CHILD` - Delete from\
        \ directory access,\\n * `EXECUTE` - Execute access,\\n * `EXTEND` - File\
        \ extension access,\\n * `MODIFY` - File modification access,\\n * `READ`\
        \ - Read access rights,\\n * `READ_ACL` - ACL read access,\\n * `READ_ATTR`\
        \ - Attribute read access,\\n * `READ_DATA` - File read access,\\n * `READ_EA`\
        \ - Extended attribute read access,\\n * `SYNCHRONIZE` - File synchronize\
        \ access,\\n * `WRITE` - Write access rights,\\n * `WRITE_ACL` - ACL write\
        \ access,\\n * `WRITE_ATTR` - Attribute write access,\\n * `WRITE_EA` - Extended\
        \ attribute write access,\\n * `WRITE_GROUP` - Group write access\"\n    \
        \        }\n          }\n        }\n      }\n    },\n    \"network_permissions\"\
        : {\n      \"type\": \"array\",\n      \"items\": {\n        \"description\"\
        : \"The network access control list (ACL) for this SMB share. If not specified,\
        \ the default is to allow any host.\",\n        \"type\": \"object\",\n  \
        \      \"properties\": {\n          \"type\": {\n            \"type\": \"\
        string\",\n            \"enum\": [\n              \"ALLOWED\",\n         \
        \     \"DENIED\"\n            ],\n            \"description\": \"Type of permissions\
        \ entry (ALLOWED or DENIED):\\n * `ALLOWED` - The permissions entry rights\
        \ are allowed to the trustee,\\n * `DENIED` - The permissions entry rights\
        \ are denied to the trustee\"\n          },\n          \"address_ranges\"\
        : {\n            \"type\": \"array\",\n            \"items\": {\n        \
        \      \"description\": \"IP address ranges to apply permissions to. Empty\
        \ means all hosts.\",\n              \"type\": \"string\"\n            }\n\
        \          },\n          \"rights\": {\n            \"type\": \"array\",\n\
        \            \"items\": {\n              \"type\": \"string\",\n         \
        \     \"enum\": [\n                \"READ_DATA\",\n                \"READ_EA\"\
        ,\n                \"READ_ATTR\",\n                \"READ_ACL\",\n       \
        \         \"WRITE_EA\",\n                \"WRITE_ATTR\",\n               \
        \ \"WRITE_ACL\",\n                \"CHANGE_OWNER\",\n                \"WRITE_GROUP\"\
        ,\n                \"DELETE\",\n                \"EXECUTE\",\n           \
        \     \"MODIFY\",\n                \"EXTEND\",\n                \"DELETE_CHILD\"\
        ,\n                \"SYNCHRONIZE\",\n                \"READ\",\n         \
        \       \"WRITE\",\n                \"CHANGE_PERMISSIONS\"\n             \
        \ ],\n              \"description\": \"Rights pertaining to the permissions\
        \ entry:\\n * `CHANGE_OWNER` - Owner write access,\\n * `CHANGE_PERMISSIONS`\
        \ - Rights to change permissions on file objects,\\n * `DELETE` - Delete access,\\\
        n * `DELETE_CHILD` - Delete from directory access,\\n * `EXECUTE` - Execute\
        \ access,\\n * `EXTEND` - File extension access,\\n * `MODIFY` - File modification\
        \ access,\\n * `READ` - Read access rights,\\n * `READ_ACL` - ACL read access,\\\
        n * `READ_ATTR` - Attribute read access,\\n * `READ_DATA` - File read access,\\\
        n * `READ_EA` - Extended attribute read access,\\n * `SYNCHRONIZE` - File\
        \ synchronize access,\\n * `WRITE` - Write access rights,\\n * `WRITE_ACL`\
        \ - ACL write access,\\n * `WRITE_ATTR` - Attribute write access,\\n * `WRITE_EA`\
        \ - Extended attribute write access,\\n * `WRITE_GROUP` - Group write access\"\
        \n            }\n          }\n        }\n      }\n    },\n    \"access_based_enumeration_enabled\"\
        : {\n      \"description\": \"Enable Access-based Enumeration on this SMB\
        \ share\",\n      \"type\": \"boolean\"\n    },\n    \"default_file_create_mode\"\
        : {\n      \"description\": \"Default POSIX file create mode bits on this\
        \ SMB share (octal, default 0644 if this field is empty)\",\n      \"type\"\
        : \"string\"\n    },\n    \"default_directory_create_mode\": {\n      \"description\"\
        : \"Default POSIX directory create mode bits on this SMB share (octal, default\
        \ 0755 if this field is empty)\",\n      \"type\": \"string\"\n    },\n  \
        \  \"require_encryption\": {\n      \"description\": \"Require all traffic\
        \ to this share to be encrypted. Clients without encryption capabilities will\
        \ not be able to connect. Default is false if this field is empty.\",\n  \
        \    \"type\": \"boolean\"\n    },\n    \"allow_fs_path_create\": {\n    \
        \  \"description\": \"If true, the server will create the filesystem path\
        \ for the share if it does not already exist. If false, the filesystem path\
        \ must already exist. Default is false if this field is empty.\",\n      \"\
        type\": \"boolean\"\n    },\n    \"expand_fs_path_variables\": {\n      \"\
        description\": \"If true, the server will expand %U variables in the filesystem\
        \ path to username. Default is false if this field is empty.\",\n      \"\
        type\": \"boolean\"\n    },\n    \"offline_files_caching_mode\": {\n     \
        \ \"type\": \"string\",\n      \"enum\": [\n        \"NO_CACHING\",\n    \
        \    \"MANUAL_CACHING\",\n        \"AUTOMATIC_CACHING\"\n      ],\n      \"\
        description\": \"Offline-files caching mode advertised to SMB clients: \\\"\
        no_caching\\\" (no caching, the default), \\\"manual_caching\\\" (cache files\
        \ the user designates as offline-available), or \\\"automatic_caching\\\"\
        \ (cache files as they are opened).:\\n * `AUTOMATIC_CACHING` - SMB_OFFLINE_FILES_CACHING_MODE_AUTOMATIC_CACHING,\\\
        n * `MANUAL_CACHING` - SMB_OFFLINE_FILES_CACHING_MODE_MANUAL_CACHING,\\n *\
        \ `NO_CACHING` - SMB_OFFLINE_FILES_CACHING_MODE_NO_CACHING\"\n    }\n  }\n\
        }"
    responses:
    - code: '200'
      description: Return value on success
    preview: true
  put:
    summary: '[preview] Modify an SMB share''s options.'
    parameters:
    - name: share_id
      description: The unique ID of the SMB share.
      required: true
    - name: If-Match
      description: ETag for expected version
      required: false
    response_body:
      schema: "{\n  \"description\": \"api_smb_share_v3\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"id\": {\n      \"description\": \"The unique\
        \ ID of the SMB share\",\n      \"type\": \"string\"\n    },\n    \"share_name\"\
        : {\n      \"description\": \"The SMB share name\",\n      \"type\": \"string\"\
        \n    },\n    \"tenant_id\": {\n      \"description\": \"The tenant ID of\
        \ the tenant that the SMB share is a part of\",\n      \"type\": \"number\"\
        \n    },\n    \"fs_path\": {\n      \"description\": \"The filesystem path\
        \ to SMB share\",\n      \"type\": \"string\"\n    },\n    \"description\"\
        : {\n      \"description\": \"Description of this SMB share\",\n      \"type\"\
        : \"string\"\n    },\n    \"permissions\": {\n      \"type\": \"array\",\n\
        \      \"items\": {\n        \"description\": \"The access control list (ACL)\
        \ for this SMB share\",\n        \"type\": \"object\",\n        \"properties\"\
        : {\n          \"type\": {\n            \"type\": \"string\",\n          \
        \  \"enum\": [\n              \"ALLOWED\",\n              \"DENIED\"\n   \
        \         ],\n            \"description\": \"Type of permissions entry (ALLOWED\
        \ or DENIED):\\n * `ALLOWED` - The permissions entry rights are allowed to\
        \ the trustee,\\n * `DENIED` - The permissions entry rights are denied to\
        \ the trustee\"\n          },\n          \"trustee\": {\n            \"description\"\
        : \"User/group to apply the permissions entry to\",\n            \"type\"\
        : \"object\",\n            \"properties\": {\n              \"domain\": {\n\
        \                \"type\": \"string\",\n                \"enum\": [\n    \
        \              \"LOCAL\",\n                  \"API_NULL_DOMAIN\",\n      \
        \            \"WORLD\",\n                  \"POSIX_USER\",\n             \
        \     \"POSIX_GROUP\",\n                  \"ACTIVE_DIRECTORY\",\n        \
        \          \"API_INVALID_DOMAIN\",\n                  \"API_RESERVED_DOMAIN\"\
        ,\n                  \"API_INTERNAL_DOMAIN\",\n                  \"API_OPERATOR_DOMAIN\"\
        ,\n                  \"API_QUMULO_SUPPORT_DOMAIN\",\n                  \"\
        API_CREATOR_DOMAIN\"\n                ],\n                \"description\"\
        : \"domain:\\n * `ACTIVE_DIRECTORY` - ACTIVE_DIRECTORY,\\n * `API_CREATOR_DOMAIN`\
        \ - API_CREATOR_DOMAIN,\\n * `API_INTERNAL_DOMAIN` - API_INTERNAL_DOMAIN,\\\
        n * `API_INVALID_DOMAIN` - API_INVALID_DOMAIN,\\n * `API_NULL_DOMAIN` - API_NULL_DOMAIN,\\\
        n * `API_OPERATOR_DOMAIN` - API_OPERATOR_DOMAIN,\\n * `API_QUMULO_SUPPORT_DOMAIN`\
        \ - API_QUMULO_SUPPORT_DOMAIN,\\n * `API_RESERVED_DOMAIN` - API_RESERVED_DOMAIN,\\\
        n * `LOCAL` - LOCAL,\\n * `POSIX_GROUP` - POSIX_GROUP,\\n * `POSIX_USER` -\
        \ POSIX_USER,\\n * `WORLD` - WORLD\"\n              },\n              \"auth_id\"\
        : {\n                \"description\": \"auth_id\",\n                \"type\"\
        : \"string\"\n              },\n              \"uid\": {\n               \
        \ \"description\": \"uid\",\n                \"type\": \"number\"\n      \
        \        },\n              \"gid\": {\n                \"description\": \"\
        gid\",\n                \"type\": \"number\"\n              },\n         \
        \     \"sid\": {\n                \"description\": \"sid\",\n            \
        \    \"type\": \"string\"\n              },\n              \"name\": {\n \
        \               \"description\": \"name\",\n                \"type\": \"string\"\
        \n              }\n            }\n          },\n          \"rights\": {\n\
        \            \"type\": \"array\",\n            \"items\": {\n            \
        \  \"type\": \"string\",\n              \"enum\": [\n                \"READ_DATA\"\
        ,\n                \"READ_EA\",\n                \"READ_ATTR\",\n        \
        \        \"READ_ACL\",\n                \"WRITE_EA\",\n                \"\
        WRITE_ATTR\",\n                \"WRITE_ACL\",\n                \"CHANGE_OWNER\"\
        ,\n                \"WRITE_GROUP\",\n                \"DELETE\",\n       \
        \         \"EXECUTE\",\n                \"MODIFY\",\n                \"EXTEND\"\
        ,\n                \"DELETE_CHILD\",\n                \"SYNCHRONIZE\",\n \
        \               \"READ\",\n                \"WRITE\",\n                \"\
        CHANGE_PERMISSIONS\"\n              ],\n              \"description\": \"\
        Rights pertaining to the permissions entry:\\n * `CHANGE_OWNER` - Owner write\
        \ access,\\n * `CHANGE_PERMISSIONS` - Rights to change permissions on file\
        \ objects,\\n * `DELETE` - Delete access,\\n * `DELETE_CHILD` - Delete from\
        \ directory access,\\n * `EXECUTE` - Execute access,\\n * `EXTEND` - File\
        \ extension access,\\n * `MODIFY` - File modification access,\\n * `READ`\
        \ - Read access rights,\\n * `READ_ACL` - ACL read access,\\n * `READ_ATTR`\
        \ - Attribute read access,\\n * `READ_DATA` - File read access,\\n * `READ_EA`\
        \ - Extended attribute read access,\\n * `SYNCHRONIZE` - File synchronize\
        \ access,\\n * `WRITE` - Write access rights,\\n * `WRITE_ACL` - ACL write\
        \ access,\\n * `WRITE_ATTR` - Attribute write access,\\n * `WRITE_EA` - Extended\
        \ attribute write access,\\n * `WRITE_GROUP` - Group write access\"\n    \
        \        }\n          }\n        }\n      }\n    },\n    \"network_permissions\"\
        : {\n      \"type\": \"array\",\n      \"items\": {\n        \"description\"\
        : \"The network access control list (ACL) for this SMB share. If not specified,\
        \ the default is to allow any host.\",\n        \"type\": \"object\",\n  \
        \      \"properties\": {\n          \"type\": {\n            \"type\": \"\
        string\",\n            \"enum\": [\n              \"ALLOWED\",\n         \
        \     \"DENIED\"\n            ],\n            \"description\": \"Type of permissions\
        \ entry (ALLOWED or DENIED):\\n * `ALLOWED` - The permissions entry rights\
        \ are allowed to the trustee,\\n * `DENIED` - The permissions entry rights\
        \ are denied to the trustee\"\n          },\n          \"address_ranges\"\
        : {\n            \"type\": \"array\",\n            \"items\": {\n        \
        \      \"description\": \"IP address ranges to apply permissions to. Empty\
        \ means all hosts.\",\n              \"type\": \"string\"\n            }\n\
        \          },\n          \"rights\": {\n            \"type\": \"array\",\n\
        \            \"items\": {\n              \"type\": \"string\",\n         \
        \     \"enum\": [\n                \"READ_DATA\",\n                \"READ_EA\"\
        ,\n                \"READ_ATTR\",\n                \"READ_ACL\",\n       \
        \         \"WRITE_EA\",\n                \"WRITE_ATTR\",\n               \
        \ \"WRITE_ACL\",\n                \"CHANGE_OWNER\",\n                \"WRITE_GROUP\"\
        ,\n                \"DELETE\",\n                \"EXECUTE\",\n           \
        \     \"MODIFY\",\n                \"EXTEND\",\n                \"DELETE_CHILD\"\
        ,\n                \"SYNCHRONIZE\",\n                \"READ\",\n         \
        \       \"WRITE\",\n                \"CHANGE_PERMISSIONS\"\n             \
        \ ],\n              \"description\": \"Rights pertaining to the permissions\
        \ entry:\\n * `CHANGE_OWNER` - Owner write access,\\n * `CHANGE_PERMISSIONS`\
        \ - Rights to change permissions on file objects,\\n * `DELETE` - Delete access,\\\
        n * `DELETE_CHILD` - Delete from directory access,\\n * `EXECUTE` - Execute\
        \ access,\\n * `EXTEND` - File extension access,\\n * `MODIFY` - File modification\
        \ access,\\n * `READ` - Read access rights,\\n * `READ_ACL` - ACL read access,\\\
        n * `READ_ATTR` - Attribute read access,\\n * `READ_DATA` - File read access,\\\
        n * `READ_EA` - Extended attribute read access,\\n * `SYNCHRONIZE` - File\
        \ synchronize access,\\n * `WRITE` - Write access rights,\\n * `WRITE_ACL`\
        \ - ACL write access,\\n * `WRITE_ATTR` - Attribute write access,\\n * `WRITE_EA`\
        \ - Extended attribute write access,\\n * `WRITE_GROUP` - Group write access\"\
        \n            }\n          }\n        }\n      }\n    },\n    \"access_based_enumeration_enabled\"\
        : {\n      \"description\": \"Enable Access-based Enumeration on this SMB\
        \ share\",\n      \"type\": \"boolean\"\n    },\n    \"default_file_create_mode\"\
        : {\n      \"description\": \"Default POSIX file create mode bits on this\
        \ SMB share (octal, default 0644 if this field is empty)\",\n      \"type\"\
        : \"string\"\n    },\n    \"default_directory_create_mode\": {\n      \"description\"\
        : \"Default POSIX directory create mode bits on this SMB share (octal, default\
        \ 0755 if this field is empty)\",\n      \"type\": \"string\"\n    },\n  \
        \  \"require_encryption\": {\n      \"description\": \"Require all traffic\
        \ to this share to be encrypted. Clients without encryption capabilities will\
        \ not be able to connect. Default is false if this field is empty.\",\n  \
        \    \"type\": \"boolean\"\n    },\n    \"allow_fs_path_create\": {\n    \
        \  \"description\": \"If true, the server will create the filesystem path\
        \ for the share if it does not already exist. If false, the filesystem path\
        \ must already exist. Default is false if this field is empty.\",\n      \"\
        type\": \"boolean\"\n    },\n    \"expand_fs_path_variables\": {\n      \"\
        description\": \"If true, the server will expand %U variables in the filesystem\
        \ path to username. Default is false if this field is empty.\",\n      \"\
        type\": \"boolean\"\n    },\n    \"offline_files_caching_mode\": {\n     \
        \ \"type\": \"string\",\n      \"enum\": [\n        \"NO_CACHING\",\n    \
        \    \"MANUAL_CACHING\",\n        \"AUTOMATIC_CACHING\"\n      ],\n      \"\
        description\": \"Offline-files caching mode advertised to SMB clients: \\\"\
        no_caching\\\" (no caching, the default), \\\"manual_caching\\\" (cache files\
        \ the user designates as offline-available), or \\\"automatic_caching\\\"\
        \ (cache files as they are opened).:\\n * `AUTOMATIC_CACHING` - SMB_OFFLINE_FILES_CACHING_MODE_AUTOMATIC_CACHING,\\\
        n * `MANUAL_CACHING` - SMB_OFFLINE_FILES_CACHING_MODE_MANUAL_CACHING,\\n *\
        \ `NO_CACHING` - SMB_OFFLINE_FILES_CACHING_MODE_NO_CACHING\"\n    }\n  }\n\
        }"
    responses:
    - code: '200'
      description: Return value on success
    preview: true
    request_body:
      schema: "{\n  \"description\": \"api_smb_share_v3\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"id\": {\n      \"description\": \"The unique\
        \ ID of the SMB share\",\n      \"type\": \"string\"\n    },\n    \"share_name\"\
        : {\n      \"description\": \"The SMB share name\",\n      \"type\": \"string\"\
        \n    },\n    \"tenant_id\": {\n      \"description\": \"The tenant ID of\
        \ the tenant that the SMB share is a part of\",\n      \"type\": \"number\"\
        \n    },\n    \"fs_path\": {\n      \"description\": \"The filesystem path\
        \ to SMB share\",\n      \"type\": \"string\"\n    },\n    \"description\"\
        : {\n      \"description\": \"Description of this SMB share\",\n      \"type\"\
        : \"string\"\n    },\n    \"permissions\": {\n      \"type\": \"array\",\n\
        \      \"items\": {\n        \"description\": \"The access control list (ACL)\
        \ for this SMB share\",\n        \"type\": \"object\",\n        \"properties\"\
        : {\n          \"type\": {\n            \"type\": \"string\",\n          \
        \  \"enum\": [\n              \"ALLOWED\",\n              \"DENIED\"\n   \
        \         ],\n            \"description\": \"Type of permissions entry (ALLOWED\
        \ or DENIED):\\n * `ALLOWED` - The permissions entry rights are allowed to\
        \ the trustee,\\n * `DENIED` - The permissions entry rights are denied to\
        \ the trustee\"\n          },\n          \"trustee\": {\n            \"description\"\
        : \"User/group to apply the permissions entry to\",\n            \"type\"\
        : \"object\",\n            \"properties\": {\n              \"domain\": {\n\
        \                \"type\": \"string\",\n                \"enum\": [\n    \
        \              \"LOCAL\",\n                  \"API_NULL_DOMAIN\",\n      \
        \            \"WORLD\",\n                  \"POSIX_USER\",\n             \
        \     \"POSIX_GROUP\",\n                  \"ACTIVE_DIRECTORY\",\n        \
        \          \"API_INVALID_DOMAIN\",\n                  \"API_RESERVED_DOMAIN\"\
        ,\n                  \"API_INTERNAL_DOMAIN\",\n                  \"API_OPERATOR_DOMAIN\"\
        ,\n                  \"API_QUMULO_SUPPORT_DOMAIN\",\n                  \"\
        API_CREATOR_DOMAIN\"\n                ],\n                \"description\"\
        : \"domain:\\n * `ACTIVE_DIRECTORY` - ACTIVE_DIRECTORY,\\n * `API_CREATOR_DOMAIN`\
        \ - API_CREATOR_DOMAIN,\\n * `API_INTERNAL_DOMAIN` - API_INTERNAL_DOMAIN,\\\
        n * `API_INVALID_DOMAIN` - API_INVALID_DOMAIN,\\n * `API_NULL_DOMAIN` - API_NULL_DOMAIN,\\\
        n * `API_OPERATOR_DOMAIN` - API_OPERATOR_DOMAIN,\\n * `API_QUMULO_SUPPORT_DOMAIN`\
        \ - API_QUMULO_SUPPORT_DOMAIN,\\n * `API_RESERVED_DOMAIN` - API_RESERVED_DOMAIN,\\\
        n * `LOCAL` - LOCAL,\\n * `POSIX_GROUP` - POSIX_GROUP,\\n * `POSIX_USER` -\
        \ POSIX_USER,\\n * `WORLD` - WORLD\"\n              },\n              \"auth_id\"\
        : {\n                \"description\": \"auth_id\",\n                \"type\"\
        : \"string\"\n              },\n              \"uid\": {\n               \
        \ \"description\": \"uid\",\n                \"type\": \"number\"\n      \
        \        },\n              \"gid\": {\n                \"description\": \"\
        gid\",\n                \"type\": \"number\"\n              },\n         \
        \     \"sid\": {\n                \"description\": \"sid\",\n            \
        \    \"type\": \"string\"\n              },\n              \"name\": {\n \
        \               \"description\": \"name\",\n                \"type\": \"string\"\
        \n              }\n            }\n          },\n          \"rights\": {\n\
        \            \"type\": \"array\",\n            \"items\": {\n            \
        \  \"type\": \"string\",\n              \"enum\": [\n                \"READ_DATA\"\
        ,\n                \"READ_EA\",\n                \"READ_ATTR\",\n        \
        \        \"READ_ACL\",\n                \"WRITE_EA\",\n                \"\
        WRITE_ATTR\",\n                \"WRITE_ACL\",\n                \"CHANGE_OWNER\"\
        ,\n                \"WRITE_GROUP\",\n                \"DELETE\",\n       \
        \         \"EXECUTE\",\n                \"MODIFY\",\n                \"EXTEND\"\
        ,\n                \"DELETE_CHILD\",\n                \"SYNCHRONIZE\",\n \
        \               \"READ\",\n                \"WRITE\",\n                \"\
        CHANGE_PERMISSIONS\",\n                \"ADD_FILE\",\n                \"ADD_SUBDIR\"\
        ,\n                \"ALL\",\n                \"NONE\"\n              ],\n\
        \              \"description\": \"Rights pertaining to the permissions entry:\\\
        n * `ADD_FILE` - Alias for MODIFY,\\n * `ADD_SUBDIR` - Alias for EXTEND,\\\
        n * `ALL` - READ, WRITE, and CHANGE_PERMISSIONS,\\n * `CHANGE_OWNER` - Owner\
        \ write access,\\n * `CHANGE_PERMISSIONS` - Rights to change permissions on\
        \ file objects,\\n * `DELETE` - Delete access,\\n * `DELETE_CHILD` - Delete\
        \ from directory access,\\n * `EXECUTE` - Execute access,\\n * `EXTEND` -\
        \ File extension access,\\n * `MODIFY` - File modification access,\\n * `NONE`\
        \ - No rights,\\n * `READ` - Read access rights,\\n * `READ_ACL` - ACL read\
        \ access,\\n * `READ_ATTR` - Attribute read access,\\n * `READ_DATA` - File\
        \ read access,\\n * `READ_EA` - Extended attribute read access,\\n * `SYNCHRONIZE`\
        \ - File synchronize access,\\n * `WRITE` - Write access rights,\\n * `WRITE_ACL`\
        \ - ACL write access,\\n * `WRITE_ATTR` - Attribute write access,\\n * `WRITE_EA`\
        \ - Extended attribute write access,\\n * `WRITE_GROUP` - Group write access\"\
        \n            }\n          }\n        }\n      }\n    },\n    \"network_permissions\"\
        : {\n      \"type\": \"array\",\n      \"items\": {\n        \"description\"\
        : \"The network access control list (ACL) for this SMB share. If not specified,\
        \ the default is to allow any host.\",\n        \"type\": \"object\",\n  \
        \      \"properties\": {\n          \"type\": {\n            \"type\": \"\
        string\",\n            \"enum\": [\n              \"ALLOWED\",\n         \
        \     \"DENIED\"\n            ],\n            \"description\": \"Type of permissions\
        \ entry (ALLOWED or DENIED):\\n * `ALLOWED` - The permissions entry rights\
        \ are allowed to the trustee,\\n * `DENIED` - The permissions entry rights\
        \ are denied to the trustee\"\n          },\n          \"address_ranges\"\
        : {\n            \"type\": \"array\",\n            \"items\": {\n        \
        \      \"description\": \"IP address ranges to apply permissions to. Empty\
        \ means all hosts.\",\n              \"type\": \"string\"\n            }\n\
        \          },\n          \"rights\": {\n            \"type\": \"array\",\n\
        \            \"items\": {\n              \"type\": \"string\",\n         \
        \     \"enum\": [\n                \"READ_DATA\",\n                \"READ_EA\"\
        ,\n                \"READ_ATTR\",\n                \"READ_ACL\",\n       \
        \         \"WRITE_EA\",\n                \"WRITE_ATTR\",\n               \
        \ \"WRITE_ACL\",\n                \"CHANGE_OWNER\",\n                \"WRITE_GROUP\"\
        ,\n                \"DELETE\",\n                \"EXECUTE\",\n           \
        \     \"MODIFY\",\n                \"EXTEND\",\n                \"DELETE_CHILD\"\
        ,\n                \"SYNCHRONIZE\",\n                \"READ\",\n         \
        \       \"WRITE\",\n                \"CHANGE_PERMISSIONS\",\n            \
        \    \"ADD_FILE\",\n                \"ADD_SUBDIR\",\n                \"ALL\"\
        ,\n                \"NONE\"\n              ],\n              \"description\"\
        : \"Rights pertaining to the permissions entry:\\n * `ADD_FILE` - Alias for\
        \ MODIFY,\\n * `ADD_SUBDIR` - Alias for EXTEND,\\n * `ALL` - READ, WRITE,\
        \ and CHANGE_PERMISSIONS,\\n * `CHANGE_OWNER` - Owner write access,\\n * `CHANGE_PERMISSIONS`\
        \ - Rights to change permissions on file objects,\\n * `DELETE` - Delete access,\\\
        n * `DELETE_CHILD` - Delete from directory access,\\n * `EXECUTE` - Execute\
        \ access,\\n * `EXTEND` - File extension access,\\n * `MODIFY` - File modification\
        \ access,\\n * `NONE` - No rights,\\n * `READ` - Read access rights,\\n *\
        \ `READ_ACL` - ACL read access,\\n * `READ_ATTR` - Attribute read access,\\\
        n * `READ_DATA` - File read access,\\n * `READ_EA` - Extended attribute read\
        \ access,\\n * `SYNCHRONIZE` - File synchronize access,\\n * `WRITE` - Write\
        \ access rights,\\n * `WRITE_ACL` - ACL write access,\\n * `WRITE_ATTR` -\
        \ Attribute write access,\\n * `WRITE_EA` - Extended attribute write access,\\\
        n * `WRITE_GROUP` - Group write access\"\n            }\n          }\n   \
        \     }\n      }\n    },\n    \"access_based_enumeration_enabled\": {\n  \
        \    \"description\": \"Enable Access-based Enumeration on this SMB share\"\
        ,\n      \"type\": \"boolean\"\n    },\n    \"default_file_create_mode\":\
        \ {\n      \"description\": \"Default POSIX file create mode bits on this\
        \ SMB share (octal, default 0644 if this field is empty)\",\n      \"type\"\
        : \"string\"\n    },\n    \"default_directory_create_mode\": {\n      \"description\"\
        : \"Default POSIX directory create mode bits on this SMB share (octal, default\
        \ 0755 if this field is empty)\",\n      \"type\": \"string\"\n    },\n  \
        \  \"require_encryption\": {\n      \"description\": \"Require all traffic\
        \ to this share to be encrypted. Clients without encryption capabilities will\
        \ not be able to connect. Default is false if this field is empty.\",\n  \
        \    \"type\": \"boolean\"\n    },\n    \"allow_fs_path_create\": {\n    \
        \  \"description\": \"If true, the server will create the filesystem path\
        \ for the share if it does not already exist. If false, the filesystem path\
        \ must already exist. Default is false if this field is empty.\",\n      \"\
        type\": \"boolean\"\n    },\n    \"expand_fs_path_variables\": {\n      \"\
        description\": \"If true, the server will expand %U variables in the filesystem\
        \ path to username. Default is false if this field is empty.\",\n      \"\
        type\": \"boolean\"\n    },\n    \"offline_files_caching_mode\": {\n     \
        \ \"type\": \"string\",\n      \"enum\": [\n        \"NO_CACHING\",\n    \
        \    \"MANUAL_CACHING\",\n        \"AUTOMATIC_CACHING\"\n      ],\n      \"\
        description\": \"Offline-files caching mode advertised to SMB clients: \\\"\
        no_caching\\\" (no caching, the default), \\\"manual_caching\\\" (cache files\
        \ the user designates as offline-available), or \\\"automatic_caching\\\"\
        \ (cache files as they are opened).:\\n * `AUTOMATIC_CACHING` - SMB_OFFLINE_FILES_CACHING_MODE_AUTOMATIC_CACHING,\\\
        n * `MANUAL_CACHING` - SMB_OFFLINE_FILES_CACHING_MODE_MANUAL_CACHING,\\n *\
        \ `NO_CACHING` - SMB_OFFLINE_FILES_CACHING_MODE_NO_CACHING\"\n    }\n  }\n\
        }"
  patch:
    summary: '[preview] Modify select fields in an SMB share.'
    parameters:
    - name: share_id
      description: The unique ID of the SMB share.
      required: true
    - name: If-Match
      description: ETag for expected version
      required: false
    response_body:
      schema: "{\n  \"description\": \"api_smb_share_v3\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"id\": {\n      \"description\": \"The unique\
        \ ID of the SMB share\",\n      \"type\": \"string\"\n    },\n    \"share_name\"\
        : {\n      \"description\": \"The SMB share name\",\n      \"type\": \"string\"\
        \n    },\n    \"tenant_id\": {\n      \"description\": \"The tenant ID of\
        \ the tenant that the SMB share is a part of\",\n      \"type\": \"number\"\
        \n    },\n    \"fs_path\": {\n      \"description\": \"The filesystem path\
        \ to SMB share\",\n      \"type\": \"string\"\n    },\n    \"description\"\
        : {\n      \"description\": \"Description of this SMB share\",\n      \"type\"\
        : \"string\"\n    },\n    \"permissions\": {\n      \"type\": \"array\",\n\
        \      \"items\": {\n        \"description\": \"The access control list (ACL)\
        \ for this SMB share\",\n        \"type\": \"object\",\n        \"properties\"\
        : {\n          \"type\": {\n            \"type\": \"string\",\n          \
        \  \"enum\": [\n              \"ALLOWED\",\n              \"DENIED\"\n   \
        \         ],\n            \"description\": \"Type of permissions entry (ALLOWED\
        \ or DENIED):\\n * `ALLOWED` - The permissions entry rights are allowed to\
        \ the trustee,\\n * `DENIED` - The permissions entry rights are denied to\
        \ the trustee\"\n          },\n          \"trustee\": {\n            \"description\"\
        : \"User/group to apply the permissions entry to\",\n            \"type\"\
        : \"object\",\n            \"properties\": {\n              \"domain\": {\n\
        \                \"type\": \"string\",\n                \"enum\": [\n    \
        \              \"LOCAL\",\n                  \"API_NULL_DOMAIN\",\n      \
        \            \"WORLD\",\n                  \"POSIX_USER\",\n             \
        \     \"POSIX_GROUP\",\n                  \"ACTIVE_DIRECTORY\",\n        \
        \          \"API_INVALID_DOMAIN\",\n                  \"API_RESERVED_DOMAIN\"\
        ,\n                  \"API_INTERNAL_DOMAIN\",\n                  \"API_OPERATOR_DOMAIN\"\
        ,\n                  \"API_QUMULO_SUPPORT_DOMAIN\",\n                  \"\
        API_CREATOR_DOMAIN\"\n                ],\n                \"description\"\
        : \"domain:\\n * `ACTIVE_DIRECTORY` - ACTIVE_DIRECTORY,\\n * `API_CREATOR_DOMAIN`\
        \ - API_CREATOR_DOMAIN,\\n * `API_INTERNAL_DOMAIN` - API_INTERNAL_DOMAIN,\\\
        n * `API_INVALID_DOMAIN` - API_INVALID_DOMAIN,\\n * `API_NULL_DOMAIN` - API_NULL_DOMAIN,\\\
        n * `API_OPERATOR_DOMAIN` - API_OPERATOR_DOMAIN,\\n * `API_QUMULO_SUPPORT_DOMAIN`\
        \ - API_QUMULO_SUPPORT_DOMAIN,\\n * `API_RESERVED_DOMAIN` - API_RESERVED_DOMAIN,\\\
        n * `LOCAL` - LOCAL,\\n * `POSIX_GROUP` - POSIX_GROUP,\\n * `POSIX_USER` -\
        \ POSIX_USER,\\n * `WORLD` - WORLD\"\n              },\n              \"auth_id\"\
        : {\n                \"description\": \"auth_id\",\n                \"type\"\
        : \"string\"\n              },\n              \"uid\": {\n               \
        \ \"description\": \"uid\",\n                \"type\": \"number\"\n      \
        \        },\n              \"gid\": {\n                \"description\": \"\
        gid\",\n                \"type\": \"number\"\n              },\n         \
        \     \"sid\": {\n                \"description\": \"sid\",\n            \
        \    \"type\": \"string\"\n              },\n              \"name\": {\n \
        \               \"description\": \"name\",\n                \"type\": \"string\"\
        \n              }\n            }\n          },\n          \"rights\": {\n\
        \            \"type\": \"array\",\n            \"items\": {\n            \
        \  \"type\": \"string\",\n              \"enum\": [\n                \"READ_DATA\"\
        ,\n                \"READ_EA\",\n                \"READ_ATTR\",\n        \
        \        \"READ_ACL\",\n                \"WRITE_EA\",\n                \"\
        WRITE_ATTR\",\n                \"WRITE_ACL\",\n                \"CHANGE_OWNER\"\
        ,\n                \"WRITE_GROUP\",\n                \"DELETE\",\n       \
        \         \"EXECUTE\",\n                \"MODIFY\",\n                \"EXTEND\"\
        ,\n                \"DELETE_CHILD\",\n                \"SYNCHRONIZE\",\n \
        \               \"READ\",\n                \"WRITE\",\n                \"\
        CHANGE_PERMISSIONS\"\n              ],\n              \"description\": \"\
        Rights pertaining to the permissions entry:\\n * `CHANGE_OWNER` - Owner write\
        \ access,\\n * `CHANGE_PERMISSIONS` - Rights to change permissions on file\
        \ objects,\\n * `DELETE` - Delete access,\\n * `DELETE_CHILD` - Delete from\
        \ directory access,\\n * `EXECUTE` - Execute access,\\n * `EXTEND` - File\
        \ extension access,\\n * `MODIFY` - File modification access,\\n * `READ`\
        \ - Read access rights,\\n * `READ_ACL` - ACL read access,\\n * `READ_ATTR`\
        \ - Attribute read access,\\n * `READ_DATA` - File read access,\\n * `READ_EA`\
        \ - Extended attribute read access,\\n * `SYNCHRONIZE` - File synchronize\
        \ access,\\n * `WRITE` - Write access rights,\\n * `WRITE_ACL` - ACL write\
        \ access,\\n * `WRITE_ATTR` - Attribute write access,\\n * `WRITE_EA` - Extended\
        \ attribute write access,\\n * `WRITE_GROUP` - Group write access\"\n    \
        \        }\n          }\n        }\n      }\n    },\n    \"network_permissions\"\
        : {\n      \"type\": \"array\",\n      \"items\": {\n        \"description\"\
        : \"The network access control list (ACL) for this SMB share. If not specified,\
        \ the default is to allow any host.\",\n        \"type\": \"object\",\n  \
        \      \"properties\": {\n          \"type\": {\n            \"type\": \"\
        string\",\n            \"enum\": [\n              \"ALLOWED\",\n         \
        \     \"DENIED\"\n            ],\n            \"description\": \"Type of permissions\
        \ entry (ALLOWED or DENIED):\\n * `ALLOWED` - The permissions entry rights\
        \ are allowed to the trustee,\\n * `DENIED` - The permissions entry rights\
        \ are denied to the trustee\"\n          },\n          \"address_ranges\"\
        : {\n            \"type\": \"array\",\n            \"items\": {\n        \
        \      \"description\": \"IP address ranges to apply permissions to. Empty\
        \ means all hosts.\",\n              \"type\": \"string\"\n            }\n\
        \          },\n          \"rights\": {\n            \"type\": \"array\",\n\
        \            \"items\": {\n              \"type\": \"string\",\n         \
        \     \"enum\": [\n                \"READ_DATA\",\n                \"READ_EA\"\
        ,\n                \"READ_ATTR\",\n                \"READ_ACL\",\n       \
        \         \"WRITE_EA\",\n                \"WRITE_ATTR\",\n               \
        \ \"WRITE_ACL\",\n                \"CHANGE_OWNER\",\n                \"WRITE_GROUP\"\
        ,\n                \"DELETE\",\n                \"EXECUTE\",\n           \
        \     \"MODIFY\",\n                \"EXTEND\",\n                \"DELETE_CHILD\"\
        ,\n                \"SYNCHRONIZE\",\n                \"READ\",\n         \
        \       \"WRITE\",\n                \"CHANGE_PERMISSIONS\"\n             \
        \ ],\n              \"description\": \"Rights pertaining to the permissions\
        \ entry:\\n * `CHANGE_OWNER` - Owner write access,\\n * `CHANGE_PERMISSIONS`\
        \ - Rights to change permissions on file objects,\\n * `DELETE` - Delete access,\\\
        n * `DELETE_CHILD` - Delete from directory access,\\n * `EXECUTE` - Execute\
        \ access,\\n * `EXTEND` - File extension access,\\n * `MODIFY` - File modification\
        \ access,\\n * `READ` - Read access rights,\\n * `READ_ACL` - ACL read access,\\\
        n * `READ_ATTR` - Attribute read access,\\n * `READ_DATA` - File read access,\\\
        n * `READ_EA` - Extended attribute read access,\\n * `SYNCHRONIZE` - File\
        \ synchronize access,\\n * `WRITE` - Write access rights,\\n * `WRITE_ACL`\
        \ - ACL write access,\\n * `WRITE_ATTR` - Attribute write access,\\n * `WRITE_EA`\
        \ - Extended attribute write access,\\n * `WRITE_GROUP` - Group write access\"\
        \n            }\n          }\n        }\n      }\n    },\n    \"access_based_enumeration_enabled\"\
        : {\n      \"description\": \"Enable Access-based Enumeration on this SMB\
        \ share\",\n      \"type\": \"boolean\"\n    },\n    \"default_file_create_mode\"\
        : {\n      \"description\": \"Default POSIX file create mode bits on this\
        \ SMB share (octal, default 0644 if this field is empty)\",\n      \"type\"\
        : \"string\"\n    },\n    \"default_directory_create_mode\": {\n      \"description\"\
        : \"Default POSIX directory create mode bits on this SMB share (octal, default\
        \ 0755 if this field is empty)\",\n      \"type\": \"string\"\n    },\n  \
        \  \"require_encryption\": {\n      \"description\": \"Require all traffic\
        \ to this share to be encrypted. Clients without encryption capabilities will\
        \ not be able to connect. Default is false if this field is empty.\",\n  \
        \    \"type\": \"boolean\"\n    },\n    \"allow_fs_path_create\": {\n    \
        \  \"description\": \"If true, the server will create the filesystem path\
        \ for the share if it does not already exist. If false, the filesystem path\
        \ must already exist. Default is false if this field is empty.\",\n      \"\
        type\": \"boolean\"\n    },\n    \"expand_fs_path_variables\": {\n      \"\
        description\": \"If true, the server will expand %U variables in the filesystem\
        \ path to username. Default is false if this field is empty.\",\n      \"\
        type\": \"boolean\"\n    },\n    \"offline_files_caching_mode\": {\n     \
        \ \"type\": \"string\",\n      \"enum\": [\n        \"NO_CACHING\",\n    \
        \    \"MANUAL_CACHING\",\n        \"AUTOMATIC_CACHING\"\n      ],\n      \"\
        description\": \"Offline-files caching mode advertised to SMB clients: \\\"\
        no_caching\\\" (no caching, the default), \\\"manual_caching\\\" (cache files\
        \ the user designates as offline-available), or \\\"automatic_caching\\\"\
        \ (cache files as they are opened).:\\n * `AUTOMATIC_CACHING` - SMB_OFFLINE_FILES_CACHING_MODE_AUTOMATIC_CACHING,\\\
        n * `MANUAL_CACHING` - SMB_OFFLINE_FILES_CACHING_MODE_MANUAL_CACHING,\\n *\
        \ `NO_CACHING` - SMB_OFFLINE_FILES_CACHING_MODE_NO_CACHING\"\n    }\n  }\n\
        }"
    responses:
    - code: '200'
      description: Return value on success
    preview: true
    request_body:
      schema: "{\n  \"description\": \"api_smb_share_v3\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"id\": {\n      \"description\": \"The unique\
        \ ID of the SMB share\",\n      \"type\": \"string\"\n    },\n    \"share_name\"\
        : {\n      \"description\": \"The SMB share name\",\n      \"type\": \"string\"\
        \n    },\n    \"tenant_id\": {\n      \"description\": \"The tenant ID of\
        \ the tenant that the SMB share is a part of\",\n      \"type\": \"number\"\
        \n    },\n    \"fs_path\": {\n      \"description\": \"The filesystem path\
        \ to SMB share\",\n      \"type\": \"string\"\n    },\n    \"description\"\
        : {\n      \"description\": \"Description of this SMB share\",\n      \"type\"\
        : \"string\"\n    },\n    \"permissions\": {\n      \"type\": \"array\",\n\
        \      \"items\": {\n        \"description\": \"The access control list (ACL)\
        \ for this SMB share\",\n        \"type\": \"object\",\n        \"properties\"\
        : {\n          \"type\": {\n            \"type\": \"string\",\n          \
        \  \"enum\": [\n              \"ALLOWED\",\n              \"DENIED\"\n   \
        \         ],\n            \"description\": \"Type of permissions entry (ALLOWED\
        \ or DENIED):\\n * `ALLOWED` - The permissions entry rights are allowed to\
        \ the trustee,\\n * `DENIED` - The permissions entry rights are denied to\
        \ the trustee\"\n          },\n          \"trustee\": {\n            \"description\"\
        : \"User/group to apply the permissions entry to\",\n            \"type\"\
        : \"object\",\n            \"properties\": {\n              \"domain\": {\n\
        \                \"type\": \"string\",\n                \"enum\": [\n    \
        \              \"LOCAL\",\n                  \"API_NULL_DOMAIN\",\n      \
        \            \"WORLD\",\n                  \"POSIX_USER\",\n             \
        \     \"POSIX_GROUP\",\n                  \"ACTIVE_DIRECTORY\",\n        \
        \          \"API_INVALID_DOMAIN\",\n                  \"API_RESERVED_DOMAIN\"\
        ,\n                  \"API_INTERNAL_DOMAIN\",\n                  \"API_OPERATOR_DOMAIN\"\
        ,\n                  \"API_QUMULO_SUPPORT_DOMAIN\",\n                  \"\
        API_CREATOR_DOMAIN\"\n                ],\n                \"description\"\
        : \"domain:\\n * `ACTIVE_DIRECTORY` - ACTIVE_DIRECTORY,\\n * `API_CREATOR_DOMAIN`\
        \ - API_CREATOR_DOMAIN,\\n * `API_INTERNAL_DOMAIN` - API_INTERNAL_DOMAIN,\\\
        n * `API_INVALID_DOMAIN` - API_INVALID_DOMAIN,\\n * `API_NULL_DOMAIN` - API_NULL_DOMAIN,\\\
        n * `API_OPERATOR_DOMAIN` - API_OPERATOR_DOMAIN,\\n * `API_QUMULO_SUPPORT_DOMAIN`\
        \ - API_QUMULO_SUPPORT_DOMAIN,\\n * `API_RESERVED_DOMAIN` - API_RESERVED_DOMAIN,\\\
        n * `LOCAL` - LOCAL,\\n * `POSIX_GROUP` - POSIX_GROUP,\\n * `POSIX_USER` -\
        \ POSIX_USER,\\n * `WORLD` - WORLD\"\n              },\n              \"auth_id\"\
        : {\n                \"description\": \"auth_id\",\n                \"type\"\
        : \"string\"\n              },\n              \"uid\": {\n               \
        \ \"description\": \"uid\",\n                \"type\": \"number\"\n      \
        \        },\n              \"gid\": {\n                \"description\": \"\
        gid\",\n                \"type\": \"number\"\n              },\n         \
        \     \"sid\": {\n                \"description\": \"sid\",\n            \
        \    \"type\": \"string\"\n              },\n              \"name\": {\n \
        \               \"description\": \"name\",\n                \"type\": \"string\"\
        \n              }\n            }\n          },\n          \"rights\": {\n\
        \            \"type\": \"array\",\n            \"items\": {\n            \
        \  \"type\": \"string\",\n              \"enum\": [\n                \"READ_DATA\"\
        ,\n                \"READ_EA\",\n                \"READ_ATTR\",\n        \
        \        \"READ_ACL\",\n                \"WRITE_EA\",\n                \"\
        WRITE_ATTR\",\n                \"WRITE_ACL\",\n                \"CHANGE_OWNER\"\
        ,\n                \"WRITE_GROUP\",\n                \"DELETE\",\n       \
        \         \"EXECUTE\",\n                \"MODIFY\",\n                \"EXTEND\"\
        ,\n                \"DELETE_CHILD\",\n                \"SYNCHRONIZE\",\n \
        \               \"READ\",\n                \"WRITE\",\n                \"\
        CHANGE_PERMISSIONS\",\n                \"ADD_FILE\",\n                \"ADD_SUBDIR\"\
        ,\n                \"ALL\",\n                \"NONE\"\n              ],\n\
        \              \"description\": \"Rights pertaining to the permissions entry:\\\
        n * `ADD_FILE` - Alias for MODIFY,\\n * `ADD_SUBDIR` - Alias for EXTEND,\\\
        n * `ALL` - READ, WRITE, and CHANGE_PERMISSIONS,\\n * `CHANGE_OWNER` - Owner\
        \ write access,\\n * `CHANGE_PERMISSIONS` - Rights to change permissions on\
        \ file objects,\\n * `DELETE` - Delete access,\\n * `DELETE_CHILD` - Delete\
        \ from directory access,\\n * `EXECUTE` - Execute access,\\n * `EXTEND` -\
        \ File extension access,\\n * `MODIFY` - File modification access,\\n * `NONE`\
        \ - No rights,\\n * `READ` - Read access rights,\\n * `READ_ACL` - ACL read\
        \ access,\\n * `READ_ATTR` - Attribute read access,\\n * `READ_DATA` - File\
        \ read access,\\n * `READ_EA` - Extended attribute read access,\\n * `SYNCHRONIZE`\
        \ - File synchronize access,\\n * `WRITE` - Write access rights,\\n * `WRITE_ACL`\
        \ - ACL write access,\\n * `WRITE_ATTR` - Attribute write access,\\n * `WRITE_EA`\
        \ - Extended attribute write access,\\n * `WRITE_GROUP` - Group write access\"\
        \n            }\n          }\n        }\n      }\n    },\n    \"network_permissions\"\
        : {\n      \"type\": \"array\",\n      \"items\": {\n        \"description\"\
        : \"The network access control list (ACL) for this SMB share. If not specified,\
        \ the default is to allow any host.\",\n        \"type\": \"object\",\n  \
        \      \"properties\": {\n          \"type\": {\n            \"type\": \"\
        string\",\n            \"enum\": [\n              \"ALLOWED\",\n         \
        \     \"DENIED\"\n            ],\n            \"description\": \"Type of permissions\
        \ entry (ALLOWED or DENIED):\\n * `ALLOWED` - The permissions entry rights\
        \ are allowed to the trustee,\\n * `DENIED` - The permissions entry rights\
        \ are denied to the trustee\"\n          },\n          \"address_ranges\"\
        : {\n            \"type\": \"array\",\n            \"items\": {\n        \
        \      \"description\": \"IP address ranges to apply permissions to. Empty\
        \ means all hosts.\",\n              \"type\": \"string\"\n            }\n\
        \          },\n          \"rights\": {\n            \"type\": \"array\",\n\
        \            \"items\": {\n              \"type\": \"string\",\n         \
        \     \"enum\": [\n                \"READ_DATA\",\n                \"READ_EA\"\
        ,\n                \"READ_ATTR\",\n                \"READ_ACL\",\n       \
        \         \"WRITE_EA\",\n                \"WRITE_ATTR\",\n               \
        \ \"WRITE_ACL\",\n                \"CHANGE_OWNER\",\n                \"WRITE_GROUP\"\
        ,\n                \"DELETE\",\n                \"EXECUTE\",\n           \
        \     \"MODIFY\",\n                \"EXTEND\",\n                \"DELETE_CHILD\"\
        ,\n                \"SYNCHRONIZE\",\n                \"READ\",\n         \
        \       \"WRITE\",\n                \"CHANGE_PERMISSIONS\",\n            \
        \    \"ADD_FILE\",\n                \"ADD_SUBDIR\",\n                \"ALL\"\
        ,\n                \"NONE\"\n              ],\n              \"description\"\
        : \"Rights pertaining to the permissions entry:\\n * `ADD_FILE` - Alias for\
        \ MODIFY,\\n * `ADD_SUBDIR` - Alias for EXTEND,\\n * `ALL` - READ, WRITE,\
        \ and CHANGE_PERMISSIONS,\\n * `CHANGE_OWNER` - Owner write access,\\n * `CHANGE_PERMISSIONS`\
        \ - Rights to change permissions on file objects,\\n * `DELETE` - Delete access,\\\
        n * `DELETE_CHILD` - Delete from directory access,\\n * `EXECUTE` - Execute\
        \ access,\\n * `EXTEND` - File extension access,\\n * `MODIFY` - File modification\
        \ access,\\n * `NONE` - No rights,\\n * `READ` - Read access rights,\\n *\
        \ `READ_ACL` - ACL read access,\\n * `READ_ATTR` - Attribute read access,\\\
        n * `READ_DATA` - File read access,\\n * `READ_EA` - Extended attribute read\
        \ access,\\n * `SYNCHRONIZE` - File synchronize access,\\n * `WRITE` - Write\
        \ access rights,\\n * `WRITE_ACL` - ACL write access,\\n * `WRITE_ATTR` -\
        \ Attribute write access,\\n * `WRITE_EA` - Extended attribute write access,\\\
        n * `WRITE_GROUP` - Group write access\"\n            }\n          }\n   \
        \     }\n      }\n    },\n    \"access_based_enumeration_enabled\": {\n  \
        \    \"description\": \"Enable Access-based Enumeration on this SMB share\"\
        ,\n      \"type\": \"boolean\"\n    },\n    \"default_file_create_mode\":\
        \ {\n      \"description\": \"Default POSIX file create mode bits on this\
        \ SMB share (octal, default 0644 if this field is empty)\",\n      \"type\"\
        : \"string\"\n    },\n    \"default_directory_create_mode\": {\n      \"description\"\
        : \"Default POSIX directory create mode bits on this SMB share (octal, default\
        \ 0755 if this field is empty)\",\n      \"type\": \"string\"\n    },\n  \
        \  \"require_encryption\": {\n      \"description\": \"Require all traffic\
        \ to this share to be encrypted. Clients without encryption capabilities will\
        \ not be able to connect. Default is false if this field is empty.\",\n  \
        \    \"type\": \"boolean\"\n    },\n    \"allow_fs_path_create\": {\n    \
        \  \"description\": \"If true, the server will create the filesystem path\
        \ for the share if it does not already exist. If false, the filesystem path\
        \ must already exist. Default is false if this field is empty.\",\n      \"\
        type\": \"boolean\"\n    },\n    \"expand_fs_path_variables\": {\n      \"\
        description\": \"If true, the server will expand %U variables in the filesystem\
        \ path to username. Default is false if this field is empty.\",\n      \"\
        type\": \"boolean\"\n    },\n    \"offline_files_caching_mode\": {\n     \
        \ \"type\": \"string\",\n      \"enum\": [\n        \"NO_CACHING\",\n    \
        \    \"MANUAL_CACHING\",\n        \"AUTOMATIC_CACHING\"\n      ],\n      \"\
        description\": \"Offline-files caching mode advertised to SMB clients: \\\"\
        no_caching\\\" (no caching, the default), \\\"manual_caching\\\" (cache files\
        \ the user designates as offline-available), or \\\"automatic_caching\\\"\
        \ (cache files as they are opened).:\\n * `AUTOMATIC_CACHING` - SMB_OFFLINE_FILES_CACHING_MODE_AUTOMATIC_CACHING,\\\
        n * `MANUAL_CACHING` - SMB_OFFLINE_FILES_CACHING_MODE_MANUAL_CACHING,\\n *\
        \ `NO_CACHING` - SMB_OFFLINE_FILES_CACHING_MODE_NO_CACHING\"\n    }\n  }\n\
        }"
  delete:
    summary: '[preview] Delete an SMB share. Not undoable.'
    parameters:
    - name: share_id
      description: The unique ID of the SMB share.
      required: true
    - name: If-Match
      description: ETag for expected version
      required: false
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    preview: true
rest_endpoint: /v3/smb/shares/{share_id}
api_version: v3
permalink: /rest-api-guide/smb-shares-methods-v3/v3_smb_shares_share_id.html
sidebar: rest_api_guide_sidebar
redirect_from: /rest-api-guide/smb-shares-methods/v3_smb_shares_share_id.html
deprecated: false
---
