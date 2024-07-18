---
category: /smb
methods:
  get:
    parameters:
    - description: File ID (uint64). Limits result to handles on the specified file.
      name: file_number
      required: false
    - description: Includes the paths to each file in the results. Resolving many
        paths can be slow.
      name: resolve_paths
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
    summary: Enumerate open file handles
rest_endpoint: /v1/smb/files/
permalink: /rest-api-guide/smb/smb_files.html
sidebar: rest_api_command_guide_sidebar
---
