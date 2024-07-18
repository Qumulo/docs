---
category: /cluster
methods:
  get:
    parameters: []
    response_body:
      description: Return value on success
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"api_cluster_name_settings\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"cluster_name\": {\n      \"description\"\
        : \"Name of the cluster\",\n      \"type\": \"string\"\n    }\n  }\n}"
      status_code: '200'
    summary: Returns cluster settings.
  put:
    parameters:
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"api_cluster_name_settings\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"cluster_name\": {\n      \"description\"\
        : \"Name of the cluster\",\n      \"type\": \"string\"\n    }\n  }\n}"
    response_body:
      description: Return value on success
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"api_cluster_name_settings\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"cluster_name\": {\n      \"description\"\
        : \"Name of the cluster\",\n      \"type\": \"string\"\n    }\n  }\n}"
      status_code: '200'
    summary: Set the name of the cluster
rest_endpoint: /v1/cluster/settings
permalink: /rest-api-guide/cluster/settings.html
sidebar: rest_api_guide_sidebar
---
