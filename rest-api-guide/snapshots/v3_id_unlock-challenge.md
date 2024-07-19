---
category: /snapshots
methods:
  get:
    parameters:
    - description: The snapshot identifier.
      name: id
      required: true
    response_body:
      schema: "{\n  \"description\": \"api_snapshot_unlock_challenge\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"challenge\": {\n      \"description\"\
        : \"challenge\",\n      \"type\": \"string\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Generate a snapshot unlock challenge to provide in the subsequent unlock
      call.
rest_endpoint: /v3/snapshots/{id}/unlock-challenge
permalink: /rest-api-guide/snapshots/v3_id_unlock-challenge.html
sidebar: rest_api_guide_sidebar
---
