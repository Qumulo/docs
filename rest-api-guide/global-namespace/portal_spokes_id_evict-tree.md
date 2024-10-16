---
category: /Global Namespace
methods:
  post:
    parameters:
    - description: Portal ID
      name: id
      required: true
    request_body:
      schema: "{\n  \"description\": \"api_portal_evict_tree_request\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"dir_id\": {\n      \"description\"\
        : \"ID of the directory of the tree to evict. The directory must belong to\
        \ a portal, and will itself be evicted unless it is the spoke root.\",\n \
        \     \"type\": \"string\"\n    }\n  }\n}"
    response_body: {}
    responses:
    - code: '202'
      description: Return value on success
    summary: Begin the background removal of data for a cached directory and all of
      its children.
rest_endpoint: /v1/portal/spokes/{id}/evict-tree
api_version: v1
permalink: /rest-api-guide/global-namespace/portal_spokes_id_evict-tree.html
sidebar: rest_api_guide_sidebar
---
