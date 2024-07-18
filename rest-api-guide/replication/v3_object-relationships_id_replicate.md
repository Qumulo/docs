---
category: /replication
methods:
  post:
    parameters:
    - description: Relationship identifier
      name: id
      required: true
    response_body:
      description: Return value on success
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"api_monitor_uri\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"monitor_uri\": {\n      \"description\": \"\
        monitor_uri\",\n      \"type\": \"string\"\n    }\n  }\n}"
      status_code: '202'
    summary: Start a new replication job for the specified object relationship
rest_endpoint: /v3/replication/object-relationships/{id}/replicate
permalink: /rest-api-guide/replication/v3_object-relationships_id_replicate.html
sidebar: rest_api_guide_sidebar
---
