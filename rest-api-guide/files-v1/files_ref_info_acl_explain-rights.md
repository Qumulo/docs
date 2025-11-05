---
category: /Files V1
methods:
  post:
    summary: Explain how rights are granted to a user for a file/directory.
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
      schema: "{\n  \"description\": \"api_files_effective_rights_explanation\",\n\
        \  \"type\": \"object\",\n  \"properties\": {\n    \"owner\": {\n      \"\
        description\": \"The user that owns the file.\",\n      \"type\": \"object\"\
        ,\n      \"properties\": {\n        \"domain\": {\n          \"type\": \"\
        string\",\n          \"enum\": [\n            \"LOCAL\",\n            \"API_NULL_DOMAIN\"\
        ,\n            \"WORLD\",\n            \"POSIX_USER\",\n            \"POSIX_GROUP\"\
        ,\n            \"ACTIVE_DIRECTORY\",\n            \"API_INVALID_DOMAIN\",\n\
        \            \"API_RESERVED_DOMAIN\",\n            \"API_INTERNAL_DOMAIN\"\
        ,\n            \"API_OPERATOR_DOMAIN\",\n            \"API_QUMULO_SUPPORT_DOMAIN\"\
        ,\n            \"API_CREATOR_DOMAIN\"\n          ],\n          \"description\"\
        : \"domain:\\n * `ACTIVE_DIRECTORY` - ACTIVE_DIRECTORY,\\n * `API_CREATOR_DOMAIN`\
        \ - API_CREATOR_DOMAIN,\\n * `API_INTERNAL_DOMAIN` - API_INTERNAL_DOMAIN,\\\
        n * `API_INVALID_DOMAIN` - API_INVALID_DOMAIN,\\n * `API_NULL_DOMAIN` - API_NULL_DOMAIN,\\\
        n * `API_OPERATOR_DOMAIN` - API_OPERATOR_DOMAIN,\\n * `API_QUMULO_SUPPORT_DOMAIN`\
        \ - API_QUMULO_SUPPORT_DOMAIN,\\n * `API_RESERVED_DOMAIN` - API_RESERVED_DOMAIN,\\\
        n * `LOCAL` - LOCAL,\\n * `POSIX_GROUP` - POSIX_GROUP,\\n * `POSIX_USER` -\
        \ POSIX_USER,\\n * `WORLD` - WORLD\"\n        },\n        \"auth_id\": {\n\
        \          \"description\": \"auth_id\",\n          \"type\": \"string\"\n\
        \        },\n        \"uid\": {\n          \"description\": \"uid\",\n   \
        \       \"type\": \"number\"\n        },\n        \"gid\": {\n          \"\
        description\": \"gid\",\n          \"type\": \"number\"\n        },\n    \
        \    \"sid\": {\n          \"description\": \"sid\",\n          \"type\":\
        \ \"string\"\n        },\n        \"name\": {\n          \"description\":\
        \ \"name\",\n          \"type\": \"string\"\n        }\n      }\n    },\n\
        \    \"group_owner\": {\n      \"description\": \"The group-owner for the\
        \ file.\",\n      \"type\": \"object\",\n      \"properties\": {\n       \
        \ \"domain\": {\n          \"type\": \"string\",\n          \"enum\": [\n\
        \            \"LOCAL\",\n            \"API_NULL_DOMAIN\",\n            \"\
        WORLD\",\n            \"POSIX_USER\",\n            \"POSIX_GROUP\",\n    \
        \        \"ACTIVE_DIRECTORY\",\n            \"API_INVALID_DOMAIN\",\n    \
        \        \"API_RESERVED_DOMAIN\",\n            \"API_INTERNAL_DOMAIN\",\n\
        \            \"API_OPERATOR_DOMAIN\",\n            \"API_QUMULO_SUPPORT_DOMAIN\"\
        ,\n            \"API_CREATOR_DOMAIN\"\n          ],\n          \"description\"\
        : \"domain:\\n * `ACTIVE_DIRECTORY` - ACTIVE_DIRECTORY,\\n * `API_CREATOR_DOMAIN`\
        \ - API_CREATOR_DOMAIN,\\n * `API_INTERNAL_DOMAIN` - API_INTERNAL_DOMAIN,\\\
        n * `API_INVALID_DOMAIN` - API_INVALID_DOMAIN,\\n * `API_NULL_DOMAIN` - API_NULL_DOMAIN,\\\
        n * `API_OPERATOR_DOMAIN` - API_OPERATOR_DOMAIN,\\n * `API_QUMULO_SUPPORT_DOMAIN`\
        \ - API_QUMULO_SUPPORT_DOMAIN,\\n * `API_RESERVED_DOMAIN` - API_RESERVED_DOMAIN,\\\
        n * `LOCAL` - LOCAL,\\n * `POSIX_GROUP` - POSIX_GROUP,\\n * `POSIX_USER` -\
        \ POSIX_USER,\\n * `WORLD` - WORLD\"\n        },\n        \"auth_id\": {\n\
        \          \"description\": \"auth_id\",\n          \"type\": \"string\"\n\
        \        },\n        \"uid\": {\n          \"description\": \"uid\",\n   \
        \       \"type\": \"number\"\n        },\n        \"gid\": {\n          \"\
        description\": \"gid\",\n          \"type\": \"number\"\n        },\n    \
        \    \"sid\": {\n          \"description\": \"sid\",\n          \"type\":\
        \ \"string\"\n        },\n        \"name\": {\n          \"description\":\
        \ \"name\",\n          \"type\": \"string\"\n        }\n      }\n    },\n\
        \    \"requestor\": {\n      \"description\": \"The full identity whose rights\
        \ are described.\",\n      \"type\": \"object\",\n      \"properties\": {\n\
        \        \"user\": {\n          \"description\": \"The user for whose rights\
        \ are being explained.\",\n          \"type\": \"object\",\n          \"properties\"\
        : {\n            \"domain\": {\n              \"type\": \"string\",\n    \
        \          \"enum\": [\n                \"LOCAL\",\n                \"API_NULL_DOMAIN\"\
        ,\n                \"WORLD\",\n                \"POSIX_USER\",\n         \
        \       \"POSIX_GROUP\",\n                \"ACTIVE_DIRECTORY\",\n        \
        \        \"API_INVALID_DOMAIN\",\n                \"API_RESERVED_DOMAIN\"\
        ,\n                \"API_INTERNAL_DOMAIN\",\n                \"API_OPERATOR_DOMAIN\"\
        ,\n                \"API_QUMULO_SUPPORT_DOMAIN\",\n                \"API_CREATOR_DOMAIN\"\
        \n              ],\n              \"description\": \"domain:\\n * `ACTIVE_DIRECTORY`\
        \ - ACTIVE_DIRECTORY,\\n * `API_CREATOR_DOMAIN` - API_CREATOR_DOMAIN,\\n *\
        \ `API_INTERNAL_DOMAIN` - API_INTERNAL_DOMAIN,\\n * `API_INVALID_DOMAIN` -\
        \ API_INVALID_DOMAIN,\\n * `API_NULL_DOMAIN` - API_NULL_DOMAIN,\\n * `API_OPERATOR_DOMAIN`\
        \ - API_OPERATOR_DOMAIN,\\n * `API_QUMULO_SUPPORT_DOMAIN` - API_QUMULO_SUPPORT_DOMAIN,\\\
        n * `API_RESERVED_DOMAIN` - API_RESERVED_DOMAIN,\\n * `LOCAL` - LOCAL,\\n\
        \ * `POSIX_GROUP` - POSIX_GROUP,\\n * `POSIX_USER` - POSIX_USER,\\n * `WORLD`\
        \ - WORLD\"\n            },\n            \"auth_id\": {\n              \"\
        description\": \"auth_id\",\n              \"type\": \"string\"\n        \
        \    },\n            \"uid\": {\n              \"description\": \"uid\",\n\
        \              \"type\": \"number\"\n            },\n            \"gid\":\
        \ {\n              \"description\": \"gid\",\n              \"type\": \"number\"\
        \n            },\n            \"sid\": {\n              \"description\": \"\
        sid\",\n              \"type\": \"string\"\n            },\n            \"\
        name\": {\n              \"description\": \"name\",\n              \"type\"\
        : \"string\"\n            }\n          }\n        },\n        \"primary_group\"\
        : {\n          \"description\": \"The user's primary group.\",\n         \
        \ \"type\": \"object\",\n          \"properties\": {\n            \"domain\"\
        : {\n              \"type\": \"string\",\n              \"enum\": [\n    \
        \            \"LOCAL\",\n                \"API_NULL_DOMAIN\",\n          \
        \      \"WORLD\",\n                \"POSIX_USER\",\n                \"POSIX_GROUP\"\
        ,\n                \"ACTIVE_DIRECTORY\",\n                \"API_INVALID_DOMAIN\"\
        ,\n                \"API_RESERVED_DOMAIN\",\n                \"API_INTERNAL_DOMAIN\"\
        ,\n                \"API_OPERATOR_DOMAIN\",\n                \"API_QUMULO_SUPPORT_DOMAIN\"\
        ,\n                \"API_CREATOR_DOMAIN\"\n              ],\n            \
        \  \"description\": \"domain:\\n * `ACTIVE_DIRECTORY` - ACTIVE_DIRECTORY,\\\
        n * `API_CREATOR_DOMAIN` - API_CREATOR_DOMAIN,\\n * `API_INTERNAL_DOMAIN`\
        \ - API_INTERNAL_DOMAIN,\\n * `API_INVALID_DOMAIN` - API_INVALID_DOMAIN,\\\
        n * `API_NULL_DOMAIN` - API_NULL_DOMAIN,\\n * `API_OPERATOR_DOMAIN` - API_OPERATOR_DOMAIN,\\\
        n * `API_QUMULO_SUPPORT_DOMAIN` - API_QUMULO_SUPPORT_DOMAIN,\\n * `API_RESERVED_DOMAIN`\
        \ - API_RESERVED_DOMAIN,\\n * `LOCAL` - LOCAL,\\n * `POSIX_GROUP` - POSIX_GROUP,\\\
        n * `POSIX_USER` - POSIX_USER,\\n * `WORLD` - WORLD\"\n            },\n  \
        \          \"auth_id\": {\n              \"description\": \"auth_id\",\n \
        \             \"type\": \"string\"\n            },\n            \"uid\": {\n\
        \              \"description\": \"uid\",\n              \"type\": \"number\"\
        \n            },\n            \"gid\": {\n              \"description\": \"\
        gid\",\n              \"type\": \"number\"\n            },\n            \"\
        sid\": {\n              \"description\": \"sid\",\n              \"type\"\
        : \"string\"\n            },\n            \"name\": {\n              \"description\"\
        : \"name\",\n              \"type\": \"string\"\n            }\n         \
        \ }\n        },\n        \"auxiliary_identities\": {\n          \"type\":\
        \ \"array\",\n          \"items\": {\n            \"description\": \"Any auxiliary\
        \ identities for the user, e.g. additional groups or related identities.\"\
        ,\n            \"type\": \"object\",\n            \"properties\": {\n    \
        \          \"domain\": {\n                \"type\": \"string\",\n        \
        \        \"enum\": [\n                  \"LOCAL\",\n                  \"API_NULL_DOMAIN\"\
        ,\n                  \"WORLD\",\n                  \"POSIX_USER\",\n     \
        \             \"POSIX_GROUP\",\n                  \"ACTIVE_DIRECTORY\",\n\
        \                  \"API_INVALID_DOMAIN\",\n                  \"API_RESERVED_DOMAIN\"\
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
        \n              }\n            }\n          }\n        }\n      }\n    },\n\
        \    \"admin_priv_rights\": {\n      \"description\": \"Rights granted by\
        \ possessing the administrator privilege.\",\n      \"type\": \"array\",\n\
        \      \"items\": {\n        \"type\": \"string\",\n        \"enum\": [\n\
        \          \"READ\",\n          \"READ_EA\",\n          \"READ_ATTR\",\n \
        \         \"READ_ACL\",\n          \"WRITE_EA\",\n          \"WRITE_ATTR\"\
        ,\n          \"WRITE_ACL\",\n          \"CHANGE_OWNER\",\n          \"WRITE_GROUP\"\
        ,\n          \"DELETE\",\n          \"EXECUTE\",\n          \"MODIFY\",\n\
        \          \"EXTEND\",\n          \"ADD_FILE\",\n          \"ADD_SUBDIR\"\
        ,\n          \"DELETE_CHILD\",\n          \"SYNCHRONIZE\",\n          \"ALL\"\
        \n        ],\n        \"description\": \"Rights granted by possessing the\
        \ administrator privilege.:\\n * `ADD_FILE` - API_FILES_ACCESS_ADD_FILE,\\\
        n * `ADD_SUBDIR` - API_FILES_ACCESS_ADD_SUBDIR,\\n * `ALL` - API_FILES_ACCESS_ALL,\\\
        n * `CHANGE_OWNER` - API_FILES_ACCESS_CHANGE_OWNER,\\n * `DELETE` - API_FILES_ACCESS_DELETE,\\\
        n * `DELETE_CHILD` - API_FILES_ACCESS_DELETE_CHILD,\\n * `EXECUTE` - API_FILES_ACCESS_EXECUTE,\\\
        n * `EXTEND` - API_FILES_ACCESS_EXTEND,\\n * `MODIFY` - API_FILES_ACCESS_MODIFY,\\\
        n * `READ` - API_FILES_ACCESS_READ,\\n * `READ_ACL` - API_FILES_ACCESS_READ_ACL,\\\
        n * `READ_ATTR` - API_FILES_ACCESS_READ_ATTR,\\n * `READ_EA` - API_FILES_ACCESS_READ_EA,\\\
        n * `SYNCHRONIZE` - API_FILES_ACCESS_SYNCHRONIZE,\\n * `WRITE_ACL` - API_FILES_ACCESS_WRITE_ACL,\\\
        n * `WRITE_ATTR` - API_FILES_ACCESS_WRITE_ATTR,\\n * `WRITE_EA` - API_FILES_ACCESS_WRITE_EA,\\\
        n * `WRITE_GROUP` - API_FILES_ACCESS_WRITE_GROUP\"\n      }\n    },\n    \"\
        read_attr_priv_rights\": {\n      \"description\": \"Rights granted by possessing\
        \ the privilege to read attributes.\",\n      \"type\": \"array\",\n     \
        \ \"items\": {\n        \"type\": \"string\",\n        \"enum\": [\n     \
        \     \"READ\",\n          \"READ_EA\",\n          \"READ_ATTR\",\n      \
        \    \"READ_ACL\",\n          \"WRITE_EA\",\n          \"WRITE_ATTR\",\n \
        \         \"WRITE_ACL\",\n          \"CHANGE_OWNER\",\n          \"WRITE_GROUP\"\
        ,\n          \"DELETE\",\n          \"EXECUTE\",\n          \"MODIFY\",\n\
        \          \"EXTEND\",\n          \"ADD_FILE\",\n          \"ADD_SUBDIR\"\
        ,\n          \"DELETE_CHILD\",\n          \"SYNCHRONIZE\",\n          \"ALL\"\
        \n        ],\n        \"description\": \"Rights granted by possessing the\
        \ privilege to read attributes.:\\n * `ADD_FILE` - API_FILES_ACCESS_ADD_FILE,\\\
        n * `ADD_SUBDIR` - API_FILES_ACCESS_ADD_SUBDIR,\\n * `ALL` - API_FILES_ACCESS_ALL,\\\
        n * `CHANGE_OWNER` - API_FILES_ACCESS_CHANGE_OWNER,\\n * `DELETE` - API_FILES_ACCESS_DELETE,\\\
        n * `DELETE_CHILD` - API_FILES_ACCESS_DELETE_CHILD,\\n * `EXECUTE` - API_FILES_ACCESS_EXECUTE,\\\
        n * `EXTEND` - API_FILES_ACCESS_EXTEND,\\n * `MODIFY` - API_FILES_ACCESS_MODIFY,\\\
        n * `READ` - API_FILES_ACCESS_READ,\\n * `READ_ACL` - API_FILES_ACCESS_READ_ACL,\\\
        n * `READ_ATTR` - API_FILES_ACCESS_READ_ATTR,\\n * `READ_EA` - API_FILES_ACCESS_READ_EA,\\\
        n * `SYNCHRONIZE` - API_FILES_ACCESS_SYNCHRONIZE,\\n * `WRITE_ACL` - API_FILES_ACCESS_WRITE_ACL,\\\
        n * `WRITE_ATTR` - API_FILES_ACCESS_WRITE_ATTR,\\n * `WRITE_EA` - API_FILES_ACCESS_WRITE_EA,\\\
        n * `WRITE_GROUP` - API_FILES_ACCESS_WRITE_GROUP\"\n      }\n    },\n    \"\
        annotated_aces\": {\n      \"type\": \"array\",\n      \"items\": {\n    \
        \    \"description\": \"An ACE-by-ACE explanation of rights granted to the\
        \ user.\",\n        \"type\": \"object\",\n        \"properties\": {\n   \
        \       \"ace\": {\n            \"description\": \"Exact copy of the FS ACE.\"\
        ,\n            \"type\": \"object\",\n            \"properties\": {\n    \
        \          \"type\": {\n                \"type\": \"string\",\n          \
        \      \"enum\": [\n                  \"ALLOWED\",\n                  \"DENIED\"\
        \n                ],\n                \"description\": \"Type of this ACL\
        \ entry:\\n * `ALLOWED` - API_FILES_ACE_TYPE_ALLOWED,\\n * `DENIED` - API_FILES_ACE_TYPE_DENIED\"\
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
        : \"Trustee for this ACL entry\",\n                \"type\": \"object\",\n\
        \                \"properties\": {\n                  \"domain\": {\n    \
        \                \"type\": \"string\",\n                    \"enum\": [\n\
        \                      \"LOCAL\",\n                      \"API_NULL_DOMAIN\"\
        ,\n                      \"WORLD\",\n                      \"POSIX_USER\"\
        ,\n                      \"POSIX_GROUP\",\n                      \"ACTIVE_DIRECTORY\"\
        ,\n                      \"API_INVALID_DOMAIN\",\n                      \"\
        API_RESERVED_DOMAIN\",\n                      \"API_INTERNAL_DOMAIN\",\n \
        \                     \"API_OPERATOR_DOMAIN\",\n                      \"API_QUMULO_SUPPORT_DOMAIN\"\
        ,\n                      \"API_CREATOR_DOMAIN\"\n                    ],\n\
        \                    \"description\": \"domain:\\n * `ACTIVE_DIRECTORY` -\
        \ ACTIVE_DIRECTORY,\\n * `API_CREATOR_DOMAIN` - API_CREATOR_DOMAIN,\\n * `API_INTERNAL_DOMAIN`\
        \ - API_INTERNAL_DOMAIN,\\n * `API_INVALID_DOMAIN` - API_INVALID_DOMAIN,\\\
        n * `API_NULL_DOMAIN` - API_NULL_DOMAIN,\\n * `API_OPERATOR_DOMAIN` - API_OPERATOR_DOMAIN,\\\
        n * `API_QUMULO_SUPPORT_DOMAIN` - API_QUMULO_SUPPORT_DOMAIN,\\n * `API_RESERVED_DOMAIN`\
        \ - API_RESERVED_DOMAIN,\\n * `LOCAL` - LOCAL,\\n * `POSIX_GROUP` - POSIX_GROUP,\\\
        n * `POSIX_USER` - POSIX_USER,\\n * `WORLD` - WORLD\"\n                  },\n\
        \                  \"auth_id\": {\n                    \"description\": \"\
        auth_id\",\n                    \"type\": \"string\"\n                  },\n\
        \                  \"uid\": {\n                    \"description\": \"uid\"\
        ,\n                    \"type\": \"number\"\n                  },\n      \
        \            \"gid\": {\n                    \"description\": \"gid\",\n \
        \                   \"type\": \"number\"\n                  },\n         \
        \         \"sid\": {\n                    \"description\": \"sid\",\n    \
        \                \"type\": \"string\"\n                  },\n            \
        \      \"name\": {\n                    \"description\": \"name\",\n     \
        \               \"type\": \"string\"\n                  }\n              \
        \  }\n              },\n              \"rights\": {\n                \"description\"\
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
        \              \"ALL\"\n                  ],\n                  \"description\"\
        : \"Rights granted or denied for this ACL entry:\\n * `ADD_FILE` - API_FILES_ACCESS_ADD_FILE,\\\
        n * `ADD_SUBDIR` - API_FILES_ACCESS_ADD_SUBDIR,\\n * `ALL` - API_FILES_ACCESS_ALL,\\\
        n * `CHANGE_OWNER` - API_FILES_ACCESS_CHANGE_OWNER,\\n * `DELETE` - API_FILES_ACCESS_DELETE,\\\
        n * `DELETE_CHILD` - API_FILES_ACCESS_DELETE_CHILD,\\n * `EXECUTE` - API_FILES_ACCESS_EXECUTE,\\\
        n * `EXTEND` - API_FILES_ACCESS_EXTEND,\\n * `MODIFY` - API_FILES_ACCESS_MODIFY,\\\
        n * `READ` - API_FILES_ACCESS_READ,\\n * `READ_ACL` - API_FILES_ACCESS_READ_ACL,\\\
        n * `READ_ATTR` - API_FILES_ACCESS_READ_ATTR,\\n * `READ_EA` - API_FILES_ACCESS_READ_EA,\\\
        n * `SYNCHRONIZE` - API_FILES_ACCESS_SYNCHRONIZE,\\n * `WRITE_ACL` - API_FILES_ACCESS_WRITE_ACL,\\\
        n * `WRITE_ATTR` - API_FILES_ACCESS_WRITE_ATTR,\\n * `WRITE_EA` - API_FILES_ACCESS_WRITE_EA,\\\
        n * `WRITE_GROUP` - API_FILES_ACCESS_WRITE_GROUP\"\n                }\n  \
        \            }\n            }\n          },\n          \"trustee_matches\"\
        : {\n            \"description\": \"Whether this ACE's trustee matches the\
        \ user in question.\",\n            \"type\": \"boolean\"\n          },\n\
        \          \"skipped_inherit_only\": {\n            \"description\": \"Whether\
        \ this ACE does not affect rights due to being inherit-only.\",\n        \
        \    \"type\": \"boolean\"\n          },\n          \"newly_allowed\": {\n\
        \            \"description\": \"Rights allowed by the current ACE.\",\n  \
        \          \"type\": \"array\",\n            \"items\": {\n              \"\
        type\": \"string\",\n              \"enum\": [\n                \"READ\",\n\
        \                \"READ_EA\",\n                \"READ_ATTR\",\n          \
        \      \"READ_ACL\",\n                \"WRITE_EA\",\n                \"WRITE_ATTR\"\
        ,\n                \"WRITE_ACL\",\n                \"CHANGE_OWNER\",\n   \
        \             \"WRITE_GROUP\",\n                \"DELETE\",\n            \
        \    \"EXECUTE\",\n                \"MODIFY\",\n                \"EXTEND\"\
        ,\n                \"ADD_FILE\",\n                \"ADD_SUBDIR\",\n      \
        \          \"DELETE_CHILD\",\n                \"SYNCHRONIZE\",\n         \
        \       \"ALL\"\n              ],\n              \"description\": \"Rights\
        \ allowed by the current ACE.:\\n * `ADD_FILE` - API_FILES_ACCESS_ADD_FILE,\\\
        n * `ADD_SUBDIR` - API_FILES_ACCESS_ADD_SUBDIR,\\n * `ALL` - API_FILES_ACCESS_ALL,\\\
        n * `CHANGE_OWNER` - API_FILES_ACCESS_CHANGE_OWNER,\\n * `DELETE` - API_FILES_ACCESS_DELETE,\\\
        n * `DELETE_CHILD` - API_FILES_ACCESS_DELETE_CHILD,\\n * `EXECUTE` - API_FILES_ACCESS_EXECUTE,\\\
        n * `EXTEND` - API_FILES_ACCESS_EXTEND,\\n * `MODIFY` - API_FILES_ACCESS_MODIFY,\\\
        n * `READ` - API_FILES_ACCESS_READ,\\n * `READ_ACL` - API_FILES_ACCESS_READ_ACL,\\\
        n * `READ_ATTR` - API_FILES_ACCESS_READ_ATTR,\\n * `READ_EA` - API_FILES_ACCESS_READ_EA,\\\
        n * `SYNCHRONIZE` - API_FILES_ACCESS_SYNCHRONIZE,\\n * `WRITE_ACL` - API_FILES_ACCESS_WRITE_ACL,\\\
        n * `WRITE_ATTR` - API_FILES_ACCESS_WRITE_ATTR,\\n * `WRITE_EA` - API_FILES_ACCESS_WRITE_EA,\\\
        n * `WRITE_GROUP` - API_FILES_ACCESS_WRITE_GROUP\"\n            }\n      \
        \    },\n          \"cumulative_allowed\": {\n            \"description\"\
        : \"Rights allowed in total so far.\",\n            \"type\": \"array\",\n\
        \            \"items\": {\n              \"type\": \"string\",\n         \
        \     \"enum\": [\n                \"READ\",\n                \"READ_EA\"\
        ,\n                \"READ_ATTR\",\n                \"READ_ACL\",\n       \
        \         \"WRITE_EA\",\n                \"WRITE_ATTR\",\n               \
        \ \"WRITE_ACL\",\n                \"CHANGE_OWNER\",\n                \"WRITE_GROUP\"\
        ,\n                \"DELETE\",\n                \"EXECUTE\",\n           \
        \     \"MODIFY\",\n                \"EXTEND\",\n                \"ADD_FILE\"\
        ,\n                \"ADD_SUBDIR\",\n                \"DELETE_CHILD\",\n  \
        \              \"SYNCHRONIZE\",\n                \"ALL\"\n              ],\n\
        \              \"description\": \"Rights allowed in total so far.:\\n * `ADD_FILE`\
        \ - API_FILES_ACCESS_ADD_FILE,\\n * `ADD_SUBDIR` - API_FILES_ACCESS_ADD_SUBDIR,\\\
        n * `ALL` - API_FILES_ACCESS_ALL,\\n * `CHANGE_OWNER` - API_FILES_ACCESS_CHANGE_OWNER,\\\
        n * `DELETE` - API_FILES_ACCESS_DELETE,\\n * `DELETE_CHILD` - API_FILES_ACCESS_DELETE_CHILD,\\\
        n * `EXECUTE` - API_FILES_ACCESS_EXECUTE,\\n * `EXTEND` - API_FILES_ACCESS_EXTEND,\\\
        n * `MODIFY` - API_FILES_ACCESS_MODIFY,\\n * `READ` - API_FILES_ACCESS_READ,\\\
        n * `READ_ACL` - API_FILES_ACCESS_READ_ACL,\\n * `READ_ATTR` - API_FILES_ACCESS_READ_ATTR,\\\
        n * `READ_EA` - API_FILES_ACCESS_READ_EA,\\n * `SYNCHRONIZE` - API_FILES_ACCESS_SYNCHRONIZE,\\\
        n * `WRITE_ACL` - API_FILES_ACCESS_WRITE_ACL,\\n * `WRITE_ATTR` - API_FILES_ACCESS_WRITE_ATTR,\\\
        n * `WRITE_EA` - API_FILES_ACCESS_WRITE_EA,\\n * `WRITE_GROUP` - API_FILES_ACCESS_WRITE_GROUP\"\
        \n            }\n          },\n          \"newly_denied\": {\n           \
        \ \"description\": \"Rights denied by the current ACE.\",\n            \"\
        type\": \"array\",\n            \"items\": {\n              \"type\": \"string\"\
        ,\n              \"enum\": [\n                \"READ\",\n                \"\
        READ_EA\",\n                \"READ_ATTR\",\n                \"READ_ACL\",\n\
        \                \"WRITE_EA\",\n                \"WRITE_ATTR\",\n        \
        \        \"WRITE_ACL\",\n                \"CHANGE_OWNER\",\n             \
        \   \"WRITE_GROUP\",\n                \"DELETE\",\n                \"EXECUTE\"\
        ,\n                \"MODIFY\",\n                \"EXTEND\",\n            \
        \    \"ADD_FILE\",\n                \"ADD_SUBDIR\",\n                \"DELETE_CHILD\"\
        ,\n                \"SYNCHRONIZE\",\n                \"ALL\"\n           \
        \   ],\n              \"description\": \"Rights denied by the current ACE.:\\\
        n * `ADD_FILE` - API_FILES_ACCESS_ADD_FILE,\\n * `ADD_SUBDIR` - API_FILES_ACCESS_ADD_SUBDIR,\\\
        n * `ALL` - API_FILES_ACCESS_ALL,\\n * `CHANGE_OWNER` - API_FILES_ACCESS_CHANGE_OWNER,\\\
        n * `DELETE` - API_FILES_ACCESS_DELETE,\\n * `DELETE_CHILD` - API_FILES_ACCESS_DELETE_CHILD,\\\
        n * `EXECUTE` - API_FILES_ACCESS_EXECUTE,\\n * `EXTEND` - API_FILES_ACCESS_EXTEND,\\\
        n * `MODIFY` - API_FILES_ACCESS_MODIFY,\\n * `READ` - API_FILES_ACCESS_READ,\\\
        n * `READ_ACL` - API_FILES_ACCESS_READ_ACL,\\n * `READ_ATTR` - API_FILES_ACCESS_READ_ATTR,\\\
        n * `READ_EA` - API_FILES_ACCESS_READ_EA,\\n * `SYNCHRONIZE` - API_FILES_ACCESS_SYNCHRONIZE,\\\
        n * `WRITE_ACL` - API_FILES_ACCESS_WRITE_ACL,\\n * `WRITE_ATTR` - API_FILES_ACCESS_WRITE_ATTR,\\\
        n * `WRITE_EA` - API_FILES_ACCESS_WRITE_EA,\\n * `WRITE_GROUP` - API_FILES_ACCESS_WRITE_GROUP\"\
        \n            }\n          },\n          \"cumulative_denied\": {\n      \
        \      \"description\": \"Rights denied in total so far.\",\n            \"\
        type\": \"array\",\n            \"items\": {\n              \"type\": \"string\"\
        ,\n              \"enum\": [\n                \"READ\",\n                \"\
        READ_EA\",\n                \"READ_ATTR\",\n                \"READ_ACL\",\n\
        \                \"WRITE_EA\",\n                \"WRITE_ATTR\",\n        \
        \        \"WRITE_ACL\",\n                \"CHANGE_OWNER\",\n             \
        \   \"WRITE_GROUP\",\n                \"DELETE\",\n                \"EXECUTE\"\
        ,\n                \"MODIFY\",\n                \"EXTEND\",\n            \
        \    \"ADD_FILE\",\n                \"ADD_SUBDIR\",\n                \"DELETE_CHILD\"\
        ,\n                \"SYNCHRONIZE\",\n                \"ALL\"\n           \
        \   ],\n              \"description\": \"Rights denied in total so far.:\\\
        n * `ADD_FILE` - API_FILES_ACCESS_ADD_FILE,\\n * `ADD_SUBDIR` - API_FILES_ACCESS_ADD_SUBDIR,\\\
        n * `ALL` - API_FILES_ACCESS_ALL,\\n * `CHANGE_OWNER` - API_FILES_ACCESS_CHANGE_OWNER,\\\
        n * `DELETE` - API_FILES_ACCESS_DELETE,\\n * `DELETE_CHILD` - API_FILES_ACCESS_DELETE_CHILD,\\\
        n * `EXECUTE` - API_FILES_ACCESS_EXECUTE,\\n * `EXTEND` - API_FILES_ACCESS_EXTEND,\\\
        n * `MODIFY` - API_FILES_ACCESS_MODIFY,\\n * `READ` - API_FILES_ACCESS_READ,\\\
        n * `READ_ACL` - API_FILES_ACCESS_READ_ACL,\\n * `READ_ATTR` - API_FILES_ACCESS_READ_ATTR,\\\
        n * `READ_EA` - API_FILES_ACCESS_READ_EA,\\n * `SYNCHRONIZE` - API_FILES_ACCESS_SYNCHRONIZE,\\\
        n * `WRITE_ACL` - API_FILES_ACCESS_WRITE_ACL,\\n * `WRITE_ATTR` - API_FILES_ACCESS_WRITE_ATTR,\\\
        n * `WRITE_EA` - API_FILES_ACCESS_WRITE_EA,\\n * `WRITE_GROUP` - API_FILES_ACCESS_WRITE_GROUP\"\
        \n            }\n          }\n        }\n      }\n    },\n    \"rights_from_aces\"\
        : {\n      \"description\": \"Rights granted by the file or directory's ACEs.\"\
        ,\n      \"type\": \"array\",\n      \"items\": {\n        \"type\": \"string\"\
        ,\n        \"enum\": [\n          \"READ\",\n          \"READ_EA\",\n    \
        \      \"READ_ATTR\",\n          \"READ_ACL\",\n          \"WRITE_EA\",\n\
        \          \"WRITE_ATTR\",\n          \"WRITE_ACL\",\n          \"CHANGE_OWNER\"\
        ,\n          \"WRITE_GROUP\",\n          \"DELETE\",\n          \"EXECUTE\"\
        ,\n          \"MODIFY\",\n          \"EXTEND\",\n          \"ADD_FILE\",\n\
        \          \"ADD_SUBDIR\",\n          \"DELETE_CHILD\",\n          \"SYNCHRONIZE\"\
        ,\n          \"ALL\"\n        ],\n        \"description\": \"Rights granted\
        \ by the file or directory's ACEs.:\\n * `ADD_FILE` - API_FILES_ACCESS_ADD_FILE,\\\
        n * `ADD_SUBDIR` - API_FILES_ACCESS_ADD_SUBDIR,\\n * `ALL` - API_FILES_ACCESS_ALL,\\\
        n * `CHANGE_OWNER` - API_FILES_ACCESS_CHANGE_OWNER,\\n * `DELETE` - API_FILES_ACCESS_DELETE,\\\
        n * `DELETE_CHILD` - API_FILES_ACCESS_DELETE_CHILD,\\n * `EXECUTE` - API_FILES_ACCESS_EXECUTE,\\\
        n * `EXTEND` - API_FILES_ACCESS_EXTEND,\\n * `MODIFY` - API_FILES_ACCESS_MODIFY,\\\
        n * `READ` - API_FILES_ACCESS_READ,\\n * `READ_ACL` - API_FILES_ACCESS_READ_ACL,\\\
        n * `READ_ATTR` - API_FILES_ACCESS_READ_ATTR,\\n * `READ_EA` - API_FILES_ACCESS_READ_EA,\\\
        n * `SYNCHRONIZE` - API_FILES_ACCESS_SYNCHRONIZE,\\n * `WRITE_ACL` - API_FILES_ACCESS_WRITE_ACL,\\\
        n * `WRITE_ATTR` - API_FILES_ACCESS_WRITE_ATTR,\\n * `WRITE_EA` - API_FILES_ACCESS_WRITE_EA,\\\
        n * `WRITE_GROUP` - API_FILES_ACCESS_WRITE_GROUP\"\n      }\n    },\n    \"\
        implicit_owner_rights_suppressed_by_ace\": {\n      \"description\": \"Whether\
        \ implicit rights for the owner were suppressed by an ACE for the well-known\
        \ Owner Rights principal.\",\n      \"type\": \"boolean\"\n    },\n    \"\
        implicit_owner_rights\": {\n      \"description\": \"Rights implicitly granted\
        \ because the user in question owns the file or directory.\",\n      \"type\"\
        : \"array\",\n      \"items\": {\n        \"type\": \"string\",\n        \"\
        enum\": [\n          \"READ\",\n          \"READ_EA\",\n          \"READ_ATTR\"\
        ,\n          \"READ_ACL\",\n          \"WRITE_EA\",\n          \"WRITE_ATTR\"\
        ,\n          \"WRITE_ACL\",\n          \"CHANGE_OWNER\",\n          \"WRITE_GROUP\"\
        ,\n          \"DELETE\",\n          \"EXECUTE\",\n          \"MODIFY\",\n\
        \          \"EXTEND\",\n          \"ADD_FILE\",\n          \"ADD_SUBDIR\"\
        ,\n          \"DELETE_CHILD\",\n          \"SYNCHRONIZE\",\n          \"ALL\"\
        \n        ],\n        \"description\": \"Rights implicitly granted because\
        \ the user in question owns the file or directory.:\\n * `ADD_FILE` - API_FILES_ACCESS_ADD_FILE,\\\
        n * `ADD_SUBDIR` - API_FILES_ACCESS_ADD_SUBDIR,\\n * `ALL` - API_FILES_ACCESS_ALL,\\\
        n * `CHANGE_OWNER` - API_FILES_ACCESS_CHANGE_OWNER,\\n * `DELETE` - API_FILES_ACCESS_DELETE,\\\
        n * `DELETE_CHILD` - API_FILES_ACCESS_DELETE_CHILD,\\n * `EXECUTE` - API_FILES_ACCESS_EXECUTE,\\\
        n * `EXTEND` - API_FILES_ACCESS_EXTEND,\\n * `MODIFY` - API_FILES_ACCESS_MODIFY,\\\
        n * `READ` - API_FILES_ACCESS_READ,\\n * `READ_ACL` - API_FILES_ACCESS_READ_ACL,\\\
        n * `READ_ATTR` - API_FILES_ACCESS_READ_ATTR,\\n * `READ_EA` - API_FILES_ACCESS_READ_EA,\\\
        n * `SYNCHRONIZE` - API_FILES_ACCESS_SYNCHRONIZE,\\n * `WRITE_ACL` - API_FILES_ACCESS_WRITE_ACL,\\\
        n * `WRITE_ATTR` - API_FILES_ACCESS_WRITE_ATTR,\\n * `WRITE_EA` - API_FILES_ACCESS_WRITE_EA,\\\
        n * `WRITE_GROUP` - API_FILES_ACCESS_WRITE_GROUP\"\n      }\n    },\n    \"\
        implicit_rights_from_parent\": {\n      \"description\": \"Rights implicitly\
        \ granted by this file or directory's container.\",\n      \"type\": \"array\"\
        ,\n      \"items\": {\n        \"type\": \"string\",\n        \"enum\": [\n\
        \          \"READ\",\n          \"READ_EA\",\n          \"READ_ATTR\",\n \
        \         \"READ_ACL\",\n          \"WRITE_EA\",\n          \"WRITE_ATTR\"\
        ,\n          \"WRITE_ACL\",\n          \"CHANGE_OWNER\",\n          \"WRITE_GROUP\"\
        ,\n          \"DELETE\",\n          \"EXECUTE\",\n          \"MODIFY\",\n\
        \          \"EXTEND\",\n          \"ADD_FILE\",\n          \"ADD_SUBDIR\"\
        ,\n          \"DELETE_CHILD\",\n          \"SYNCHRONIZE\",\n          \"ALL\"\
        \n        ],\n        \"description\": \"Rights implicitly granted by this\
        \ file or directory's container.:\\n * `ADD_FILE` - API_FILES_ACCESS_ADD_FILE,\\\
        n * `ADD_SUBDIR` - API_FILES_ACCESS_ADD_SUBDIR,\\n * `ALL` - API_FILES_ACCESS_ALL,\\\
        n * `CHANGE_OWNER` - API_FILES_ACCESS_CHANGE_OWNER,\\n * `DELETE` - API_FILES_ACCESS_DELETE,\\\
        n * `DELETE_CHILD` - API_FILES_ACCESS_DELETE_CHILD,\\n * `EXECUTE` - API_FILES_ACCESS_EXECUTE,\\\
        n * `EXTEND` - API_FILES_ACCESS_EXTEND,\\n * `MODIFY` - API_FILES_ACCESS_MODIFY,\\\
        n * `READ` - API_FILES_ACCESS_READ,\\n * `READ_ACL` - API_FILES_ACCESS_READ_ACL,\\\
        n * `READ_ATTR` - API_FILES_ACCESS_READ_ATTR,\\n * `READ_EA` - API_FILES_ACCESS_READ_EA,\\\
        n * `SYNCHRONIZE` - API_FILES_ACCESS_SYNCHRONIZE,\\n * `WRITE_ACL` - API_FILES_ACCESS_WRITE_ACL,\\\
        n * `WRITE_ATTR` - API_FILES_ACCESS_WRITE_ATTR,\\n * `WRITE_EA` - API_FILES_ACCESS_WRITE_EA,\\\
        n * `WRITE_GROUP` - API_FILES_ACCESS_WRITE_GROUP\"\n      }\n    },\n    \"\
        implicit_rights\": {\n      \"description\": \"Cumulative rights implicitly\
        \ granted.\",\n      \"type\": \"array\",\n      \"items\": {\n        \"\
        type\": \"string\",\n        \"enum\": [\n          \"READ\",\n          \"\
        READ_EA\",\n          \"READ_ATTR\",\n          \"READ_ACL\",\n          \"\
        WRITE_EA\",\n          \"WRITE_ATTR\",\n          \"WRITE_ACL\",\n       \
        \   \"CHANGE_OWNER\",\n          \"WRITE_GROUP\",\n          \"DELETE\",\n\
        \          \"EXECUTE\",\n          \"MODIFY\",\n          \"EXTEND\",\n  \
        \        \"ADD_FILE\",\n          \"ADD_SUBDIR\",\n          \"DELETE_CHILD\"\
        ,\n          \"SYNCHRONIZE\",\n          \"ALL\"\n        ],\n        \"description\"\
        : \"Cumulative rights implicitly granted.:\\n * `ADD_FILE` - API_FILES_ACCESS_ADD_FILE,\\\
        n * `ADD_SUBDIR` - API_FILES_ACCESS_ADD_SUBDIR,\\n * `ALL` - API_FILES_ACCESS_ALL,\\\
        n * `CHANGE_OWNER` - API_FILES_ACCESS_CHANGE_OWNER,\\n * `DELETE` - API_FILES_ACCESS_DELETE,\\\
        n * `DELETE_CHILD` - API_FILES_ACCESS_DELETE_CHILD,\\n * `EXECUTE` - API_FILES_ACCESS_EXECUTE,\\\
        n * `EXTEND` - API_FILES_ACCESS_EXTEND,\\n * `MODIFY` - API_FILES_ACCESS_MODIFY,\\\
        n * `READ` - API_FILES_ACCESS_READ,\\n * `READ_ACL` - API_FILES_ACCESS_READ_ACL,\\\
        n * `READ_ATTR` - API_FILES_ACCESS_READ_ATTR,\\n * `READ_EA` - API_FILES_ACCESS_READ_EA,\\\
        n * `SYNCHRONIZE` - API_FILES_ACCESS_SYNCHRONIZE,\\n * `WRITE_ACL` - API_FILES_ACCESS_WRITE_ACL,\\\
        n * `WRITE_ATTR` - API_FILES_ACCESS_WRITE_ATTR,\\n * `WRITE_EA` - API_FILES_ACCESS_WRITE_EA,\\\
        n * `WRITE_GROUP` - API_FILES_ACCESS_WRITE_GROUP\"\n      }\n    },\n    \"\
        is_read_only\": {\n      \"description\": \"Whether the file or directory\
        \ in question is in read-only mode.\",\n      \"type\": \"boolean\"\n    },\n\
        \    \"max_rights\": {\n      \"description\": \"Maximum rights which may\
        \ be granted based on share permissions.\",\n      \"type\": \"array\",\n\
        \      \"items\": {\n        \"type\": \"string\",\n        \"enum\": [\n\
        \          \"READ\",\n          \"READ_EA\",\n          \"READ_ATTR\",\n \
        \         \"READ_ACL\",\n          \"WRITE_EA\",\n          \"WRITE_ATTR\"\
        ,\n          \"WRITE_ACL\",\n          \"CHANGE_OWNER\",\n          \"WRITE_GROUP\"\
        ,\n          \"DELETE\",\n          \"EXECUTE\",\n          \"MODIFY\",\n\
        \          \"EXTEND\",\n          \"ADD_FILE\",\n          \"ADD_SUBDIR\"\
        ,\n          \"DELETE_CHILD\",\n          \"SYNCHRONIZE\",\n          \"ALL\"\
        \n        ],\n        \"description\": \"Maximum rights which may be granted\
        \ based on share permissions.:\\n * `ADD_FILE` - API_FILES_ACCESS_ADD_FILE,\\\
        n * `ADD_SUBDIR` - API_FILES_ACCESS_ADD_SUBDIR,\\n * `ALL` - API_FILES_ACCESS_ALL,\\\
        n * `CHANGE_OWNER` - API_FILES_ACCESS_CHANGE_OWNER,\\n * `DELETE` - API_FILES_ACCESS_DELETE,\\\
        n * `DELETE_CHILD` - API_FILES_ACCESS_DELETE_CHILD,\\n * `EXECUTE` - API_FILES_ACCESS_EXECUTE,\\\
        n * `EXTEND` - API_FILES_ACCESS_EXTEND,\\n * `MODIFY` - API_FILES_ACCESS_MODIFY,\\\
        n * `READ` - API_FILES_ACCESS_READ,\\n * `READ_ACL` - API_FILES_ACCESS_READ_ACL,\\\
        n * `READ_ATTR` - API_FILES_ACCESS_READ_ATTR,\\n * `READ_EA` - API_FILES_ACCESS_READ_EA,\\\
        n * `SYNCHRONIZE` - API_FILES_ACCESS_SYNCHRONIZE,\\n * `WRITE_ACL` - API_FILES_ACCESS_WRITE_ACL,\\\
        n * `WRITE_ATTR` - API_FILES_ACCESS_WRITE_ATTR,\\n * `WRITE_EA` - API_FILES_ACCESS_WRITE_EA,\\\
        n * `WRITE_GROUP` - API_FILES_ACCESS_WRITE_GROUP\"\n      }\n    },\n    \"\
        effective_rights\": {\n      \"description\": \"Effective rights granted to\
        \ the user in question for the file or directory.\",\n      \"type\": \"array\"\
        ,\n      \"items\": {\n        \"type\": \"string\",\n        \"enum\": [\n\
        \          \"READ\",\n          \"READ_EA\",\n          \"READ_ATTR\",\n \
        \         \"READ_ACL\",\n          \"WRITE_EA\",\n          \"WRITE_ATTR\"\
        ,\n          \"WRITE_ACL\",\n          \"CHANGE_OWNER\",\n          \"WRITE_GROUP\"\
        ,\n          \"DELETE\",\n          \"EXECUTE\",\n          \"MODIFY\",\n\
        \          \"EXTEND\",\n          \"ADD_FILE\",\n          \"ADD_SUBDIR\"\
        ,\n          \"DELETE_CHILD\",\n          \"SYNCHRONIZE\",\n          \"ALL\"\
        \n        ],\n        \"description\": \"Effective rights granted to the user\
        \ in question for the file or directory.:\\n * `ADD_FILE` - API_FILES_ACCESS_ADD_FILE,\\\
        n * `ADD_SUBDIR` - API_FILES_ACCESS_ADD_SUBDIR,\\n * `ALL` - API_FILES_ACCESS_ALL,\\\
        n * `CHANGE_OWNER` - API_FILES_ACCESS_CHANGE_OWNER,\\n * `DELETE` - API_FILES_ACCESS_DELETE,\\\
        n * `DELETE_CHILD` - API_FILES_ACCESS_DELETE_CHILD,\\n * `EXECUTE` - API_FILES_ACCESS_EXECUTE,\\\
        n * `EXTEND` - API_FILES_ACCESS_EXTEND,\\n * `MODIFY` - API_FILES_ACCESS_MODIFY,\\\
        n * `READ` - API_FILES_ACCESS_READ,\\n * `READ_ACL` - API_FILES_ACCESS_READ_ACL,\\\
        n * `READ_ATTR` - API_FILES_ACCESS_READ_ATTR,\\n * `READ_EA` - API_FILES_ACCESS_READ_EA,\\\
        n * `SYNCHRONIZE` - API_FILES_ACCESS_SYNCHRONIZE,\\n * `WRITE_ACL` - API_FILES_ACCESS_WRITE_ACL,\\\
        n * `WRITE_ATTR` - API_FILES_ACCESS_WRITE_ATTR,\\n * `WRITE_EA` - API_FILES_ACCESS_WRITE_EA,\\\
        n * `WRITE_GROUP` - API_FILES_ACCESS_WRITE_GROUP\"\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
    request_body:
      schema: "{\n  \"description\": \"api_files_effective_rights_post\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"user\": {\n      \"description\"\
        : \"The user for whom to explain effective rights.\",\n      \"type\": \"\
        object\",\n      \"properties\": {\n        \"domain\": {\n          \"type\"\
        : \"string\",\n          \"enum\": [\n            \"LOCAL\",\n           \
        \ \"API_NULL_DOMAIN\",\n            \"WORLD\",\n            \"POSIX_USER\"\
        ,\n            \"POSIX_GROUP\",\n            \"ACTIVE_DIRECTORY\",\n     \
        \       \"API_INVALID_DOMAIN\",\n            \"API_RESERVED_DOMAIN\",\n  \
        \          \"API_INTERNAL_DOMAIN\",\n            \"API_OPERATOR_DOMAIN\",\n\
        \            \"API_QUMULO_SUPPORT_DOMAIN\",\n            \"API_CREATOR_DOMAIN\"\
        \n          ],\n          \"description\": \"domain:\\n * `ACTIVE_DIRECTORY`\
        \ - ACTIVE_DIRECTORY,\\n * `API_CREATOR_DOMAIN` - API_CREATOR_DOMAIN,\\n *\
        \ `API_INTERNAL_DOMAIN` - API_INTERNAL_DOMAIN,\\n * `API_INVALID_DOMAIN` -\
        \ API_INVALID_DOMAIN,\\n * `API_NULL_DOMAIN` - API_NULL_DOMAIN,\\n * `API_OPERATOR_DOMAIN`\
        \ - API_OPERATOR_DOMAIN,\\n * `API_QUMULO_SUPPORT_DOMAIN` - API_QUMULO_SUPPORT_DOMAIN,\\\
        n * `API_RESERVED_DOMAIN` - API_RESERVED_DOMAIN,\\n * `LOCAL` - LOCAL,\\n\
        \ * `POSIX_GROUP` - POSIX_GROUP,\\n * `POSIX_USER` - POSIX_USER,\\n * `WORLD`\
        \ - WORLD\"\n        },\n        \"auth_id\": {\n          \"description\"\
        : \"auth_id\",\n          \"type\": \"string\"\n        },\n        \"uid\"\
        : {\n          \"description\": \"uid\",\n          \"type\": \"number\"\n\
        \        },\n        \"gid\": {\n          \"description\": \"gid\",\n   \
        \       \"type\": \"number\"\n        },\n        \"sid\": {\n          \"\
        description\": \"sid\",\n          \"type\": \"string\"\n        },\n    \
        \    \"name\": {\n          \"description\": \"name\",\n          \"type\"\
        : \"string\"\n        }\n      }\n    },\n    \"primary_group\": {\n     \
        \ \"description\": \"The user's primary group.\",\n      \"type\": \"object\"\
        ,\n      \"properties\": {\n        \"domain\": {\n          \"type\": \"\
        string\",\n          \"enum\": [\n            \"LOCAL\",\n            \"API_NULL_DOMAIN\"\
        ,\n            \"WORLD\",\n            \"POSIX_USER\",\n            \"POSIX_GROUP\"\
        ,\n            \"ACTIVE_DIRECTORY\",\n            \"API_INVALID_DOMAIN\",\n\
        \            \"API_RESERVED_DOMAIN\",\n            \"API_INTERNAL_DOMAIN\"\
        ,\n            \"API_OPERATOR_DOMAIN\",\n            \"API_QUMULO_SUPPORT_DOMAIN\"\
        ,\n            \"API_CREATOR_DOMAIN\"\n          ],\n          \"description\"\
        : \"domain:\\n * `ACTIVE_DIRECTORY` - ACTIVE_DIRECTORY,\\n * `API_CREATOR_DOMAIN`\
        \ - API_CREATOR_DOMAIN,\\n * `API_INTERNAL_DOMAIN` - API_INTERNAL_DOMAIN,\\\
        n * `API_INVALID_DOMAIN` - API_INVALID_DOMAIN,\\n * `API_NULL_DOMAIN` - API_NULL_DOMAIN,\\\
        n * `API_OPERATOR_DOMAIN` - API_OPERATOR_DOMAIN,\\n * `API_QUMULO_SUPPORT_DOMAIN`\
        \ - API_QUMULO_SUPPORT_DOMAIN,\\n * `API_RESERVED_DOMAIN` - API_RESERVED_DOMAIN,\\\
        n * `LOCAL` - LOCAL,\\n * `POSIX_GROUP` - POSIX_GROUP,\\n * `POSIX_USER` -\
        \ POSIX_USER,\\n * `WORLD` - WORLD\"\n        },\n        \"auth_id\": {\n\
        \          \"description\": \"auth_id\",\n          \"type\": \"string\"\n\
        \        },\n        \"uid\": {\n          \"description\": \"uid\",\n   \
        \       \"type\": \"number\"\n        },\n        \"gid\": {\n          \"\
        description\": \"gid\",\n          \"type\": \"number\"\n        },\n    \
        \    \"sid\": {\n          \"description\": \"sid\",\n          \"type\":\
        \ \"string\"\n        },\n        \"name\": {\n          \"description\":\
        \ \"name\",\n          \"type\": \"string\"\n        }\n      }\n    },\n\
        \    \"auxiliary_identities\": {\n      \"type\": \"array\",\n      \"items\"\
        : {\n        \"description\": \"Any auxiliary identities for the user, e.g.\
        \ additional groups or related identities.\",\n        \"type\": \"object\"\
        ,\n        \"properties\": {\n          \"domain\": {\n            \"type\"\
        : \"string\",\n            \"enum\": [\n              \"LOCAL\",\n       \
        \       \"API_NULL_DOMAIN\",\n              \"WORLD\",\n              \"POSIX_USER\"\
        ,\n              \"POSIX_GROUP\",\n              \"ACTIVE_DIRECTORY\",\n \
        \             \"API_INVALID_DOMAIN\",\n              \"API_RESERVED_DOMAIN\"\
        ,\n              \"API_INTERNAL_DOMAIN\",\n              \"API_OPERATOR_DOMAIN\"\
        ,\n              \"API_QUMULO_SUPPORT_DOMAIN\",\n              \"API_CREATOR_DOMAIN\"\
        \n            ],\n            \"description\": \"domain:\\n * `ACTIVE_DIRECTORY`\
        \ - ACTIVE_DIRECTORY,\\n * `API_CREATOR_DOMAIN` - API_CREATOR_DOMAIN,\\n *\
        \ `API_INTERNAL_DOMAIN` - API_INTERNAL_DOMAIN,\\n * `API_INVALID_DOMAIN` -\
        \ API_INVALID_DOMAIN,\\n * `API_NULL_DOMAIN` - API_NULL_DOMAIN,\\n * `API_OPERATOR_DOMAIN`\
        \ - API_OPERATOR_DOMAIN,\\n * `API_QUMULO_SUPPORT_DOMAIN` - API_QUMULO_SUPPORT_DOMAIN,\\\
        n * `API_RESERVED_DOMAIN` - API_RESERVED_DOMAIN,\\n * `LOCAL` - LOCAL,\\n\
        \ * `POSIX_GROUP` - POSIX_GROUP,\\n * `POSIX_USER` - POSIX_USER,\\n * `WORLD`\
        \ - WORLD\"\n          },\n          \"auth_id\": {\n            \"description\"\
        : \"auth_id\",\n            \"type\": \"string\"\n          },\n         \
        \ \"uid\": {\n            \"description\": \"uid\",\n            \"type\"\
        : \"number\"\n          },\n          \"gid\": {\n            \"description\"\
        : \"gid\",\n            \"type\": \"number\"\n          },\n          \"sid\"\
        : {\n            \"description\": \"sid\",\n            \"type\": \"string\"\
        \n          },\n          \"name\": {\n            \"description\": \"name\"\
        ,\n            \"type\": \"string\"\n          }\n        }\n      }\n   \
        \ }\n  }\n}"
rest_endpoint: /v1/files/{ref}/info/acl/explain-rights
api_version: v1
permalink: /rest-api-guide/files-v1/files_ref_info_acl_explain-rights.html
sidebar: rest_api_guide_sidebar
redirect_from: /rest-api-guide/files/files_ref_info_acl_explain-rights.html
---
