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
    - description: Stream ID (uint64) to be deleted
      name: stream_id
      required: true
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    summary: Delete a named stream on provided object
rest_endpoint: /v1/files/{ref}/streams/{stream_id}
api_version: v1
permalink: /rest-api-guide/files/files_ref_streams_stream_id.html
sidebar: rest_api_guide_sidebar
---
