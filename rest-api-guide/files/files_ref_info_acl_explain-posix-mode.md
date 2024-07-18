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
    - description: The snapshot ID that specifies the version of the filesystem to
        use. If not specified, use the head version.
      name: snapshot
      required: false
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Explain the derived POSIX mode for a file/directory.
rest_endpoint: /v1/files/{ref}/info/acl/explain-posix-mode
permalink: /rest-api-guide/files/files_ref_info_acl_explain-posix-mode.html
sidebar: rest_api_command_guide_sidebar
---
