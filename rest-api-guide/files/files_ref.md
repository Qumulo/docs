---
category: /Files
methods:
  delete:
    parameters:
    - description: The file ID or the absolute path to the file system object. File
        IDs can be found in the id field of responses of APIs that return file attributes.
        You must URL-encode the paths. The APIs & Tools page in the Qumulo Core Web
        UI URL-encodes the paths.
      name: ref
      required: true
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    summary: Paths must be absolute and URL encoded.
rest_endpoint: /v1/files/{ref}
api_version: v1
permalink: /rest-api-guide/files/files_ref.html
sidebar: rest_api_guide_sidebar
---
