---
category: /Files V1
methods:
  delete:
    summary: Delete a named stream on provided object
    parameters:
    - name: ref
      description: The file ID or the absolute path to the file system object. File
        IDs can be found in the id field of responses of APIs that return file attributes.
        You must URL-encode the paths. The APIs & Tools page in the Qumulo Core Web
        UI URL-encodes the paths.
      required: true
    - name: stream_id
      description: Stream ID (u64) to be deleted
      required: true
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    preview: false
rest_endpoint: /v1/files/{ref}/streams/{stream_id}
api_version: v1
permalink: /rest-api-guide/files-v1/files_ref_streams_stream_id.html
sidebar: rest_api_guide_sidebar
redirect_from: /rest-api-guide/files/files_ref_streams_stream_id.html
deprecated: false
---
