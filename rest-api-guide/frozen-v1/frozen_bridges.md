---
category: /Frozen V1
methods:
  post:
    summary: '[preview] Creates a Frozen bridge at `mount_path` over Azure storage
      that Qumulo has set aside for this cluster, and returns the bridge. File access
      across the cluster pauses briefly during this call while the cluster restarts
      its services, so create a bridge while clients are quiet. The bridge is listed
      as soon as the call returns, shortly before it can be used. Returns HTTP 400
      if `mount_path` isn''t absolute or already exists, or its parent isn''t a directory
      or is inside another bridge; HTTP 409 if the cluster has as many bridges as
      it allows, no storage is ready for another Frozen bridge, or the bridge this
      call created was deleted before the call returned; HTTP 412 while the cluster''s
      REST file IDs leave out the filesystem ID; HTTP 503 while the cluster is still
      preparing for bridges, which a retry shortly after clears, or if the storage
      set aside can''t be used right now; and HTTP 404 if this cluster can''t have
      Frozen bridges. For no storage ready, or storage that can''t be used, contact
      Qumulo.'
    parameters: []
    response_body: {}
    responses:
    - code: '201'
      description: Return value on success
    preview: true
    request_body:
      schema: "{\n  \"description\": \"api_frozen_bridge_request\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"mount_path\": {\n      \"description\"\
        : \"Absolute path of the bridge's directory, which the create makes. Its parent\
        \ must exist, and must not be inside another bridge.\",\n      \"type\": \"\
        string\"\n    },\n    \"allow_archived_metadata_changes\": {\n      \"description\"\
        : \"When true, clients can change the metadata of a file that is frozen, offline\
        \ or restoring: its mode, owner, group, ACL, times and DOS attributes, and\
        \ its named streams. When false, every protocol and the REST API refuse those\
        \ changes with access denied. Defaults to false, and can't be changed after\
        \ creation.\",\n      \"type\": \"boolean\"\n    }\n  }\n}"
  get:
    summary: '[preview] Lists every Frozen bridge on the cluster, in path order.'
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"api_frozen_bridges\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"entries\": {\n      \"type\": \"array\",\n \
        \     \"items\": {\n        \"description\": \"Every Frozen bridge on the\
        \ cluster, in path order.\",\n        \"type\": \"object\",\n        \"properties\"\
        : {\n          \"filesystem_uuid\": {\n            \"description\": \"The\
        \ bridge's filesystem UUID.\",\n            \"type\": \"string\"\n       \
        \   },\n          \"mount_path\": {\n            \"description\": \"Absolute\
        \ path of the bridge's directory on the cluster, without a trailing slash.\"\
        ,\n            \"type\": \"string\"\n          },\n          \"allow_archived_metadata_changes\"\
        : {\n            \"description\": \"Whether clients can change the metadata\
        \ and named streams of a file that is frozen, offline or restoring; see the\
        \ create request's field.\",\n            \"type\": \"boolean\"\n        \
        \  }\n        }\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: true
rest_endpoint: /v1/frozen/bridges/
api_version: v1
deprecated: false
permalink: /rest-api-guide/frozen-v1/frozen_bridges.html
sidebar: rest_api_guide_sidebar
---
