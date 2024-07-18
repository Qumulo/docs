---
category: /file-system
methods:
  get:
    parameters:
    - description: The name or identifier of the public key for which to show snapshot
        and snapshot policy usage.
      name: key_ref
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
    summary: Get file system public key usage by using the name or identifier of the
      specified key.
rest_endpoint: /v1/file-system/security/keys/{key_ref}/usages
permalink: /rest-api-guide/file-system/usages.html
sidebar: rest_api_guide_sidebar
---
