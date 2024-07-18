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
    - description: The snapshot ID that specifies the version of the filesystem to
        use. If not specified, use the head version.
      name: snapshot
      required: false
    - description: Read data from the requested file starting at the given 64-bit
        integer offset. If the offset is larger than the size of the file, the read
        will succeed and no data will be returned.
      name: offset
      required: false
    - description: Read up to length bytes from the requested file. If the read extends
        beyond the end of the file, the read will return as many bytes as possible,
        up to length.
      name: length
      required: false
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Return the contents of the file as an HTTP octet stream. The etag returned
      by this method represents the whole state of this file. In another word, if
      you are reading just a portion of the data, etag could be invalid because of
      other changes happened to the file, even the specific portion of data you read
      is still intact.
  patch:
    parameters:
    - description: The file ID or the absolute path to the file system object. File
        IDs can be found in the id field of responses of APIs that return file attributes.
        You must URL-encode the paths. The APIs & Tools page in the Qumulo Core Web
        UI URL-encodes the paths.
      name: ref
      required: true
    - description: 'Write the provided data at the given 64-bit integer offset. If
        the offset is greater than the size of the file, the file will be zero-extended
        up to offset before the data is written. (default: 0)'
      name: offset
      required: false
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
    summary: Set the contents of the file, at the given offset, to the body of the
      request. The target file must already exist, and the Content-Type of the request
      must be application/octet-stream.
  put:
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
    summary: Replace the contents of the file with the body of the request. The target
      file must already exist, and the content-type of the request must be application/octet-stream.
rest_endpoint: /v1/files/{ref}/data
permalink: /rest-api-guide/files/ref_data.html
sidebar: rest_api_guide_sidebar
---
