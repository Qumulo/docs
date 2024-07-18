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
    - description: Stream ID (uint64) to be modified
      name: stream_id
      required: true
    - description: The snapshot ID that specifies the version of the filesystem to
        use. If not specified, use the head version.
      name: snapshot
      required: false
    - description: Read data from the requested stream starting at the given 64-bit
        integer offset. If the offset is larger than the size of the stream, the read
        will succeed and no data will be returned. If not specified the offset will
        0.
      name: offset
      required: false
    - description: Read up to length bytes from the requested stream. If the read
        extends beyond the end of the stream, the read will return as many bytes as
        possible, up to length. Will read the whole file if not specified.
      name: length
      required: false
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    summary: Return the contents of the file as an HTTP octet stream. The etag returned
      by this method represents the whole state of this file. In another word, if
      you are reading just a portion of the data, etag could be invalid because of
      other changes happened to the stream, even the specific portion of data you
      read is still intact.
  patch:
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
    - description: 'Write the provided data at the given 64-bit integer offset. If
        the offset is greater than the size of the stream, the stream will be zero-extended
        up to offset before the data is written. (default: 0)'
      name: offset
      required: false
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
      example_value: '"TO DO"'
      schema: "{\n  \"type\": \"object\"\n}"
    response_body:
      example_value: '"TO DO"'
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
    summary: Set the contents of the stream, at the given offset, to the body of the
      request. The target stream must already exist, and the Content-Type of the request
      must be application/octet-stream.
  put:
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
      example_value: '"TO DO"'
      schema: "{\n  \"type\": \"object\"\n}"
    response_body:
      example_value: '"TO DO"'
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
    summary: Replace the contents of the stream with the body of the request. The
      target stream must already exist, and the content-type of the request must be
      Application/Octet-stream.
rest_endpoint: /v1/files/{ref}/streams/{stream_id}/data
permalink: /rest-api-guide/files/ref_streams_stream_id_data.html
sidebar: rest_api_guide_sidebar
---
