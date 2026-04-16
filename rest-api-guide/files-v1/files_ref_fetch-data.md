---
category: /Files V1
methods:
  post:
    summary: '[preview] Performs a server-side read of the specified file region to
      populate cluster caches. Does not return file contents.'
    parameters:
    - name: ref
      description: The file ID or the absolute path to the file system object. File
        IDs can be found in the id field of responses of APIs that return file attributes.
        You must URL-encode the paths. The APIs & Tools page in the Qumulo Core Web
        UI URL-encodes the paths.
      required: true
    - name: If-Match
      description: ETag for expected version
      required: false
    response_body:
      schema: "{\n  \"description\": \"api_files_fetch_data_result\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"bytes_fetched\": {\n      \"description\"\
        : \"The number of bytes fetched into the cache.\",\n      \"type\": \"string\"\
        \n    },\n    \"next_offset\": {\n      \"description\": \"The offset (in\
        \ bytes) to use for the next fetch request. Empty at the end of the file.\"\
        ,\n      \"type\": \"string\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: true
    request_body:
      schema: "{\n  \"description\": \"api_files_fetch_data\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"offset\": {\n      \"description\": \"The offset\
        \ (in bytes) from where to begin fetching data.\",\n      \"type\": \"string\"\
        \n    },\n    \"length\": {\n      \"description\": \"The maximum number of\
        \ bytes to fetch. Equals to server target read size by default.\",\n     \
        \ \"type\": \"string\"\n    }\n  }\n}"
rest_endpoint: /v1/files/{ref}/fetch-data
api_version: v1
deprecated: false
permalink: /rest-api-guide/files-v1/files_ref_fetch-data.html
sidebar: rest_api_guide_sidebar
---
