---
category: /Directory Quotas
methods:
  delete:
    parameters:
    - description: Directory ID
      name: id
      required: true
    - description: ETag for expected version
      name: If-Match
      required: false
    preview: false
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    summary: Delete the quota for a given directory.
  get:
    parameters:
    - description: Directory ID
      name: id
      required: true
    preview: false
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
    - description: Directory ID
      name: id
      required: true
    - description: ETag for expected version
      name: If-Match
      required: false
    preview: false
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
api_version: v1
permalink: /rest-api-guide/directory-quotas/files_quotas_id.html
sidebar: rest_api_guide_sidebar
---
