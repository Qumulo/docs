---
category: /S3 Server Methods
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
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    summary: Delete an existing S3 bucket.
rest_endpoint: /v1/s3/buckets/{name}
api_version: v1
permalink: /rest-api-guide/s3-server-methods/s3_buckets_name.html
sidebar: rest_api_guide_sidebar
---
