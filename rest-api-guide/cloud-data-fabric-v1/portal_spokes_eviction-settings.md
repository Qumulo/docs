---
category: /Cloud Data Fabric V1
methods:
  get:
    summary: Retrieve the configuration for recovering cluster capacity by removing
      cached data automatically.
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"v1_portal_eviction_settings\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"free_threshold\": {\n      \"description\"\
        : \"Fraction of free total cluster capacity that the system will try to maintain\
        \ by evicting cached spoke portal data, in the range [0.0, 1.0]. Default is\
        \ 0.15, 0.0 means no eviction, 1.0 means always evict.\",\n      \"type\"\
        : \"number\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
  put:
    summary: Overwrite the configuration for recovering cluster capacity by removing
      cached data automatically.
    parameters:
    - name: If-Match
      description: ETag for expected version
      required: false
    response_body:
      schema: "{\n  \"description\": \"v1_portal_eviction_settings\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"free_threshold\": {\n      \"description\"\
        : \"Fraction of free total cluster capacity that the system will try to maintain\
        \ by evicting cached spoke portal data, in the range [0.0, 1.0]. Default is\
        \ 0.15, 0.0 means no eviction, 1.0 means always evict.\",\n      \"type\"\
        : \"number\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
    request_body:
      schema: "{\n  \"description\": \"v1_portal_eviction_settings\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"free_threshold\": {\n      \"description\"\
        : \"Fraction of free total cluster capacity that the system will try to maintain\
        \ by evicting cached spoke portal data, in the range [0.0, 1.0]. Default is\
        \ 0.15, 0.0 means no eviction, 1.0 means always evict.\",\n      \"type\"\
        : \"number\"\n    }\n  }\n}"
  patch:
    summary: Change the configuration for recovering cluster capacity by removing
      cached data automatically.
    parameters:
    - name: If-Match
      description: ETag for expected version
      required: false
    response_body:
      schema: "{\n  \"description\": \"v1_portal_eviction_settings\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"free_threshold\": {\n      \"description\"\
        : \"Fraction of free total cluster capacity that the system will try to maintain\
        \ by evicting cached spoke portal data, in the range [0.0, 1.0]. Default is\
        \ 0.15, 0.0 means no eviction, 1.0 means always evict.\",\n      \"type\"\
        : \"number\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
    request_body:
      schema: "{\n  \"description\": \"v1_portal_eviction_settings\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"free_threshold\": {\n      \"description\"\
        : \"Fraction of free total cluster capacity that the system will try to maintain\
        \ by evicting cached spoke portal data, in the range [0.0, 1.0]. Default is\
        \ 0.15, 0.0 means no eviction, 1.0 means always evict.\",\n      \"type\"\
        : \"number\"\n    }\n  }\n}"
rest_endpoint: /v1/portal/spokes/eviction-settings
api_version: v1
permalink: /rest-api-guide/cloud-data-fabric-v1/portal_spokes_eviction-settings.html
sidebar: rest_api_guide_sidebar
redirect_from: /rest-api-guide/cloud-data-fabric/portal_spokes_eviction-settings.html
---
