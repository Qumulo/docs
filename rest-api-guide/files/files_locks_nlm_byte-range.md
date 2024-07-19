---
category: /files
methods:
  delete:
    parameters:
    - description: The lock owner's name. The client provides the name. Typically,
        it is the client hostname.
      name: owner_name
      required: false
    - description: The lock owner's address. This is the IP address of the machine
        that acquires the lock. If the machine's IP address changes, any existing
        lock entries are still listed under the old address.
      name: owner_address
      required: false
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Release all locks held by a particular client. This is dangerous, and
      should only be used after confirming that the client is dead.
  get:
    parameters:
    - description: The lock owner's name. The client provides the name. Typically,
        it is the client hostname.
      name: owner_name
      required: false
    - description: The lock owner's address. This is the IP address of the machine
        that acquires the lock. If the machine's IP address changes, any existing
        lock entries are still listed under the old address.
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
rest_endpoint: /v1/files/locks/nlm/byte-range/
permalink: /rest-api-guide/files/files_locks_nlm_byte-range.html
sidebar: rest_api_guide_sidebar
---