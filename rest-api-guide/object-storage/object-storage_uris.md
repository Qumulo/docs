---
category: /Object Storage
methods:
  get:
    summary: Retrieve the list of object storage URIs which point to the location
      where the system stores object-backed data.
    parameters: []
    response_body:
      schema: "{\n  \"type\": \"array\",\n  \"items\": {\n    \"type\": \"string\"\
        \n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
rest_endpoint: /v1/object-storage/uris
api_version: v1
permalink: /rest-api-guide/object-storage/object-storage_uris.html
sidebar: rest_api_guide_sidebar
---
