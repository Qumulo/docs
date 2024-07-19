---
category: /nfs
methods:
  delete:
    parameters:
    - description: A unique identifier of the NFS export, either ID or export path
      name: ref
      required: true
    - description: ETag for expected version
      name: If-Match
      required: false
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    summary: This method deletes an NFS export.
  get:
    parameters:
    - description: A unique identifier of the NFS export, either ID or export path
      name: ref
      required: true
    response_body:
      schema: "{\n  \"description\": \"api_nfs_export\",\n  \"type\": \"object\",\n\
        \  \"properties\": {\n    \"id\": {\n      \"description\": \"The unique ID\
        \ of the NFS export\",\n      \"type\": \"string\"\n    },\n    \"export_path\"\
        : {\n      \"description\": \"The NFS export path\",\n      \"type\": \"string\"\
        \n    },\n    \"fs_path\": {\n      \"description\": \"The filesystem path\
        \ of the exported directory\",\n      \"type\": \"string\"\n    },\n    \"\
        description\": {\n      \"description\": \"Description of this NFS export\"\
        ,\n      \"type\": \"string\"\n    },\n    \"restrictions\": {\n      \"type\"\
        : \"array\",\n      \"items\": {\n        \"description\": \"An array of NFS\
        \ host restrictions.\",\n        \"type\": \"object\",\n        \"properties\"\
        : {\n          \"host_restrictions\": {\n            \"type\": \"array\",\n\
        \            \"items\": {\n              \"description\": \"The list of hosts\
        \ allowed to connect\",\n              \"type\": \"string\"\n            }\n\
        \          },\n          \"require_privileged_port\": {\n            \"description\"\
        : \"Require that clients use a privileged port to use this export.\",\n  \
        \          \"type\": \"boolean\"\n          },\n          \"read_only\": {\n\
        \            \"description\": \"Sets the NFS export to read-only\",\n    \
        \        \"type\": \"boolean\"\n          },\n          \"user_mapping\":\
        \ {\n            \"type\": \"string\",\n            \"enum\": [\n        \
        \      \"NFS_MAP_NONE\",\n              \"NFS_MAP_ROOT\",\n              \"\
        NFS_MAP_ALL\"\n            ],\n            \"description\": \"NFS user mapping\
        \ (squashing) support:\\n * `NFS_MAP_ALL` - Map all users.,\\n * `NFS_MAP_NONE`\
        \ - Do not map users.,\\n * `NFS_MAP_ROOT` - Map root user (uid 0).\"\n  \
        \        },\n          \"map_to_user\": {\n            \"description\": \"\
        An identity object representing a local user or an NFS user to map (see /users).\
        \ If map_to_user is an NFS user, then map_to_group with an NFS gid must be\
        \ given.\",\n            \"type\": \"object\",\n            \"properties\"\
        : {\n              \"id_type\": {\n                \"type\": \"string\",\n\
        \                \"enum\": [\n                  \"LOCAL_USER\",\n        \
        \          \"LOCAL_GROUP\",\n                  \"NFS_GID\",\n            \
        \      \"NFS_UID\",\n                  \"SMB_SID\",\n                  \"\
        INTERNAL\",\n                  \"QUMULO_OPERATOR\"\n                ],\n \
        \               \"description\": \"id_type:\\n * `INTERNAL` - INTERNAL,\\\
        n * `LOCAL_GROUP` - LOCAL_GROUP,\\n * `LOCAL_USER` - LOCAL_USER,\\n * `NFS_GID`\
        \ - NFS_GID,\\n * `NFS_UID` - NFS_UID,\\n * `QUMULO_OPERATOR` - QUMULO_OPERATOR,\\\
        n * `SMB_SID` - SMB_SID\"\n              },\n              \"id_value\": {\n\
        \                \"description\": \"id_value\",\n                \"type\"\
        : \"string\"\n              }\n            }\n          },\n          \"map_to_group\"\
        : {\n            \"description\": \"An identity object representing an NFS\
        \ group. If given, map_to_user should be an NFS user.\",\n            \"type\"\
        : \"object\",\n            \"properties\": {\n              \"id_type\": {\n\
        \                \"type\": \"string\",\n                \"enum\": [\n    \
        \              \"LOCAL_USER\",\n                  \"LOCAL_GROUP\",\n     \
        \             \"NFS_GID\",\n                  \"NFS_UID\",\n             \
        \     \"SMB_SID\",\n                  \"INTERNAL\",\n                  \"\
        QUMULO_OPERATOR\"\n                ],\n                \"description\": \"\
        id_type:\\n * `INTERNAL` - INTERNAL,\\n * `LOCAL_GROUP` - LOCAL_GROUP,\\n\
        \ * `LOCAL_USER` - LOCAL_USER,\\n * `NFS_GID` - NFS_GID,\\n * `NFS_UID` -\
        \ NFS_UID,\\n * `QUMULO_OPERATOR` - QUMULO_OPERATOR,\\n * `SMB_SID` - SMB_SID\"\
        \n              },\n              \"id_value\": {\n                \"description\"\
        : \"id_value\",\n                \"type\": \"string\"\n              }\n \
        \           }\n          }\n        }\n      }\n    },\n    \"fields_to_present_as_32_bit\"\
        : {\n      \"description\": \"Specify which NFS3 result values should be 32-bit\
        \ sanitized on this export. Has no effect on exports used over NFS4.\",\n\
        \      \"type\": \"array\",\n      \"items\": {\n        \"type\": \"string\"\
        ,\n        \"enum\": [\n          \"FILE_IDS\",\n          \"FILE_SIZES\"\
        ,\n          \"FS_SIZE\",\n          \"ALL\"\n        ],\n        \"description\"\
        : \"Specify which NFS3 result values should be 32-bit sanitized on this export.\
        \ Has no effect on exports used over NFS4.:\\n * `ALL` - Force all 64 bit\
        \ fields to fit in 32 bits.,\\n * `FILE_IDS` - Hash high file ids to 32 bits.,\\\
        n * `FILE_SIZES` - Clamp large file sizes to 4GiB to fit in 32 bits.,\\n *\
        \ `FS_SIZE` - Clamp available, used and total space reported for the FS to\
        \ 4GiB.\"\n      }\n    },\n    \"tenant_id\": {\n      \"description\": \"\
        The tenant ID of the tenant that the NFS export is a part of\",\n      \"\
        type\": \"number\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: This method retrieves the specified NFS export. Refer to the 'Modify
      NFS Export' method for a description of the returned fields.
  patch:
    parameters:
    - description: A unique identifier of the NFS export, either ID or export path
      name: ref
      required: true
    - description: Specifies whether the file system path can be created if it does
        not already exist.
      name: allow-fs-path-create
      required: false
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
      schema: "{\n  \"description\": \"api_nfs_export_patch\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"id\": {\n      \"description\": \"The unique\
        \ ID of the NFS export\",\n      \"type\": \"string\"\n    },\n    \"export_path\"\
        : {\n      \"description\": \"The NFS export path\",\n      \"type\": \"string\"\
        \n    },\n    \"fs_path\": {\n      \"description\": \"The filesystem path\
        \ of the exported directory\",\n      \"type\": \"string\"\n    },\n    \"\
        description\": {\n      \"description\": \"Description of this NFS export\"\
        ,\n      \"type\": \"string\"\n    },\n    \"restrictions\": {\n      \"type\"\
        : \"array\",\n      \"items\": {\n        \"description\": \"An array of NFS\
        \ host restrictions.\",\n        \"type\": \"object\",\n        \"properties\"\
        : {\n          \"host_restrictions\": {\n            \"type\": \"array\",\n\
        \            \"items\": {\n              \"description\": \"The list of hosts\
        \ allowed to connect\",\n              \"type\": \"string\"\n            }\n\
        \          },\n          \"require_privileged_port\": {\n            \"description\"\
        : \"Require that clients use a privileged port to use this export.\",\n  \
        \          \"type\": \"boolean\"\n          },\n          \"read_only\": {\n\
        \            \"description\": \"Sets the NFS export to read-only\",\n    \
        \        \"type\": \"boolean\"\n          },\n          \"user_mapping\":\
        \ {\n            \"type\": \"string\",\n            \"enum\": [\n        \
        \      \"NFS_MAP_NONE\",\n              \"NFS_MAP_ROOT\",\n              \"\
        NFS_MAP_ALL\"\n            ],\n            \"description\": \"NFS user mapping\
        \ (squashing) support:\\n * `NFS_MAP_ALL` - Map all users.,\\n * `NFS_MAP_NONE`\
        \ - Do not map users.,\\n * `NFS_MAP_ROOT` - Map root user (uid 0).\"\n  \
        \        },\n          \"map_to_user\": {\n            \"description\": \"\
        An identity object representing a local user or an NFS user to map (see /users).\
        \ If map_to_user is an NFS user, then map_to_group with an NFS gid must be\
        \ given.\",\n            \"type\": \"object\",\n            \"properties\"\
        : {\n              \"id_type\": {\n                \"type\": \"string\",\n\
        \                \"enum\": [\n                  \"LOCAL_USER\",\n        \
        \          \"LOCAL_GROUP\",\n                  \"NFS_GID\",\n            \
        \      \"NFS_UID\",\n                  \"SMB_SID\",\n                  \"\
        INTERNAL\",\n                  \"QUMULO_OPERATOR\"\n                ],\n \
        \               \"description\": \"id_type:\\n * `INTERNAL` - INTERNAL,\\\
        n * `LOCAL_GROUP` - LOCAL_GROUP,\\n * `LOCAL_USER` - LOCAL_USER,\\n * `NFS_GID`\
        \ - NFS_GID,\\n * `NFS_UID` - NFS_UID,\\n * `QUMULO_OPERATOR` - QUMULO_OPERATOR,\\\
        n * `SMB_SID` - SMB_SID\"\n              },\n              \"id_value\": {\n\
        \                \"description\": \"id_value\",\n                \"type\"\
        : \"string\"\n              }\n            }\n          },\n          \"map_to_group\"\
        : {\n            \"description\": \"An identity object representing an NFS\
        \ group. If given, map_to_user should be an NFS user.\",\n            \"type\"\
        : \"object\",\n            \"properties\": {\n              \"id_type\": {\n\
        \                \"type\": \"string\",\n                \"enum\": [\n    \
        \              \"LOCAL_USER\",\n                  \"LOCAL_GROUP\",\n     \
        \             \"NFS_GID\",\n                  \"NFS_UID\",\n             \
        \     \"SMB_SID\",\n                  \"INTERNAL\",\n                  \"\
        QUMULO_OPERATOR\"\n                ],\n                \"description\": \"\
        id_type:\\n * `INTERNAL` - INTERNAL,\\n * `LOCAL_GROUP` - LOCAL_GROUP,\\n\
        \ * `LOCAL_USER` - LOCAL_USER,\\n * `NFS_GID` - NFS_GID,\\n * `NFS_UID` -\
        \ NFS_UID,\\n * `QUMULO_OPERATOR` - QUMULO_OPERATOR,\\n * `SMB_SID` - SMB_SID\"\
        \n              },\n              \"id_value\": {\n                \"description\"\
        : \"id_value\",\n                \"type\": \"string\"\n              }\n \
        \           }\n          }\n        }\n      }\n    },\n    \"fields_to_present_as_32_bit\"\
        : {\n      \"description\": \"Specify which NFS3 result values should be 32-bit\
        \ sanitized on this export. Has no effect on exports used over NFS4.\",\n\
        \      \"type\": \"array\",\n      \"items\": {\n        \"type\": \"string\"\
        ,\n        \"enum\": [\n          \"FILE_IDS\",\n          \"FILE_SIZES\"\
        ,\n          \"FS_SIZE\",\n          \"ALL\"\n        ],\n        \"description\"\
        : \"Specify which NFS3 result values should be 32-bit sanitized on this export.\
        \ Has no effect on exports used over NFS4.:\\n * `ALL` - Force all 64 bit\
        \ fields to fit in 32 bits.,\\n * `FILE_IDS` - Hash high file ids to 32 bits.,\\\
        n * `FILE_SIZES` - Clamp large file sizes to 4GiB to fit in 32 bits.,\\n *\
        \ `FS_SIZE` - Clamp available, used and total space reported for the FS to\
        \ 4GiB.\"\n      }\n    },\n    \"tenant_id\": {\n      \"description\": \"\
        The tenant ID of the tenant that the NFS export is a part of\",\n      \"\
        type\": \"number\"\n    }\n  }\n}"
    response_body:
      schema: "{\n  \"description\": \"api_nfs_export\",\n  \"type\": \"object\",\n\
        \  \"properties\": {\n    \"id\": {\n      \"description\": \"The unique ID\
        \ of the NFS export\",\n      \"type\": \"string\"\n    },\n    \"export_path\"\
        : {\n      \"description\": \"The NFS export path\",\n      \"type\": \"string\"\
        \n    },\n    \"fs_path\": {\n      \"description\": \"The filesystem path\
        \ of the exported directory\",\n      \"type\": \"string\"\n    },\n    \"\
        description\": {\n      \"description\": \"Description of this NFS export\"\
        ,\n      \"type\": \"string\"\n    },\n    \"restrictions\": {\n      \"type\"\
        : \"array\",\n      \"items\": {\n        \"description\": \"An array of NFS\
        \ host restrictions.\",\n        \"type\": \"object\",\n        \"properties\"\
        : {\n          \"host_restrictions\": {\n            \"type\": \"array\",\n\
        \            \"items\": {\n              \"description\": \"The list of hosts\
        \ allowed to connect\",\n              \"type\": \"string\"\n            }\n\
        \          },\n          \"require_privileged_port\": {\n            \"description\"\
        : \"Require that clients use a privileged port to use this export.\",\n  \
        \          \"type\": \"boolean\"\n          },\n          \"read_only\": {\n\
        \            \"description\": \"Sets the NFS export to read-only\",\n    \
        \        \"type\": \"boolean\"\n          },\n          \"user_mapping\":\
        \ {\n            \"type\": \"string\",\n            \"enum\": [\n        \
        \      \"NFS_MAP_NONE\",\n              \"NFS_MAP_ROOT\",\n              \"\
        NFS_MAP_ALL\"\n            ],\n            \"description\": \"NFS user mapping\
        \ (squashing) support:\\n * `NFS_MAP_ALL` - Map all users.,\\n * `NFS_MAP_NONE`\
        \ - Do not map users.,\\n * `NFS_MAP_ROOT` - Map root user (uid 0).\"\n  \
        \        },\n          \"map_to_user\": {\n            \"description\": \"\
        An identity object representing a local user or an NFS user to map (see /users).\
        \ If map_to_user is an NFS user, then map_to_group with an NFS gid must be\
        \ given.\",\n            \"type\": \"object\",\n            \"properties\"\
        : {\n              \"id_type\": {\n                \"type\": \"string\",\n\
        \                \"enum\": [\n                  \"LOCAL_USER\",\n        \
        \          \"LOCAL_GROUP\",\n                  \"NFS_GID\",\n            \
        \      \"NFS_UID\",\n                  \"SMB_SID\",\n                  \"\
        INTERNAL\",\n                  \"QUMULO_OPERATOR\"\n                ],\n \
        \               \"description\": \"id_type:\\n * `INTERNAL` - INTERNAL,\\\
        n * `LOCAL_GROUP` - LOCAL_GROUP,\\n * `LOCAL_USER` - LOCAL_USER,\\n * `NFS_GID`\
        \ - NFS_GID,\\n * `NFS_UID` - NFS_UID,\\n * `QUMULO_OPERATOR` - QUMULO_OPERATOR,\\\
        n * `SMB_SID` - SMB_SID\"\n              },\n              \"id_value\": {\n\
        \                \"description\": \"id_value\",\n                \"type\"\
        : \"string\"\n              }\n            }\n          },\n          \"map_to_group\"\
        : {\n            \"description\": \"An identity object representing an NFS\
        \ group. If given, map_to_user should be an NFS user.\",\n            \"type\"\
        : \"object\",\n            \"properties\": {\n              \"id_type\": {\n\
        \                \"type\": \"string\",\n                \"enum\": [\n    \
        \              \"LOCAL_USER\",\n                  \"LOCAL_GROUP\",\n     \
        \             \"NFS_GID\",\n                  \"NFS_UID\",\n             \
        \     \"SMB_SID\",\n                  \"INTERNAL\",\n                  \"\
        QUMULO_OPERATOR\"\n                ],\n                \"description\": \"\
        id_type:\\n * `INTERNAL` - INTERNAL,\\n * `LOCAL_GROUP` - LOCAL_GROUP,\\n\
        \ * `LOCAL_USER` - LOCAL_USER,\\n * `NFS_GID` - NFS_GID,\\n * `NFS_UID` -\
        \ NFS_UID,\\n * `QUMULO_OPERATOR` - QUMULO_OPERATOR,\\n * `SMB_SID` - SMB_SID\"\
        \n              },\n              \"id_value\": {\n                \"description\"\
        : \"id_value\",\n                \"type\": \"string\"\n              }\n \
        \           }\n          }\n        }\n      }\n    },\n    \"fields_to_present_as_32_bit\"\
        : {\n      \"description\": \"Specify which NFS3 result values should be 32-bit\
        \ sanitized on this export. Has no effect on exports used over NFS4.\",\n\
        \      \"type\": \"array\",\n      \"items\": {\n        \"type\": \"string\"\
        ,\n        \"enum\": [\n          \"FILE_IDS\",\n          \"FILE_SIZES\"\
        ,\n          \"FS_SIZE\",\n          \"ALL\"\n        ],\n        \"description\"\
        : \"Specify which NFS3 result values should be 32-bit sanitized on this export.\
        \ Has no effect on exports used over NFS4.:\\n * `ALL` - Force all 64 bit\
        \ fields to fit in 32 bits.,\\n * `FILE_IDS` - Hash high file ids to 32 bits.,\\\
        n * `FILE_SIZES` - Clamp large file sizes to 4GiB to fit in 32 bits.,\\n *\
        \ `FS_SIZE` - Clamp available, used and total space reported for the FS to\
        \ 4GiB.\"\n      }\n    },\n    \"tenant_id\": {\n      \"description\": \"\
        The tenant ID of the tenant that the NFS export is a part of\",\n      \"\
        type\": \"number\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: This method modifies individual attributes of a NFS export.
  put:
    parameters:
    - description: A unique identifier of the NFS export, either ID or export path
      name: ref
      required: true
    - description: Specifies whether the file system path can be created if it does
        not already exist.
      name: allow-fs-path-create
      required: false
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
      schema: "{\n  \"description\": \"api_nfs_export\",\n  \"type\": \"object\",\n\
        \  \"properties\": {\n    \"id\": {\n      \"description\": \"The unique ID\
        \ of the NFS export\",\n      \"type\": \"string\"\n    },\n    \"export_path\"\
        : {\n      \"description\": \"The NFS export path\",\n      \"type\": \"string\"\
        \n    },\n    \"fs_path\": {\n      \"description\": \"The filesystem path\
        \ of the exported directory\",\n      \"type\": \"string\"\n    },\n    \"\
        description\": {\n      \"description\": \"Description of this NFS export\"\
        ,\n      \"type\": \"string\"\n    },\n    \"restrictions\": {\n      \"type\"\
        : \"array\",\n      \"items\": {\n        \"description\": \"An array of NFS\
        \ host restrictions.\",\n        \"type\": \"object\",\n        \"properties\"\
        : {\n          \"host_restrictions\": {\n            \"type\": \"array\",\n\
        \            \"items\": {\n              \"description\": \"The list of hosts\
        \ allowed to connect\",\n              \"type\": \"string\"\n            }\n\
        \          },\n          \"require_privileged_port\": {\n            \"description\"\
        : \"Require that clients use a privileged port to use this export.\",\n  \
        \          \"type\": \"boolean\"\n          },\n          \"read_only\": {\n\
        \            \"description\": \"Sets the NFS export to read-only\",\n    \
        \        \"type\": \"boolean\"\n          },\n          \"user_mapping\":\
        \ {\n            \"type\": \"string\",\n            \"enum\": [\n        \
        \      \"NFS_MAP_NONE\",\n              \"NFS_MAP_ROOT\",\n              \"\
        NFS_MAP_ALL\"\n            ],\n            \"description\": \"NFS user mapping\
        \ (squashing) support:\\n * `NFS_MAP_ALL` - Map all users.,\\n * `NFS_MAP_NONE`\
        \ - Do not map users.,\\n * `NFS_MAP_ROOT` - Map root user (uid 0).\"\n  \
        \        },\n          \"map_to_user\": {\n            \"description\": \"\
        An identity object representing a local user or an NFS user to map (see /users).\
        \ If map_to_user is an NFS user, then map_to_group with an NFS gid must be\
        \ given.\",\n            \"type\": \"object\",\n            \"properties\"\
        : {\n              \"id_type\": {\n                \"type\": \"string\",\n\
        \                \"enum\": [\n                  \"LOCAL_USER\",\n        \
        \          \"LOCAL_GROUP\",\n                  \"NFS_GID\",\n            \
        \      \"NFS_UID\",\n                  \"SMB_SID\",\n                  \"\
        INTERNAL\",\n                  \"QUMULO_OPERATOR\"\n                ],\n \
        \               \"description\": \"id_type:\\n * `INTERNAL` - INTERNAL,\\\
        n * `LOCAL_GROUP` - LOCAL_GROUP,\\n * `LOCAL_USER` - LOCAL_USER,\\n * `NFS_GID`\
        \ - NFS_GID,\\n * `NFS_UID` - NFS_UID,\\n * `QUMULO_OPERATOR` - QUMULO_OPERATOR,\\\
        n * `SMB_SID` - SMB_SID\"\n              },\n              \"id_value\": {\n\
        \                \"description\": \"id_value\",\n                \"type\"\
        : \"string\"\n              }\n            }\n          },\n          \"map_to_group\"\
        : {\n            \"description\": \"An identity object representing an NFS\
        \ group. If given, map_to_user should be an NFS user.\",\n            \"type\"\
        : \"object\",\n            \"properties\": {\n              \"id_type\": {\n\
        \                \"type\": \"string\",\n                \"enum\": [\n    \
        \              \"LOCAL_USER\",\n                  \"LOCAL_GROUP\",\n     \
        \             \"NFS_GID\",\n                  \"NFS_UID\",\n             \
        \     \"SMB_SID\",\n                  \"INTERNAL\",\n                  \"\
        QUMULO_OPERATOR\"\n                ],\n                \"description\": \"\
        id_type:\\n * `INTERNAL` - INTERNAL,\\n * `LOCAL_GROUP` - LOCAL_GROUP,\\n\
        \ * `LOCAL_USER` - LOCAL_USER,\\n * `NFS_GID` - NFS_GID,\\n * `NFS_UID` -\
        \ NFS_UID,\\n * `QUMULO_OPERATOR` - QUMULO_OPERATOR,\\n * `SMB_SID` - SMB_SID\"\
        \n              },\n              \"id_value\": {\n                \"description\"\
        : \"id_value\",\n                \"type\": \"string\"\n              }\n \
        \           }\n          }\n        }\n      }\n    },\n    \"fields_to_present_as_32_bit\"\
        : {\n      \"description\": \"Specify which NFS3 result values should be 32-bit\
        \ sanitized on this export. Has no effect on exports used over NFS4.\",\n\
        \      \"type\": \"array\",\n      \"items\": {\n        \"type\": \"string\"\
        ,\n        \"enum\": [\n          \"FILE_IDS\",\n          \"FILE_SIZES\"\
        ,\n          \"FS_SIZE\",\n          \"ALL\"\n        ],\n        \"description\"\
        : \"Specify which NFS3 result values should be 32-bit sanitized on this export.\
        \ Has no effect on exports used over NFS4.:\\n * `ALL` - Force all 64 bit\
        \ fields to fit in 32 bits.,\\n * `FILE_IDS` - Hash high file ids to 32 bits.,\\\
        n * `FILE_SIZES` - Clamp large file sizes to 4GiB to fit in 32 bits.,\\n *\
        \ `FS_SIZE` - Clamp available, used and total space reported for the FS to\
        \ 4GiB.\"\n      }\n    },\n    \"tenant_id\": {\n      \"description\": \"\
        The tenant ID of the tenant that the NFS export is a part of\",\n      \"\
        type\": \"number\"\n    }\n  }\n}"
    response_body:
      schema: "{\n  \"description\": \"api_nfs_export\",\n  \"type\": \"object\",\n\
        \  \"properties\": {\n    \"id\": {\n      \"description\": \"The unique ID\
        \ of the NFS export\",\n      \"type\": \"string\"\n    },\n    \"export_path\"\
        : {\n      \"description\": \"The NFS export path\",\n      \"type\": \"string\"\
        \n    },\n    \"fs_path\": {\n      \"description\": \"The filesystem path\
        \ of the exported directory\",\n      \"type\": \"string\"\n    },\n    \"\
        description\": {\n      \"description\": \"Description of this NFS export\"\
        ,\n      \"type\": \"string\"\n    },\n    \"restrictions\": {\n      \"type\"\
        : \"array\",\n      \"items\": {\n        \"description\": \"An array of NFS\
        \ host restrictions.\",\n        \"type\": \"object\",\n        \"properties\"\
        : {\n          \"host_restrictions\": {\n            \"type\": \"array\",\n\
        \            \"items\": {\n              \"description\": \"The list of hosts\
        \ allowed to connect\",\n              \"type\": \"string\"\n            }\n\
        \          },\n          \"require_privileged_port\": {\n            \"description\"\
        : \"Require that clients use a privileged port to use this export.\",\n  \
        \          \"type\": \"boolean\"\n          },\n          \"read_only\": {\n\
        \            \"description\": \"Sets the NFS export to read-only\",\n    \
        \        \"type\": \"boolean\"\n          },\n          \"user_mapping\":\
        \ {\n            \"type\": \"string\",\n            \"enum\": [\n        \
        \      \"NFS_MAP_NONE\",\n              \"NFS_MAP_ROOT\",\n              \"\
        NFS_MAP_ALL\"\n            ],\n            \"description\": \"NFS user mapping\
        \ (squashing) support:\\n * `NFS_MAP_ALL` - Map all users.,\\n * `NFS_MAP_NONE`\
        \ - Do not map users.,\\n * `NFS_MAP_ROOT` - Map root user (uid 0).\"\n  \
        \        },\n          \"map_to_user\": {\n            \"description\": \"\
        An identity object representing a local user or an NFS user to map (see /users).\
        \ If map_to_user is an NFS user, then map_to_group with an NFS gid must be\
        \ given.\",\n            \"type\": \"object\",\n            \"properties\"\
        : {\n              \"id_type\": {\n                \"type\": \"string\",\n\
        \                \"enum\": [\n                  \"LOCAL_USER\",\n        \
        \          \"LOCAL_GROUP\",\n                  \"NFS_GID\",\n            \
        \      \"NFS_UID\",\n                  \"SMB_SID\",\n                  \"\
        INTERNAL\",\n                  \"QUMULO_OPERATOR\"\n                ],\n \
        \               \"description\": \"id_type:\\n * `INTERNAL` - INTERNAL,\\\
        n * `LOCAL_GROUP` - LOCAL_GROUP,\\n * `LOCAL_USER` - LOCAL_USER,\\n * `NFS_GID`\
        \ - NFS_GID,\\n * `NFS_UID` - NFS_UID,\\n * `QUMULO_OPERATOR` - QUMULO_OPERATOR,\\\
        n * `SMB_SID` - SMB_SID\"\n              },\n              \"id_value\": {\n\
        \                \"description\": \"id_value\",\n                \"type\"\
        : \"string\"\n              }\n            }\n          },\n          \"map_to_group\"\
        : {\n            \"description\": \"An identity object representing an NFS\
        \ group. If given, map_to_user should be an NFS user.\",\n            \"type\"\
        : \"object\",\n            \"properties\": {\n              \"id_type\": {\n\
        \                \"type\": \"string\",\n                \"enum\": [\n    \
        \              \"LOCAL_USER\",\n                  \"LOCAL_GROUP\",\n     \
        \             \"NFS_GID\",\n                  \"NFS_UID\",\n             \
        \     \"SMB_SID\",\n                  \"INTERNAL\",\n                  \"\
        QUMULO_OPERATOR\"\n                ],\n                \"description\": \"\
        id_type:\\n * `INTERNAL` - INTERNAL,\\n * `LOCAL_GROUP` - LOCAL_GROUP,\\n\
        \ * `LOCAL_USER` - LOCAL_USER,\\n * `NFS_GID` - NFS_GID,\\n * `NFS_UID` -\
        \ NFS_UID,\\n * `QUMULO_OPERATOR` - QUMULO_OPERATOR,\\n * `SMB_SID` - SMB_SID\"\
        \n              },\n              \"id_value\": {\n                \"description\"\
        : \"id_value\",\n                \"type\": \"string\"\n              }\n \
        \           }\n          }\n        }\n      }\n    },\n    \"fields_to_present_as_32_bit\"\
        : {\n      \"description\": \"Specify which NFS3 result values should be 32-bit\
        \ sanitized on this export. Has no effect on exports used over NFS4.\",\n\
        \      \"type\": \"array\",\n      \"items\": {\n        \"type\": \"string\"\
        ,\n        \"enum\": [\n          \"FILE_IDS\",\n          \"FILE_SIZES\"\
        ,\n          \"FS_SIZE\",\n          \"ALL\"\n        ],\n        \"description\"\
        : \"Specify which NFS3 result values should be 32-bit sanitized on this export.\
        \ Has no effect on exports used over NFS4.:\\n * `ALL` - Force all 64 bit\
        \ fields to fit in 32 bits.,\\n * `FILE_IDS` - Hash high file ids to 32 bits.,\\\
        n * `FILE_SIZES` - Clamp large file sizes to 4GiB to fit in 32 bits.,\\n *\
        \ `FS_SIZE` - Clamp available, used and total space reported for the FS to\
        \ 4GiB.\"\n      }\n    },\n    \"tenant_id\": {\n      \"description\": \"\
        The tenant ID of the tenant that the NFS export is a part of\",\n      \"\
        type\": \"number\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: This method sets all attributes of a NFS export.
rest_endpoint: /v2/nfs/exports/{ref}
api_version: v2
permalink: /rest-api-guide/nfs/v2_exports_ref.html
sidebar: rest_api_guide_sidebar
---
