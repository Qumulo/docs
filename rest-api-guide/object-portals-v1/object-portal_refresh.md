---
category: /Object Portals V1
methods:
  post:
    summary: '[preview] Updates the bridge''s file or directory for one object now,
      rather than when the bucket''s change notification arrives, and works on a bridge
      with no notification queue. Use it when a file on the bridge doesn''t match
      its object. If the object exists, the refresh creates or updates the file to
      match it, including its content and metadata. If the object no longer exists,
      the refresh deletes the file, or removes the directory, along with any parent
      directories left empty. A file a client changed on the cluster is kept rather
      than deleted, as long as the bucket still holds the object version the file
      was read from. A bucket that refuses or fails the read answers HTTP 503 and
      leaves the file as it is. `mode` controls only metadata: MERGE, the default,
      keeps attributes changed on the cluster, and OVERWRITE replaces every attribute
      the object carries, which can''t be undone. On a bridge created with `metadata_import`
      OFF, the refresh updates the file''s existence and content but no metadata.
      Returns HTTP 404 if no bridge serves the bucket.'
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
