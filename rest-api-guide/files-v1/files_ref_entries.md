---
category: /Files V1
methods:
  post:
    summary: Create a new file, link, or directory. In addition, this method can be
      use to rename an existing file. The return value is an attribute structure for
      the new file; refer to the 'Set Attributes' method for field descriptions.
    parameters:
    - name: ref
      description: The file ID or the absolute path to the file system object. File
        IDs can be found in the id field of responses of APIs that return file attributes.
        You must URL-encode the paths. The APIs & Tools page in the Qumulo Core Web
        UI URL-encodes the paths.
      required: true
    response_body:
      schema: "{\n  \"description\": \"api_files_attributes\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"path\": {\n      \"description\": \"Filesystem\
        \ path of the object\",\n      \"type\": \"string\"\n    },\n    \"name\"\
        : {\n      \"description\": \"Name of this file\",\n      \"type\": \"string\"\
        \n    },\n    \"num_links\": {\n      \"description\": \"How many directory\
        \ entries are associated with this file\",\n      \"type\": \"number\"\n \
        \   },\n    \"type\": {\n      \"type\": \"string\",\n      \"enum\": [\n\
        \        \"FS_FILE_TYPE_FILE\",\n        \"FS_FILE_TYPE_DIRECTORY\",\n   \
        \     \"FS_FILE_TYPE_SYMLINK\",\n        \"FS_FILE_TYPE_UNIX_PIPE\",\n   \
        \     \"FS_FILE_TYPE_UNIX_CHARACTER_DEVICE\",\n        \"FS_FILE_TYPE_UNIX_BLOCK_DEVICE\"\
        ,\n        \"FS_FILE_TYPE_UNIX_SOCKET\"\n      ],\n      \"description\":\
        \ \"Resource type:\\n * `FS_FILE_TYPE_DIRECTORY` - FS_FILE_TYPE_DIRECTORY,\\\
        n * `FS_FILE_TYPE_FILE` - FS_FILE_TYPE_FILE,\\n * `FS_FILE_TYPE_SYMLINK` -\
        \ FS_FILE_TYPE_SYMLINK,\\n * `FS_FILE_TYPE_UNIX_BLOCK_DEVICE` - FS_FILE_TYPE_UNIX_BLOCK_DEVICE,\\\
        n * `FS_FILE_TYPE_UNIX_CHARACTER_DEVICE` - FS_FILE_TYPE_UNIX_CHARACTER_DEVICE,\\\
        n * `FS_FILE_TYPE_UNIX_PIPE` - FS_FILE_TYPE_UNIX_PIPE,\\n * `FS_FILE_TYPE_UNIX_SOCKET`\
        \ - FS_FILE_TYPE_UNIX_SOCKET\"\n    },\n    \"major_minor_numbers\": {\n \
        \     \"description\": \"The major and minor numbers for UNIX device files\"\
        ,\n      \"type\": \"object\",\n      \"properties\": {\n        \"major\"\
        : {\n          \"description\": \"major\",\n          \"type\": \"number\"\
        \n        },\n        \"minor\": {\n          \"description\": \"minor\",\n\
        \          \"type\": \"number\"\n        }\n      }\n    },\n    \"symlink_target_type\"\
        : {\n      \"type\": \"string\",\n      \"enum\": [\n        \"FS_FILE_TYPE_UNKNOWN\"\
        ,\n        \"FS_FILE_TYPE_FILE\",\n        \"FS_FILE_TYPE_DIRECTORY\"\n  \
        \    ],\n      \"description\": \"The type of the target file if this file\
        \ is a symlink:\\n * `FS_FILE_TYPE_DIRECTORY` - API_SYMLINK_TARGET_DIRECTORY,\\\
        n * `FS_FILE_TYPE_FILE` - API_SYMLINK_TARGET_FILE,\\n * `FS_FILE_TYPE_UNKNOWN`\
        \ - API_SYMLINK_TARGET_UNKNOWN\"\n    },\n    \"file_number\": {\n      \"\
        description\": \"Unique ID of this file\",\n      \"type\": \"string\"\n \
        \   },\n    \"id\": {\n      \"description\": \"Unique ID of this file\",\n\
        \      \"type\": \"string\"\n    },\n    \"mode\": {\n      \"description\"\
        : \"POSIX-style file mode (octal)\",\n      \"type\": \"string\"\n    },\n\
        \    \"owner\": {\n      \"description\": \"File owner\",\n      \"type\"\
        : \"string\"\n    },\n    \"owner_details\": {\n      \"description\": \"\
        File owner details\",\n      \"type\": \"object\",\n      \"properties\":\
        \ {\n        \"id_type\": {\n          \"type\": \"string\",\n          \"\
        enum\": [\n            \"LOCAL_USER\",\n            \"LOCAL_GROUP\",\n   \
        \         \"NFS_GID\",\n            \"NFS_UID\",\n            \"SMB_SID\"\
        ,\n            \"INTERNAL\",\n            \"QUMULO_OPERATOR\",\n         \
        \   \"QUMULO_SUPPORT\"\n          ],\n          \"description\": \"id_type:\\\
        n * `INTERNAL` - INTERNAL,\\n * `LOCAL_GROUP` - LOCAL_GROUP,\\n * `LOCAL_USER`\
        \ - LOCAL_USER,\\n * `NFS_GID` - NFS_GID,\\n * `NFS_UID` - NFS_UID,\\n * `QUMULO_OPERATOR`\
        \ - QUMULO_OPERATOR,\\n * `QUMULO_SUPPORT` - QUMULO_SUPPORT,\\n * `SMB_SID`\
        \ - SMB_SID\"\n        },\n        \"id_value\": {\n          \"description\"\
        : \"id_value\",\n          \"type\": \"string\"\n        }\n      }\n    },\n\
        \    \"group\": {\n      \"description\": \"File group\",\n      \"type\"\
        : \"string\"\n    },\n    \"group_details\": {\n      \"description\": \"\
        File group details\",\n      \"type\": \"object\",\n      \"properties\":\
        \ {\n        \"id_type\": {\n          \"type\": \"string\",\n          \"\
        enum\": [\n            \"LOCAL_USER\",\n            \"LOCAL_GROUP\",\n   \
        \         \"NFS_GID\",\n            \"NFS_UID\",\n            \"SMB_SID\"\
        ,\n            \"INTERNAL\",\n            \"QUMULO_OPERATOR\",\n         \
        \   \"QUMULO_SUPPORT\"\n          ],\n          \"description\": \"id_type:\\\
        n * `INTERNAL` - INTERNAL,\\n * `LOCAL_GROUP` - LOCAL_GROUP,\\n * `LOCAL_USER`\
        \ - LOCAL_USER,\\n * `NFS_GID` - NFS_GID,\\n * `NFS_UID` - NFS_UID,\\n * `QUMULO_OPERATOR`\
        \ - QUMULO_OPERATOR,\\n * `QUMULO_SUPPORT` - QUMULO_SUPPORT,\\n * `SMB_SID`\
        \ - SMB_SID\"\n        },\n        \"id_value\": {\n          \"description\"\
        : \"id_value\",\n          \"type\": \"string\"\n        }\n      }\n    },\n\
        \    \"blocks\": {\n      \"description\": \"Number of blocks used by the\
        \ file on this cluster\",\n      \"type\": \"string\"\n    },\n    \"datablocks\"\
        : {\n      \"description\": \"Number of data blocks used by the file on this\
        \ cluster\",\n      \"type\": \"string\"\n    },\n    \"metablocks\": {\n\
        \      \"description\": \"Number of meta blocks used by the file on this cluster\"\
        ,\n      \"type\": \"string\"\n    },\n    \"logical_datablocks\": {\n   \
        \   \"description\": \"Number of data blocks used by the file\",\n      \"\
        type\": \"string\"\n    },\n    \"size\": {\n      \"description\": \"File\
        \ size in bytes\",\n      \"type\": \"string\"\n    },\n    \"access_time\"\
        : {\n      \"description\": \"Last time content was read, RFC 3339 format\"\
        ,\n      \"type\": \"string\"\n    },\n    \"modification_time\": {\n    \
        \  \"description\": \"Last time content was modified, RFC 3339 format\",\n\
        \      \"type\": \"string\"\n    },\n    \"change_time\": {\n      \"description\"\
        : \"Last time content or attributes were modified, RFC 3339 format\",\n  \
        \    \"type\": \"string\"\n    },\n    \"creation_time\": {\n      \"description\"\
        : \"File creation time, RFC 3339 format\",\n      \"type\": \"string\"\n \
        \   },\n    \"child_count\": {\n      \"description\": \"Count of children\
        \ (valid for directories)\",\n      \"type\": \"number\"\n    },\n    \"extended_attributes\"\
        : {\n      \"description\": \"SMB extended file attributes\",\n      \"type\"\
        : \"object\",\n      \"properties\": {\n        \"read_only\": {\n       \
        \   \"description\": \"read_only\",\n          \"type\": \"boolean\"\n   \
        \     },\n        \"hidden\": {\n          \"description\": \"hidden\",\n\
        \          \"type\": \"boolean\"\n        },\n        \"system\": {\n    \
        \      \"description\": \"system\",\n          \"type\": \"boolean\"\n   \
        \     },\n        \"archive\": {\n          \"description\": \"archive\",\n\
        \          \"type\": \"boolean\"\n        },\n        \"temporary\": {\n \
        \         \"description\": \"temporary\",\n          \"type\": \"boolean\"\
        \n        },\n        \"compressed\": {\n          \"description\": \"compressed\"\
        ,\n          \"type\": \"boolean\"\n        },\n        \"not_content_indexed\"\
        : {\n          \"description\": \"not_content_indexed\",\n          \"type\"\
        : \"boolean\"\n        },\n        \"sparse_file\": {\n          \"description\"\
        : \"sparse_file\",\n          \"type\": \"boolean\"\n        },\n        \"\
        offline\": {\n          \"description\": \"offline\",\n          \"type\"\
        : \"boolean\"\n        }\n      }\n    },\n    \"directory_entry_hash_policy\"\
        : {\n      \"type\": \"string\",\n      \"enum\": [\n        \"FS_DIRECTORY_HASH_VERSION_LOWER\"\
        ,\n        \"FS_DIRECTORY_HASH_VERSION_FOLDED\"\n      ],\n      \"description\"\
        : \"Hash policy for directory entries:\\n * `FS_DIRECTORY_HASH_VERSION_FOLDED`\
        \ - FS_DIRECTORY_HASH_VERSION_FOLDED,\\n * `FS_DIRECTORY_HASH_VERSION_LOWER`\
        \ - FS_DIRECTORY_HASH_VERSION_LOWER\"\n    },\n    \"data_revision\": {\n\
        \      \"description\": \"The revision for changes to the underlying file\
        \ data.\",\n      \"type\": \"string\"\n    },\n    \"user_metadata_revision\"\
        : {\n      \"description\": \"The revision for changes to the user defined\
        \ metadata of the file.\",\n      \"type\": \"string\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
    request_body:
      schema: "{\n  \"description\": \"api_files_create_entry\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"name\": {\n      \"description\": \"Name of\
        \ file to create\",\n      \"type\": \"string\"\n    },\n    \"action\": {\n\
        \      \"type\": \"string\",\n      \"enum\": [\n        \"CREATE_FILE\",\n\
        \        \"CREATE_DIRECTORY\",\n        \"CREATE_SYMLINK\",\n        \"CREATE_LINK\"\
        ,\n        \"RENAME\",\n        \"CREATE_UNIX_FILE\"\n      ],\n      \"description\"\
        : \"Operation to perform:\\n * `CREATE_DIRECTORY` - API_FILES_CREATE_DIRECTORY,\\\
        n * `CREATE_FILE` - API_FILES_CREATE_FILE,\\n * `CREATE_LINK` - API_FILES_CREATE_LINK,\\\
        n * `CREATE_SYMLINK` - API_FILES_CREATE_SYMLINK,\\n * `CREATE_UNIX_FILE` -\
        \ API_FILES_CREATE_UNIX_FILE,\\n * `RENAME` - API_FILES_RENAME\"\n    },\n\
        \    \"old_path\": {\n      \"description\": \"Rename source or link target\"\
        ,\n      \"type\": \"string\"\n    },\n    \"clobber\": {\n      \"description\"\
        : \"When action is RENAME, setting this to true will clobber the destination\
        \ if it exists.\",\n      \"type\": \"boolean\"\n    },\n    \"symlink_target_type\"\
        : {\n      \"type\": \"string\",\n      \"enum\": [\n        \"FS_FILE_TYPE_UNKNOWN\"\
        ,\n        \"FS_FILE_TYPE_FILE\",\n        \"FS_FILE_TYPE_DIRECTORY\"\n  \
        \    ],\n      \"description\": \"The file type of the target to which the\
        \ symbolic link points. If you don't specify the file type, or if it is FS_FILE_TYPE_UNKNOWN,\
        \ the effect is the same as running the 'ln -s' command on a Unix NFS client.\
        \ If the file type is FS_FILE_TYPE_FILE or FS_FILE_TYPE_DIRECTORY, the effect\
        \ is the same as running the 'mklink' or 'mklink /D' command on a Windows\
        \ SMB client.:\\n * `FS_FILE_TYPE_DIRECTORY` - API_SYMLINK_TARGET_DIRECTORY,\\\
        n * `FS_FILE_TYPE_FILE` - API_SYMLINK_TARGET_FILE,\\n * `FS_FILE_TYPE_UNKNOWN`\
        \ - API_SYMLINK_TARGET_UNKNOWN\"\n    },\n    \"unix_file_type\": {\n    \
        \  \"type\": \"string\",\n      \"enum\": [\n        \"FS_FILE_TYPE_FILE\"\
        ,\n        \"FS_FILE_TYPE_DIRECTORY\",\n        \"FS_FILE_TYPE_SYMLINK\",\n\
        \        \"FS_FILE_TYPE_UNIX_PIPE\",\n        \"FS_FILE_TYPE_UNIX_CHARACTER_DEVICE\"\
        ,\n        \"FS_FILE_TYPE_UNIX_BLOCK_DEVICE\",\n        \"FS_FILE_TYPE_UNIX_SOCKET\"\
        \n      ],\n      \"description\": \"Required when the action is CREATE_UNIX_FILE.\
        \ You are given the choice of FS_FILE_TYPE_UNIX_BLOCK_DEVICE, FS_FILE_TYPE_UNIX_CHARACTER_DEVICE,\
        \ FS_FILE_TYPE_UNIX_PIPE or FS_FILE_TYPE_UNIX_SOCKET:\\n * `FS_FILE_TYPE_DIRECTORY`\
        \ - FS_FILE_TYPE_DIRECTORY,\\n * `FS_FILE_TYPE_FILE` - FS_FILE_TYPE_FILE,\\\
        n * `FS_FILE_TYPE_SYMLINK` - FS_FILE_TYPE_SYMLINK,\\n * `FS_FILE_TYPE_UNIX_BLOCK_DEVICE`\
        \ - FS_FILE_TYPE_UNIX_BLOCK_DEVICE,\\n * `FS_FILE_TYPE_UNIX_CHARACTER_DEVICE`\
        \ - FS_FILE_TYPE_UNIX_CHARACTER_DEVICE,\\n * `FS_FILE_TYPE_UNIX_PIPE` - FS_FILE_TYPE_UNIX_PIPE,\\\
        n * `FS_FILE_TYPE_UNIX_SOCKET` - FS_FILE_TYPE_UNIX_SOCKET\"\n    },\n    \"\
        major_minor_numbers\": {\n      \"description\": \"When creating a UNIX device\
        \ file, these are the major and minor numbers\",\n      \"type\": \"object\"\
        ,\n      \"properties\": {\n        \"major\": {\n          \"description\"\
        : \"major\",\n          \"type\": \"number\"\n        },\n        \"minor\"\
        : {\n          \"description\": \"minor\",\n          \"type\": \"number\"\
        \n        }\n      }\n    }\n  }\n}"
  get:
    summary: Get directory entries. Path or ID must reference a directory.
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
    - name: smb-pattern
      description: Return only entries matching the give SMB pattern
      required: false
    - name: skip-atime-update
      description: If true, suppress the update of the directory's access time for
        this read.
      required: false
    - name: include-acls
      description: 'If set to true, include the ACL for each entry in the response.
        To retrieve the ACL for files[i], look up file_acls.acl_pool[file_acls.acl_indices[i]].
        When the caller doesn''t have the READ_ACL permission for a file, the entry
        in acl.acl_indices is null. False by default. '
      required: false
    - name: after
      description: Return entries after the given key (keys are returned in the paging
        object)
      required: false
    - name: limit
      description: Return no more than this many entries; the system may choose a
        smaller limit.
      required: false
    response_body:
      schema: "{\n  \"description\": \"api_files_directory_entries\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"path\": {\n      \"description\"\
        : \"path\",\n      \"type\": \"string\"\n    },\n    \"id\": {\n      \"description\"\
        : \"Unique ID of this directory\",\n      \"type\": \"string\"\n    },\n \
        \   \"child_count\": {\n      \"description\": \"child_count\",\n      \"\
        type\": \"number\"\n    },\n    \"files\": {\n      \"type\": \"array\",\n\
        \      \"items\": {\n        \"description\": \"files\",\n        \"type\"\
        : \"object\",\n        \"properties\": {\n          \"path\": {\n        \
        \    \"description\": \"Filesystem path of the object\",\n            \"type\"\
        : \"string\"\n          },\n          \"name\": {\n            \"description\"\
        : \"Name of this file\",\n            \"type\": \"string\"\n          },\n\
        \          \"num_links\": {\n            \"description\": \"How many directory\
        \ entries are associated with this file\",\n            \"type\": \"number\"\
        \n          },\n          \"type\": {\n            \"type\": \"string\",\n\
        \            \"enum\": [\n              \"FS_FILE_TYPE_FILE\",\n         \
        \     \"FS_FILE_TYPE_DIRECTORY\",\n              \"FS_FILE_TYPE_SYMLINK\"\
        ,\n              \"FS_FILE_TYPE_UNIX_PIPE\",\n              \"FS_FILE_TYPE_UNIX_CHARACTER_DEVICE\"\
        ,\n              \"FS_FILE_TYPE_UNIX_BLOCK_DEVICE\",\n              \"FS_FILE_TYPE_UNIX_SOCKET\"\
        \n            ],\n            \"description\": \"Resource type:\\n * `FS_FILE_TYPE_DIRECTORY`\
        \ - FS_FILE_TYPE_DIRECTORY,\\n * `FS_FILE_TYPE_FILE` - FS_FILE_TYPE_FILE,\\\
        n * `FS_FILE_TYPE_SYMLINK` - FS_FILE_TYPE_SYMLINK,\\n * `FS_FILE_TYPE_UNIX_BLOCK_DEVICE`\
        \ - FS_FILE_TYPE_UNIX_BLOCK_DEVICE,\\n * `FS_FILE_TYPE_UNIX_CHARACTER_DEVICE`\
        \ - FS_FILE_TYPE_UNIX_CHARACTER_DEVICE,\\n * `FS_FILE_TYPE_UNIX_PIPE` - FS_FILE_TYPE_UNIX_PIPE,\\\
        n * `FS_FILE_TYPE_UNIX_SOCKET` - FS_FILE_TYPE_UNIX_SOCKET\"\n          },\n\
        \          \"major_minor_numbers\": {\n            \"description\": \"The\
        \ major and minor numbers for UNIX device files\",\n            \"type\":\
        \ \"object\",\n            \"properties\": {\n              \"major\": {\n\
        \                \"description\": \"major\",\n                \"type\": \"\
        number\"\n              },\n              \"minor\": {\n                \"\
        description\": \"minor\",\n                \"type\": \"number\"\n        \
        \      }\n            }\n          },\n          \"symlink_target_type\":\
        \ {\n            \"type\": \"string\",\n            \"enum\": [\n        \
        \      \"FS_FILE_TYPE_UNKNOWN\",\n              \"FS_FILE_TYPE_FILE\",\n \
        \             \"FS_FILE_TYPE_DIRECTORY\"\n            ],\n            \"description\"\
        : \"The type of the target file if this file is a symlink:\\n * `FS_FILE_TYPE_DIRECTORY`\
        \ - API_SYMLINK_TARGET_DIRECTORY,\\n * `FS_FILE_TYPE_FILE` - API_SYMLINK_TARGET_FILE,\\\
        n * `FS_FILE_TYPE_UNKNOWN` - API_SYMLINK_TARGET_UNKNOWN\"\n          },\n\
        \          \"file_number\": {\n            \"description\": \"Unique ID of\
        \ this file\",\n            \"type\": \"string\"\n          },\n         \
        \ \"id\": {\n            \"description\": \"Unique ID of this file\",\n  \
        \          \"type\": \"string\"\n          },\n          \"mode\": {\n   \
        \         \"description\": \"POSIX-style file mode (octal)\",\n          \
        \  \"type\": \"string\"\n          },\n          \"owner\": {\n          \
        \  \"description\": \"File owner\",\n            \"type\": \"string\"\n  \
        \        },\n          \"owner_details\": {\n            \"description\":\
        \ \"File owner details\",\n            \"type\": \"object\",\n           \
        \ \"properties\": {\n              \"id_type\": {\n                \"type\"\
        : \"string\",\n                \"enum\": [\n                  \"LOCAL_USER\"\
        ,\n                  \"LOCAL_GROUP\",\n                  \"NFS_GID\",\n  \
        \                \"NFS_UID\",\n                  \"SMB_SID\",\n          \
        \        \"INTERNAL\",\n                  \"QUMULO_OPERATOR\",\n         \
        \         \"QUMULO_SUPPORT\"\n                ],\n                \"description\"\
        : \"id_type:\\n * `INTERNAL` - INTERNAL,\\n * `LOCAL_GROUP` - LOCAL_GROUP,\\\
        n * `LOCAL_USER` - LOCAL_USER,\\n * `NFS_GID` - NFS_GID,\\n * `NFS_UID` -\
        \ NFS_UID,\\n * `QUMULO_OPERATOR` - QUMULO_OPERATOR,\\n * `QUMULO_SUPPORT`\
        \ - QUMULO_SUPPORT,\\n * `SMB_SID` - SMB_SID\"\n              },\n       \
        \       \"id_value\": {\n                \"description\": \"id_value\",\n\
        \                \"type\": \"string\"\n              }\n            }\n  \
        \        },\n          \"group\": {\n            \"description\": \"File group\"\
        ,\n            \"type\": \"string\"\n          },\n          \"group_details\"\
        : {\n            \"description\": \"File group details\",\n            \"\
        type\": \"object\",\n            \"properties\": {\n              \"id_type\"\
        : {\n                \"type\": \"string\",\n                \"enum\": [\n\
        \                  \"LOCAL_USER\",\n                  \"LOCAL_GROUP\",\n \
        \                 \"NFS_GID\",\n                  \"NFS_UID\",\n         \
        \         \"SMB_SID\",\n                  \"INTERNAL\",\n                \
        \  \"QUMULO_OPERATOR\",\n                  \"QUMULO_SUPPORT\"\n          \
        \      ],\n                \"description\": \"id_type:\\n * `INTERNAL` - INTERNAL,\\\
        n * `LOCAL_GROUP` - LOCAL_GROUP,\\n * `LOCAL_USER` - LOCAL_USER,\\n * `NFS_GID`\
        \ - NFS_GID,\\n * `NFS_UID` - NFS_UID,\\n * `QUMULO_OPERATOR` - QUMULO_OPERATOR,\\\
        n * `QUMULO_SUPPORT` - QUMULO_SUPPORT,\\n * `SMB_SID` - SMB_SID\"\n      \
        \        },\n              \"id_value\": {\n                \"description\"\
        : \"id_value\",\n                \"type\": \"string\"\n              }\n \
        \           }\n          },\n          \"blocks\": {\n            \"description\"\
        : \"Number of blocks used by the file on this cluster\",\n            \"type\"\
        : \"string\"\n          },\n          \"datablocks\": {\n            \"description\"\
        : \"Number of data blocks used by the file on this cluster\",\n          \
        \  \"type\": \"string\"\n          },\n          \"metablocks\": {\n     \
        \       \"description\": \"Number of meta blocks used by the file on this\
        \ cluster\",\n            \"type\": \"string\"\n          },\n          \"\
        logical_datablocks\": {\n            \"description\": \"Number of data blocks\
        \ used by the file\",\n            \"type\": \"string\"\n          },\n  \
        \        \"size\": {\n            \"description\": \"File size in bytes\"\
        ,\n            \"type\": \"string\"\n          },\n          \"access_time\"\
        : {\n            \"description\": \"Last time content was read, RFC 3339 format\"\
        ,\n            \"type\": \"string\"\n          },\n          \"modification_time\"\
        : {\n            \"description\": \"Last time content was modified, RFC 3339\
        \ format\",\n            \"type\": \"string\"\n          },\n          \"\
        change_time\": {\n            \"description\": \"Last time content or attributes\
        \ were modified, RFC 3339 format\",\n            \"type\": \"string\"\n  \
        \        },\n          \"creation_time\": {\n            \"description\":\
        \ \"File creation time, RFC 3339 format\",\n            \"type\": \"string\"\
        \n          },\n          \"child_count\": {\n            \"description\"\
        : \"Count of children (valid for directories)\",\n            \"type\": \"\
        number\"\n          },\n          \"extended_attributes\": {\n           \
        \ \"description\": \"SMB extended file attributes\",\n            \"type\"\
        : \"object\",\n            \"properties\": {\n              \"read_only\"\
        : {\n                \"description\": \"read_only\",\n                \"type\"\
        : \"boolean\"\n              },\n              \"hidden\": {\n           \
        \     \"description\": \"hidden\",\n                \"type\": \"boolean\"\n\
        \              },\n              \"system\": {\n                \"description\"\
        : \"system\",\n                \"type\": \"boolean\"\n              },\n \
        \             \"archive\": {\n                \"description\": \"archive\"\
        ,\n                \"type\": \"boolean\"\n              },\n             \
        \ \"temporary\": {\n                \"description\": \"temporary\",\n    \
        \            \"type\": \"boolean\"\n              },\n              \"compressed\"\
        : {\n                \"description\": \"compressed\",\n                \"\
        type\": \"boolean\"\n              },\n              \"not_content_indexed\"\
        : {\n                \"description\": \"not_content_indexed\",\n         \
        \       \"type\": \"boolean\"\n              },\n              \"sparse_file\"\
        : {\n                \"description\": \"sparse_file\",\n                \"\
        type\": \"boolean\"\n              },\n              \"offline\": {\n    \
        \            \"description\": \"offline\",\n                \"type\": \"boolean\"\
        \n              }\n            }\n          },\n          \"directory_entry_hash_policy\"\
        : {\n            \"type\": \"string\",\n            \"enum\": [\n        \
        \      \"FS_DIRECTORY_HASH_VERSION_LOWER\",\n              \"FS_DIRECTORY_HASH_VERSION_FOLDED\"\
        \n            ],\n            \"description\": \"Hash policy for directory\
        \ entries:\\n * `FS_DIRECTORY_HASH_VERSION_FOLDED` - FS_DIRECTORY_HASH_VERSION_FOLDED,\\\
        n * `FS_DIRECTORY_HASH_VERSION_LOWER` - FS_DIRECTORY_HASH_VERSION_LOWER\"\n\
        \          },\n          \"data_revision\": {\n            \"description\"\
        : \"The revision for changes to the underlying file data.\",\n           \
        \ \"type\": \"string\"\n          },\n          \"user_metadata_revision\"\
        : {\n            \"description\": \"The revision for changes to the user defined\
        \ metadata of the file.\",\n            \"type\": \"string\"\n          }\n\
        \        }\n      }\n    },\n    \"file_acls\": {\n      \"description\":\
        \ \"Provides the ACL for each file. When include_acls is not requested, file_acls\
        \ is null.\",\n      \"type\": \"object\",\n      \"properties\": {\n    \
        \    \"acl_pool\": {\n          \"type\": \"array\",\n          \"items\"\
        : {\n            \"description\": \"The ACL pool which acl_indices references.\
        \ To retrieve the ACL for files[i] look up acl_pool[acl_indices[i]].\",\n\
        \            \"type\": \"object\",\n            \"properties\": {\n      \
        \        \"control\": {\n                \"type\": \"array\",\n          \
        \      \"items\": {\n                  \"type\": \"string\",\n           \
        \       \"enum\": [\n                    \"PRESENT\",\n                  \
        \  \"DEFAULTED\",\n                    \"TRUSTED\",\n                    \"\
        AUTO_INHERIT\",\n                    \"PROTECTED\"\n                  ],\n\
        \                  \"description\": \"control:\\n * `AUTO_INHERIT` - Set whether\
        \ the ACL was created through inheritance,\\n * `DEFAULTED` - Sets whether\
        \ the ACL was established by default means,\\n * `PRESENT` - Set when ACL\
        \ is present on the object,\\n * `PROTECTED` - Protects ACL from inherit operations,\\\
        n * `TRUSTED` - Set when ACL is provided by a trusted source\"\n         \
        \       }\n              },\n              \"posix_special_permissions\":\
        \ {\n                \"type\": \"array\",\n                \"items\": {\n\
        \                  \"type\": \"string\",\n                  \"enum\": [\n\
        \                    \"STICKY_BIT\",\n                    \"SET_GID\",\n \
        \                   \"SET_UID\"\n                  ],\n                  \"\
        description\": \"posix_special_permissions:\\n * `SET_GID` - SET_GID,\\n *\
        \ `SET_UID` - SET_UID,\\n * `STICKY_BIT` - STICKY_BIT\"\n                }\n\
        \              },\n              \"aces\": {\n                \"type\": \"\
        array\",\n                \"items\": {\n                  \"description\"\
        : \"aces\",\n                  \"type\": \"object\",\n                  \"\
        properties\": {\n                    \"type\": {\n                      \"\
        type\": \"string\",\n                      \"enum\": [\n                 \
        \       \"ALLOWED\",\n                        \"DENIED\"\n               \
        \       ],\n                      \"description\": \"Type of this ACL entry:\\\
        n * `ALLOWED` - An ACL entry that grants rights,\\n * `DENIED` - An ACL entry\
        \ that denies rights\"\n                    },\n                    \"flags\"\
        : {\n                      \"type\": \"array\",\n                      \"\
        items\": {\n                        \"type\": \"string\",\n              \
        \          \"enum\": [\n                          \"OBJECT_INHERIT\",\n  \
        \                        \"CONTAINER_INHERIT\",\n                        \
        \  \"NO_PROPAGATE_INHERIT\",\n                          \"INHERIT_ONLY\",\n\
        \                          \"INHERITED\"\n                        ],\n   \
        \                     \"description\": \"ACE flags for this ACL entry:\\n\
        \ * `CONTAINER_INHERIT` - Children that are containers inherit as effective\
        \ ACE,\\n * `INHERITED` - Indicates the ACE was inherited,\\n * `INHERIT_ONLY`\
        \ - Indicates an inherit-only ACE that doesn't control access to the attached\
        \ object,\\n * `NO_PROPAGATE_INHERIT` - Prevent subsequent children from inheriting\
        \ ACE,\\n * `OBJECT_INHERIT` - Non-container children inherit as effective\
        \ ACE. Container objects inherit as inherit-only ACE\"\n                 \
        \     }\n                    },\n                    \"trustee\": {\n    \
        \                  \"description\": \"Trustee for this ACL entry\",\n    \
        \                  \"type\": \"object\",\n                      \"properties\"\
        : {\n                        \"domain\": {\n                          \"type\"\
        : \"string\",\n                          \"enum\": [\n                   \
        \         \"LOCAL\",\n                            \"API_NULL_DOMAIN\",\n \
        \                           \"WORLD\",\n                            \"POSIX_USER\"\
        ,\n                            \"POSIX_GROUP\",\n                        \
        \    \"ACTIVE_DIRECTORY\",\n                            \"API_INVALID_DOMAIN\"\
        ,\n                            \"API_RESERVED_DOMAIN\",\n                \
        \            \"API_INTERNAL_DOMAIN\",\n                            \"API_OPERATOR_DOMAIN\"\
        ,\n                            \"API_QUMULO_SUPPORT_DOMAIN\",\n          \
        \                  \"API_CREATOR_DOMAIN\"\n                          ],\n\
        \                          \"description\": \"domain:\\n * `ACTIVE_DIRECTORY`\
        \ - ACTIVE_DIRECTORY,\\n * `API_CREATOR_DOMAIN` - API_CREATOR_DOMAIN,\\n *\
        \ `API_INTERNAL_DOMAIN` - API_INTERNAL_DOMAIN,\\n * `API_INVALID_DOMAIN` -\
        \ API_INVALID_DOMAIN,\\n * `API_NULL_DOMAIN` - API_NULL_DOMAIN,\\n * `API_OPERATOR_DOMAIN`\
        \ - API_OPERATOR_DOMAIN,\\n * `API_QUMULO_SUPPORT_DOMAIN` - API_QUMULO_SUPPORT_DOMAIN,\\\
        n * `API_RESERVED_DOMAIN` - API_RESERVED_DOMAIN,\\n * `LOCAL` - LOCAL,\\n\
        \ * `POSIX_GROUP` - POSIX_GROUP,\\n * `POSIX_USER` - POSIX_USER,\\n * `WORLD`\
        \ - WORLD\"\n                        },\n                        \"auth_id\"\
        : {\n                          \"description\": \"auth_id\",\n           \
        \               \"type\": \"string\"\n                        },\n       \
        \                 \"uid\": {\n                          \"description\": \"\
        uid\",\n                          \"type\": \"number\"\n                 \
        \       },\n                        \"gid\": {\n                         \
        \ \"description\": \"gid\",\n                          \"type\": \"number\"\
        \n                        },\n                        \"sid\": {\n       \
        \                   \"description\": \"sid\",\n                          \"\
        type\": \"string\"\n                        },\n                        \"\
        name\": {\n                          \"description\": \"name\",\n        \
        \                  \"type\": \"string\"\n                        }\n     \
        \                 }\n                    },\n                    \"rights\"\
        : {\n                      \"type\": \"array\",\n                      \"\
        items\": {\n                        \"type\": \"string\",\n              \
        \          \"enum\": [\n                          \"READ\",\n            \
        \              \"READ_EA\",\n                          \"READ_ATTR\",\n  \
        \                        \"READ_ACL\",\n                          \"WRITE_EA\"\
        ,\n                          \"WRITE_ATTR\",\n                          \"\
        WRITE_ACL\",\n                          \"CHANGE_OWNER\",\n              \
        \            \"WRITE_GROUP\",\n                          \"DELETE\",\n   \
        \                       \"EXECUTE\",\n                          \"MODIFY\"\
        ,\n                          \"EXTEND\",\n                          \"DELETE_CHILD\"\
        ,\n                          \"SYNCHRONIZE\"\n                        ],\n\
        \                        \"description\": \"Rights granted or denied for this\
        \ ACL entry:\\n * `CHANGE_OWNER` - Owner write access,\\n * `DELETE` - Delete\
        \ access,\\n * `DELETE_CHILD` - Delete from directory access,\\n * `EXECUTE`\
        \ - Execute access,\\n * `EXTEND` - File extension access,\\n * `MODIFY` -\
        \ File modification access,\\n * `READ` - File read access,\\n * `READ_ACL`\
        \ - ACL read access,\\n * `READ_ATTR` - Attribute read access,\\n * `READ_EA`\
        \ - Extended attribute read access,\\n * `SYNCHRONIZE` - File synchronize\
        \ access,\\n * `WRITE_ACL` - ACL write access,\\n * `WRITE_ATTR` - Attribute\
        \ write access,\\n * `WRITE_EA` - Extended attribute write access,\\n * `WRITE_GROUP`\
        \ - Group write access\"\n                      }\n                    }\n\
        \                  }\n                }\n              }\n            }\n\
        \          }\n        },\n        \"acl_indices\": {\n          \"type\":\
        \ \"array\",\n          \"items\": {\n            \"description\": \"Same\
        \ length as files. acl_indices[i] is the index in acl_pool for files[i]. When\
        \ the caller doesn't have the READ_ACL permission for a file, acl_indices[i]\
        \ is null.\",\n            \"type\": \"number\"\n          }\n        }\n\
        \      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
rest_endpoint: /v1/files/{ref}/entries/
api_version: v1
permalink: /rest-api-guide/files-v1/files_ref_entries.html
sidebar: rest_api_guide_sidebar
redirect_from: /rest-api-guide/files/files_ref_entries.html
deprecated: false
---
