---
category: /snapshots
methods:
  delete:
    parameters:
    - description: Snapshot identifier
      name: id
      required: true
    - description: ETag for expected version
      name: If-Match
      required: false
    response_body: {}
    responses:
    - code: '202'
      description: Return value on success
    summary: Deletes a snapshot.
  get:
    parameters:
    - description: Snapshot identifier
      name: id
      required: true
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
    summary: Returns information about a specific snapshot.
  patch:
    parameters:
    - description: Snapshot identifier
      name: id
      required: true
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
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
    summary: Modifies a snapshot.
rest_endpoint: /v3/snapshots/{id}
api_version: v3
permalink: /rest-api-guide/snapshots/v3_id.html
sidebar: rest_api_guide_sidebar
---
