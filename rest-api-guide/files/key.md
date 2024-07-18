---
category: /files
methods:
  delete:
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
    - description: The user-defined metadata key on which to operate.
      name: key
      required: true
    - description: ETag for expected version
      name: If-Match
      required: false
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Delete the user-defined metadata entry for the current file by using
      the specified key.
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
    - description: The user-defined metadata key on which to operate.
      name: key
      required: true
    - description: The snapshot ID that specifies the version of the filesystem to
        use. If not specified, use the head version.
      name: snapshot
      required: false
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Retrieve the Base64-encoded user-defined metadata value for the current
      file by using the specified key.
  post:
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
    - description: The user-defined metadata key on which to operate.
      name: key
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
    summary: Add a user-defined metadata value to the current file by using the specified
      key and user-defined metadata type.
  put:
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
    - description: The user-defined metadata key on which to operate.
      name: key
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
    summary: Add or update the user-defined metadata value for the current file by
      using the specified key.
rest_endpoint: /v1/files/{ref}/user-metadata/{type}/{key}
permalink: /rest-api-guide/files/key.html
sidebar: rest_api_guide_sidebar
---
