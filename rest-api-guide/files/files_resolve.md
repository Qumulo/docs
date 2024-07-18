---
category: /files
methods:
  post:
    parameters:
    - description: The snapshot ID that specifies the version of the filesystem to
        use. If not specified, use the head version.
      name: snapshot
      required: false
    request_body:
      example_value: TO DO
      schema: TO DO
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Return the full paths for each specified file ID. If a file has more
      than one path (due to hard links) a canonical path is chosen.
rest_endpoint: /v1/files/resolve
sidebar: rest_api_command_guide_sidebar
---
