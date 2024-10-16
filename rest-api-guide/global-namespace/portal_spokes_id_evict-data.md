---
category: /Global Namespace
methods:
  post:
    parameters:
    - description: Portal ID
      name: id
      required: true
    request_body:
      schema: "{\n  \"description\": \"api_portal_evict_data_request\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"file_id\": {\n      \"description\"\
        : \"ID of the file to evict data from. The file must belong to a portal.\"\
        ,\n      \"type\": \"string\"\n    }\n  }\n}"
    response_body:
      schema: "{\n  \"description\": \"api_portal_eviction_result\",\n  \"type\":\
        \ \"object\",\n  \"properties\": {\n    \"evicted_blocks\": {\n      \"description\"\
        : \"Number of 4096 byte blocks that have been freed. It can be less than requested\
        \ and even 0 if no eviction was possible. The cluster's reported free capacity\
        \ may take time to reflect the eviction.\",\n      \"type\": \"string\"\n\
        \    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Recover cluster capacity by removing cached file data.
rest_endpoint: /v1/portal/spokes/{id}/evict-data
api_version: v1
permalink: /rest-api-guide/global-namespace/portal_spokes_id_evict-data.html
sidebar: rest_api_guide_sidebar
---
