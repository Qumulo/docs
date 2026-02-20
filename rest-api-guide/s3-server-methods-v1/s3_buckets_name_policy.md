---
category: /S3 Server Methods V1
methods:
  put:
    summary: 'Sets the policy on an S3 bucket. The format of the bucket policycan
      be found here: https://docs.qumulo.com/administrator-guide/s3-api/creating-managing-s3-buckets.html'
    parameters:
    - name: name
      description: Bucket name
      required: true
    - name: allow-remove-self
      description: If set to true, the user is able to set a bucket policy that removes
        their access to set bucket policies on this bucket, otherwise they cannot.
        If not present, removing self permissions will be denied.
      required: false
    - name: If-Match
      description: ETag for expected version
      required: false
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    preview: false
  get:
    summary: Gets the policy on an S3 bucket.
    parameters:
    - name: name
      description: Bucket name
      required: true
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    preview: false
rest_endpoint: /v1/s3/buckets/{name}/policy
api_version: v1
permalink: /rest-api-guide/s3-server-methods-v1/s3_buckets_name_policy.html
sidebar: rest_api_guide_sidebar
redirect_from: /rest-api-guide/s3-server-methods/s3_buckets_name_policy.html
deprecated: false
---
