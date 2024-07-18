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
      example_value: TO DO
      schema: TO DO
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Copies the contents of the source file specified in the body of the request
      to the default stream. The file must already exist.
rest_endpoint: /v1/files/{ref}/copy-chunk
permalink: /rest-api-guide/files/files__ref_copy-chunk.html
sidebar: rest_api_guide_sidebar
---
