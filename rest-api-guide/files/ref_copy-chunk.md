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
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
      schema: "{\n  \"description\": \"api_files_copy_chunk\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"source_id\": {\n      \"description\": \"File\
        \ ID of the source file. Exactly one of source_id or source_path must be provided.\"\
        ,\n      \"type\": \"string\"\n    },\n    \"source_path\": {\n      \"description\"\
        : \"Path of the source file. Exactly one of source_id or source_path must\
        \ be provided.\",\n      \"type\": \"string\"\n    },\n    \"source_stream_id\"\
        : {\n      \"description\": \"Stream ID of the source file. Defaults to default\
        \ stream.\",\n      \"type\": \"string\"\n    },\n    \"source_snapshot\"\
        : {\n      \"description\": \"Snapshot ID specifying the version of the file\
        \ to copy from. Defaults to head version.\",\n      \"type\": \"number\"\n\
        \    },\n    \"source_offset\": {\n      \"description\": \"Specifies the\
        \ offset in bytes to start copying from. Defaults to 0.\",\n      \"type\"\
        : \"string\"\n    },\n    \"target_offset\": {\n      \"description\": \"\
        Specifies the offset in bytes to start copying to. Defaults to 0.\",\n   \
        \   \"type\": \"string\"\n    },\n    \"length\": {\n      \"description\"\
        : \"Specifies the maximum length of copy in bytes. Defaults to copy to the\
        \ end of the source file. The server may not be able to copy the entire length\
        \ requested. If that is the case, the response body returned can be used as\
        \ request body for the remaining copy.\",\n      \"type\": \"string\"\n  \
        \  },\n    \"source_etag\": {\n      \"description\": \"Expected ETag of the\
        \ source file returned from /v1/files/{source-id}/info/attributes. If provided,\
        \ this ETag will be validated against the server to ensure no intermediate\
        \ change has occurred.\",\n      \"type\": \"string\"\n    }\n  }\n}"
    response_body:
      schema: "{\n  \"description\": \"api_files_copy_chunk\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"source_id\": {\n      \"description\": \"File\
        \ ID of the source file. Exactly one of source_id or source_path must be provided.\"\
        ,\n      \"type\": \"string\"\n    },\n    \"source_path\": {\n      \"description\"\
        : \"Path of the source file. Exactly one of source_id or source_path must\
        \ be provided.\",\n      \"type\": \"string\"\n    },\n    \"source_stream_id\"\
        : {\n      \"description\": \"Stream ID of the source file. Defaults to default\
        \ stream.\",\n      \"type\": \"string\"\n    },\n    \"source_snapshot\"\
        : {\n      \"description\": \"Snapshot ID specifying the version of the file\
        \ to copy from. Defaults to head version.\",\n      \"type\": \"number\"\n\
        \    },\n    \"source_offset\": {\n      \"description\": \"Specifies the\
        \ offset in bytes to start copying from. Defaults to 0.\",\n      \"type\"\
        : \"string\"\n    },\n    \"target_offset\": {\n      \"description\": \"\
        Specifies the offset in bytes to start copying to. Defaults to 0.\",\n   \
        \   \"type\": \"string\"\n    },\n    \"length\": {\n      \"description\"\
        : \"Specifies the maximum length of copy in bytes. Defaults to copy to the\
        \ end of the source file. The server may not be able to copy the entire length\
        \ requested. If that is the case, the response body returned can be used as\
        \ request body for the remaining copy.\",\n      \"type\": \"string\"\n  \
        \  },\n    \"source_etag\": {\n      \"description\": \"Expected ETag of the\
        \ source file returned from /v1/files/{source-id}/info/attributes. If provided,\
        \ this ETag will be validated against the server to ensure no intermediate\
        \ change has occurred.\",\n      \"type\": \"string\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Copies the contents of the source file specified in the body of the request
      to the default stream. The file must already exist.
rest_endpoint: /v1/files/{ref}/copy-chunk
permalink: /rest-api-guide/files/ref_copy-chunk.html
sidebar: rest_api_guide_sidebar
---
