---
category: /Object Portals V1
methods:
  post:
    summary: '[preview] Converge one object key against the bucket now, without waiting
      for a change event. Works on a bridge with no event queue configured. A refresh
      re-evaluates the key''s whole convergence state: it may create the file, resolve
      a name conflict by displacement, refresh content and identity, re-import user
      metadata, or -- when the object no longer exists in the bucket -- delete the
      file, or drop a directory''s marker and remove a chain of empty parent directories.
      Deletion is mode-independent: `mode` governs metadata application only. MERGE
      (the default) leaves locally changed attributes alone; OVERWRITE discards them
      for every attribute the object carries and cannot be undone. On a bridge created
      with metadata_import=OFF the refresh still converges existence, content, and
      identity, but imports no metadata. A bucket no bridge serves answers HTTP 404.'
    parameters: []
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    preview: true
    request_body:
      schema: "{\n  \"description\": \"api_bridge_refresh_request\",\n  \"type\":\
        \ \"object\",\n  \"properties\": {\n    \"bucket_uri\": {\n      \"description\"\
        : \"Bucket URI as it appears in the bridge's configuration\",\n      \"type\"\
        : \"string\"\n    },\n    \"key\": {\n      \"description\": \"Object key\
        \ within the bucket. A directory is named by its marker key, including the\
        \ trailing delimiter.\",\n      \"type\": \"string\"\n    },\n    \"mode\"\
        : {\n      \"type\": \"string\",\n      \"enum\": [\n        \"MERGE\",\n\
        \        \"OVERWRITE\"\n      ],\n      \"description\": \"MERGE re-reads\
        \ the object and applies what changed, leaving alone any attribute changed\
        \ locally since the last import. OVERWRITE discards local changes to every\
        \ attribute the object carries, and is destructive: an administrator's ownership,\
        \ permission, timestamp, and DOS-attribute edits on this file are lost. Attributes\
        \ the object does not carry are left alone either way. Treated as MERGE when\
        \ omitted.:\\n * `MERGE` - API_BRIDGE_REFRESH_MERGE,\\n * `OVERWRITE` - API_BRIDGE_REFRESH_OVERWRITE\"\
        \n    }\n  }\n}"
rest_endpoint: /v1/object-portal/refresh
api_version: v1
deprecated: false
permalink: /rest-api-guide/object-portals-v1/object-portal_refresh.html
sidebar: rest_api_guide_sidebar
---
