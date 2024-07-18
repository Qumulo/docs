---
category: /files
methods:
  post:
    parameters:
    - description: The snapshot ID that specifies the version of the filesystem to
        use. If not specified, use the head version.
      name: snapshot
      required: false
    request_body:
      example_value: '"TO DO"'
      schema: "{\n  \"type\": \"array\",\n  \"items\": {\n    \"type\": \"string\"\
        \n  }\n}"
    response_body:
      example_value: '"TO DO"'
      schema: "{\n  \"type\": \"array\",\n  \"items\": {\n    \"description\": \"\
        fs_api_ref_id_path\",\n    \"type\": \"object\",\n    \"properties\": {\n\
        \      \"id\": {\n        \"description\": \"Unique ID of this file or directory\"\
        ,\n        \"type\": \"string\"\n      },\n      \"path\": {\n        \"description\"\
        : \"Full path of this file or directory\",\n        \"type\": \"string\"\n\
        \      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Return the full paths for each specified file ID. If a file has more
      than one path (due to hard links) a canonical path is chosen.
rest_endpoint: /v1/files/resolve
permalink: /rest-api-guide/files/resolve.html
sidebar: rest_api_guide_sidebar
---
