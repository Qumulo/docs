---
category: /snapshots
methods:
  post:
    parameters:
    - description: The snapshot identifier.
      name: id
      required: true
    request_body:
      schema: "{\n  \"description\": \"api_snapshot_lock\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"lock_key_ref\": {\n      \"description\": \"\
        lock_key_ref\",\n      \"type\": \"string\"\n    }\n  }\n}"
    response_body:
      schema: "{\n  \"description\": \"api_snapshot_lock\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"lock_key_ref\": {\n      \"description\": \"\
        lock_key_ref\",\n      \"type\": \"string\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Lock the specified snapshot. The only modification you can make to a
      locked snapshot is extending its expiration time.
rest_endpoint: /v3/snapshots/{id}/lock
permalink: /rest-api-guide/snapshots/v3_id_lock.html
sidebar: rest_api_guide_sidebar
---
