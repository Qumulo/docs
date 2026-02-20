---
category: /Files V1
methods:
  get:
    summary: Retrieve the Base64-encoded user-defined metadata value for the current
      file by using the specified key.
    parameters:
    - name: ref
      description: The file ID or the absolute path to the file system object. File
        IDs can be found in the id field of responses of APIs that return file attributes.
        You must URL-encode the paths. The APIs & Tools page in the Qumulo Core Web
        UI URL-encodes the paths.
      required: true
    - name: type
      description: The user-defined metadata type on which to operate.
      required: true
    - name: key
      description: The user-defined metadata key on which to operate.
      required: true
    - name: snapshot
      description: The snapshot ID that specifies the version of the filesystem to
        use. If not specified, use the head version.
      required: false
    response_body:
      schema: "{\n  \"description\": \"api_files_user_metadata_value\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"value\": {\n      \"type\": \"array\"\
        ,\n      \"items\": {\n        \"description\": \"The bytes that represent\
        \ the Base64-encoded value of the user-defined metadata entry.\",\n      \
        \  \"type\": \"number\"\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
  delete:
    summary: Delete the user-defined metadata entry for the current file by using
      the specified key.
    parameters:
    - name: ref
      description: The file ID or the absolute path to the file system object. File
        IDs can be found in the id field of responses of APIs that return file attributes.
        You must URL-encode the paths. The APIs & Tools page in the Qumulo Core Web
        UI URL-encodes the paths.
      required: true
    - name: type
      description: The user-defined metadata type on which to operate.
      required: true
    - name: key
      description: The user-defined metadata key on which to operate.
      required: true
    - name: If-Match
      description: ETag for expected version
      required: false
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    preview: false
  put:
    summary: Add or update the user-defined metadata value for the current file by
      using the specified key.
    parameters:
    - name: ref
      description: The file ID or the absolute path to the file system object. File
        IDs can be found in the id field of responses of APIs that return file attributes.
        You must URL-encode the paths. The APIs & Tools page in the Qumulo Core Web
        UI URL-encodes the paths.
      required: true
    - name: type
      description: The user-defined metadata type on which to operate.
      required: true
    - name: key
      description: The user-defined metadata key on which to operate.
      required: true
    - name: If-Match
      description: ETag for expected version
      required: false
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    preview: false
    request_body:
      schema: "{\n  \"description\": \"api_files_user_metadata_value\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"value\": {\n      \"type\": \"array\"\
        ,\n      \"items\": {\n        \"description\": \"The bytes that represent\
        \ the Base64-encoded value of the user-defined metadata entry.\",\n      \
        \  \"type\": \"number\"\n      }\n    }\n  }\n}"
  post:
    summary: Add a user-defined metadata value to the current file by using the specified
      key and user-defined metadata type.
    parameters:
    - name: ref
      description: The file ID or the absolute path to the file system object. File
        IDs can be found in the id field of responses of APIs that return file attributes.
        You must URL-encode the paths. The APIs & Tools page in the Qumulo Core Web
        UI URL-encodes the paths.
      required: true
    - name: type
      description: The user-defined metadata type on which to operate.
      required: true
    - name: key
      description: The user-defined metadata key on which to operate.
      required: true
    - name: If-Match
      description: ETag for expected version
      required: false
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    preview: false
    request_body:
      schema: "{\n  \"description\": \"api_files_user_metadata_value\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"value\": {\n      \"type\": \"array\"\
        ,\n      \"items\": {\n        \"description\": \"The bytes that represent\
        \ the Base64-encoded value of the user-defined metadata entry.\",\n      \
        \  \"type\": \"number\"\n      }\n    }\n  }\n}"
rest_endpoint: /v1/files/{ref}/user-metadata/{type}/{key}
api_version: v1
permalink: /rest-api-guide/files-v1/files_ref_user-metadata_type_key.html
sidebar: rest_api_guide_sidebar
redirect_from: /rest-api-guide/files/files_ref_user-metadata_type_key.html
deprecated: false
---
