---
category: /s3
methods:
  get:
    parameters:
    - description: Bucket name
      name: name
      required: true
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Gets the policy on an S3 bucket.
  put:
    parameters:
    - description: Bucket name
      name: name
      required: true
    - description: If set to true, the user is able to set a bucket policy that removes
        their access to set bucket policies on this bucket, otherwise they cannot.
        If not present, removing self permissions will be denied.
      name: allow-remove-self
      required: false
    - description: ETag for expected version
      name: If-Match
      required: false
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: 'Sets the policy on an S3 bucket. The format of the bucket policycan
      be found here: https://docs.qumulo.com/administrator-guide/s3-api/creating-managing-s3-buckets.html'
rest_endpoint: /v1/s3/buckets/{name}/policy
permalink: /rest-api-guide/s3/policy.html
sidebar: rest_api_command_guide_sidebar
---
