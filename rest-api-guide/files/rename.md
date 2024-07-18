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
    - description: Stream ID (uint64) to be renamed
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
    summary: Rename a stream on provided object
rest_endpoint: /v1/files/{ref}/streams/{stream_id}/rename
permalink: /rest-api-guide/files/rename.html
sidebar: rest_api_command_guide_sidebar
---
