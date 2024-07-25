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
    - description: "Weight the sampling by the value specified: capacity (total bytes\
        \ used for data and metadata), data (total bytes used for data only), file\
        \ (file count), named_streams (named stream count):\n * `capacity` - capacity,\n\
        \ * `data` - data,\n * `file` - file,\n * `named_streams` - named_streams"
      name: by-value
      required: true
    - description: Maximum number of entries returned
      name: limit
      required: true
    response_body:
      schema: "{\n  \"type\": \"array\",\n  \"items\": {\n    \"description\": \"\
        api_files_aggregates\",\n    \"type\": \"object\",\n    \"properties\": {\n\
        \      \"name\": {\n        \"description\": \"Name of this file or directory\"\
        ,\n        \"type\": \"string\"\n      },\n      \"type\": {\n        \"type\"\
        : \"string\",\n        \"enum\": [\n          \"FS_FILE_TYPE_FILE\",\n   \
        \       \"FS_FILE_TYPE_DIRECTORY\",\n          \"FS_FILE_TYPE_SYMLINK\",\n\
        \          \"FS_FILE_TYPE_UNIX_PIPE\",\n          \"FS_FILE_TYPE_UNIX_CHARACTER_DEVICE\"\
        ,\n          \"FS_FILE_TYPE_UNIX_BLOCK_DEVICE\",\n          \"FS_FILE_TYPE_UNIX_SOCKET\"\
        \n        ],\n        \"description\": \"type:\\n * `FS_FILE_TYPE_DIRECTORY`\
        \ - FS_FILE_TYPE_DIRECTORY,\\n * `FS_FILE_TYPE_FILE` - FS_FILE_TYPE_FILE,\\\
        n * `FS_FILE_TYPE_SYMLINK` - FS_FILE_TYPE_SYMLINK,\\n * `FS_FILE_TYPE_UNIX_BLOCK_DEVICE`\
        \ - FS_FILE_TYPE_UNIX_BLOCK_DEVICE,\\n * `FS_FILE_TYPE_UNIX_CHARACTER_DEVICE`\
        \ - FS_FILE_TYPE_UNIX_CHARACTER_DEVICE,\\n * `FS_FILE_TYPE_UNIX_PIPE` - FS_FILE_TYPE_UNIX_PIPE,\\\
        n * `FS_FILE_TYPE_UNIX_SOCKET` - FS_FILE_TYPE_UNIX_SOCKET\"\n      },\n  \
        \    \"id\": {\n        \"description\": \"Unique ID of this file or directory\"\
        ,\n        \"type\": \"string\"\n      },\n      \"capacity_usage\": {\n \
        \       \"description\": \"Capacity used by this file, or directory and all\
        \ its children, in bytes\",\n        \"type\": \"string\"\n      },\n    \
        \  \"data_usage\": {\n        \"description\": \"Capacity used for data by\
        \ this file, or directory and all its children, in bytes\",\n        \"type\"\
        : \"string\"\n      },\n      \"meta_usage\": {\n        \"description\":\
        \ \"Capacity used for metadata by this file, or directory and all its children,\
        \ in bytes\",\n        \"type\": \"string\"\n      },\n      \"num_files\"\
        : {\n        \"description\": \"Total number of files in the directory\",\n\
        \        \"type\": \"string\"\n      },\n      \"num_directories\": {\n  \
        \      \"description\": \"Total number of directories in the directory\",\n\
        \        \"type\": \"string\"\n      },\n      \"num_symlinks\": {\n     \
        \   \"description\": \"Total number of symlinks in the directory\",\n    \
        \    \"type\": \"string\"\n      },\n      \"num_other_objects\": {\n    \
        \    \"description\": \"Total number of Unix devices, pipes, and sockets in\
        \ the directory\",\n        \"type\": \"string\"\n      },\n      \"named_stream_data_usage\"\
        : {\n        \"description\": \"Capacity used for data by named streams on\
        \ this file, or directory and all its children, in bytes\",\n        \"type\"\
        : \"string\"\n      },\n      \"num_named_streams\": {\n        \"description\"\
        : \"Total number of named streams in the directory\",\n        \"type\": \"\
        string\"\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Retrieve a random sampling of files, with the probability of being chosen
      based on by-value property.
rest_endpoint: /v1/files/{ref}/sample/
api_version: v1
permalink: /rest-api-guide/files/files_ref_sample.html
sidebar: rest_api_guide_sidebar
---
