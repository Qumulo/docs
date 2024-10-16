---
category: /Object Storage
methods:
  post:
    parameters: []
    request_body:
      schema: "{\n  \"type\": \"array\",\n  \"items\": {\n    \"type\": \"string\"\
        \n  }\n}"
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    summary: Add new object storage URIs to the list of object storage URIs which
      point to the location where the system stores object-backed data. If this endpoint
      is called with URIs which are already in use, the system adds new URIs to the
      list of object storage URIs and ignores the existing URIs. Although the system
      does not rebalance data across URIs, it allocates new space to the least-used
      URIs.
rest_endpoint: /v1/object-storage/add-uris
api_version: v1
permalink: /rest-api-guide/object-storage/object-storage_add-uris.html
sidebar: rest_api_guide_sidebar
---
