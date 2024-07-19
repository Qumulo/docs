---
category: /files
methods:
  post:
    parameters:
    - description: The file ID or the absolute path to the file system object. File
        IDs can be found in the id field of responses of APIs that return file attributes.
        You must URL-encode the paths. The APIs & Tools page in the Qumulo Core Web
        UI URL-encodes the paths.
      name: ref
      required: true
    - description: Stream ID (uint64) to be modified
      name: stream_id
      required: true
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
      schema: "{\n  \"description\": \"api_files_punch_hole\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"offset\": {\n      \"description\": \"Offset\
        \ in bytes specifying the start of the hole to create.\",\n      \"type\"\
        : \"string\"\n    },\n    \"size\": {\n      \"description\": \"Size in bytes\
        \ of the hole to create.\",\n      \"type\": \"string\"\n    }\n  }\n}"
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
    summary: Create a hole in a region of a stream. Destroys all data within the hole
      so that subsequent reads will return zeroes. Returns the post-operation attributes
      of the stream.
rest_endpoint: /v1/files/{ref}/streams/{stream_id}/punch-hole
api_version: v1
permalink: /rest-api-guide/files/ref_streams_stream_id_punch-hole.html
sidebar: rest_api_guide_sidebar
---
