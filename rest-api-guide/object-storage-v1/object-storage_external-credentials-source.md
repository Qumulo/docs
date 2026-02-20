---
category: /Object Storage V1
methods:
  get:
    summary: Retrieve the opaque name of the external credentials store that may be
      needed for accessing the configured object storage on some platforms.  If no
      external credentials store is configured, then expect an empty string.
    parameters: []
    response_body:
      schema: "{\n  \"type\": \"string\"\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
rest_endpoint: /v1/object-storage/external-credentials-source
api_version: v1
permalink: /rest-api-guide/object-storage-v1/object-storage_external-credentials-source.html
sidebar: rest_api_guide_sidebar
deprecated: false
---
