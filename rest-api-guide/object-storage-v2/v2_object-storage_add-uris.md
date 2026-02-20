---
category: /Object Storage V2
methods:
  post:
    summary: Add new object storage URIs and corresponding credentials to the available
      object storage which points to the location where the system stores object-backed
      data. If this endpoint is called with URIs or credentials which are already
      in use, the system ignores them. Although the system does not rebalance data
      across new URIs, it allocates new space to the least-used URIs.
    parameters: []
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    preview: false
    request_body:
      schema: "{\n  \"description\": \"api_object_storage_uris_and_credentials\",\n\
        \  \"type\": \"object\",\n  \"properties\": {\n    \"uris\": {\n      \"type\"\
        : \"array\",\n      \"items\": {\n        \"description\": \"uris\",\n   \
        \     \"type\": \"string\"\n      }\n    },\n    \"maybe_credentials\": {\n\
        \      \"type\": \"array\",\n      \"items\": {\n        \"description\":\
        \ \"maybe_credentials\",\n        \"type\": \"object\",\n        \"properties\"\
        : {\n          \"store_name\": {\n            \"description\": \"store_name\"\
        ,\n            \"type\": \"string\"\n          },\n          \"access_key_id\"\
        : {\n            \"description\": \"access_key_id\",\n            \"type\"\
        : \"string\"\n          },\n          \"secret_access_key\": {\n         \
        \   \"description\": \"secret_access_key\",\n            \"type\": \"string\"\
        ,\n            \"format\": \"password\"\n          }\n        }\n      }\n\
        \    }\n  }\n}"
rest_endpoint: /v2/object-storage/add-uris
api_version: v2
permalink: /rest-api-guide/object-storage-v2/v2_object-storage_add-uris.html
sidebar: rest_api_guide_sidebar
deprecated: false
---
