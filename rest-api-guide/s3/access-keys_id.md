---
category: /s3
methods:
  delete:
    parameters:
    - description: Access Key ID
      name: id
      required: true
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    summary: Delete the key identified by the given Access Key ID the current user.
      Access is revoked immediately.
rest_endpoint: /v1/s3/access-keys/{id}
api_version: v1
permalink: /rest-api-guide/s3/access-keys_id.html
sidebar: rest_api_guide_sidebar
---
