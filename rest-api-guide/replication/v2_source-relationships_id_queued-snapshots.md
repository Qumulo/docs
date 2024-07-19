---
category: /replication
methods:
  get:
    parameters:
    - description: Relationship identifier
      name: id
      required: true
    response_body:
      schema: "{\n  \"description\": \"api_queued_replication_snapshots\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"entries\": {\n      \"type\": \"\
        array\",\n      \"items\": {\n        \"description\": \"List of information\
        \ of snapshots awaiting replication\",\n        \"type\": \"object\",\n  \
        \      \"properties\": {\n          \"id\": {\n            \"description\"\
        : \"Unique identifier of the snapshot\",\n            \"type\": \"number\"\
        \n          },\n          \"name\": {\n            \"description\": \"Name\
        \ of the snapshot\",\n            \"type\": \"string\"\n          },\n   \
        \       \"timestamp\": {\n            \"description\": \"Creation timestamp\
        \ of the snapshot, encoded as RFC 3339, which is a normalized subset of ISO\
        \ 8601. See http://tools.ietf.org/rfc/rfc3339.txt, section 5.6 for ABNF.\"\
        ,\n            \"type\": \"string\"\n          },\n          \"directory_name\"\
        : {\n            \"description\": \"Snapshot directory name, as would be seen\
        \ in the .snapshot directory over SMB or NFS.\",\n            \"type\": \"\
        string\"\n          },\n          \"source_file_id\": {\n            \"description\"\
        : \"Source directory of the snapshot\",\n            \"type\": \"string\"\n\
        \          },\n          \"created_by_policy\": {\n            \"description\"\
        : \"This snapshot was created by a policy. The name of that policy will be\
        \ stored in the name field in place of a user-defined name.\",\n         \
        \   \"type\": \"boolean\"\n          },\n          \"in_delete\": {\n    \
        \        \"description\": \"Whether or not the snapshot is in the process\
        \ of being deleted\",\n            \"type\": \"boolean\"\n          },\n \
        \         \"expiration\": {\n            \"description\": \"Time at which\
        \ snapshot will be expired on the source cluster. Empty string if no expiration\
        \ time set. Encoded as RFC 3339, which is a normalized subset of ISO 8601.\
        \ See http://tools.ietf.org/rfc/rfc3339.txt, section 5.6 for ABNF.\",\n  \
        \          \"type\": \"string\"\n          },\n          \"target_expiration\"\
        : {\n            \"description\": \"Time at which snapshot will be expired\
        \ on the target cluster. Empty string if no expiration time set. Encoded as\
        \ RFC 3339, which is a normalized subset of ISO 8601. See http://tools.ietf.org/rfc/rfc3339.txt,\
        \ section 5.6 for ABNF.\",\n            \"type\": \"string\"\n          },\n\
        \          \"policy_id\": {\n            \"description\": \"Unique identifier\
        \ of the policy that created this snapshot\",\n            \"type\": \"number\"\
        \n          }\n        }\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: List information for all snapshots awaiting replication by the specified
      relationship.
rest_endpoint: /v2/replication/source-relationships/{id}/queued-snapshots/
api_version: v2
permalink: /rest-api-guide/replication/v2_source-relationships_id_queued-snapshots.html
sidebar: rest_api_guide_sidebar
---
