---
category: /Replication V3
methods:
  get:
    summary: Get the status of an existing object replication relationship.
    parameters:
    - name: id
      description: Relationship identifier
      required: true
    response_body:
      schema: "{\n  \"description\": \"api_object_relationship_status_v3\",\n  \"\
        type\": \"object\",\n  \"properties\": {\n    \"id\": {\n      \"description\"\
        : \"Unique identifier of the replication relationship\",\n      \"type\":\
        \ \"string\"\n    },\n    \"direction\": {\n      \"type\": \"string\",\n\
        \      \"enum\": [\n        \"COPY_TO_OBJECT\",\n        \"COPY_FROM_OBJECT\"\
        \n      ],\n      \"description\": \"The object relationship can either copy\
        \ data to or from the object store:\\n * `COPY_FROM_OBJECT` - COPY_FROM_OBJECT,\\\
        n * `COPY_TO_OBJECT` - COPY_TO_OBJECT\"\n    },\n    \"local_directory_id\"\
        : {\n      \"description\": \"File ID of the qumulo directory\",\n      \"\
        type\": \"string\"\n    },\n    \"local_directory_path\": {\n      \"description\"\
        : \"Path of the qumulo directory. Path is empty if directory no longer exists\"\
        ,\n      \"type\": \"string\"\n    },\n    \"object_store_address\": {\n \
        \     \"description\": \"S3-compatible server address\",\n      \"type\":\
        \ \"string\"\n    },\n    \"port\": {\n      \"description\": \"HTTPS port\
        \ to use when communicating with the object store\",\n      \"type\": \"number\"\
        \n    },\n    \"ca_certificate\": {\n      \"description\": \"Public certificate\
        \ of the certificate authority to trust for connections to the object store,\
        \ in PEM format. If empty, the built-in trusted public CAs are used.\",\n\
        \      \"type\": \"string\"\n    },\n    \"bucket\": {\n      \"description\"\
        : \"Bucket in the object store to use\",\n      \"type\": \"string\"\n   \
        \ },\n    \"bucket_style\": {\n      \"type\": \"string\",\n      \"enum\"\
        : [\n        \"BUCKET_STYLE_PATH\",\n        \"BUCKET_STYLE_VIRTUAL_HOSTED\"\
        \n      ],\n      \"description\": \"Addressing style for requests to the\
        \ bucket. BUCKET_STYLE_PATH indicates path-style addressing while BUCKET_STYLE_VIRTUAL_HOSTED\
        \ indicates virtual hosted-style.:\\n * `BUCKET_STYLE_PATH` - BUCKET_STYLE_PATH,\\\
        n * `BUCKET_STYLE_VIRTUAL_HOSTED` - BUCKET_STYLE_VIRTUAL_HOSTED\"\n    },\n\
        \    \"object_folder\": {\n      \"description\": \"Folder in the object store\
        \ bucket to use\",\n      \"type\": \"string\"\n    },\n    \"region\": {\n\
        \      \"description\": \"Region the bucket is located in\",\n      \"type\"\
        : \"string\"\n    },\n    \"access_key_id\": {\n      \"description\": \"\
        Access key ID to use when communicating with the object store\",\n      \"\
        type\": \"string\"\n    },\n    \"state\": {\n      \"type\": \"string\",\n\
        \      \"enum\": [\n        \"REPLICATION_NOT_RUNNING\",\n        \"REPLICATION_RUNNING\"\
        \n      ],\n      \"description\": \"Current state of the replication:\\n\
        \ * `REPLICATION_NOT_RUNNING` - REPLICATION_NOT_RUNNING,\\n * `REPLICATION_RUNNING`\
        \ - REPLICATION_RUNNING\"\n    },\n    \"last_job\": {\n      \"description\"\
        : \"Details about last replication attempt. This may be null if replication\
        \ has not finished\",\n      \"type\": \"object\",\n      \"properties\":\
        \ {\n        \"start_time\": {\n          \"description\": \"The time that\
        \ replication started, encoded as RFC 3339\",\n          \"type\": \"string\"\
        \n        },\n        \"end_time\": {\n          \"description\": \"The time\
        \ that replication ended, encoded as RFC 3339\",\n          \"type\": \"string\"\
        \n        },\n        \"error\": {\n          \"description\": \"The error\
        \ message of last replication job. This may be empty if replication succeeded\"\
        ,\n          \"type\": \"string\"\n        }\n      }\n    },\n    \"current_job\"\
        : {\n      \"description\": \"Details about the current replication. This\
        \ may be null if replication is not running\",\n      \"type\": \"object\"\
        ,\n      \"properties\": {\n        \"start_time\": {\n          \"description\"\
        : \"The time that replication started, encoded as RFC 3339\",\n          \"\
        type\": \"string\"\n        },\n        \"estimated_end_time\": {\n      \
        \    \"description\": \"The estimated time that replication will complete,\
        \ encoded as RFC3339. This may be null if estimate is being calculated\",\n\
        \          \"type\": \"string\"\n        }\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
rest_endpoint: /v3/replication/object-relationships/{id}/status
api_version: v3
permalink: /rest-api-guide/replication-v3/v3_replication_object-relationships_id_status.html
sidebar: rest_api_guide_sidebar
redirect_from: /rest-api-guide/replication/v3_replication_object-relationships_id_status.html
deprecated: false
---
