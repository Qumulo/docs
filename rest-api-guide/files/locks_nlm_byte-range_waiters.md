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
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"api_byte_range_waiters\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"waiters\": {\n      \"type\": \"array\",\n \
        \     \"items\": {\n        \"description\": \"waiters\",\n        \"type\"\
        : \"object\",\n        \"properties\": {\n          \"file_id\": {\n     \
        \       \"description\": \"file_id\",\n            \"type\": \"string\"\n\
        \          },\n          \"stream_id\": {\n            \"description\": \"\
        stream_id\",\n            \"type\": \"string\"\n          },\n          \"\
        snapshot_id\": {\n            \"description\": \"The locked file's snapshot\
        \ ID. Empty if the file is at the head version (not from a snapshot).\",\n\
        \            \"type\": \"string\"\n          },\n          \"mode\": {\n \
        \           \"type\": \"array\",\n            \"items\": {\n             \
        \ \"type\": \"string\",\n              \"enum\": [\n                \"API_BYTE_RANGE_EXCLUSIVE\"\
        ,\n                \"API_BYTE_RANGE_SHARED\",\n                \"API_BYTE_RANGE_READ_OP\"\
        ,\n                \"API_BYTE_RANGE_WRITE_OP\"\n              ],\n       \
        \       \"description\": \"mode:\\n * `API_BYTE_RANGE_EXCLUSIVE` - API_BYTE_RANGE_EXCLUSIVE,\\\
        n * `API_BYTE_RANGE_READ_OP` - API_BYTE_RANGE_READ_OP,\\n * `API_BYTE_RANGE_SHARED`\
        \ - API_BYTE_RANGE_SHARED,\\n * `API_BYTE_RANGE_WRITE_OP` - API_BYTE_RANGE_WRITE_OP\"\
        \n            }\n          },\n          \"offset\": {\n            \"description\"\
        : \"offset\",\n            \"type\": \"string\"\n          },\n          \"\
        size\": {\n            \"description\": \"size\",\n            \"type\": \"\
        string\"\n          },\n          \"owner_id\": {\n            \"description\"\
        : \"The unique identifier for the process that owns the file lock.\",\n  \
        \          \"type\": \"string\"\n          },\n          \"owner_name\": {\n\
        \            \"description\": \"The name of the machine that owns the lock.\"\
        ,\n            \"type\": \"string\"\n          },\n          \"owner_address\"\
        : {\n            \"description\": \"The IP address to use for acquiring the\
        \ file lock.\",\n            \"type\": \"string\"\n          },\n        \
        \  \"node_address\": {\n            \"description\": \"The IP address of the\
        \ node that receives the request.\",\n            \"type\": \"string\"\n \
        \         }\n        }\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Return a list of all NLM byte range requests currently waiting on the
      specified machine.
rest_endpoint: /v1/files/locks/nlm/byte-range/waiters/
permalink: /rest-api-guide/files/locks_nlm_byte-range_waiters.html
sidebar: rest_api_guide_sidebar
---
