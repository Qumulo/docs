---
category: /s3
methods:
  delete:
    parameters:
    - description: Bucket name
      name: name
      required: true
    - description: If set to true, the root directory of the bucket will also be unlinked.
        Otherwise the root directory is not unlinked.
      name: delete-root-dir
      required: true
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Delete an existing S3 bucket.
rest_endpoint: /v1/s3/buckets/{name}
permalink: /rest-api-guide/s3/s3_buckets_name.html
sidebar: rest_api_command_guide_sidebar
---
