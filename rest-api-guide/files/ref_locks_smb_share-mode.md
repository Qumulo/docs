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
    - description: The snapshot ID that specifies the version of the filesystem to
        use. If not specified, use the head version.
      name: snapshot
      required: false
    - description: Return entries after the given key (keys are returned in the paging
        object)
      name: after
      required: false
    - description: Return no more than this many entries; the system may choose a
        smaller limit.
      name: limit
      required: false
    response_body:
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"api_share_mode_grants\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"grants\": {\n      \"type\": \"array\",\n  \
        \    \"items\": {\n        \"description\": \"grants\",\n        \"type\"\
        : \"object\",\n        \"properties\": {\n          \"file_id\": {\n     \
        \       \"description\": \"file_id\",\n            \"type\": \"string\"\n\
        \          },\n          \"stream_id\": {\n            \"description\": \"\
        stream_id\",\n            \"type\": \"string\"\n          },\n          \"\
        snapshot_id\": {\n            \"description\": \"The locked file's snapshot\
        \ ID. Empty if the file is at the head version (not from a snapshot).\",\n\
        \            \"type\": \"string\"\n          },\n          \"mode\": {\n \
        \           \"type\": \"array\",\n            \"items\": {\n             \
        \ \"type\": \"string\",\n              \"enum\": [\n                \"API_SHARE_MODE_READ\"\
        ,\n                \"API_SHARE_MODE_WRITE\",\n                \"API_SHARE_MODE_DELETE\"\
        ,\n                \"API_SHARE_MODE_EXCLUDE_READ\",\n                \"API_SHARE_MODE_EXCLUDE_WRITE\"\
        ,\n                \"API_SHARE_MODE_EXCLUDE_DELETE\"\n              ],\n \
        \             \"description\": \"mode:\\n * `API_SHARE_MODE_DELETE` - API_SHARE_MODE_DELETE,\\\
        n * `API_SHARE_MODE_EXCLUDE_DELETE` - API_SHARE_MODE_EXCLUDE_DELETE,\\n *\
        \ `API_SHARE_MODE_EXCLUDE_READ` - API_SHARE_MODE_EXCLUDE_READ,\\n * `API_SHARE_MODE_EXCLUDE_WRITE`\
        \ - API_SHARE_MODE_EXCLUDE_WRITE,\\n * `API_SHARE_MODE_READ` - API_SHARE_MODE_READ,\\\
        n * `API_SHARE_MODE_WRITE` - API_SHARE_MODE_WRITE\"\n            }\n     \
        \     },\n          \"owner_id\": {\n            \"description\": \"The unique\
        \ identifier for the process that owns the file lock.\",\n            \"type\"\
        : \"string\"\n          },\n          \"owner_address\": {\n            \"\
        description\": \"The IP address to use for acquiring the file lock.\",\n \
        \           \"type\": \"string\"\n          },\n          \"node_address\"\
        : {\n            \"description\": \"The IP address of the node that receives\
        \ the request.\",\n            \"type\": \"string\"\n          }\n       \
        \ }\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Return a list of all SMB share mode locks currently granted on the specified
      file.
rest_endpoint: /v1/files/{ref}/locks/smb/share-mode/
permalink: /rest-api-guide/files/ref_locks_smb_share-mode.html
sidebar: rest_api_guide_sidebar
---
