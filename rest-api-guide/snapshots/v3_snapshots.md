---
category: /snapshots
methods:
  get:
    parameters:
    - description: "Filter the list of snapshots to exclude snapshots in process of\
        \ being deleted, or include only snapshots in process of being deleted. By\
        \ default, includes all snapshots.:\n * `all` - all,\n * `exclude_in_delete`\
        \ - exclude_in_delete,\n * `only_in_delete` - only_in_delete"
      name: filter
      required: true
    response_body:
      schema: "{\n  \"description\": \"api_snapshots\",\n  \"type\": \"object\",\n\
        \  \"properties\": {\n    \"entries\": {\n      \"type\": \"array\",\n   \
        \   \"items\": {\n        \"description\": \"List of snapshot information\"\
        ,\n        \"type\": \"object\",\n        \"properties\": {\n          \"\
        id\": {\n            \"description\": \"The unique snapshot identifier.\"\
        ,\n            \"type\": \"number\"\n          },\n          \"name\": {\n\
        \            \"description\": \"The snapshot name as it appears in the .snapshot\
        \ directory over SMB or NFS.\",\n            \"type\": \"string\"\n      \
        \    },\n          \"timestamp\": {\n            \"description\": \"The snapshot\
        \ creation timestamp, encoded as RFC 3339, a normalized subset of ISO 8601.\"\
        ,\n            \"type\": \"string\"\n          },\n          \"source_file_id\"\
        : {\n            \"description\": \"The source file ID of the directory for\
        \ the snapshot.\",\n            \"type\": \"string\"\n          },\n     \
        \     \"policy_id\": {\n            \"description\": \"The policy ID from\
        \ which this snapshot was created, or null if this snapshot was created manually.\"\
        ,\n            \"type\": \"number\"\n          },\n          \"expiration\"\
        : {\n            \"description\": \"The snapshot expiration time, encoded\
        \ as RFC 3339, a normalized subset of ISO 8601. If expiration time is null,\
        \ the snapshot never expires.\",\n            \"type\": \"string\"\n     \
        \     },\n          \"in_delete\": {\n            \"description\": \"Specifies\
        \ whether the snapshot is in the process of being deleted.\",\n          \
        \  \"type\": \"boolean\"\n          }\n        }\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Returns information about all snapshots.
  post:
    parameters: []
    request_body:
      schema: "{\n  \"description\": \"api_snapshot_create\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"name_suffix\": {\n      \"description\": \"\
        The snapshot name. Qumulo Core prepends the snapshot ID to the name. If not\
        \ provided, Qumulo Core uses the value OnDemand.\",\n      \"type\": \"string\"\
        \n    },\n    \"expiration\": {\n      \"description\": \"The snapshot expiration\
        \ time, encoded as RFC 3339, a normalized subset of ISO 8601. If expiration\
        \ time is null, the snapshot never expires.\",\n      \"type\": \"string\"\
        \n    },\n    \"source_file_id\": {\n      \"description\": \"The ID of the\
        \ directory to snapshot.\",\n      \"type\": \"string\"\n    }\n  }\n}"
    response_body:
      schema: "{\n  \"description\": \"api_snapshot_info\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"id\": {\n      \"description\": \"The unique\
        \ snapshot identifier.\",\n      \"type\": \"number\"\n    },\n    \"name\"\
        : {\n      \"description\": \"The snapshot name as it appears in the .snapshot\
        \ directory over SMB or NFS.\",\n      \"type\": \"string\"\n    },\n    \"\
        timestamp\": {\n      \"description\": \"The snapshot creation timestamp,\
        \ encoded as RFC 3339, a normalized subset of ISO 8601.\",\n      \"type\"\
        : \"string\"\n    },\n    \"source_file_id\": {\n      \"description\": \"\
        The source file ID of the directory for the snapshot.\",\n      \"type\":\
        \ \"string\"\n    },\n    \"policy_id\": {\n      \"description\": \"The policy\
        \ ID from which this snapshot was created, or null if this snapshot was created\
        \ manually.\",\n      \"type\": \"number\"\n    },\n    \"expiration\": {\n\
        \      \"description\": \"The snapshot expiration time, encoded as RFC 3339,\
        \ a normalized subset of ISO 8601. If expiration time is null, the snapshot\
        \ never expires.\",\n      \"type\": \"string\"\n    },\n    \"in_delete\"\
        : {\n      \"description\": \"Specifies whether the snapshot is in the process\
        \ of being deleted.\",\n      \"type\": \"boolean\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Creates a new snapshot and returns snapshot information.
rest_endpoint: /v3/snapshots/
api_version: v3
permalink: /rest-api-guide/snapshots/v3_snapshots.html
sidebar: rest_api_guide_sidebar
---
