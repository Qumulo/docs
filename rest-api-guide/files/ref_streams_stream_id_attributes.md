---
category: /files
methods:
  get:
    parameters:
    - description: The file ID or the absolute path to the file system object. File
        IDs can be found in the id field of responses of APIs that return file attributes.
        You must URL-encode the paths. The APIs & Tools page in the Qumulo Core Web
        UI URL-encodes the paths.
      name: ref
      required: true
    - description: Stream ID (uint64) to get
      name: stream_id
      required: true
    - description: The snapshot ID that specifies the version of the filesystem to
        use. If not specified, use the head version.
      name: snapshot
      required: false
    response_body:
      schema: "{\n  \"description\": \"api_named_stream_attributes\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"name\": {\n      \"description\"\
        : \"name\",\n      \"type\": \"string\"\n    },\n    \"id\": {\n      \"description\"\
        : \"id\",\n      \"type\": \"string\"\n    },\n    \"size\": {\n      \"description\"\
        : \"size\",\n      \"type\": \"string\"\n    },\n    \"datablocks\": {\n \
        \     \"description\": \"datablocks\",\n      \"type\": \"string\"\n    },\n\
        \    \"data_revision\": {\n      \"description\": \"data_revision\",\n   \
        \   \"type\": \"string\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Get Stream attributes.
  patch:
    parameters:
    - description: The file ID or the absolute path to the file system object. File
        IDs can be found in the id field of responses of APIs that return file attributes.
        You must URL-encode the paths. The APIs & Tools page in the Qumulo Core Web
        UI URL-encodes the paths.
      name: ref
      required: true
    - description: Stream ID (uint64) to get
      name: stream_id
      required: true
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
      schema: "{\n  \"description\": \"api_settable_files_attributes\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"path\": {\n      \"description\"\
        : \"Filesystem path of the object\",\n      \"type\": \"string\"\n    },\n\
        \    \"name\": {\n      \"description\": \"Name of this file\",\n      \"\
        type\": \"string\"\n    },\n    \"num_links\": {\n      \"description\": \"\
        How many directory entries are associated with this file\",\n      \"type\"\
        : \"number\"\n    },\n    \"type\": {\n      \"type\": \"string\",\n     \
        \ \"enum\": [\n        \"FS_FILE_TYPE_FILE\",\n        \"FS_FILE_TYPE_DIRECTORY\"\
        ,\n        \"FS_FILE_TYPE_SYMLINK\",\n        \"FS_FILE_TYPE_UNIX_PIPE\",\n\
        \        \"FS_FILE_TYPE_UNIX_CHARACTER_DEVICE\",\n        \"FS_FILE_TYPE_UNIX_BLOCK_DEVICE\"\
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
        ,\n            \"INTERNAL\",\n            \"QUMULO_OPERATOR\"\n          ],\n\
        \          \"description\": \"id_type:\\n * `INTERNAL` - INTERNAL,\\n * `LOCAL_GROUP`\
        \ - LOCAL_GROUP,\\n * `LOCAL_USER` - LOCAL_USER,\\n * `NFS_GID` - NFS_GID,\\\
        n * `NFS_UID` - NFS_UID,\\n * `QUMULO_OPERATOR` - QUMULO_OPERATOR,\\n * `SMB_SID`\
        \ - SMB_SID\"\n        },\n        \"id_value\": {\n          \"description\"\
        : \"id_value\",\n          \"type\": \"string\"\n        }\n      }\n    },\n\
        \    \"group\": {\n      \"description\": \"File group\",\n      \"type\"\
        : \"string\"\n    },\n    \"group_details\": {\n      \"description\": \"\
        File group details\",\n      \"type\": \"object\",\n      \"properties\":\
        \ {\n        \"id_type\": {\n          \"type\": \"string\",\n          \"\
        enum\": [\n            \"LOCAL_USER\",\n            \"LOCAL_GROUP\",\n   \
        \         \"NFS_GID\",\n            \"NFS_UID\",\n            \"SMB_SID\"\
        ,\n            \"INTERNAL\",\n            \"QUMULO_OPERATOR\"\n          ],\n\
        \          \"description\": \"id_type:\\n * `INTERNAL` - INTERNAL,\\n * `LOCAL_GROUP`\
        \ - LOCAL_GROUP,\\n * `LOCAL_USER` - LOCAL_USER,\\n * `NFS_GID` - NFS_GID,\\\
        n * `NFS_UID` - NFS_UID,\\n * `QUMULO_OPERATOR` - QUMULO_OPERATOR,\\n * `SMB_SID`\
        \ - SMB_SID\"\n        },\n        \"id_value\": {\n          \"description\"\
        : \"id_value\",\n          \"type\": \"string\"\n        }\n      }\n    },\n\
        \    \"blocks\": {\n      \"description\": \"Number of blocks used by the\
        \ file\",\n      \"type\": \"string\"\n    },\n    \"datablocks\": {\n   \
        \   \"description\": \"Number of data blocks used by the file\",\n      \"\
        type\": \"string\"\n    },\n    \"metablocks\": {\n      \"description\":\
        \ \"Number of meta blocks used by the file\",\n      \"type\": \"string\"\n\
        \    },\n    \"size\": {\n      \"description\": \"File size in bytes\",\n\
        \      \"type\": \"string\"\n    },\n    \"access_time\": {\n      \"description\"\
        : \"Last time content was read, RFC 3339 format\",\n      \"type\": \"string\"\
        \n    },\n    \"modification_time\": {\n      \"description\": \"Last time\
        \ content was modified, RFC 3339 format\",\n      \"type\": \"string\"\n \
        \   },\n    \"change_time\": {\n      \"description\": \"Last time content\
        \ or attributes were modified, RFC 3339 format\",\n      \"type\": \"string\"\
        \n    },\n    \"creation_time\": {\n      \"description\": \"File creation\
        \ time, RFC 3339 format\",\n      \"type\": \"string\"\n    },\n    \"child_count\"\
        : {\n      \"description\": \"Count of children (valid for directories)\"\
        ,\n      \"type\": \"number\"\n    },\n    \"extended_attributes\": {\n  \
        \    \"description\": \"SMB extended file attributes\",\n      \"type\": \"\
        object\",\n      \"properties\": {\n        \"read_only\": {\n          \"\
        description\": \"read_only\",\n          \"type\": \"boolean\"\n        },\n\
        \        \"hidden\": {\n          \"description\": \"hidden\",\n         \
        \ \"type\": \"boolean\"\n        },\n        \"system\": {\n          \"description\"\
        : \"system\",\n          \"type\": \"boolean\"\n        },\n        \"archive\"\
        : {\n          \"description\": \"archive\",\n          \"type\": \"boolean\"\
        \n        },\n        \"temporary\": {\n          \"description\": \"temporary\"\
        ,\n          \"type\": \"boolean\"\n        },\n        \"compressed\": {\n\
        \          \"description\": \"compressed\",\n          \"type\": \"boolean\"\
        \n        },\n        \"not_content_indexed\": {\n          \"description\"\
        : \"not_content_indexed\",\n          \"type\": \"boolean\"\n        },\n\
        \        \"sparse_file\": {\n          \"description\": \"sparse_file\",\n\
        \          \"type\": \"boolean\"\n        },\n        \"offline\": {\n   \
        \       \"description\": \"offline\",\n          \"type\": \"boolean\"\n \
        \       }\n      }\n    },\n    \"directory_entry_hash_policy\": {\n     \
        \ \"type\": \"string\",\n      \"enum\": [\n        \"FS_DIRECTORY_HASH_VERSION_LOWER\"\
        ,\n        \"FS_DIRECTORY_HASH_VERSION_FOLDED\"\n      ],\n      \"description\"\
        : \"Hash policy for directory entries:\\n * `FS_DIRECTORY_HASH_VERSION_FOLDED`\
        \ - FS_DIRECTORY_HASH_VERSION_FOLDED,\\n * `FS_DIRECTORY_HASH_VERSION_LOWER`\
        \ - FS_DIRECTORY_HASH_VERSION_LOWER\"\n    }\n  }\n}"
    response_body:
      schema: "{\n  \"description\": \"api_named_stream_attributes\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"name\": {\n      \"description\"\
        : \"name\",\n      \"type\": \"string\"\n    },\n    \"id\": {\n      \"description\"\
        : \"id\",\n      \"type\": \"string\"\n    },\n    \"size\": {\n      \"description\"\
        : \"size\",\n      \"type\": \"string\"\n    },\n    \"datablocks\": {\n \
        \     \"description\": \"datablocks\",\n      \"type\": \"string\"\n    },\n\
        \    \"data_revision\": {\n      \"description\": \"data_revision\",\n   \
        \   \"type\": \"string\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Update a subset of stream attributes
rest_endpoint: /v1/files/{ref}/streams/{stream_id}/attributes
api_version: v1
permalink: /rest-api-guide/files/ref_streams_stream_id_attributes.html
sidebar: rest_api_guide_sidebar
---
