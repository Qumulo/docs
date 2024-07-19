---
category: /s3
methods:
  delete:
    parameters:
    - description: Bucket name
      name: name
      required: true
    - description: Upload ID
      name: id
      required: true
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    summary: Aborts an in-progress upload and releases all allocated storage.
rest_endpoint: /v1/s3/buckets/{name}/uploads/{id}
permalink: /rest-api-guide/s3/buckets_name_uploads_id.html
sidebar: rest_api_guide_sidebar
---