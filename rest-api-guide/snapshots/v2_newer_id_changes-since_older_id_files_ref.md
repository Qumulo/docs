---
category: /snapshots
methods:
  get:
    parameters:
    - description: Newer snapshot
      name: newer_id
      required: true
    - description: Older snapshot
      name: older_id
      required: true
    - description: The file ID or the absolute path to the file system object. File
        IDs can be found in the id field of responses of APIs that return file attributes.
        You must URL-encode the paths. The APIs & Tools page in the Qumulo Core Web
        UI URL-encodes the paths.
      name: ref
      required: true
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
      schema: "{\n  \"description\": \"api_snapshot_file_diff\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"entries\": {\n      \"type\": \"array\",\n \
        \     \"items\": {\n        \"description\": \"entries\",\n        \"type\"\
        : \"object\",\n        \"properties\": {\n          \"type\": {\n        \
        \    \"type\": \"string\",\n            \"enum\": [\n              \"FILE_REGION_DATA\"\
        ,\n              \"FILE_REGION_HOLE\"\n            ],\n            \"description\"\
        : \"The type of content in the changed region of the file in the newer snapshot.\
        \ The region may contain either data a hole.:\\n * `FILE_REGION_DATA` - FILE_REGION_DATA,\\\
        n * `FILE_REGION_HOLE` - FILE_REGION_HOLE\"\n          },\n          \"offset\"\
        : {\n            \"description\": \"The starting offset of the changed region\
        \ in bytes.\",\n            \"type\": \"string\"\n          },\n         \
        \ \"size\": {\n            \"description\": \"The size of the changed region\
        \ in bytes.\",\n            \"type\": \"string\"\n          }\n        }\n\
        \      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Returns a list of changed byte ranges between two snapshots of a regular
      file. The list includes new, modified, and deallocated regions of the file's
      contents.
rest_endpoint: /v2/snapshots/{newer_id}/changes-since/{older_id}/files/{ref}
permalink: /rest-api-guide/snapshots/v2_newer_id_changes-since_older_id_files_ref.html
sidebar: rest_api_guide_sidebar
---
