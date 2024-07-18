---
category: /snapshots
methods:
  get:
    parameters: []
    response_body:
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"api_snapshot_statuses_v2\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"entries\": {\n      \"type\": \"array\"\
        ,\n      \"items\": {\n        \"description\": \"List of snapshot status\
        \ information\",\n        \"type\": \"object\",\n        \"properties\": {\n\
        \          \"id\": {\n            \"description\": \"Unique identifier of\
        \ the snapshot\",\n            \"type\": \"number\"\n          },\n      \
        \    \"name\": {\n            \"description\": \"Name of the snapshot\",\n\
        \            \"type\": \"string\"\n          },\n          \"timestamp\":\
        \ {\n            \"description\": \"Creation timestamp of the snapshot, encoded\
        \ as RFC 3339, which is a normalized subset of ISO 8601. See http://tools.ietf.org/rfc/rfc3339.txt,\
        \ section 5.6 for ABNF.\",\n            \"type\": \"string\"\n          },\n\
        \          \"directory_name\": {\n            \"description\": \"Snapshot\
        \ directory name, as would be seen in the .snapshot directory over SMB or\
        \ NFS.\",\n            \"type\": \"string\"\n          },\n          \"source_file_id\"\
        : {\n            \"description\": \"File ID of the snapshot source directory\"\
        ,\n            \"type\": \"string\"\n          },\n          \"source_file_path\"\
        : {\n            \"description\": \"File path of the snapshot source directory\"\
        ,\n            \"type\": \"string\"\n          },\n          \"created_by_policy\"\
        : {\n            \"description\": \"This snapshot was created by a policy.\
        \ The name of that policy will be stored in the name field in place of a user-defined\
        \ name.\",\n            \"type\": \"boolean\"\n          },\n          \"\
        expiration\": {\n            \"description\": \"Time at which snapshot will\
        \ be expired. Empty string if no expiration time set. Encoded as RFC 3339,\
        \ which is a normalized subset of ISO 8601. See http://tools.ietf.org/rfc/rfc3339.txt,\
        \ section 5.6 for ABNF.\",\n            \"type\": \"string\"\n          },\n\
        \          \"owners\": {\n            \"type\": \"array\",\n            \"\
        items\": {\n              \"description\": \"Owners of this snapshot. The\
        \ snapshot cannot be deleted or modified while the list is non-empty.\",\n\
        \              \"type\": \"object\",\n              \"properties\": {\n  \
        \              \"id\": {\n                  \"description\": \"id\",\n   \
        \               \"type\": \"string\"\n                }\n              }\n\
        \            }\n          }\n        }\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Returns the status on all snapshots.
rest_endpoint: /v2/snapshots/status/
permalink: /rest-api-guide/snapshots/v2_status.html
sidebar: rest_api_guide_sidebar
---
