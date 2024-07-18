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
    - description: The user-defined metadata type on which to operate.
      name: type
      required: true
    - description: The snapshot ID that specifies the version of the filesystem to
        use. If not specified, use the head version.
      name: snapshot
      required: false
    - description: Return entries after the given key (keys are returned in the paging
        object)
      name: after
      required: false
    - description: Return no more than this many entries; the system may choose a
        smaller limit.
      name: limit
      required: false
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Retrieve the user-defined metadata of a specified type for the current
      file. Values are base 64 encoded.
rest_endpoint: /v1/files/{ref}/user-metadata/{type}/
permalink: /rest-api-guide/files/type.html
sidebar: rest_api_command_guide_sidebar
---
