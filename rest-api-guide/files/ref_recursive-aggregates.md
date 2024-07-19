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
    - description: 'Maximum directory entries we see before breaking out of the tree
        walk (default: 1000, system limit: 5000)'
      name: max-entries
      required: false
    - description: 'Maximum depth to traverse while doing the tree walk (default:
        10, system limit: 5000)'
      name: max-depth
      required: false
    - description: "Ordering field used for top N selection and sorting (default:\
        \ total_blocks):\n * `total_blocks` - total_blocks,\n * `total_datablocks`\
        \ - total_datablocks,\n * `total_directories` - total_directories,\n * `total_files`\
        \ - total_files,\n * `total_metablocks` - total_metablocks,\n * `total_named_stream_datablocks`\
        \ - total_named_stream_datablocks,\n * `total_named_streams` - total_named_streams,\n\
        \ * `total_other` - total_other,\n * `total_symlinks` - total_symlinks"
      name: order-by
      required: false
    - description: The snapshot ID that specifies the version of the filesystem to
        use. If not specified, use the head version.
      name: snapshot
      required: false
    response_body:
      schema: "{\n  \"type\": \"array\",\n  \"items\": {\n    \"description\": \"\
        api_files_dir_aggregates\",\n    \"type\": \"object\",\n    \"properties\"\
        : {\n      \"path\": {\n        \"description\": \"path\",\n        \"type\"\
        : \"string\"\n      },\n      \"id\": {\n        \"description\": \"id\",\n\
        \        \"type\": \"string\"\n      },\n      \"files\": {\n        \"type\"\
        : \"array\",\n        \"items\": {\n          \"description\": \"files\",\n\
        \          \"type\": \"object\",\n          \"properties\": {\n          \
        \  \"name\": {\n              \"description\": \"Name of this file or directory\"\
        ,\n              \"type\": \"string\"\n            },\n            \"type\"\
        : {\n              \"type\": \"string\",\n              \"enum\": [\n    \
        \            \"FS_FILE_TYPE_FILE\",\n                \"FS_FILE_TYPE_DIRECTORY\"\
        ,\n                \"FS_FILE_TYPE_SYMLINK\",\n                \"FS_FILE_TYPE_UNIX_PIPE\"\
        ,\n                \"FS_FILE_TYPE_UNIX_CHARACTER_DEVICE\",\n             \
        \   \"FS_FILE_TYPE_UNIX_BLOCK_DEVICE\",\n                \"FS_FILE_TYPE_UNIX_SOCKET\"\
        \n              ],\n              \"description\": \"type:\\n * `FS_FILE_TYPE_DIRECTORY`\
        \ - FS_FILE_TYPE_DIRECTORY,\\n * `FS_FILE_TYPE_FILE` - FS_FILE_TYPE_FILE,\\\
        n * `FS_FILE_TYPE_SYMLINK` - FS_FILE_TYPE_SYMLINK,\\n * `FS_FILE_TYPE_UNIX_BLOCK_DEVICE`\
        \ - FS_FILE_TYPE_UNIX_BLOCK_DEVICE,\\n * `FS_FILE_TYPE_UNIX_CHARACTER_DEVICE`\
        \ - FS_FILE_TYPE_UNIX_CHARACTER_DEVICE,\\n * `FS_FILE_TYPE_UNIX_PIPE` - FS_FILE_TYPE_UNIX_PIPE,\\\
        n * `FS_FILE_TYPE_UNIX_SOCKET` - FS_FILE_TYPE_UNIX_SOCKET\"\n            },\n\
        \            \"id\": {\n              \"description\": \"Unique ID of this\
        \ file or directory\",\n              \"type\": \"string\"\n            },\n\
        \            \"capacity_usage\": {\n              \"description\": \"Capacity\
        \ used by this file, or directory and all its children, in bytes\",\n    \
        \          \"type\": \"string\"\n            },\n            \"data_usage\"\
        : {\n              \"description\": \"Capacity used for data by this file,\
        \ or directory and all its children, in bytes\",\n              \"type\":\
        \ \"string\"\n            },\n            \"meta_usage\": {\n            \
        \  \"description\": \"Capacity used for metadata by this file, or directory\
        \ and all its children, in bytes\",\n              \"type\": \"string\"\n\
        \            },\n            \"num_files\": {\n              \"description\"\
        : \"Total number of files in the directory\",\n              \"type\": \"\
        string\"\n            },\n            \"num_directories\": {\n           \
        \   \"description\": \"Total number of directories in the directory\",\n \
        \             \"type\": \"string\"\n            },\n            \"num_symlinks\"\
        : {\n              \"description\": \"Total number of symlinks in the directory\"\
        ,\n              \"type\": \"string\"\n            },\n            \"num_other_objects\"\
        : {\n              \"description\": \"Total number of Unix devices, pipes,\
        \ and sockets in the directory\",\n              \"type\": \"string\"\n  \
        \          },\n            \"named_stream_data_usage\": {\n              \"\
        description\": \"Capacity used for data by named streams on this file, or\
        \ directory and all its children, in bytes\",\n              \"type\": \"\
        string\"\n            },\n            \"num_named_streams\": {\n         \
        \     \"description\": \"Total number of named streams in the directory\"\
        ,\n              \"type\": \"string\"\n            }\n          }\n      \
        \  }\n      },\n      \"total_capacity\": {\n        \"description\": \"total_capacity\"\
        ,\n        \"type\": \"string\"\n      },\n      \"total_data\": {\n     \
        \   \"description\": \"total_data\",\n        \"type\": \"string\"\n     \
        \ },\n      \"total_named_stream_data\": {\n        \"description\": \"total_named_stream_data\"\
        ,\n        \"type\": \"string\"\n      },\n      \"total_meta\": {\n     \
        \   \"description\": \"total_meta\",\n        \"type\": \"string\"\n     \
        \ },\n      \"total_files\": {\n        \"description\": \"total_files\",\n\
        \        \"type\": \"string\"\n      },\n      \"total_directories\": {\n\
        \        \"description\": \"total_directories\",\n        \"type\": \"string\"\
        \n      },\n      \"total_symlinks\": {\n        \"description\": \"total_symlinks\"\
        ,\n        \"type\": \"string\"\n      },\n      \"total_other_objects\":\
        \ {\n        \"description\": \"total_other_objects\",\n        \"type\":\
        \ \"string\"\n      },\n      \"total_named_streams\": {\n        \"description\"\
        : \"total_named_streams\",\n        \"type\": \"string\"\n      }\n    }\n\
        \  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Return aggregated data for this directory and its children. It does a
      breadth-first traversal of directories up to the user-specified limit (see max_entries
      and max_depth parameters) or system-imposed limit. Directory entries that are
      smaller than 10% of the directory's total size are omitted.
rest_endpoint: /v1/files/{ref}/recursive-aggregates/
permalink: /rest-api-guide/files/ref_recursive-aggregates.html
sidebar: rest_api_guide_sidebar
---
