---
category: /Tree Delete
methods:
  get:
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"tree_delete_jobs_response\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"jobs\": {\n      \"type\": \"array\"\
        ,\n      \"items\": {\n        \"description\": \"jobs\",\n        \"type\"\
        : \"object\",\n        \"properties\": {\n          \"id\": {\n          \
        \  \"description\": \"The ID of the directory being deleted.\",\n        \
        \    \"type\": \"string\"\n          },\n          \"create_time\": {\n  \
        \          \"description\": \"The time the job was created. It may not have\
        \ started at that time if the system was processing other jobs.\",\n     \
        \       \"type\": \"string\"\n          },\n          \"mode\": {\n      \
        \      \"type\": \"string\",\n            \"enum\": [\n              \"IN_PLACE\"\
        ,\n              \"PORTAL_DELETION\",\n              \"PORTAL_EVICTION\"\n\
        \            ],\n            \"description\": \"The tree delete mode this\
        \ job is running in.:\\n * `IN_PLACE` - TREE_DELETE_IN_PLACE,\\n * `PORTAL_DELETION`\
        \ - TREE_DELETE_PORTAL_DELETION,\\n * `PORTAL_EVICTION` - TREE_DELETE_PORTAL_EVICTION\"\
        \n          },\n          \"initial_path\": {\n            \"description\"\
        : \"The path of the directory at the time the job was started.\",\n      \
        \      \"type\": \"string\"\n          },\n          \"initial_capacity\"\
        : {\n            \"description\": \"Initial bytes (data and metadata) used\
        \ by the tree being deleted.\",\n            \"type\": \"string\"\n      \
        \    },\n          \"initial_directories\": {\n            \"description\"\
        : \"Initial number of directories in the tree being deleted.\",\n        \
        \    \"type\": \"string\"\n          },\n          \"initial_files\": {\n\
        \            \"description\": \"Initial number of non-directory files in the\
        \ tree being deleted.\",\n            \"type\": \"string\"\n          },\n\
        \          \"remaining_capacity\": {\n            \"description\": \"Remaining\
        \ bytes (data and metadata) used by the tree being deleted.\",\n         \
        \   \"type\": \"string\"\n          },\n          \"remaining_directories\"\
        : {\n            \"description\": \"Remaining number of directories in the\
        \ tree being deleted.\",\n            \"type\": \"string\"\n          },\n\
        \          \"remaining_files\": {\n            \"description\": \"Remaining\
        \ number of non-directory files in the tree being deleted.\",\n          \
        \  \"type\": \"string\"\n          }\n        }\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Get status of all directory-tree deletion jobs.
  post:
    parameters: []
    request_body:
      schema: "{\n  \"description\": \"tree_delete_job_post\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"id\": {\n      \"description\": \"The file ID\
        \ or the absolute path to the file system object. File IDs can be found in\
        \ the id field of responses of APIs that return file attributes. You must\
        \ URL-encode the paths. The APIs & Tools page in the Qumulo Core Web UI URL-encodes\
        \ the paths.\",\n      \"type\": \"string\"\n    }\n  }\n}"
    response_body: {}
    responses:
    - code: '202'
      description: Return value on success
    summary: Start unlinking this directory and all its contents.
rest_endpoint: /v1/tree-delete/jobs/
api_version: v1
permalink: /rest-api-guide/tree-delete/tree-delete_jobs.html
sidebar: rest_api_guide_sidebar
---
