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
    - description: "Weight the sampling by the value specified: capacity (total bytes\
        \ used for data and metadata), data (total bytes used for data only), file\
        \ (file count), named_streams (named stream count):\n * `capacity` - capacity,\n\
        \ * `data` - data,\n * `file` - file,\n * `named_streams` - named_streams"
      name: by-value
      required: true
    - description: Maximum number of entries returned
      name: limit
      required: true
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Retrieve a random sampling of files, with the probability of being chosen
      based on by-value property.
rest_endpoint: /v1/files/{ref}/sample/
sidebar: rest_api_command_guide_sidebar
---
