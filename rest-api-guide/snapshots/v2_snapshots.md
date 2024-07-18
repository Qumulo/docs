---
category: /snapshots
methods:
  get:
    parameters:
    - description: Specifies whether or not to include snapshots that are currently
        being deleted. Defaults to false if not specified.
      name: include-in-delete
      required: false
    response_body:
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"api_snapshots_v2\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"entries\": {\n      \"type\": \"array\",\n \
        \     \"items\": {\n        \"description\": \"List of snapshot information\"\
        ,\n        \"type\": \"object\",\n        \"properties\": {\n          \"\
        id\": {\n            \"description\": \"Unique identifier of the snapshot\"\
        ,\n            \"type\": \"number\"\n          },\n          \"name\": {\n\
        \            \"description\": \"Name of the snapshot\",\n            \"type\"\
        : \"string\"\n          },\n          \"timestamp\": {\n            \"description\"\
        : \"Creation timestamp of the snapshot, encoded as RFC 3339, which is a normalized\
        \ subset of ISO 8601. See http://tools.ietf.org/rfc/rfc3339.txt, section 5.6\
        \ for ABNF.\",\n            \"type\": \"string\"\n          },\n         \
        \ \"directory_name\": {\n            \"description\": \"Snapshot directory\
        \ name, as would be seen in the .snapshot directory over SMB or NFS.\",\n\
        \            \"type\": \"string\"\n          },\n          \"source_file_id\"\
        : {\n            \"description\": \"Source directory of the snapshot\",\n\
        \            \"type\": \"string\"\n          },\n          \"created_by_policy\"\
        : {\n            \"description\": \"This snapshot was created by a policy.\
        \ The name of that policy will be stored in the name field in place of a user-defined\
        \ name.\",\n            \"type\": \"boolean\"\n          },\n          \"\
        expiration\": {\n            \"description\": \"Time at which snapshot will\
        \ be expired. Empty string if no expiration time set. Encoded as RFC 3339,\
        \ which is a normalized subset of ISO 8601. See http://tools.ietf.org/rfc/rfc3339.txt,\
        \ section 5.6 for ABNF.\",\n            \"type\": \"string\"\n          },\n\
        \          \"in_delete\": {\n            \"description\": \"Whether or not\
        \ the snapshot is in the process of being deleted\",\n            \"type\"\
        : \"boolean\"\n          }\n        }\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Returns information about all snapshots.
  post:
    parameters:
    - description: Duration after which to expire the snapshot, in format <quantity><units>,
        where <quantity> is a positive integer less than 1000 and <units> is one of
        [months, weeks, days, hours, minutes], e.g. 5days or 1hours. Empty string
        or never indicates the snapshot should never expire. Defaults to never if
        not specified.
      name: expiration-time-to-live
      required: false
    request_body:
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"api_snapshot_create_v2\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"name\": {\n      \"description\": \"Name of\
        \ the snapshot\",\n      \"type\": \"string\"\n    },\n    \"expiration\"\
        : {\n      \"description\": \"Time at which snapshot will be expired. Empty\
        \ string if no expiration time set. Encoded as RFC 3339, which is a normalized\
        \ subset of ISO 8601. See http://tools.ietf.org/rfc/rfc3339.txt, section 5.6\
        \ for ABNF.\",\n      \"type\": \"string\"\n    },\n    \"source_file_id\"\
        : {\n      \"description\": \"ID of directory to snapshot.\",\n      \"type\"\
        : \"string\"\n    }\n  }\n}"
    response_body:
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"api_snapshot_info_v2\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"id\": {\n      \"description\": \"Unique identifier\
        \ of the snapshot\",\n      \"type\": \"number\"\n    },\n    \"name\": {\n\
        \      \"description\": \"Name of the snapshot\",\n      \"type\": \"string\"\
        \n    },\n    \"timestamp\": {\n      \"description\": \"Creation timestamp\
        \ of the snapshot, encoded as RFC 3339, which is a normalized subset of ISO\
        \ 8601. See http://tools.ietf.org/rfc/rfc3339.txt, section 5.6 for ABNF.\"\
        ,\n      \"type\": \"string\"\n    },\n    \"directory_name\": {\n      \"\
        description\": \"Snapshot directory name, as would be seen in the .snapshot\
        \ directory over SMB or NFS.\",\n      \"type\": \"string\"\n    },\n    \"\
        source_file_id\": {\n      \"description\": \"Source directory of the snapshot\"\
        ,\n      \"type\": \"string\"\n    },\n    \"created_by_policy\": {\n    \
        \  \"description\": \"This snapshot was created by a policy. The name of that\
        \ policy will be stored in the name field in place of a user-defined name.\"\
        ,\n      \"type\": \"boolean\"\n    },\n    \"expiration\": {\n      \"description\"\
        : \"Time at which snapshot will be expired. Empty string if no expiration\
        \ time set. Encoded as RFC 3339, which is a normalized subset of ISO 8601.\
        \ See http://tools.ietf.org/rfc/rfc3339.txt, section 5.6 for ABNF.\",\n  \
        \    \"type\": \"string\"\n    },\n    \"in_delete\": {\n      \"description\"\
        : \"Whether or not the snapshot is in the process of being deleted\",\n  \
        \    \"type\": \"boolean\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Creates a new snapshot and returns its details.
rest_endpoint: /v2/snapshots/
permalink: /rest-api-guide/snapshots/v2_snapshots.html
sidebar: rest_api_guide_sidebar
---
