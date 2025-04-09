---
category: /S3 Server Methods
methods:
  delete:
    summary: Aborts an in-progress upload and releases all allocated storage.
    parameters:
    - name: name
      description: Bucket name
      required: true
    - name: id
      description: Upload ID
      required: true
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    preview: false
rest_endpoint: /v1/s3/buckets/{name}/uploads/{id}
api_version: v1
permalink: /rest-api-guide/s3-server-methods/s3_buckets_name_uploads_id.html
sidebar: rest_api_guide_sidebar
---
