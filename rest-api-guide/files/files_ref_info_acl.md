---
category: /Files
methods:
  get:
    parameters:
    - description: The file ID or the absolute path to the file system object. File
        IDs can be found in the id field of responses of APIs that return file attributes.
        You must URL-encode the paths. The APIs & Tools page in the Qumulo Core Web
        UI URL-encodes the paths.
      name: ref
      required: true
    - description: The snapshot ID that specifies the version of the filesystem to
        use. If not specified, use the head version.
      name: snapshot
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
        \     \"PROTECTED\",\n              \"ACL_CONTROLS_ALL\"\n            ],\n\
        \            \"description\": \"control:\\n * `ACL_CONTROLS_ALL` - All ACL\
        \ controls,\\n * `AUTO_INHERIT` - Set whether the ACL was created through\
        \ inheritance,\\n * `DEFAULTED` - Sets whether the ACL was established by\
        \ default means,\\n * `PRESENT` - Set when ACL is present on the object,\\\
        n * `PROTECTED` - Protects ACL from inherit operations,\\n * `TRUSTED` - Set\
        \ when ACL is provided by a trusted source\"\n          }\n        },\n  \
        \      \"posix_special_permissions\": {\n          \"type\": \"array\",\n\
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
        n * `ALLOWED` - An ACL entry that grants rights,\\n * `DENIED` - An ACL entry\
        \ that denies rights\"\n              },\n              \"flags\": {\n   \
        \             \"description\": \"ACE flags for this ACL entry\",\n       \
        \         \"type\": \"array\",\n                \"items\": {\n           \
        \       \"type\": \"string\",\n                  \"enum\": [\n           \
        \         \"OBJECT_INHERIT\",\n                    \"CONTAINER_INHERIT\",\n\
        \                    \"NO_PROPAGATE_INHERIT\",\n                    \"INHERIT_ONLY\"\
        ,\n                    \"INHERITED\",\n                    \"ACE_FLAGS_ALL\"\
        \n                  ],\n                  \"description\": \"ACE flags for\
        \ this ACL entry:\\n * `ACE_FLAGS_ALL` - All ACE flags,\\n * `CONTAINER_INHERIT`\
        \ - Children that are containers inherit as effective ACE,\\n * `INHERITED`\
        \ - Indicates the ACE was inherited,\\n * `INHERIT_ONLY` - Indicates an inherit-only\
        \ ACE that doesn't control access to the attached object,\\n * `NO_PROPAGATE_INHERIT`\
        \ - Prevent subsequent children from inheriting ACE,\\n * `OBJECT_INHERIT`\
        \ - Non-container children inherit as effective ACE. Container objects inherit\
        \ as inherit-only ACE\"\n                }\n              },\n           \
        \   \"trustee\": {\n                \"description\": \"Trustee for this ACL\
        \ entry\",\n                \"type\": \"string\"\n              },\n     \
        \         \"trustee_details\": {\n                \"description\": \"Trustee\
        \ details for this ACL entry\",\n                \"type\": \"object\",\n \
        \               \"properties\": {\n                  \"id_type\": {\n    \
        \                \"type\": \"string\",\n                    \"enum\": [\n\
        \                      \"LOCAL_USER\",\n                      \"LOCAL_GROUP\"\
        ,\n                      \"NFS_GID\",\n                      \"NFS_UID\",\n\
        \                      \"SMB_SID\",\n                      \"INTERNAL\",\n\
        \                      \"QUMULO_OPERATOR\"\n                    ],\n     \
        \               \"description\": \"id_type:\\n * `INTERNAL` - INTERNAL,\\\
        n * `LOCAL_GROUP` - LOCAL_GROUP,\\n * `LOCAL_USER` - LOCAL_USER,\\n * `NFS_GID`\
        \ - NFS_GID,\\n * `NFS_UID` - NFS_UID,\\n * `QUMULO_OPERATOR` - QUMULO_OPERATOR,\\\
        n * `SMB_SID` - SMB_SID\"\n                  },\n                  \"id_value\"\
        : {\n                    \"description\": \"id_value\",\n                \
        \    \"type\": \"string\"\n                  }\n                }\n      \
        \        },\n              \"rights\": {\n                \"description\"\
        : \"Rights granted or denied for this ACL entry\",\n                \"type\"\
        : \"array\",\n                \"items\": {\n                  \"type\": \"\
        string\",\n                  \"enum\": [\n                    \"READ\",\n\
        \                    \"READ_EA\",\n                    \"READ_ATTR\",\n  \
        \                  \"READ_ACL\",\n                    \"WRITE_EA\",\n    \
        \                \"WRITE_ATTR\",\n                    \"WRITE_ACL\",\n   \
        \                 \"CHANGE_OWNER\",\n                    \"WRITE_GROUP\",\n\
        \                    \"DELETE\",\n                    \"EXECUTE\",\n     \
        \               \"MODIFY\",\n                    \"EXTEND\",\n           \
        \         \"ADD_FILE\",\n                    \"ADD_SUBDIR\",\n           \
        \         \"DELETE_CHILD\",\n                    \"SYNCHRONIZE\",\n      \
        \              \"ACCESS_RIGHTS_ALL\"\n                  ],\n             \
        \     \"description\": \"Rights granted or denied for this ACL entry:\\n *\
        \ `ACCESS_RIGHTS_ALL` - All access rights,\\n * `ADD_FILE` - File creation\
        \ access,\\n * `ADD_SUBDIR` - Directory creation access,\\n * `CHANGE_OWNER`\
        \ - Owner write access,\\n * `DELETE` - Delete access,\\n * `DELETE_CHILD`\
        \ - Delete from directory access,\\n * `EXECUTE` - Execute access,\\n * `EXTEND`\
        \ - File extension access,\\n * `MODIFY` - File modification access,\\n *\
        \ `READ` - File read access,\\n * `READ_ACL` - ACL read access,\\n * `READ_ATTR`\
        \ - Attribute read access,\\n * `READ_EA` - Extended attribute read access,\\\
        n * `SYNCHRONIZE` - File synchronize access,\\n * `WRITE_ACL` - ACL write\
        \ access,\\n * `WRITE_ATTR` - Attribute write access,\\n * `WRITE_EA` - Extended\
        \ attribute write access,\\n * `WRITE_GROUP` - Group write access\"\n    \
        \            }\n              }\n            }\n          }\n        }\n \
        \     }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Get file access control list (ACL).
  put:
    parameters:
    - description: The file ID or the absolute path to the file system object. File
        IDs can be found in the id field of responses of APIs that return file attributes.
        You must URL-encode the paths. The APIs & Tools page in the Qumulo Core Web
        UI URL-encodes the paths.
      name: ref
      required: true
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
      schema: "{\n  \"description\": \"api_files_acl\",\n  \"type\": \"object\",\n\
        \  \"properties\": {\n    \"control\": {\n      \"description\": \"control\"\
        ,\n      \"type\": \"array\",\n      \"items\": {\n        \"type\": \"string\"\
        ,\n        \"enum\": [\n          \"PRESENT\",\n          \"DEFAULTED\",\n\
        \          \"TRUSTED\",\n          \"AUTO_INHERIT\",\n          \"PROTECTED\"\
        ,\n          \"ACL_CONTROLS_ALL\"\n        ],\n        \"description\": \"\
        control:\\n * `ACL_CONTROLS_ALL` - All ACL controls,\\n * `AUTO_INHERIT` -\
        \ Set whether the ACL was created through inheritance,\\n * `DEFAULTED` -\
        \ Sets whether the ACL was established by default means,\\n * `PRESENT` -\
        \ Set when ACL is present on the object,\\n * `PROTECTED` - Protects ACL from\
        \ inherit operations,\\n * `TRUSTED` - Set when ACL is provided by a trusted\
        \ source\"\n      }\n    },\n    \"posix_special_permissions\": {\n      \"\
        type\": \"array\",\n      \"items\": {\n        \"type\": \"string\",\n  \
        \      \"enum\": [\n          \"STICKY_BIT\",\n          \"SET_GID\",\n  \
        \        \"SET_UID\"\n        ],\n        \"description\": \"posix_special_permissions:\\\
        n * `SET_GID` - SET_GID,\\n * `SET_UID` - SET_UID,\\n * `STICKY_BIT` - STICKY_BIT\"\
        \n      }\n    },\n    \"aces\": {\n      \"type\": \"array\",\n      \"items\"\
        : {\n        \"description\": \"aces\",\n        \"type\": \"object\",\n \
        \       \"properties\": {\n          \"type\": {\n            \"type\": \"\
        string\",\n            \"enum\": [\n              \"ALLOWED\",\n         \
        \     \"DENIED\"\n            ],\n            \"description\": \"Type of this\
        \ ACL entry:\\n * `ALLOWED` - An ACL entry that grants rights,\\n * `DENIED`\
        \ - An ACL entry that denies rights\"\n          },\n          \"flags\":\
        \ {\n            \"description\": \"ACE flags for this ACL entry\",\n    \
        \        \"type\": \"array\",\n            \"items\": {\n              \"\
        type\": \"string\",\n              \"enum\": [\n                \"OBJECT_INHERIT\"\
        ,\n                \"CONTAINER_INHERIT\",\n                \"NO_PROPAGATE_INHERIT\"\
        ,\n                \"INHERIT_ONLY\",\n                \"INHERITED\",\n   \
        \             \"ACE_FLAGS_ALL\"\n              ],\n              \"description\"\
        : \"ACE flags for this ACL entry:\\n * `ACE_FLAGS_ALL` - All ACE flags,\\\
        n * `CONTAINER_INHERIT` - Children that are containers inherit as effective\
        \ ACE,\\n * `INHERITED` - Indicates the ACE was inherited,\\n * `INHERIT_ONLY`\
        \ - Indicates an inherit-only ACE that doesn't control access to the attached\
        \ object,\\n * `NO_PROPAGATE_INHERIT` - Prevent subsequent children from inheriting\
        \ ACE,\\n * `OBJECT_INHERIT` - Non-container children inherit as effective\
        \ ACE. Container objects inherit as inherit-only ACE\"\n            }\n  \
        \        },\n          \"trustee\": {\n            \"description\": \"Trustee\
        \ for this ACL entry\",\n            \"type\": \"string\"\n          },\n\
        \          \"trustee_details\": {\n            \"description\": \"Trustee\
        \ details for this ACL entry\",\n            \"type\": \"object\",\n     \
        \       \"properties\": {\n              \"id_type\": {\n                \"\
        type\": \"string\",\n                \"enum\": [\n                  \"LOCAL_USER\"\
        ,\n                  \"LOCAL_GROUP\",\n                  \"NFS_GID\",\n  \
        \                \"NFS_UID\",\n                  \"SMB_SID\",\n          \
        \        \"INTERNAL\",\n                  \"QUMULO_OPERATOR\"\n          \
        \      ],\n                \"description\": \"id_type:\\n * `INTERNAL` - INTERNAL,\\\
        n * `LOCAL_GROUP` - LOCAL_GROUP,\\n * `LOCAL_USER` - LOCAL_USER,\\n * `NFS_GID`\
        \ - NFS_GID,\\n * `NFS_UID` - NFS_UID,\\n * `QUMULO_OPERATOR` - QUMULO_OPERATOR,\\\
        n * `SMB_SID` - SMB_SID\"\n              },\n              \"id_value\": {\n\
        \                \"description\": \"id_value\",\n                \"type\"\
        : \"string\"\n              }\n            }\n          },\n          \"rights\"\
        : {\n            \"description\": \"Rights granted or denied for this ACL\
        \ entry\",\n            \"type\": \"array\",\n            \"items\": {\n \
        \             \"type\": \"string\",\n              \"enum\": [\n         \
        \       \"READ\",\n                \"READ_EA\",\n                \"READ_ATTR\"\
        ,\n                \"READ_ACL\",\n                \"WRITE_EA\",\n        \
        \        \"WRITE_ATTR\",\n                \"WRITE_ACL\",\n               \
        \ \"CHANGE_OWNER\",\n                \"WRITE_GROUP\",\n                \"\
        DELETE\",\n                \"EXECUTE\",\n                \"MODIFY\",\n   \
        \             \"EXTEND\",\n                \"ADD_FILE\",\n               \
        \ \"ADD_SUBDIR\",\n                \"DELETE_CHILD\",\n                \"SYNCHRONIZE\"\
        ,\n                \"ACCESS_RIGHTS_ALL\"\n              ],\n             \
        \ \"description\": \"Rights granted or denied for this ACL entry:\\n * `ACCESS_RIGHTS_ALL`\
        \ - All access rights,\\n * `ADD_FILE` - File creation access,\\n * `ADD_SUBDIR`\
        \ - Directory creation access,\\n * `CHANGE_OWNER` - Owner write access,\\\
        n * `DELETE` - Delete access,\\n * `DELETE_CHILD` - Delete from directory\
        \ access,\\n * `EXECUTE` - Execute access,\\n * `EXTEND` - File extension\
        \ access,\\n * `MODIFY` - File modification access,\\n * `READ` - File read\
        \ access,\\n * `READ_ACL` - ACL read access,\\n * `READ_ATTR` - Attribute\
        \ read access,\\n * `READ_EA` - Extended attribute read access,\\n * `SYNCHRONIZE`\
        \ - File synchronize access,\\n * `WRITE_ACL` - ACL write access,\\n * `WRITE_ATTR`\
        \ - Attribute write access,\\n * `WRITE_EA` - Extended attribute write access,\\\
        n * `WRITE_GROUP` - Group write access\"\n            }\n          }\n   \
        \     }\n      }\n    }\n  }\n}"
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
        \     \"PROTECTED\",\n              \"ACL_CONTROLS_ALL\"\n            ],\n\
        \            \"description\": \"control:\\n * `ACL_CONTROLS_ALL` - All ACL\
        \ controls,\\n * `AUTO_INHERIT` - Set whether the ACL was created through\
        \ inheritance,\\n * `DEFAULTED` - Sets whether the ACL was established by\
        \ default means,\\n * `PRESENT` - Set when ACL is present on the object,\\\
        n * `PROTECTED` - Protects ACL from inherit operations,\\n * `TRUSTED` - Set\
        \ when ACL is provided by a trusted source\"\n          }\n        },\n  \
        \      \"posix_special_permissions\": {\n          \"type\": \"array\",\n\
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
        n * `ALLOWED` - An ACL entry that grants rights,\\n * `DENIED` - An ACL entry\
        \ that denies rights\"\n              },\n              \"flags\": {\n   \
        \             \"description\": \"ACE flags for this ACL entry\",\n       \
        \         \"type\": \"array\",\n                \"items\": {\n           \
        \       \"type\": \"string\",\n                  \"enum\": [\n           \
        \         \"OBJECT_INHERIT\",\n                    \"CONTAINER_INHERIT\",\n\
        \                    \"NO_PROPAGATE_INHERIT\",\n                    \"INHERIT_ONLY\"\
        ,\n                    \"INHERITED\",\n                    \"ACE_FLAGS_ALL\"\
        \n                  ],\n                  \"description\": \"ACE flags for\
        \ this ACL entry:\\n * `ACE_FLAGS_ALL` - All ACE flags,\\n * `CONTAINER_INHERIT`\
        \ - Children that are containers inherit as effective ACE,\\n * `INHERITED`\
        \ - Indicates the ACE was inherited,\\n * `INHERIT_ONLY` - Indicates an inherit-only\
        \ ACE that doesn't control access to the attached object,\\n * `NO_PROPAGATE_INHERIT`\
        \ - Prevent subsequent children from inheriting ACE,\\n * `OBJECT_INHERIT`\
        \ - Non-container children inherit as effective ACE. Container objects inherit\
        \ as inherit-only ACE\"\n                }\n              },\n           \
        \   \"trustee\": {\n                \"description\": \"Trustee for this ACL\
        \ entry\",\n                \"type\": \"string\"\n              },\n     \
        \         \"trustee_details\": {\n                \"description\": \"Trustee\
        \ details for this ACL entry\",\n                \"type\": \"object\",\n \
        \               \"properties\": {\n                  \"id_type\": {\n    \
        \                \"type\": \"string\",\n                    \"enum\": [\n\
        \                      \"LOCAL_USER\",\n                      \"LOCAL_GROUP\"\
        ,\n                      \"NFS_GID\",\n                      \"NFS_UID\",\n\
        \                      \"SMB_SID\",\n                      \"INTERNAL\",\n\
        \                      \"QUMULO_OPERATOR\"\n                    ],\n     \
        \               \"description\": \"id_type:\\n * `INTERNAL` - INTERNAL,\\\
        n * `LOCAL_GROUP` - LOCAL_GROUP,\\n * `LOCAL_USER` - LOCAL_USER,\\n * `NFS_GID`\
        \ - NFS_GID,\\n * `NFS_UID` - NFS_UID,\\n * `QUMULO_OPERATOR` - QUMULO_OPERATOR,\\\
        n * `SMB_SID` - SMB_SID\"\n                  },\n                  \"id_value\"\
        : {\n                    \"description\": \"id_value\",\n                \
        \    \"type\": \"string\"\n                  }\n                }\n      \
        \        },\n              \"rights\": {\n                \"description\"\
        : \"Rights granted or denied for this ACL entry\",\n                \"type\"\
        : \"array\",\n                \"items\": {\n                  \"type\": \"\
        string\",\n                  \"enum\": [\n                    \"READ\",\n\
        \                    \"READ_EA\",\n                    \"READ_ATTR\",\n  \
        \                  \"READ_ACL\",\n                    \"WRITE_EA\",\n    \
        \                \"WRITE_ATTR\",\n                    \"WRITE_ACL\",\n   \
        \                 \"CHANGE_OWNER\",\n                    \"WRITE_GROUP\",\n\
        \                    \"DELETE\",\n                    \"EXECUTE\",\n     \
        \               \"MODIFY\",\n                    \"EXTEND\",\n           \
        \         \"ADD_FILE\",\n                    \"ADD_SUBDIR\",\n           \
        \         \"DELETE_CHILD\",\n                    \"SYNCHRONIZE\",\n      \
        \              \"ACCESS_RIGHTS_ALL\"\n                  ],\n             \
        \     \"description\": \"Rights granted or denied for this ACL entry:\\n *\
        \ `ACCESS_RIGHTS_ALL` - All access rights,\\n * `ADD_FILE` - File creation\
        \ access,\\n * `ADD_SUBDIR` - Directory creation access,\\n * `CHANGE_OWNER`\
        \ - Owner write access,\\n * `DELETE` - Delete access,\\n * `DELETE_CHILD`\
        \ - Delete from directory access,\\n * `EXECUTE` - Execute access,\\n * `EXTEND`\
        \ - File extension access,\\n * `MODIFY` - File modification access,\\n *\
        \ `READ` - File read access,\\n * `READ_ACL` - ACL read access,\\n * `READ_ATTR`\
        \ - Attribute read access,\\n * `READ_EA` - Extended attribute read access,\\\
        n * `SYNCHRONIZE` - File synchronize access,\\n * `WRITE_ACL` - ACL write\
        \ access,\\n * `WRITE_ATTR` - Attribute write access,\\n * `WRITE_EA` - Extended\
        \ attribute write access,\\n * `WRITE_GROUP` - Group write access\"\n    \
        \            }\n              }\n            }\n          }\n        }\n \
        \     }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Update file access control list (ACL).
rest_endpoint: /v1/files/{ref}/info/acl
api_version: v1
permalink: /rest-api-guide/files/files_ref_info_acl.html
sidebar: rest_api_guide_sidebar
---
