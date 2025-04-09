---
category: /Files
methods:
  delete:
    summary: Delete the file system object specified by 'ref'. When 'ref' is a path,
      the exact specified name is deleted. If 'ref' is a file ID and the file has
      mulitple links, then the link to be deleted is the one that '/v1/files/resolve'
      would return.
    parameters:
    - name: ref
      description: The file ID or the absolute path to the file system object. File
        IDs can be found in the id field of responses of APIs that return file attributes.
        You must URL-encode the paths. The APIs & Tools page in the Qumulo Core Web
        UI URL-encodes the paths.
      required: true
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    preview: false
rest_endpoint: /v1/files/{ref}
api_version: v1
permalink: /rest-api-guide/files/files_ref.html
sidebar: rest_api_guide_sidebar
---
