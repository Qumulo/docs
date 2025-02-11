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
      schema: "{\n  \"description\": \"api_files_acl_v2\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"control\": {\n      \"description\": \"control\"\
        ,\n      \"type\": \"array\",\n      \"items\": {\n        \"type\": \"string\"\
        ,\n        \"enum\": [\n          \"API_FILES_ACL_CONTROL_PRESENT\",\n   \
        \       \"API_FILES_ACL_CONTROL_DEFAULTED\",\n          \"API_FILES_ACL_CONTROL_TRUSTED\"\
        ,\n          \"API_FILES_ACL_CONTROL_AUTO_INHERIT\",\n          \"API_FILES_ACL_CONTROL_PROTECTED\"\
        ,\n          \"API_FILES_ACL_CONTROL_ALL\"\n        ],\n        \"description\"\
        : \"control:\\n * `API_FILES_ACL_CONTROL_ALL` - All ACL controls,\\n * `API_FILES_ACL_CONTROL_AUTO_INHERIT`\
        \ - Set whether the ACL was created through inheritance,\\n * `API_FILES_ACL_CONTROL_DEFAULTED`\
        \ - Sets whether the ACL was established by default means,\\n * `API_FILES_ACL_CONTROL_PRESENT`\
        \ - Set when ACL is present on the object,\\n * `API_FILES_ACL_CONTROL_PROTECTED`\
        \ - Protects ACL from inherit operations,\\n * `API_FILES_ACL_CONTROL_TRUSTED`\
        \ - Set when ACL is provided by a trusted source\"\n      }\n    },\n    \"\
        posix_special_permissions\": {\n      \"type\": \"array\",\n      \"items\"\
        : {\n        \"type\": \"string\",\n        \"enum\": [\n          \"STICKY_BIT\"\
        ,\n          \"SET_GID\",\n          \"SET_UID\"\n        ],\n        \"description\"\
        : \"posix_special_permissions:\\n * `SET_GID` - SET_GID,\\n * `SET_UID` -\
        \ SET_UID,\\n * `STICKY_BIT` - STICKY_BIT\"\n      }\n    },\n    \"aces\"\
        : {\n      \"type\": \"array\",\n      \"items\": {\n        \"description\"\
        : \"aces\",\n        \"type\": \"object\",\n        \"properties\": {\n  \
        \        \"type\": {\n            \"type\": \"string\",\n            \"enum\"\
        : [\n              \"ALLOWED\",\n              \"DENIED\"\n            ],\n\
        \            \"description\": \"Type of this ACL entry:\\n * `ALLOWED` - API_FILES_ACE_TYPE_ALLOWED,\\\
        n * `DENIED` - API_FILES_ACE_TYPE_DENIED\"\n          },\n          \"flags\"\
        : {\n            \"description\": \"ACE flags for this ACL entry\",\n    \
        \        \"type\": \"array\",\n            \"items\": {\n              \"\
        type\": \"string\",\n              \"enum\": [\n                \"API_FILES_ACE_FLAG_OBJECT_INHERIT\"\
        ,\n                \"API_FILES_ACE_FLAG_CONTAINER_INHERIT\",\n           \
        \     \"API_FILES_ACE_FLAG_NO_PROPAGATE_INHERIT\",\n                \"API_FILES_ACE_FLAG_INHERIT_ONLY\"\
        ,\n                \"API_FILES_ACE_FLAG_INHERITED\",\n                \"API_FILES_ACE_FLAG_ALL\"\
        \n              ],\n              \"description\": \"ACE flags for this ACL\
        \ entry:\\n * `API_FILES_ACE_FLAG_ALL` - All ACE flags,\\n * `API_FILES_ACE_FLAG_CONTAINER_INHERIT`\
        \ - Children that are containers inherit as effective ACE,\\n * `API_FILES_ACE_FLAG_INHERITED`\
        \ - Indicates the ACE was inherited,\\n * `API_FILES_ACE_FLAG_INHERIT_ONLY`\
        \ - Indicates an inherit-only ACE that doesn't control access to the attached\
        \ object,\\n * `API_FILES_ACE_FLAG_NO_PROPAGATE_INHERIT` - Prevent subsequent\
        \ children from inheriting ACE,\\n * `API_FILES_ACE_FLAG_OBJECT_INHERIT` -\
        \ Non-container children inherit as effective ACE. Container objects inherit\
        \ as inherit-only ACE\"\n            }\n          },\n          \"trustee\"\
        : {\n            \"description\": \"Trustee for this ACL entry\",\n      \
        \      \"type\": \"object\",\n            \"properties\": {\n            \
        \  \"domain\": {\n                \"type\": \"string\",\n                \"\
        enum\": [\n                  \"LOCAL\",\n                  \"API_NULL_DOMAIN\"\
        ,\n                  \"WORLD\",\n                  \"POSIX_USER\",\n     \
        \             \"POSIX_GROUP\",\n                  \"ACTIVE_DIRECTORY\",\n\
        \                  \"API_INVALID_DOMAIN\",\n                  \"API_RESERVED_DOMAIN\"\
        ,\n                  \"API_INTERNAL_DOMAIN\",\n                  \"API_OPERATOR_DOMAIN\"\
        ,\n                  \"API_CREATOR_DOMAIN\"\n                ],\n        \
        \        \"description\": \"domain:\\n * `ACTIVE_DIRECTORY` - ACTIVE_DIRECTORY,\\\
        n * `API_CREATOR_DOMAIN` - API_CREATOR_DOMAIN,\\n * `API_INTERNAL_DOMAIN`\
        \ - API_INTERNAL_DOMAIN,\\n * `API_INVALID_DOMAIN` - API_INVALID_DOMAIN,\\\
        n * `API_NULL_DOMAIN` - API_NULL_DOMAIN,\\n * `API_OPERATOR_DOMAIN` - API_OPERATOR_DOMAIN,\\\
        n * `API_RESERVED_DOMAIN` - API_RESERVED_DOMAIN,\\n * `LOCAL` - LOCAL,\\n\
        \ * `POSIX_GROUP` - POSIX_GROUP,\\n * `POSIX_USER` - POSIX_USER,\\n * `WORLD`\
        \ - WORLD\"\n              },\n              \"auth_id\": {\n            \
        \    \"description\": \"auth_id\",\n                \"type\": \"string\"\n\
        \              },\n              \"uid\": {\n                \"description\"\
        : \"uid\",\n                \"type\": \"number\"\n              },\n     \
        \         \"gid\": {\n                \"description\": \"gid\",\n        \
        \        \"type\": \"number\"\n              },\n              \"sid\": {\n\
        \                \"description\": \"sid\",\n                \"type\": \"string\"\
        \n              },\n              \"name\": {\n                \"description\"\
        : \"name\",\n                \"type\": \"string\"\n              }\n     \
        \       }\n          },\n          \"rights\": {\n            \"description\"\
        : \"Rights granted or denied for this ACL entry\",\n            \"type\":\
        \ \"array\",\n            \"items\": {\n              \"type\": \"string\"\
        ,\n              \"enum\": [\n                \"API_FILES_ACCESS_READ\",\n\
        \                \"API_FILES_ACCESS_READ_EA\",\n                \"API_FILES_ACCESS_READ_ATTR\"\
        ,\n                \"API_FILES_ACCESS_READ_ACL\",\n                \"API_FILES_ACCESS_WRITE_EA\"\
        ,\n                \"API_FILES_ACCESS_WRITE_ATTR\",\n                \"API_FILES_ACCESS_WRITE_ACL\"\
        ,\n                \"API_FILES_ACCESS_CHANGE_OWNER\",\n                \"\
        API_FILES_ACCESS_WRITE_GROUP\",\n                \"API_FILES_ACCESS_DELETE\"\
        ,\n                \"API_FILES_ACCESS_EXECUTE\",\n                \"API_FILES_ACCESS_MODIFY\"\
        ,\n                \"API_FILES_ACCESS_EXTEND\",\n                \"API_FILES_ACCESS_ADD_FILE\"\
        ,\n                \"API_FILES_ACCESS_ADD_SUBDIR\",\n                \"API_FILES_ACCESS_DELETE_CHILD\"\
        ,\n                \"API_FILES_ACCESS_SYNCHRONIZE\",\n                \"API_FILES_ACCESS_ALL\"\
        \n              ],\n              \"description\": \"Rights granted or denied\
        \ for this ACL entry:\\n * `API_FILES_ACCESS_ADD_FILE` - File creation access,\\\
        n * `API_FILES_ACCESS_ADD_SUBDIR` - Directory creation access,\\n * `API_FILES_ACCESS_ALL`\
        \ - All access rights,\\n * `API_FILES_ACCESS_CHANGE_OWNER` - Owner write\
        \ access,\\n * `API_FILES_ACCESS_DELETE` - Delete access,\\n * `API_FILES_ACCESS_DELETE_CHILD`\
        \ - Delete from directory access,\\n * `API_FILES_ACCESS_EXECUTE` - Execute\
        \ access,\\n * `API_FILES_ACCESS_EXTEND` - File extension access,\\n * `API_FILES_ACCESS_MODIFY`\
        \ - File modification access,\\n * `API_FILES_ACCESS_READ` - File read access,\\\
        n * `API_FILES_ACCESS_READ_ACL` - ACL read access,\\n * `API_FILES_ACCESS_READ_ATTR`\
        \ - Attribute read access,\\n * `API_FILES_ACCESS_READ_EA` - Extended attribute\
        \ read access,\\n * `API_FILES_ACCESS_SYNCHRONIZE` - File synchronize access,\\\
        n * `API_FILES_ACCESS_WRITE_ACL` - ACL write access,\\n * `API_FILES_ACCESS_WRITE_ATTR`\
        \ - Attribute write access,\\n * `API_FILES_ACCESS_WRITE_EA` - Extended attribute\
        \ write access,\\n * `API_FILES_ACCESS_WRITE_GROUP` - Group write access\"\
        \n            }\n          }\n        }\n      }\n    }\n  }\n}"
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
      schema: "{\n  \"description\": \"api_files_acl_v2\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"control\": {\n      \"description\": \"control\"\
        ,\n      \"type\": \"array\",\n      \"items\": {\n        \"type\": \"string\"\
        ,\n        \"enum\": [\n          \"API_FILES_ACL_CONTROL_PRESENT\",\n   \
        \       \"API_FILES_ACL_CONTROL_DEFAULTED\",\n          \"API_FILES_ACL_CONTROL_TRUSTED\"\
        ,\n          \"API_FILES_ACL_CONTROL_AUTO_INHERIT\",\n          \"API_FILES_ACL_CONTROL_PROTECTED\"\
        ,\n          \"API_FILES_ACL_CONTROL_ALL\"\n        ],\n        \"description\"\
        : \"control:\\n * `API_FILES_ACL_CONTROL_ALL` - All ACL controls,\\n * `API_FILES_ACL_CONTROL_AUTO_INHERIT`\
        \ - Set whether the ACL was created through inheritance,\\n * `API_FILES_ACL_CONTROL_DEFAULTED`\
        \ - Sets whether the ACL was established by default means,\\n * `API_FILES_ACL_CONTROL_PRESENT`\
        \ - Set when ACL is present on the object,\\n * `API_FILES_ACL_CONTROL_PROTECTED`\
        \ - Protects ACL from inherit operations,\\n * `API_FILES_ACL_CONTROL_TRUSTED`\
        \ - Set when ACL is provided by a trusted source\"\n      }\n    },\n    \"\
        posix_special_permissions\": {\n      \"type\": \"array\",\n      \"items\"\
        : {\n        \"type\": \"string\",\n        \"enum\": [\n          \"STICKY_BIT\"\
        ,\n          \"SET_GID\",\n          \"SET_UID\"\n        ],\n        \"description\"\
        : \"posix_special_permissions:\\n * `SET_GID` - SET_GID,\\n * `SET_UID` -\
        \ SET_UID,\\n * `STICKY_BIT` - STICKY_BIT\"\n      }\n    },\n    \"aces\"\
        : {\n      \"type\": \"array\",\n      \"items\": {\n        \"description\"\
        : \"aces\",\n        \"type\": \"object\",\n        \"properties\": {\n  \
        \        \"type\": {\n            \"type\": \"string\",\n            \"enum\"\
        : [\n              \"ALLOWED\",\n              \"DENIED\"\n            ],\n\
        \            \"description\": \"Type of this ACL entry:\\n * `ALLOWED` - API_FILES_ACE_TYPE_ALLOWED,\\\
        n * `DENIED` - API_FILES_ACE_TYPE_DENIED\"\n          },\n          \"flags\"\
        : {\n            \"description\": \"ACE flags for this ACL entry\",\n    \
        \        \"type\": \"array\",\n            \"items\": {\n              \"\
        type\": \"string\",\n              \"enum\": [\n                \"API_FILES_ACE_FLAG_OBJECT_INHERIT\"\
        ,\n                \"API_FILES_ACE_FLAG_CONTAINER_INHERIT\",\n           \
        \     \"API_FILES_ACE_FLAG_NO_PROPAGATE_INHERIT\",\n                \"API_FILES_ACE_FLAG_INHERIT_ONLY\"\
        ,\n                \"API_FILES_ACE_FLAG_INHERITED\",\n                \"API_FILES_ACE_FLAG_ALL\"\
        \n              ],\n              \"description\": \"ACE flags for this ACL\
        \ entry:\\n * `API_FILES_ACE_FLAG_ALL` - All ACE flags,\\n * `API_FILES_ACE_FLAG_CONTAINER_INHERIT`\
        \ - Children that are containers inherit as effective ACE,\\n * `API_FILES_ACE_FLAG_INHERITED`\
        \ - Indicates the ACE was inherited,\\n * `API_FILES_ACE_FLAG_INHERIT_ONLY`\
        \ - Indicates an inherit-only ACE that doesn't control access to the attached\
        \ object,\\n * `API_FILES_ACE_FLAG_NO_PROPAGATE_INHERIT` - Prevent subsequent\
        \ children from inheriting ACE,\\n * `API_FILES_ACE_FLAG_OBJECT_INHERIT` -\
        \ Non-container children inherit as effective ACE. Container objects inherit\
        \ as inherit-only ACE\"\n            }\n          },\n          \"trustee\"\
        : {\n            \"description\": \"Trustee for this ACL entry\",\n      \
        \      \"type\": \"object\",\n            \"properties\": {\n            \
        \  \"domain\": {\n                \"type\": \"string\",\n                \"\
        enum\": [\n                  \"LOCAL\",\n                  \"API_NULL_DOMAIN\"\
        ,\n                  \"WORLD\",\n                  \"POSIX_USER\",\n     \
        \             \"POSIX_GROUP\",\n                  \"ACTIVE_DIRECTORY\",\n\
        \                  \"API_INVALID_DOMAIN\",\n                  \"API_RESERVED_DOMAIN\"\
        ,\n                  \"API_INTERNAL_DOMAIN\",\n                  \"API_OPERATOR_DOMAIN\"\
        ,\n                  \"API_CREATOR_DOMAIN\"\n                ],\n        \
        \        \"description\": \"domain:\\n * `ACTIVE_DIRECTORY` - ACTIVE_DIRECTORY,\\\
        n * `API_CREATOR_DOMAIN` - API_CREATOR_DOMAIN,\\n * `API_INTERNAL_DOMAIN`\
        \ - API_INTERNAL_DOMAIN,\\n * `API_INVALID_DOMAIN` - API_INVALID_DOMAIN,\\\
        n * `API_NULL_DOMAIN` - API_NULL_DOMAIN,\\n * `API_OPERATOR_DOMAIN` - API_OPERATOR_DOMAIN,\\\
        n * `API_RESERVED_DOMAIN` - API_RESERVED_DOMAIN,\\n * `LOCAL` - LOCAL,\\n\
        \ * `POSIX_GROUP` - POSIX_GROUP,\\n * `POSIX_USER` - POSIX_USER,\\n * `WORLD`\
        \ - WORLD\"\n              },\n              \"auth_id\": {\n            \
        \    \"description\": \"auth_id\",\n                \"type\": \"string\"\n\
        \              },\n              \"uid\": {\n                \"description\"\
        : \"uid\",\n                \"type\": \"number\"\n              },\n     \
        \         \"gid\": {\n                \"description\": \"gid\",\n        \
        \        \"type\": \"number\"\n              },\n              \"sid\": {\n\
        \                \"description\": \"sid\",\n                \"type\": \"string\"\
        \n              },\n              \"name\": {\n                \"description\"\
        : \"name\",\n                \"type\": \"string\"\n              }\n     \
        \       }\n          },\n          \"rights\": {\n            \"description\"\
        : \"Rights granted or denied for this ACL entry\",\n            \"type\":\
        \ \"array\",\n            \"items\": {\n              \"type\": \"string\"\
        ,\n              \"enum\": [\n                \"API_FILES_ACCESS_READ\",\n\
        \                \"API_FILES_ACCESS_READ_EA\",\n                \"API_FILES_ACCESS_READ_ATTR\"\
        ,\n                \"API_FILES_ACCESS_READ_ACL\",\n                \"API_FILES_ACCESS_WRITE_EA\"\
        ,\n                \"API_FILES_ACCESS_WRITE_ATTR\",\n                \"API_FILES_ACCESS_WRITE_ACL\"\
        ,\n                \"API_FILES_ACCESS_CHANGE_OWNER\",\n                \"\
        API_FILES_ACCESS_WRITE_GROUP\",\n                \"API_FILES_ACCESS_DELETE\"\
        ,\n                \"API_FILES_ACCESS_EXECUTE\",\n                \"API_FILES_ACCESS_MODIFY\"\
        ,\n                \"API_FILES_ACCESS_EXTEND\",\n                \"API_FILES_ACCESS_ADD_FILE\"\
        ,\n                \"API_FILES_ACCESS_ADD_SUBDIR\",\n                \"API_FILES_ACCESS_DELETE_CHILD\"\
        ,\n                \"API_FILES_ACCESS_SYNCHRONIZE\",\n                \"API_FILES_ACCESS_ALL\"\
        \n              ],\n              \"description\": \"Rights granted or denied\
        \ for this ACL entry:\\n * `API_FILES_ACCESS_ADD_FILE` - File creation access,\\\
        n * `API_FILES_ACCESS_ADD_SUBDIR` - Directory creation access,\\n * `API_FILES_ACCESS_ALL`\
        \ - All access rights,\\n * `API_FILES_ACCESS_CHANGE_OWNER` - Owner write\
        \ access,\\n * `API_FILES_ACCESS_DELETE` - Delete access,\\n * `API_FILES_ACCESS_DELETE_CHILD`\
        \ - Delete from directory access,\\n * `API_FILES_ACCESS_EXECUTE` - Execute\
        \ access,\\n * `API_FILES_ACCESS_EXTEND` - File extension access,\\n * `API_FILES_ACCESS_MODIFY`\
        \ - File modification access,\\n * `API_FILES_ACCESS_READ` - File read access,\\\
        n * `API_FILES_ACCESS_READ_ACL` - ACL read access,\\n * `API_FILES_ACCESS_READ_ATTR`\
        \ - Attribute read access,\\n * `API_FILES_ACCESS_READ_EA` - Extended attribute\
        \ read access,\\n * `API_FILES_ACCESS_SYNCHRONIZE` - File synchronize access,\\\
        n * `API_FILES_ACCESS_WRITE_ACL` - ACL write access,\\n * `API_FILES_ACCESS_WRITE_ATTR`\
        \ - Attribute write access,\\n * `API_FILES_ACCESS_WRITE_EA` - Extended attribute\
        \ write access,\\n * `API_FILES_ACCESS_WRITE_GROUP` - Group write access\"\
        \n            }\n          }\n        }\n      }\n    }\n  }\n}"
    response_body:
      schema: "{\n  \"description\": \"api_files_acl_v2\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"control\": {\n      \"description\": \"control\"\
        ,\n      \"type\": \"array\",\n      \"items\": {\n        \"type\": \"string\"\
        ,\n        \"enum\": [\n          \"API_FILES_ACL_CONTROL_PRESENT\",\n   \
        \       \"API_FILES_ACL_CONTROL_DEFAULTED\",\n          \"API_FILES_ACL_CONTROL_TRUSTED\"\
        ,\n          \"API_FILES_ACL_CONTROL_AUTO_INHERIT\",\n          \"API_FILES_ACL_CONTROL_PROTECTED\"\
        ,\n          \"API_FILES_ACL_CONTROL_ALL\"\n        ],\n        \"description\"\
        : \"control:\\n * `API_FILES_ACL_CONTROL_ALL` - All ACL controls,\\n * `API_FILES_ACL_CONTROL_AUTO_INHERIT`\
        \ - Set whether the ACL was created through inheritance,\\n * `API_FILES_ACL_CONTROL_DEFAULTED`\
        \ - Sets whether the ACL was established by default means,\\n * `API_FILES_ACL_CONTROL_PRESENT`\
        \ - Set when ACL is present on the object,\\n * `API_FILES_ACL_CONTROL_PROTECTED`\
        \ - Protects ACL from inherit operations,\\n * `API_FILES_ACL_CONTROL_TRUSTED`\
        \ - Set when ACL is provided by a trusted source\"\n      }\n    },\n    \"\
        posix_special_permissions\": {\n      \"type\": \"array\",\n      \"items\"\
        : {\n        \"type\": \"string\",\n        \"enum\": [\n          \"STICKY_BIT\"\
        ,\n          \"SET_GID\",\n          \"SET_UID\"\n        ],\n        \"description\"\
        : \"posix_special_permissions:\\n * `SET_GID` - SET_GID,\\n * `SET_UID` -\
        \ SET_UID,\\n * `STICKY_BIT` - STICKY_BIT\"\n      }\n    },\n    \"aces\"\
        : {\n      \"type\": \"array\",\n      \"items\": {\n        \"description\"\
        : \"aces\",\n        \"type\": \"object\",\n        \"properties\": {\n  \
        \        \"type\": {\n            \"type\": \"string\",\n            \"enum\"\
        : [\n              \"ALLOWED\",\n              \"DENIED\"\n            ],\n\
        \            \"description\": \"Type of this ACL entry:\\n * `ALLOWED` - API_FILES_ACE_TYPE_ALLOWED,\\\
        n * `DENIED` - API_FILES_ACE_TYPE_DENIED\"\n          },\n          \"flags\"\
        : {\n            \"description\": \"ACE flags for this ACL entry\",\n    \
        \        \"type\": \"array\",\n            \"items\": {\n              \"\
        type\": \"string\",\n              \"enum\": [\n                \"API_FILES_ACE_FLAG_OBJECT_INHERIT\"\
        ,\n                \"API_FILES_ACE_FLAG_CONTAINER_INHERIT\",\n           \
        \     \"API_FILES_ACE_FLAG_NO_PROPAGATE_INHERIT\",\n                \"API_FILES_ACE_FLAG_INHERIT_ONLY\"\
        ,\n                \"API_FILES_ACE_FLAG_INHERITED\",\n                \"API_FILES_ACE_FLAG_ALL\"\
        \n              ],\n              \"description\": \"ACE flags for this ACL\
        \ entry:\\n * `API_FILES_ACE_FLAG_ALL` - All ACE flags,\\n * `API_FILES_ACE_FLAG_CONTAINER_INHERIT`\
        \ - Children that are containers inherit as effective ACE,\\n * `API_FILES_ACE_FLAG_INHERITED`\
        \ - Indicates the ACE was inherited,\\n * `API_FILES_ACE_FLAG_INHERIT_ONLY`\
        \ - Indicates an inherit-only ACE that doesn't control access to the attached\
        \ object,\\n * `API_FILES_ACE_FLAG_NO_PROPAGATE_INHERIT` - Prevent subsequent\
        \ children from inheriting ACE,\\n * `API_FILES_ACE_FLAG_OBJECT_INHERIT` -\
        \ Non-container children inherit as effective ACE. Container objects inherit\
        \ as inherit-only ACE\"\n            }\n          },\n          \"trustee\"\
        : {\n            \"description\": \"Trustee for this ACL entry\",\n      \
        \      \"type\": \"object\",\n            \"properties\": {\n            \
        \  \"domain\": {\n                \"type\": \"string\",\n                \"\
        enum\": [\n                  \"LOCAL\",\n                  \"API_NULL_DOMAIN\"\
        ,\n                  \"WORLD\",\n                  \"POSIX_USER\",\n     \
        \             \"POSIX_GROUP\",\n                  \"ACTIVE_DIRECTORY\",\n\
        \                  \"API_INVALID_DOMAIN\",\n                  \"API_RESERVED_DOMAIN\"\
        ,\n                  \"API_INTERNAL_DOMAIN\",\n                  \"API_OPERATOR_DOMAIN\"\
        ,\n                  \"API_CREATOR_DOMAIN\"\n                ],\n        \
        \        \"description\": \"domain:\\n * `ACTIVE_DIRECTORY` - ACTIVE_DIRECTORY,\\\
        n * `API_CREATOR_DOMAIN` - API_CREATOR_DOMAIN,\\n * `API_INTERNAL_DOMAIN`\
        \ - API_INTERNAL_DOMAIN,\\n * `API_INVALID_DOMAIN` - API_INVALID_DOMAIN,\\\
        n * `API_NULL_DOMAIN` - API_NULL_DOMAIN,\\n * `API_OPERATOR_DOMAIN` - API_OPERATOR_DOMAIN,\\\
        n * `API_RESERVED_DOMAIN` - API_RESERVED_DOMAIN,\\n * `LOCAL` - LOCAL,\\n\
        \ * `POSIX_GROUP` - POSIX_GROUP,\\n * `POSIX_USER` - POSIX_USER,\\n * `WORLD`\
        \ - WORLD\"\n              },\n              \"auth_id\": {\n            \
        \    \"description\": \"auth_id\",\n                \"type\": \"string\"\n\
        \              },\n              \"uid\": {\n                \"description\"\
        : \"uid\",\n                \"type\": \"number\"\n              },\n     \
        \         \"gid\": {\n                \"description\": \"gid\",\n        \
        \        \"type\": \"number\"\n              },\n              \"sid\": {\n\
        \                \"description\": \"sid\",\n                \"type\": \"string\"\
        \n              },\n              \"name\": {\n                \"description\"\
        : \"name\",\n                \"type\": \"string\"\n              }\n     \
        \       }\n          },\n          \"rights\": {\n            \"description\"\
        : \"Rights granted or denied for this ACL entry\",\n            \"type\":\
        \ \"array\",\n            \"items\": {\n              \"type\": \"string\"\
        ,\n              \"enum\": [\n                \"API_FILES_ACCESS_READ\",\n\
        \                \"API_FILES_ACCESS_READ_EA\",\n                \"API_FILES_ACCESS_READ_ATTR\"\
        ,\n                \"API_FILES_ACCESS_READ_ACL\",\n                \"API_FILES_ACCESS_WRITE_EA\"\
        ,\n                \"API_FILES_ACCESS_WRITE_ATTR\",\n                \"API_FILES_ACCESS_WRITE_ACL\"\
        ,\n                \"API_FILES_ACCESS_CHANGE_OWNER\",\n                \"\
        API_FILES_ACCESS_WRITE_GROUP\",\n                \"API_FILES_ACCESS_DELETE\"\
        ,\n                \"API_FILES_ACCESS_EXECUTE\",\n                \"API_FILES_ACCESS_MODIFY\"\
        ,\n                \"API_FILES_ACCESS_EXTEND\",\n                \"API_FILES_ACCESS_ADD_FILE\"\
        ,\n                \"API_FILES_ACCESS_ADD_SUBDIR\",\n                \"API_FILES_ACCESS_DELETE_CHILD\"\
        ,\n                \"API_FILES_ACCESS_SYNCHRONIZE\",\n                \"API_FILES_ACCESS_ALL\"\
        \n              ],\n              \"description\": \"Rights granted or denied\
        \ for this ACL entry:\\n * `API_FILES_ACCESS_ADD_FILE` - File creation access,\\\
        n * `API_FILES_ACCESS_ADD_SUBDIR` - Directory creation access,\\n * `API_FILES_ACCESS_ALL`\
        \ - All access rights,\\n * `API_FILES_ACCESS_CHANGE_OWNER` - Owner write\
        \ access,\\n * `API_FILES_ACCESS_DELETE` - Delete access,\\n * `API_FILES_ACCESS_DELETE_CHILD`\
        \ - Delete from directory access,\\n * `API_FILES_ACCESS_EXECUTE` - Execute\
        \ access,\\n * `API_FILES_ACCESS_EXTEND` - File extension access,\\n * `API_FILES_ACCESS_MODIFY`\
        \ - File modification access,\\n * `API_FILES_ACCESS_READ` - File read access,\\\
        n * `API_FILES_ACCESS_READ_ACL` - ACL read access,\\n * `API_FILES_ACCESS_READ_ATTR`\
        \ - Attribute read access,\\n * `API_FILES_ACCESS_READ_EA` - Extended attribute\
        \ read access,\\n * `API_FILES_ACCESS_SYNCHRONIZE` - File synchronize access,\\\
        n * `API_FILES_ACCESS_WRITE_ACL` - ACL write access,\\n * `API_FILES_ACCESS_WRITE_ATTR`\
        \ - Attribute write access,\\n * `API_FILES_ACCESS_WRITE_EA` - Extended attribute\
        \ write access,\\n * `API_FILES_ACCESS_WRITE_GROUP` - Group write access\"\
        \n            }\n          }\n        }\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Update file access control list (ACL).
rest_endpoint: /v2/files/{ref}/info/acl
api_version: v2
permalink: /rest-api-guide/files/v2_files_ref_info_acl.html
sidebar: rest_api_guide_sidebar
---
