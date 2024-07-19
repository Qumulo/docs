---
category: /snapshots
methods:
  delete:
    parameters:
    - description: Snapshot identifier
      name: id
      required: true
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    summary: Deletes a snapshot.
  get:
    parameters:
    - description: Snapshot identifier
      name: id
      required: true
    response_body:
      schema: "{\n  \"description\": \"api_snapshot_info_v1\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"id\": {\n      \"description\": \"Unique identifier\
        \ of the snapshot\",\n      \"type\": \"number\"\n    },\n    \"name\": {\n\
        \      \"description\": \"Name of the snapshot\",\n      \"type\": \"string\"\
        \n    },\n    \"timestamp\": {\n      \"description\": \"Creation timestamp\
        \ of the snapshot, encoded as RFC 3339, which is a normalized subset of ISO\
        \ 8601. See http://tools.ietf.org/rfc/rfc3339.txt, section 5.6 for ABNF.\"\
        ,\n      \"type\": \"string\"\n    },\n    \"directory_name\": {\n      \"\
        description\": \"Snapshot directory name, as would be seen in the .snapshot\
        \ directory over SMB or NFS.\",\n      \"type\": \"string\"\n    },\n    \"\
        source_path\": {\n      \"description\": \"Source directory of the snapshot\"\
        ,\n      \"type\": \"string\"\n    },\n    \"created_by_policy\": {\n    \
        \  \"description\": \"This snapshot was created by a policy. The name of that\
        \ policy will be stored in the name field in place of a user-defined name.\"\
        ,\n      \"type\": \"boolean\"\n    },\n    \"expiration\": {\n      \"description\"\
        : \"Time at which snapshot will be expired. Empty string if no expiration\
        \ time set. Encoded as RFC 3339, which is a normalized subset of ISO 8601.\
        \ See http://tools.ietf.org/rfc/rfc3339.txt, section 5.6 for ABNF.\",\n  \
        \    \"type\": \"string\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Returns information about a specific snapshot.
  patch:
    parameters:
    - description: Snapshot identifier
      name: id
      required: true
    - description: Duration after which to expire the snapshot, in format <quantity><units>,
        where <quantity> is a positive integer less than 1000 and <units> is one of
        [months, weeks, days, hours, minutes], e.g. 5days or 1hours. Empty string
        or never indicates the snapshot should never expire. Defaults to never if
        not specified.
      name: expiration-time-to-live
      required: false
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
      schema: "{\n  \"description\": \"api_snapshot_info_v1\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"id\": {\n      \"description\": \"Unique identifier\
        \ of the snapshot\",\n      \"type\": \"number\"\n    },\n    \"name\": {\n\
        \      \"description\": \"Name of the snapshot\",\n      \"type\": \"string\"\
        \n    },\n    \"timestamp\": {\n      \"description\": \"Creation timestamp\
        \ of the snapshot, encoded as RFC 3339, which is a normalized subset of ISO\
        \ 8601. See http://tools.ietf.org/rfc/rfc3339.txt, section 5.6 for ABNF.\"\
        ,\n      \"type\": \"string\"\n    },\n    \"directory_name\": {\n      \"\
        description\": \"Snapshot directory name, as would be seen in the .snapshot\
        \ directory over SMB or NFS.\",\n      \"type\": \"string\"\n    },\n    \"\
        source_path\": {\n      \"description\": \"Source directory of the snapshot\"\
        ,\n      \"type\": \"string\"\n    },\n    \"created_by_policy\": {\n    \
        \  \"description\": \"This snapshot was created by a policy. The name of that\
        \ policy will be stored in the name field in place of a user-defined name.\"\
        ,\n      \"type\": \"boolean\"\n    },\n    \"expiration\": {\n      \"description\"\
        : \"Time at which snapshot will be expired. Empty string if no expiration\
        \ time set. Encoded as RFC 3339, which is a normalized subset of ISO 8601.\
        \ See http://tools.ietf.org/rfc/rfc3339.txt, section 5.6 for ABNF.\",\n  \
        \    \"type\": \"string\"\n    }\n  }\n}"
    response_body:
      schema: "{\n  \"description\": \"api_snapshot_info_v1\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"id\": {\n      \"description\": \"Unique identifier\
        \ of the snapshot\",\n      \"type\": \"number\"\n    },\n    \"name\": {\n\
        \      \"description\": \"Name of the snapshot\",\n      \"type\": \"string\"\
        \n    },\n    \"timestamp\": {\n      \"description\": \"Creation timestamp\
        \ of the snapshot, encoded as RFC 3339, which is a normalized subset of ISO\
        \ 8601. See http://tools.ietf.org/rfc/rfc3339.txt, section 5.6 for ABNF.\"\
        ,\n      \"type\": \"string\"\n    },\n    \"directory_name\": {\n      \"\
        description\": \"Snapshot directory name, as would be seen in the .snapshot\
        \ directory over SMB or NFS.\",\n      \"type\": \"string\"\n    },\n    \"\
        source_path\": {\n      \"description\": \"Source directory of the snapshot\"\
        ,\n      \"type\": \"string\"\n    },\n    \"created_by_policy\": {\n    \
        \  \"description\": \"This snapshot was created by a policy. The name of that\
        \ policy will be stored in the name field in place of a user-defined name.\"\
        ,\n      \"type\": \"boolean\"\n    },\n    \"expiration\": {\n      \"description\"\
        : \"Time at which snapshot will be expired. Empty string if no expiration\
        \ time set. Encoded as RFC 3339, which is a normalized subset of ISO 8601.\
        \ See http://tools.ietf.org/rfc/rfc3339.txt, section 5.6 for ABNF.\",\n  \
        \    \"type\": \"string\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Modifies a snapshot.
  put:
    parameters:
    - description: Snapshot identifier
      name: id
      required: true
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
      schema: "{\n  \"description\": \"api_snapshot_info_v1\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"id\": {\n      \"description\": \"Unique identifier\
        \ of the snapshot\",\n      \"type\": \"number\"\n    },\n    \"name\": {\n\
        \      \"description\": \"Name of the snapshot\",\n      \"type\": \"string\"\
        \n    },\n    \"timestamp\": {\n      \"description\": \"Creation timestamp\
        \ of the snapshot, encoded as RFC 3339, which is a normalized subset of ISO\
        \ 8601. See http://tools.ietf.org/rfc/rfc3339.txt, section 5.6 for ABNF.\"\
        ,\n      \"type\": \"string\"\n    },\n    \"directory_name\": {\n      \"\
        description\": \"Snapshot directory name, as would be seen in the .snapshot\
        \ directory over SMB or NFS.\",\n      \"type\": \"string\"\n    },\n    \"\
        source_path\": {\n      \"description\": \"Source directory of the snapshot\"\
        ,\n      \"type\": \"string\"\n    },\n    \"created_by_policy\": {\n    \
        \  \"description\": \"This snapshot was created by a policy. The name of that\
        \ policy will be stored in the name field in place of a user-defined name.\"\
        ,\n      \"type\": \"boolean\"\n    },\n    \"expiration\": {\n      \"description\"\
        : \"Time at which snapshot will be expired. Empty string if no expiration\
        \ time set. Encoded as RFC 3339, which is a normalized subset of ISO 8601.\
        \ See http://tools.ietf.org/rfc/rfc3339.txt, section 5.6 for ABNF.\",\n  \
        \    \"type\": \"string\"\n    }\n  }\n}"
    response_body:
      schema: "{\n  \"description\": \"api_snapshot_info_v1\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"id\": {\n      \"description\": \"Unique identifier\
        \ of the snapshot\",\n      \"type\": \"number\"\n    },\n    \"name\": {\n\
        \      \"description\": \"Name of the snapshot\",\n      \"type\": \"string\"\
        \n    },\n    \"timestamp\": {\n      \"description\": \"Creation timestamp\
        \ of the snapshot, encoded as RFC 3339, which is a normalized subset of ISO\
        \ 8601. See http://tools.ietf.org/rfc/rfc3339.txt, section 5.6 for ABNF.\"\
        ,\n      \"type\": \"string\"\n    },\n    \"directory_name\": {\n      \"\
        description\": \"Snapshot directory name, as would be seen in the .snapshot\
        \ directory over SMB or NFS.\",\n      \"type\": \"string\"\n    },\n    \"\
        source_path\": {\n      \"description\": \"Source directory of the snapshot\"\
        ,\n      \"type\": \"string\"\n    },\n    \"created_by_policy\": {\n    \
        \  \"description\": \"This snapshot was created by a policy. The name of that\
        \ policy will be stored in the name field in place of a user-defined name.\"\
        ,\n      \"type\": \"boolean\"\n    },\n    \"expiration\": {\n      \"description\"\
        : \"Time at which snapshot will be expired. Empty string if no expiration\
        \ time set. Encoded as RFC 3339, which is a normalized subset of ISO 8601.\
        \ See http://tools.ietf.org/rfc/rfc3339.txt, section 5.6 for ABNF.\",\n  \
        \    \"type\": \"string\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Modifies a snapshot.
rest_endpoint: /v1/snapshots/{id}
api_version: v1
permalink: /rest-api-guide/snapshots/id.html
sidebar: rest_api_guide_sidebar
---
