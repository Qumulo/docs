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
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Paths must be absolute and URL encoded.
rest_endpoint: /v1/files/{ref}
permalink: /rest-api-guide/files/ref.html
sidebar: rest_api_guide_sidebar
---
