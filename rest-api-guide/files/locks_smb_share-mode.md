---
category: /files
methods:
  get:
    parameters:
    - description: IP Address of the client that owns the lock.
      name: owner_address
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
      description: Return value on success
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
      status_code: '200'
    summary: Return a list of all granted file locks that the specified machine owns.
rest_endpoint: /v1/files/locks/smb/share-mode/
permalink: /rest-api-guide/files/locks_smb_share-mode.html
sidebar: rest_api_guide_sidebar
---
