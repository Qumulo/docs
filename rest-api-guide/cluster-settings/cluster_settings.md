---
category: /Cluster Settings
methods:
  get:
    summary: Returns cluster settings.
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"api_cluster_name_settings\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"cluster_name\": {\n      \"description\"\
        : \"Name of the cluster\",\n      \"type\": \"string\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
  put:
    summary: Set the name of the cluster
    parameters:
    - name: If-Match
      description: ETag for expected version
      required: false
    response_body:
      schema: "{\n  \"description\": \"api_cluster_name_settings\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"cluster_name\": {\n      \"description\"\
        : \"Name of the cluster\",\n      \"type\": \"string\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
    request_body:
      schema: "{\n  \"description\": \"api_cluster_name_settings\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"cluster_name\": {\n      \"description\"\
        : \"Name of the cluster\",\n      \"type\": \"string\"\n    }\n  }\n}"
rest_endpoint: /v1/cluster/settings
api_version: v1
permalink: /rest-api-guide/cluster-settings/cluster_settings.html
sidebar: rest_api_guide_sidebar
---
