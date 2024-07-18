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
      example_value: TO DO
      schema: TO DO
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Create a hole in a region of a stream. Destroys all data within the hole
      so that subsequent reads will return zeroes. Returns the post-operation attributes
      of the stream.
rest_endpoint: /v1/files/{ref}/streams/{stream_id}/punch-hole
permalink: /rest-api-guide/files/ref_streams_stream_id_punch-hole.html
sidebar: rest_api_guide_sidebar
---
