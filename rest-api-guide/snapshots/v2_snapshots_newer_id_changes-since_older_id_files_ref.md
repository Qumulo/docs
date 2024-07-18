---
category: /snapshots
methods:
  get:
    parameters:
    - description: Newer snapshot
      name: newer_id
      required: true
    - description: Older snapshot
      name: older_id
      required: true
    - description: The file ID or the absolute path to the file system object. File
        IDs can be found in the id field of responses of APIs that return file attributes.
        You must URL-encode the paths. The APIs & Tools page in the Qumulo Core Web
        UI URL-encodes the paths.
      name: ref
      required: true
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
    summary: Returns a list of changed byte ranges between two snapshots of a regular
      file. The list includes new, modified, and deallocated regions of the file's
      contents.
rest_endpoint: /v2/snapshots/{newer_id}/changes-since/{older_id}/files/{ref}
sidebar: rest_api_command_guide_sidebar
---
