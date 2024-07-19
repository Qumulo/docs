---
category: /snapshots
methods:
  post:
    parameters:
    - description: The snapshot identifier.
      name: id
      required: true
    request_body:
      schema: "{\n  \"description\": \"api_snapshot_unlock\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"signature\": {\n      \"description\": \"signature\"\
        ,\n      \"type\": \"string\"\n    }\n  }\n}"
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    summary: Unlock the specified snapshot. After you unlock a snapshot, you can modify
      it.
rest_endpoint: /v3/snapshots/{id}/unlock
api_version: v3
permalink: /rest-api-guide/snapshots/id_unlock.html
sidebar: rest_api_guide_sidebar
---
