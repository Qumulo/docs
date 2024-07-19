---
category: /files
methods:
  get:
    parameters:
    - description: The file ID or the absolute path to the file system object. File
        IDs can be found in the id field of responses of APIs that return file attributes.
        You must URL-encode the paths. The APIs & Tools page in the Qumulo Core Web
        UI URL-encodes the paths.
      name: ref
      required: true
    - description: The user-defined metadata type on which to operate.
      name: type
      required: true
    - description: The snapshot ID that specifies the version of the filesystem to
        use. If not specified, use the head version.
      name: snapshot
      required: false
    - description: Return entries after the given key (keys are returned in the paging
        object)
      name: after
      required: false
    - description: Return no more than this many entries; the system may choose a
        smaller limit.
      name: limit
      required: false
    response_body:
      schema: "{\n  \"description\": \"api_files_user_metadata_range_result\",\n \
        \ \"type\": \"object\",\n  \"properties\": {\n    \"entries\": {\n      \"\
        type\": \"array\",\n      \"items\": {\n        \"description\": \"The list\
        \ of user metadata entries.\",\n        \"type\": \"object\",\n        \"\
        properties\": {\n          \"type\": {\n            \"type\": \"string\",\n\
        \            \"enum\": [\n              \"GENERIC\",\n              \"S3\"\
        \n            ],\n            \"description\": \"The type of user metadata.\
        \ Generic user metadata is visible through the S3 api as object tags. S3 metadata\
        \ is visible to the S3 protocol as object metadata.:\\n * `GENERIC` - FS_USER_METADATA_TYPE_GENERIC,\\\
        n * `S3` - FS_USER_METADATA_TYPE_S3\"\n          },\n          \"key\": {\n\
        \            \"description\": \"The key used to reference the user metadata.\"\
        ,\n            \"type\": \"string\"\n          },\n          \"value\": {\n\
        \            \"type\": \"array\",\n            \"items\": {\n            \
        \  \"description\": \"The data that the user-defined metadata entry stores.\"\
        ,\n              \"type\": \"number\"\n            }\n          }\n      \
        \  }\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Retrieve the user-defined metadata of a specified type for the current
      file. Values are base 64 encoded.
rest_endpoint: /v1/files/{ref}/user-metadata/{type}/
permalink: /rest-api-guide/files/ref_user-metadata_type.html
sidebar: rest_api_guide_sidebar
---
