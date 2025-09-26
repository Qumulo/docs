---
category: /Files V1
methods:
  get:
    summary: List all named streams on provided object
    parameters:
    - name: ref
      description: The file ID or the absolute path to the file system object. File
        IDs can be found in the id field of responses of APIs that return file attributes.
        You must URL-encode the paths. The APIs & Tools page in the Qumulo Core Web
        UI URL-encodes the paths.
      required: true
    - name: snapshot
      description: The snapshot ID that specifies the version of the filesystem to
        use. If not specified, use the head version.
      required: false
    response_body:
      schema: "{\n  \"type\": \"array\",\n  \"items\": {\n    \"description\": \"\
        api_named_stream_attributes\",\n    \"type\": \"object\",\n    \"properties\"\
        : {\n      \"name\": {\n        \"description\": \"name\",\n        \"type\"\
        : \"string\"\n      },\n      \"id\": {\n        \"description\": \"id\",\n\
        \        \"type\": \"string\"\n      },\n      \"size\": {\n        \"description\"\
        : \"size\",\n        \"type\": \"string\"\n      },\n      \"datablocks\"\
        : {\n        \"description\": \"datablocks\",\n        \"type\": \"string\"\
        \n      },\n      \"data_revision\": {\n        \"description\": \"data_revision\"\
        ,\n        \"type\": \"string\"\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
  post:
    summary: Create a named stream on provided object
    parameters:
    - name: ref
      description: The file ID or the absolute path to the file system object. File
        IDs can be found in the id field of responses of APIs that return file attributes.
        You must URL-encode the paths. The APIs & Tools page in the Qumulo Core Web
        UI URL-encodes the paths.
      required: true
    - name: If-Match
      description: ETag for expected version
      required: false
    response_body:
      schema: "{\n  \"description\": \"api_named_stream_attributes\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"name\": {\n      \"description\"\
        : \"name\",\n      \"type\": \"string\"\n    },\n    \"id\": {\n      \"description\"\
        : \"id\",\n      \"type\": \"string\"\n    },\n    \"size\": {\n      \"description\"\
        : \"size\",\n      \"type\": \"string\"\n    },\n    \"datablocks\": {\n \
        \     \"description\": \"datablocks\",\n      \"type\": \"string\"\n    },\n\
        \    \"data_revision\": {\n      \"description\": \"data_revision\",\n   \
        \   \"type\": \"string\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
    request_body:
      schema: "{\n  \"description\": \"api_named_stream_entry\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"stream_name\": {\n      \"description\": \"\
        Stream name to be created.\",\n      \"type\": \"string\"\n    }\n  }\n}"
rest_endpoint: /v1/files/{ref}/streams/
api_version: v1
permalink: /rest-api-guide/files-v1/files_ref_streams.html
sidebar: rest_api_guide_sidebar
redirect_from: /rest-api-guide/files/files_ref_streams.html
---
