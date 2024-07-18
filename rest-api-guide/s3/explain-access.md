---
category: /s3
methods:
  post:
    parameters:
    - description: Bucket name
      name: name
      required: true
    request_body:
      example_value: TO DO
      schema: TO DO
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Explains the access of an identity due to the bucket policy.
rest_endpoint: /v1/s3/buckets/{name}/policy/explain-access
permalink: /rest-api-guide/s3/explain-access.html
sidebar: rest_api_guide_sidebar
---
