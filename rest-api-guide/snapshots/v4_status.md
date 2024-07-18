---
category: /snapshots
methods:
  get:
    parameters:
    - description: Filter the list of snapshots to exclude any combination of snapshots
        in process of being deleted, snapshots not in process of being deleted, locked
        snapshots, and unlocked snapshots. By default, includes all snapshots.
      name: filter
      required: false
    response_body:
      description: Return value on success
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"api_snapshot_statuses\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"entries\": {\n      \"type\": \"array\",\n \
        \     \"items\": {\n        \"description\": \"List of snapshot statuses\"\
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
        \     \"source_file_path\": {\n            \"description\": \"The snapshot\
        \ source directory (if available).\",\n            \"type\": \"string\"\n\
        \          },\n          \"policy_id\": {\n            \"description\": \"\
        The policy ID from which this snapshot was created, or null if this snapshot\
        \ was created manually.\",\n            \"type\": \"number\"\n          },\n\
        \          \"policy_name\": {\n            \"description\": \"The policy name\
        \ from which this snapshot was created, or null if this snapshot was created\
        \ manually or its policy was deleted.\",\n            \"type\": \"string\"\
        \n          },\n          \"expiration\": {\n            \"description\":\
        \ \"The snapshot expiration time, encoded as RFC 3339, a normalized subset\
        \ of ISO 8601. If expiration time is null, the snapshot never expires.\",\n\
        \            \"type\": \"string\"\n          },\n          \"owners\": {\n\
        \            \"type\": \"array\",\n            \"items\": {\n            \
        \  \"description\": \"This snapshot's owners. While there are entries on this\
        \ list, the snapshot can't be deleted or modified.\",\n              \"type\"\
        : \"object\",\n              \"properties\": {\n                \"id\": {\n\
        \                  \"description\": \"id\",\n                  \"type\": \"\
        string\"\n                }\n              }\n            }\n          },\n\
        \          \"in_delete\": {\n            \"description\": \"Specifies whether\
        \ the snapshot is in the process of being deleted.\",\n            \"type\"\
        : \"boolean\"\n          },\n          \"lock_key\": {\n            \"description\"\
        : \"The key that the snapshot is locked with. If set to null, the system does\
        \ not create locked snapshots under this policy.\",\n            \"type\"\
        : \"string\"\n          }\n        }\n      }\n    }\n  }\n}"
      status_code: '200'
    summary: Returns the information for every snapshot. If a snapshot was created
      from a snapshot policy, returns information about the policy.
rest_endpoint: /v4/snapshots/status/
permalink: /rest-api-guide/snapshots/v4_status.html
sidebar: rest_api_guide_sidebar
---
