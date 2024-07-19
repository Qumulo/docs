---
category: /files
methods:
  delete:
    parameters:
    - description: Directory ID (uint64)
      name: id
      required: true
    - description: ETag for expected version
      name: If-Match
      required: false
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    summary: Delete the quota for a given directory.
  get:
    parameters:
    - description: Directory ID (uint64)
      name: id
      required: true
    response_body:
      schema: "{\n  \"description\": \"api_files_quota\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"id\": {\n      \"description\": \"Unique ID\
        \ of this directory.\",\n      \"type\": \"string\"\n    },\n    \"limit\"\
        : {\n      \"description\": \"Limit in bytes of the cumulative size of this\
        \ directory and its descendants.\",\n      \"type\": \"string\"\n    }\n \
        \ }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Get the directory quota for a directory and its limit in bytes
  put:
    parameters:
    - description: Directory ID (uint64)
      name: id
      required: true
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
      schema: "{\n  \"description\": \"api_files_quota\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"id\": {\n      \"description\": \"Unique ID\
        \ of this directory.\",\n      \"type\": \"string\"\n    },\n    \"limit\"\
        : {\n      \"description\": \"Limit in bytes of the cumulative size of this\
        \ directory and its descendants.\",\n      \"type\": \"string\"\n    }\n \
        \ }\n}"
    response_body:
      schema: "{\n  \"description\": \"api_files_quota\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"id\": {\n      \"description\": \"Unique ID\
        \ of this directory.\",\n      \"type\": \"string\"\n    },\n    \"limit\"\
        : {\n      \"description\": \"Limit in bytes of the cumulative size of this\
        \ directory and its descendants.\",\n      \"type\": \"string\"\n    }\n \
        \ }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Modify the quota for a given directory.
rest_endpoint: /v1/files/quotas/{id}
permalink: /rest-api-guide/files/quotas_id.html
sidebar: rest_api_guide_sidebar
---