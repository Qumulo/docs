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
    - description: 'Maximum number of directory entries to return (defauilt: 1000)'
      name: max-entries
      required: false
    - description: "Ordering field used for top N selection and sorting (default:\
        \ total_blocks):\n * `total_blocks` - total_blocks,\n * `total_datablocks`\
        \ - total_datablocks,\n * `total_directories` - total_directories,\n * `total_files`\
        \ - total_files,\n * `total_metablocks` - total_metablocks,\n * `total_named_stream_datablocks`\
        \ - total_named_stream_datablocks,\n * `total_named_streams` - total_named_streams,\n\
        \ * `total_other` - total_other,\n * `total_symlinks` - total_symlinks"
      name: order-by
      required: false
    - description: The snapshot ID that specifies the version of the filesystem to
        use. If not specified, use the head version.
      name: snapshot
      required: false
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Return aggregated data for a directory (like capacity, IOPS, etc.)
rest_endpoint: /v1/files/{ref}/aggregates/
permalink: /rest-api-guide/files/aggregates.html
sidebar: rest_api_command_guide_sidebar
---
