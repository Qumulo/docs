---
category: /files
methods:
  get:
    parameters:
    - description: IP Address of the client that owns the lock.
      name: owner_address
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
    summary: Return a list of all granted file locks that the specified machine owns.
rest_endpoint: /v1/files/locks/smb/byte-range/
permalink: /rest-api-guide/files/locks_smb_byte-range.html
sidebar: rest_api_guide_sidebar
---
