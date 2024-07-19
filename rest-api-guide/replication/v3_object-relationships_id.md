---
category: /replication
methods:
  delete:
    parameters:
    - description: Relationship identifier
      name: id
      required: true
    - description: ETag for expected version
      name: If-Match
      required: false
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    summary: Delete the specified object replication relationship, which must not
      be running a job.
  get:
    parameters:
    - description: Relationship identifier
      name: id
      required: true
    response_body:
      schema: "{\n  \"description\": \"api_object_relationship_v3\",\n  \"type\":\
        \ \"object\",\n  \"properties\": {\n    \"id\": {\n      \"description\":\
        \ \"Unique identifier of the replication relationship\",\n      \"type\":\
        \ \"string\"\n    },\n    \"direction\": {\n      \"type\": \"string\",\n\
        \      \"enum\": [\n        \"COPY_TO_OBJECT\",\n        \"COPY_FROM_OBJECT\"\
        \n      ],\n      \"description\": \"The object relationship can either copy\
        \ data to or from the object store:\\n * `COPY_FROM_OBJECT` - COPY_FROM_OBJECT,\\\
        n * `COPY_TO_OBJECT` - COPY_TO_OBJECT\"\n    },\n    \"local_directory_id\"\
        : {\n      \"description\": \"File ID of the qumulo directory\",\n      \"\
        type\": \"string\"\n    },\n    \"object_store_address\": {\n      \"description\"\
        : \"S3-compatible server address\",\n      \"type\": \"string\"\n    },\n\
        \    \"port\": {\n      \"description\": \"HTTPS port to use when communicating\
        \ with the object store\",\n      \"type\": \"number\"\n    },\n    \"ca_certificate\"\
        : {\n      \"description\": \"Public certificate of the certificate authority\
        \ to trust for connections to the object store, in PEM format. If empty, the\
        \ built-in trusted public CAs are used.\",\n      \"type\": \"string\"\n \
        \   },\n    \"bucket\": {\n      \"description\": \"Bucket in the object store\
        \ to use\",\n      \"type\": \"string\"\n    },\n    \"bucket_style\": {\n\
        \      \"type\": \"string\",\n      \"enum\": [\n        \"BUCKET_STYLE_PATH\"\
        ,\n        \"BUCKET_STYLE_VIRTUAL_HOSTED\"\n      ],\n      \"description\"\
        : \"Addressing style for requests to the bucket. BUCKET_STYLE_PATH indicates\
        \ path-style addressing while BUCKET_STYLE_VIRTUAL_HOSTED indicates virtual\
        \ hosted-style.:\\n * `BUCKET_STYLE_PATH` - BUCKET_STYLE_PATH,\\n * `BUCKET_STYLE_VIRTUAL_HOSTED`\
        \ - BUCKET_STYLE_VIRTUAL_HOSTED\"\n    },\n    \"object_folder\": {\n    \
        \  \"description\": \"Folder in the object store bucket to use\",\n      \"\
        type\": \"string\"\n    },\n    \"region\": {\n      \"description\": \"Region\
        \ the bucket is located in\",\n      \"type\": \"string\"\n    },\n    \"\
        access_key_id\": {\n      \"description\": \"Access key ID to use when communicating\
        \ with the object store\",\n      \"type\": \"string\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Get information about the specified object replication relationship.
rest_endpoint: /v3/replication/object-relationships/{id}
permalink: /rest-api-guide/replication/v3_object-relationships_id.html
sidebar: rest_api_guide_sidebar
---
