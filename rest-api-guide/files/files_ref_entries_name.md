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
    - description: Name of the directory entry to be deleted
      name: name
      required: true
    preview: false
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    summary: Delete the link specified by 'name' in the directory specified by 'ref'.
      The file system object is deleted if this was its last link. This operation
      is more convenient than 'DELETE /v1/files/<ref>' when the file ID of the directory
      is known in advance for deleting multiple files in one directory.
rest_endpoint: /v1/files/{ref}/entries/{name}
api_version: v1
permalink: /rest-api-guide/files/files_ref_entries_name.html
sidebar: rest_api_guide_sidebar
---
