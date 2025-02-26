---
category: /Cloud Data Fabric
methods:
  post:
    parameters:
    - description: File or Directory ID
      name: file_id
      required: true
    preview: true
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
    summary: '[preview] Reclaim all cluster capacity used by the targeted file or
      directory. This does not affect children of a targeted directory.'
rest_endpoint: /v1/portal/files/{file_id}/evict
api_version: v1
permalink: /rest-api-guide/cloud-data-fabric/portal_files_file_id_evict.html
sidebar: rest_api_guide_sidebar
redirect_from:
  - /rest-api-guide/global-namespace/portal_files_file_id_evict.html
---
