---
category: /Files V1
methods:
  put:
    summary: Update file access control list (ACL).
    parameters:
    - name: ref
      description: The file ID or the absolute path to the file system object. File
        IDs can be found in the id field of responses of APIs that return file attributes.
        You must URL-encode the paths. The APIs & Tools page in the Qumulo Core Web
        UI URL-encodes the paths.
      required: true
    - name: If-Match
      description: ETag for expected version
      required: false
    response_body:
      schema: "{\n  \"description\": \"api_files_acl_out\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"generated\": {\n      \"description\": \"Set\
        \ to true if the system has generated an ACL from Unix permissions\",\n  \
        \    \"type\": \"boolean\"\n    },\n    \"acl\": {\n      \"description\"\
        : \"acl\",\n      \"type\": \"object\",\n      \"properties\": {\n       \
        \ \"control\": {\n          \"description\": \"control\",\n          \"type\"\
        : \"array\",\n          \"items\": {\n            \"type\": \"string\",\n\
        \            \"enum\": [\n              \"PRESENT\",\n              \"DEFAULTED\"\
        ,\n              \"TRUSTED\",\n              \"AUTO_INHERIT\",\n         \
        \     \"PROTECTED\",\n              \"ALL\"\n            ],\n            \"\
        description\": \"control:\\n * `ALL` - API_FILES_ACL_CONTROL_ALL,\\n * `AUTO_INHERIT`\
        \ - API_FILES_ACL_CONTROL_AUTO_INHERIT,\\n * `DEFAULTED` - API_FILES_ACL_CONTROL_DEFAULTED,\\\
        n * `PRESENT` - API_FILES_ACL_CONTROL_PRESENT,\\n * `PROTECTED` - API_FILES_ACL_CONTROL_PROTECTED,\\\
        n * `TRUSTED` - API_FILES_ACL_CONTROL_TRUSTED\"\n          }\n        },\n\
        \        \"posix_special_permissions\": {\n          \"type\": \"array\",\n\
        \          \"items\": {\n            \"type\": \"string\",\n            \"\
        enum\": [\n              \"STICKY_BIT\",\n              \"SET_GID\",\n   \
        \           \"SET_UID\"\n            ],\n            \"description\": \"posix_special_permissions:\\\
        n * `SET_GID` - SET_GID,\\n * `SET_UID` - SET_UID,\\n * `STICKY_BIT` - STICKY_BIT\"\
        \n          }\n        },\n        \"aces\": {\n          \"type\": \"array\"\
        ,\n          \"items\": {\n            \"description\": \"aces\",\n      \
        \      \"type\": \"object\",\n            \"properties\": {\n            \
        \  \"type\": {\n                \"type\": \"string\",\n                \"\
        enum\": [\n                  \"ALLOWED\",\n                  \"DENIED\"\n\
        \                ],\n                \"description\": \"Type of this ACL entry:\\\
        n * `ALLOWED` - API_FILES_ACE_TYPE_ALLOWED,\\n * `DENIED` - API_FILES_ACE_TYPE_DENIED\"\
        \n              },\n              \"flags\": {\n                \"description\"\
        : \"ACE flags for this ACL entry\",\n                \"type\": \"array\",\n\
        \                \"items\": {\n                  \"type\": \"string\",\n \
        \                 \"enum\": [\n                    \"OBJECT_INHERIT\",\n \
        \                   \"CONTAINER_INHERIT\",\n                    \"NO_PROPAGATE_INHERIT\"\
        ,\n                    \"INHERIT_ONLY\",\n                    \"INHERITED\"\
        ,\n                    \"ALL\"\n                  ],\n                  \"\
        description\": \"ACE flags for this ACL entry:\\n * `ALL` - API_FILES_ACE_FLAG_ALL,\\\
        n * `CONTAINER_INHERIT` - API_FILES_ACE_FLAG_CONTAINER_INHERIT,\\n * `INHERITED`\
        \ - API_FILES_ACE_FLAG_INHERITED,\\n * `INHERIT_ONLY` - API_FILES_ACE_FLAG_INHERIT_ONLY,\\\
        n * `NO_PROPAGATE_INHERIT` - API_FILES_ACE_FLAG_NO_PROPAGATE_INHERIT,\\n *\
        \ `OBJECT_INHERIT` - API_FILES_ACE_FLAG_OBJECT_INHERIT\"\n               \
        \ }\n              },\n              \"trustee\": {\n                \"description\"\
        : \"Trustee for this ACL entry\",\n                \"type\": \"string\"\n\
        \              },\n              \"trustee_details\": {\n                \"\
        description\": \"Trustee details for this ACL entry\",\n                \"\
        type\": \"object\",\n                \"properties\": {\n                 \
        \ \"id_type\": {\n                    \"type\": \"string\",\n            \
        \        \"enum\": [\n                      \"LOCAL_USER\",\n            \
        \          \"LOCAL_GROUP\",\n                      \"NFS_GID\",\n        \
        \              \"NFS_UID\",\n                      \"SMB_SID\",\n        \
        \              \"INTERNAL\",\n                      \"QUMULO_OPERATOR\",\n\
        \                      \"QUMULO_SUPPORT\"\n                    ],\n      \
        \              \"description\": \"id_type:\\n * `INTERNAL` - INTERNAL,\\n\
        \ * `LOCAL_GROUP` - LOCAL_GROUP,\\n * `LOCAL_USER` - LOCAL_USER,\\n * `NFS_GID`\
        \ - NFS_GID,\\n * `NFS_UID` - NFS_UID,\\n * `QUMULO_OPERATOR` - QUMULO_OPERATOR,\\\
        n * `QUMULO_SUPPORT` - QUMULO_SUPPORT,\\n * `SMB_SID` - SMB_SID\"\n      \
        \            },\n                  \"id_value\": {\n                    \"\
        description\": \"id_value\",\n                    \"type\": \"string\"\n \
        \                 }\n                }\n              },\n              \"\
        rights\": {\n                \"description\": \"Rights granted or denied for\
        \ this ACL entry\",\n                \"type\": \"array\",\n              \
        \  \"items\": {\n                  \"type\": \"string\",\n               \
        \   \"enum\": [\n                    \"READ\",\n                    \"READ_EA\"\
        ,\n                    \"READ_ATTR\",\n                    \"READ_ACL\",\n\
        \                    \"WRITE_EA\",\n                    \"WRITE_ATTR\",\n\
        \                    \"WRITE_ACL\",\n                    \"CHANGE_OWNER\"\
        ,\n                    \"WRITE_GROUP\",\n                    \"DELETE\",\n\
        \                    \"EXECUTE\",\n                    \"MODIFY\",\n     \
        \               \"EXTEND\",\n                    \"ADD_FILE\",\n         \
        \           \"ADD_SUBDIR\",\n                    \"DELETE_CHILD\",\n     \
        \               \"SYNCHRONIZE\",\n                    \"ALL\"\n          \
        \        ],\n                  \"description\": \"Rights granted or denied\
        \ for this ACL entry:\\n * `ADD_FILE` - API_FILES_ACCESS_ADD_FILE,\\n * `ADD_SUBDIR`\
        \ - API_FILES_ACCESS_ADD_SUBDIR,\\n * `ALL` - API_FILES_ACCESS_ALL,\\n * `CHANGE_OWNER`\
        \ - API_FILES_ACCESS_CHANGE_OWNER,\\n * `DELETE` - API_FILES_ACCESS_DELETE,\\\
        n * `DELETE_CHILD` - API_FILES_ACCESS_DELETE_CHILD,\\n * `EXECUTE` - API_FILES_ACCESS_EXECUTE,\\\
        n * `EXTEND` - API_FILES_ACCESS_EXTEND,\\n * `MODIFY` - API_FILES_ACCESS_MODIFY,\\\
        n * `READ` - API_FILES_ACCESS_READ,\\n * `READ_ACL` - API_FILES_ACCESS_READ_ACL,\\\
        n * `READ_ATTR` - API_FILES_ACCESS_READ_ATTR,\\n * `READ_EA` - API_FILES_ACCESS_READ_EA,\\\
        n * `SYNCHRONIZE` - API_FILES_ACCESS_SYNCHRONIZE,\\n * `WRITE_ACL` - API_FILES_ACCESS_WRITE_ACL,\\\
        n * `WRITE_ATTR` - API_FILES_ACCESS_WRITE_ATTR,\\n * `WRITE_EA` - API_FILES_ACCESS_WRITE_EA,\\\
        n * `WRITE_GROUP` - API_FILES_ACCESS_WRITE_GROUP\"\n                }\n  \
        \            }\n            }\n          }\n        }\n      }\n    }\n  }\n\
        }"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
    request_body:
      schema: "{\n  \"description\": \"api_files_acl\",\n  \"type\": \"object\",\n\
        \  \"properties\": {\n    \"control\": {\n      \"description\": \"control\"\
        ,\n      \"type\": \"array\",\n      \"items\": {\n        \"type\": \"string\"\
        ,\n        \"enum\": [\n          \"PRESENT\",\n          \"DEFAULTED\",\n\
        \          \"TRUSTED\",\n          \"AUTO_INHERIT\",\n          \"PROTECTED\"\
        ,\n          \"ALL\"\n        ],\n        \"description\": \"control:\\n *\
        \ `ALL` - API_FILES_ACL_CONTROL_ALL,\\n * `AUTO_INHERIT` - API_FILES_ACL_CONTROL_AUTO_INHERIT,\\\
        n * `DEFAULTED` - API_FILES_ACL_CONTROL_DEFAULTED,\\n * `PRESENT` - API_FILES_ACL_CONTROL_PRESENT,\\\
        n * `PROTECTED` - API_FILES_ACL_CONTROL_PROTECTED,\\n * `TRUSTED` - API_FILES_ACL_CONTROL_TRUSTED\"\
        \n      }\n    },\n    \"posix_special_permissions\": {\n      \"type\": \"\
        array\",\n      \"items\": {\n        \"type\": \"string\",\n        \"enum\"\
        : [\n          \"STICKY_BIT\",\n          \"SET_GID\",\n          \"SET_UID\"\
        \n        ],\n        \"description\": \"posix_special_permissions:\\n * `SET_GID`\
        \ - SET_GID,\\n * `SET_UID` - SET_UID,\\n * `STICKY_BIT` - STICKY_BIT\"\n\
        \      }\n    },\n    \"aces\": {\n      \"type\": \"array\",\n      \"items\"\
        : {\n        \"description\": \"aces\",\n        \"type\": \"object\",\n \
        \       \"properties\": {\n          \"type\": {\n            \"type\": \"\
        string\",\n            \"enum\": [\n              \"ALLOWED\",\n         \
        \     \"DENIED\"\n            ],\n            \"description\": \"Type of this\
        \ ACL entry:\\n * `ALLOWED` - API_FILES_ACE_TYPE_ALLOWED,\\n * `DENIED` -\
        \ API_FILES_ACE_TYPE_DENIED\"\n          },\n          \"flags\": {\n    \
        \        \"description\": \"ACE flags for this ACL entry\",\n            \"\
        type\": \"array\",\n            \"items\": {\n              \"type\": \"string\"\
        ,\n              \"enum\": [\n                \"OBJECT_INHERIT\",\n      \
        \          \"CONTAINER_INHERIT\",\n                \"NO_PROPAGATE_INHERIT\"\
        ,\n                \"INHERIT_ONLY\",\n                \"INHERITED\",\n   \
        \             \"ALL\"\n              ],\n              \"description\": \"\
        ACE flags for this ACL entry:\\n * `ALL` - API_FILES_ACE_FLAG_ALL,\\n * `CONTAINER_INHERIT`\
        \ - API_FILES_ACE_FLAG_CONTAINER_INHERIT,\\n * `INHERITED` - API_FILES_ACE_FLAG_INHERITED,\\\
        n * `INHERIT_ONLY` - API_FILES_ACE_FLAG_INHERIT_ONLY,\\n * `NO_PROPAGATE_INHERIT`\
        \ - API_FILES_ACE_FLAG_NO_PROPAGATE_INHERIT,\\n * `OBJECT_INHERIT` - API_FILES_ACE_FLAG_OBJECT_INHERIT\"\
        \n            }\n          },\n          \"trustee\": {\n            \"description\"\
        : \"Trustee for this ACL entry\",\n            \"type\": \"string\"\n    \
        \      },\n          \"trustee_details\": {\n            \"description\":\
        \ \"Trustee details for this ACL entry\",\n            \"type\": \"object\"\
        ,\n            \"properties\": {\n              \"id_type\": {\n         \
        \       \"type\": \"string\",\n                \"enum\": [\n             \
        \     \"LOCAL_USER\",\n                  \"LOCAL_GROUP\",\n              \
        \    \"NFS_GID\",\n                  \"NFS_UID\",\n                  \"SMB_SID\"\
        ,\n                  \"INTERNAL\",\n                  \"QUMULO_OPERATOR\"\
        ,\n                  \"QUMULO_SUPPORT\"\n                ],\n            \
        \    \"description\": \"id_type:\\n * `INTERNAL` - INTERNAL,\\n * `LOCAL_GROUP`\
        \ - LOCAL_GROUP,\\n * `LOCAL_USER` - LOCAL_USER,\\n * `NFS_GID` - NFS_GID,\\\
        n * `NFS_UID` - NFS_UID,\\n * `QUMULO_OPERATOR` - QUMULO_OPERATOR,\\n * `QUMULO_SUPPORT`\
        \ - QUMULO_SUPPORT,\\n * `SMB_SID` - SMB_SID\"\n              },\n       \
        \       \"id_value\": {\n                \"description\": \"id_value\",\n\
        \                \"type\": \"string\"\n              }\n            }\n  \
        \        },\n          \"rights\": {\n            \"description\": \"Rights\
        \ granted or denied for this ACL entry\",\n            \"type\": \"array\"\
        ,\n            \"items\": {\n              \"type\": \"string\",\n       \
        \       \"enum\": [\n                \"READ\",\n                \"READ_EA\"\
        ,\n                \"READ_ATTR\",\n                \"READ_ACL\",\n       \
        \         \"WRITE_EA\",\n                \"WRITE_ATTR\",\n               \
        \ \"WRITE_ACL\",\n                \"CHANGE_OWNER\",\n                \"WRITE_GROUP\"\
        ,\n                \"DELETE\",\n                \"EXECUTE\",\n           \
        \     \"MODIFY\",\n                \"EXTEND\",\n                \"ADD_FILE\"\
        ,\n                \"ADD_SUBDIR\",\n                \"DELETE_CHILD\",\n  \
        \              \"SYNCHRONIZE\",\n                \"ALL\"\n              ],\n\
        \              \"description\": \"Rights granted or denied for this ACL entry:\\\
        n * `ADD_FILE` - API_FILES_ACCESS_ADD_FILE,\\n * `ADD_SUBDIR` - API_FILES_ACCESS_ADD_SUBDIR,\\\
        n * `ALL` - API_FILES_ACCESS_ALL,\\n * `CHANGE_OWNER` - API_FILES_ACCESS_CHANGE_OWNER,\\\
        n * `DELETE` - API_FILES_ACCESS_DELETE,\\n * `DELETE_CHILD` - API_FILES_ACCESS_DELETE_CHILD,\\\
        n * `EXECUTE` - API_FILES_ACCESS_EXECUTE,\\n * `EXTEND` - API_FILES_ACCESS_EXTEND,\\\
        n * `MODIFY` - API_FILES_ACCESS_MODIFY,\\n * `READ` - API_FILES_ACCESS_READ,\\\
        n * `READ_ACL` - API_FILES_ACCESS_READ_ACL,\\n * `READ_ATTR` - API_FILES_ACCESS_READ_ATTR,\\\
        n * `READ_EA` - API_FILES_ACCESS_READ_EA,\\n * `SYNCHRONIZE` - API_FILES_ACCESS_SYNCHRONIZE,\\\
        n * `WRITE_ACL` - API_FILES_ACCESS_WRITE_ACL,\\n * `WRITE_ATTR` - API_FILES_ACCESS_WRITE_ATTR,\\\
        n * `WRITE_EA` - API_FILES_ACCESS_WRITE_EA,\\n * `WRITE_GROUP` - API_FILES_ACCESS_WRITE_GROUP\"\
        \n            }\n          }\n        }\n      }\n    }\n  }\n}"
  get:
    summary: Get file access control list (ACL).
    parameters:
    - name: ref
      description: The file ID or the absolute path to the file system object. File
        IDs can be found in the id field of responses of APIs that return file attributes.
        You must URL-encode the paths. The APIs & Tools page in the Qumulo Core Web
        UI URL-encodes the paths.
      required: true
    - name: snapshot
      description: The snapshot ID that specifies the version of the filesystem to
        use. If not specified, use the head version.
      required: false
    response_body:
      schema: "{\n  \"description\": \"api_files_acl_out\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"generated\": {\n      \"description\": \"Set\
        \ to true if the system has generated an ACL from Unix permissions\",\n  \
        \    \"type\": \"boolean\"\n    },\n    \"acl\": {\n      \"description\"\
        : \"acl\",\n      \"type\": \"object\",\n      \"properties\": {\n       \
        \ \"control\": {\n          \"description\": \"control\",\n          \"type\"\
        : \"array\",\n          \"items\": {\n            \"type\": \"string\",\n\
        \            \"enum\": [\n              \"PRESENT\",\n              \"DEFAULTED\"\
        ,\n              \"TRUSTED\",\n              \"AUTO_INHERIT\",\n         \
        \     \"PROTECTED\",\n              \"ALL\"\n            ],\n            \"\
        description\": \"control:\\n * `ALL` - API_FILES_ACL_CONTROL_ALL,\\n * `AUTO_INHERIT`\
        \ - API_FILES_ACL_CONTROL_AUTO_INHERIT,\\n * `DEFAULTED` - API_FILES_ACL_CONTROL_DEFAULTED,\\\
        n * `PRESENT` - API_FILES_ACL_CONTROL_PRESENT,\\n * `PROTECTED` - API_FILES_ACL_CONTROL_PROTECTED,\\\
        n * `TRUSTED` - API_FILES_ACL_CONTROL_TRUSTED\"\n          }\n        },\n\
        \        \"posix_special_permissions\": {\n          \"type\": \"array\",\n\
        \          \"items\": {\n            \"type\": \"string\",\n            \"\
        enum\": [\n              \"STICKY_BIT\",\n              \"SET_GID\",\n   \
        \           \"SET_UID\"\n            ],\n            \"description\": \"posix_special_permissions:\\\
        n * `SET_GID` - SET_GID,\\n * `SET_UID` - SET_UID,\\n * `STICKY_BIT` - STICKY_BIT\"\
        \n          }\n        },\n        \"aces\": {\n          \"type\": \"array\"\
        ,\n          \"items\": {\n            \"description\": \"aces\",\n      \
        \      \"type\": \"object\",\n            \"properties\": {\n            \
        \  \"type\": {\n                \"type\": \"string\",\n                \"\
        enum\": [\n                  \"ALLOWED\",\n                  \"DENIED\"\n\
        \                ],\n                \"description\": \"Type of this ACL entry:\\\
        n * `ALLOWED` - API_FILES_ACE_TYPE_ALLOWED,\\n * `DENIED` - API_FILES_ACE_TYPE_DENIED\"\
        \n              },\n              \"flags\": {\n                \"description\"\
        : \"ACE flags for this ACL entry\",\n                \"type\": \"array\",\n\
        \                \"items\": {\n                  \"type\": \"string\",\n \
        \                 \"enum\": [\n                    \"OBJECT_INHERIT\",\n \
        \                   \"CONTAINER_INHERIT\",\n                    \"NO_PROPAGATE_INHERIT\"\
        ,\n                    \"INHERIT_ONLY\",\n                    \"INHERITED\"\
        ,\n                    \"ALL\"\n                  ],\n                  \"\
        description\": \"ACE flags for this ACL entry:\\n * `ALL` - API_FILES_ACE_FLAG_ALL,\\\
        n * `CONTAINER_INHERIT` - API_FILES_ACE_FLAG_CONTAINER_INHERIT,\\n * `INHERITED`\
        \ - API_FILES_ACE_FLAG_INHERITED,\\n * `INHERIT_ONLY` - API_FILES_ACE_FLAG_INHERIT_ONLY,\\\
        n * `NO_PROPAGATE_INHERIT` - API_FILES_ACE_FLAG_NO_PROPAGATE_INHERIT,\\n *\
        \ `OBJECT_INHERIT` - API_FILES_ACE_FLAG_OBJECT_INHERIT\"\n               \
        \ }\n              },\n              \"trustee\": {\n                \"description\"\
        : \"Trustee for this ACL entry\",\n                \"type\": \"string\"\n\
        \              },\n              \"trustee_details\": {\n                \"\
        description\": \"Trustee details for this ACL entry\",\n                \"\
        type\": \"object\",\n                \"properties\": {\n                 \
        \ \"id_type\": {\n                    \"type\": \"string\",\n            \
        \        \"enum\": [\n                      \"LOCAL_USER\",\n            \
        \          \"LOCAL_GROUP\",\n                      \"NFS_GID\",\n        \
        \              \"NFS_UID\",\n                      \"SMB_SID\",\n        \
        \              \"INTERNAL\",\n                      \"QUMULO_OPERATOR\",\n\
        \                      \"QUMULO_SUPPORT\"\n                    ],\n      \
        \              \"description\": \"id_type:\\n * `INTERNAL` - INTERNAL,\\n\
        \ * `LOCAL_GROUP` - LOCAL_GROUP,\\n * `LOCAL_USER` - LOCAL_USER,\\n * `NFS_GID`\
        \ - NFS_GID,\\n * `NFS_UID` - NFS_UID,\\n * `QUMULO_OPERATOR` - QUMULO_OPERATOR,\\\
        n * `QUMULO_SUPPORT` - QUMULO_SUPPORT,\\n * `SMB_SID` - SMB_SID\"\n      \
        \            },\n                  \"id_value\": {\n                    \"\
        description\": \"id_value\",\n                    \"type\": \"string\"\n \
        \                 }\n                }\n              },\n              \"\
        rights\": {\n                \"description\": \"Rights granted or denied for\
        \ this ACL entry\",\n                \"type\": \"array\",\n              \
        \  \"items\": {\n                  \"type\": \"string\",\n               \
        \   \"enum\": [\n                    \"READ\",\n                    \"READ_EA\"\
        ,\n                    \"READ_ATTR\",\n                    \"READ_ACL\",\n\
        \                    \"WRITE_EA\",\n                    \"WRITE_ATTR\",\n\
        \                    \"WRITE_ACL\",\n                    \"CHANGE_OWNER\"\
        ,\n                    \"WRITE_GROUP\",\n                    \"DELETE\",\n\
        \                    \"EXECUTE\",\n                    \"MODIFY\",\n     \
        \               \"EXTEND\",\n                    \"ADD_FILE\",\n         \
        \           \"ADD_SUBDIR\",\n                    \"DELETE_CHILD\",\n     \
        \               \"SYNCHRONIZE\",\n                    \"ALL\"\n          \
        \        ],\n                  \"description\": \"Rights granted or denied\
        \ for this ACL entry:\\n * `ADD_FILE` - API_FILES_ACCESS_ADD_FILE,\\n * `ADD_SUBDIR`\
        \ - API_FILES_ACCESS_ADD_SUBDIR,\\n * `ALL` - API_FILES_ACCESS_ALL,\\n * `CHANGE_OWNER`\
        \ - API_FILES_ACCESS_CHANGE_OWNER,\\n * `DELETE` - API_FILES_ACCESS_DELETE,\\\
        n * `DELETE_CHILD` - API_FILES_ACCESS_DELETE_CHILD,\\n * `EXECUTE` - API_FILES_ACCESS_EXECUTE,\\\
        n * `EXTEND` - API_FILES_ACCESS_EXTEND,\\n * `MODIFY` - API_FILES_ACCESS_MODIFY,\\\
        n * `READ` - API_FILES_ACCESS_READ,\\n * `READ_ACL` - API_FILES_ACCESS_READ_ACL,\\\
        n * `READ_ATTR` - API_FILES_ACCESS_READ_ATTR,\\n * `READ_EA` - API_FILES_ACCESS_READ_EA,\\\
        n * `SYNCHRONIZE` - API_FILES_ACCESS_SYNCHRONIZE,\\n * `WRITE_ACL` - API_FILES_ACCESS_WRITE_ACL,\\\
        n * `WRITE_ATTR` - API_FILES_ACCESS_WRITE_ATTR,\\n * `WRITE_EA` - API_FILES_ACCESS_WRITE_EA,\\\
        n * `WRITE_GROUP` - API_FILES_ACCESS_WRITE_GROUP\"\n                }\n  \
        \            }\n            }\n          }\n        }\n      }\n    }\n  }\n\
        }"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
rest_endpoint: /v1/files/{ref}/info/acl
api_version: v1
permalink: /rest-api-guide/files-v1/files_ref_info_acl.html
sidebar: rest_api_guide_sidebar
redirect_from: /rest-api-guide/files/files_ref_info_acl.html
---
