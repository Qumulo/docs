---
category: /Snapshots V3
methods:
  post:
    summary: Unlock the specified snapshot. After you unlock a snapshot, you can modify
      it.
    parameters:
    - name: id
      description: The snapshot identifier.
      required: true
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    preview: false
    request_body:
      schema: "{\n  \"description\": \"api_snapshot_unlock\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"signature\": {\n      \"description\": \"signature\"\
        ,\n      \"type\": \"string\"\n    }\n  }\n}"
rest_endpoint: /v3/snapshots/{id}/unlock
api_version: v3
permalink: /rest-api-guide/snapshots-v3/v3_snapshots_id_unlock.html
sidebar: rest_api_guide_sidebar
redirect_from: /rest-api-guide/snapshots/v3_snapshots_id_unlock.html
deprecated: false
---
