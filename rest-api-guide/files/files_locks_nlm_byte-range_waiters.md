---
category: /files
methods:
  get:
    parameters:
    - description: The lock owner's name. The client provides the name. Typically,
        it is the client hostname.
      name: owner_name
      required: false
    - description: The waiter's address. The IP address of the machine (the waiter)
        that sends the lock request. If the machine's IP address changes, any outstanding
        requests are still listed under the old address.
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
    summary: Return a list of all NLM byte range requests currently waiting on the
      specified machine.
rest_endpoint: /v1/files/locks/nlm/byte-range/waiters/
sidebar: rest_api_command_guide_sidebar
---
