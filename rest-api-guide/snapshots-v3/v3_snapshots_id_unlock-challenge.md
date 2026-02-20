---
category: /Snapshots V3
methods:
  get:
    summary: Generate a snapshot unlock challenge to provide in the subsequent unlock
      call.
    parameters:
    - name: id
      description: The snapshot identifier.
      required: true
    response_body:
      schema: "{\n  \"description\": \"api_snapshot_unlock_challenge\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"challenge\": {\n      \"description\"\
        : \"challenge\",\n      \"type\": \"string\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
rest_endpoint: /v3/snapshots/{id}/unlock-challenge
api_version: v3
permalink: /rest-api-guide/snapshots-v3/v3_snapshots_id_unlock-challenge.html
sidebar: rest_api_guide_sidebar
redirect_from: /rest-api-guide/snapshots/v3_snapshots_id_unlock-challenge.html
deprecated: false
---
