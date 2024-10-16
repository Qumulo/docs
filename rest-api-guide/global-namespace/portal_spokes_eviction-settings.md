---
category: /Global Namespace
methods:
  get:
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"api_portal_eviction_settings\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"free_threshold\": {\n      \"description\"\
        : \"Fraction of free total cluster capacity that the system will try to maintain\
        \ by evicting cached spoke portal data, in the range [0.0, 1.0]. Default is\
        \ 0.15, 0.0 means no eviction, 1.0 means always evict.\",\n      \"type\"\
        : \"number\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Retrieve the configuration for recovering cluster capacity by removing
      cached data automatically.
  patch:
    parameters:
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
      schema: "{\n  \"description\": \"api_portal_eviction_settings\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"free_threshold\": {\n      \"description\"\
        : \"Fraction of free total cluster capacity that the system will try to maintain\
        \ by evicting cached spoke portal data, in the range [0.0, 1.0]. Default is\
        \ 0.15, 0.0 means no eviction, 1.0 means always evict.\",\n      \"type\"\
        : \"number\"\n    }\n  }\n}"
    response_body:
      schema: "{\n  \"description\": \"api_portal_eviction_settings\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"free_threshold\": {\n      \"description\"\
        : \"Fraction of free total cluster capacity that the system will try to maintain\
        \ by evicting cached spoke portal data, in the range [0.0, 1.0]. Default is\
        \ 0.15, 0.0 means no eviction, 1.0 means always evict.\",\n      \"type\"\
        : \"number\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Change the configuration for recovering cluster capacity by removing
      cached data automatically.
  put:
    parameters:
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
      schema: "{\n  \"description\": \"api_portal_eviction_settings\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"free_threshold\": {\n      \"description\"\
        : \"Fraction of free total cluster capacity that the system will try to maintain\
        \ by evicting cached spoke portal data, in the range [0.0, 1.0]. Default is\
        \ 0.15, 0.0 means no eviction, 1.0 means always evict.\",\n      \"type\"\
        : \"number\"\n    }\n  }\n}"
    response_body:
      schema: "{\n  \"description\": \"api_portal_eviction_settings\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"free_threshold\": {\n      \"description\"\
        : \"Fraction of free total cluster capacity that the system will try to maintain\
        \ by evicting cached spoke portal data, in the range [0.0, 1.0]. Default is\
        \ 0.15, 0.0 means no eviction, 1.0 means always evict.\",\n      \"type\"\
        : \"number\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Overwrite the configuration for recovering cluster capacity by removing
      cached data automatically.
rest_endpoint: /v1/portal/spokes/eviction-settings
api_version: v1
permalink: /rest-api-guide/global-namespace/portal_spokes_eviction-settings.html
sidebar: rest_api_guide_sidebar
---
