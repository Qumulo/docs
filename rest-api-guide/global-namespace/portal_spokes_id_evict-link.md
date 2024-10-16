---
category: /Global Namespace
methods:
  post:
    parameters:
    - description: Portal ID
      name: id
      required: true
    request_body:
      schema: "{\n  \"description\": \"api_portal_evict_link_request\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"dir_id\": {\n      \"description\"\
        : \"ID of the directory from which to evict a link. The directory must belong\
        \ to a portal.\",\n      \"type\": \"string\"\n    },\n    \"name\": {\n \
        \     \"description\": \"The name of the directory entry to unlink.\",\n \
        \     \"type\": \"string\"\n    }\n  }\n}"
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
    summary: Remove a cached link from a directory to one of its child files or directories.
      If no links remain between the directory and its child file or directory this
      operation also removes the cached child.
rest_endpoint: /v1/portal/spokes/{id}/evict-link
api_version: v1
permalink: /rest-api-guide/global-namespace/portal_spokes_id_evict-link.html
sidebar: rest_api_guide_sidebar
---
