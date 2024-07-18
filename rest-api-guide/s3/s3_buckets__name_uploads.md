---
category: /s3
methods:
  get:
    parameters:
    - description: Bucket name
      name: name
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
    summary: List all in-progress S3 uploads for a specific bucket.
rest_endpoint: /v1/s3/buckets/{name}/uploads/
permalink: /rest-api-guide/s3/s3_buckets__name_uploads.html
sidebar: rest_api_guide_sidebar
---
