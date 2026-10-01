---
category: /Snapshots V3
methods:
  get:
    summary: Returns the operations that transform the older snapshot's file contents
      into the newer snapshot's, at byte-range granularity. Each entry's `op` field
      is CREATE, MODIFY, or DELETE.
    parameters:
    - name: newer_id
      description: Newer snapshot
      required: true
    - name: older_id
      description: Older snapshot
      required: true
    - name: ref
      description: The file ID or the absolute path to the filesystem object. File
        IDs can be found in the id field of responses of APIs that return file attributes.
        You must URL-encode the paths. The APIs & Tools page in the Qumulo Core Web
        UI URL-encodes the paths.
      required: true
    - name: after
      description: Return entries after the given key (keys are returned in the paging
        object)
      required: false
    - name: limit
      description: Return no more than this many entries; the system may choose a
        smaller limit.
      required: false
    response_body:
      schema: "{\n  \"description\": \"api_snapshot_file_diff_v3\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"entries\": {\n      \"type\": \"array\"\
        ,\n      \"items\": {\n        \"description\": \"entries\",\n        \"type\"\
        : \"object\",\n        \"properties\": {\n          \"op\": {\n          \
        \  \"type\": \"string\",\n            \"enum\": [\n              \"CREATE\"\
        ,\n              \"MODIFY\",\n              \"DELETE\"\n            ],\n \
        \           \"description\": \"The type of change in the region of the file\
        \ in the newer snapshot. The region may have been created, modified, or deleted\
        \ compared to the older snapshot.:\\n * `CREATE` - SNAPSHOT_FILE_DIFF_OPERATION_CREATE,\\\
        n * `DELETE` - SNAPSHOT_FILE_DIFF_OPERATION_DELETE,\\n * `MODIFY` - SNAPSHOT_FILE_DIFF_OPERATION_MODIFY\"\
        \n          },\n          \"offset\": {\n            \"description\": \"The\
        \ starting offset of the changed region in bytes.\",\n            \"type\"\
        : \"string\"\n          },\n          \"size\": {\n            \"description\"\
        : \"The size of the changed region in bytes.\",\n            \"type\": \"\
        string\"\n          }\n        }\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
rest_endpoint: /v3/snapshots/{newer_id}/changes-since/{older_id}/files/{ref}
api_version: v3
deprecated: false
permalink: /rest-api-guide/snapshots-v3/v3_snapshots_newer_id_changes-since_older_id_files_ref.html
sidebar: rest_api_guide_sidebar
---
