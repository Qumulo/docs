---
category: /S3 Server Methods
methods:
  get:
    parameters:
    - description: Bucket name
      name: name
      required: true
    - description: Return entries after the given key (keys are returned in the paging
        object)
      name: after
      required: false
    - description: Return no more than this many entries; the system may choose a
        smaller limit.
      name: limit
      required: false
    response_body:
      schema: "{\n  \"description\": \"api_upload_description_list_model\",\n  \"\
        type\": \"object\",\n  \"properties\": {\n    \"uploads\": {\n      \"type\"\
        : \"array\",\n      \"items\": {\n        \"description\": \"uploads\",\n\
        \        \"type\": \"object\",\n        \"properties\": {\n          \"id\"\
        : {\n            \"description\": \"The ID of the S3 upload.\",\n        \
        \    \"type\": \"string\"\n          },\n          \"key\": {\n          \
        \  \"description\": \"The key for which the system initiates the upload.\"\
        ,\n            \"type\": \"string\"\n          },\n          \"bucket\": {\n\
        \            \"description\": \"The name of the S3 bucket to which the upload\
        \ belongs.\",\n            \"type\": \"string\"\n          },\n          \"\
        initiator\": {\n            \"description\": \"The system identity that represents\
        \ the user who initiated the upload.\",\n            \"type\": \"object\"\
        ,\n            \"properties\": {\n              \"domain\": {\n          \
        \      \"type\": \"string\",\n                \"enum\": [\n              \
        \    \"LOCAL\",\n                  \"API_NULL_DOMAIN\",\n                \
        \  \"WORLD\",\n                  \"POSIX_USER\",\n                  \"POSIX_GROUP\"\
        ,\n                  \"ACTIVE_DIRECTORY\",\n                  \"API_INVALID_DOMAIN\"\
        ,\n                  \"API_RESERVED_DOMAIN\",\n                  \"API_INTERNAL_DOMAIN\"\
        ,\n                  \"API_OPERATOR_DOMAIN\",\n                  \"API_CREATOR_DOMAIN\"\
        \n                ],\n                \"description\": \"domain:\\n * `ACTIVE_DIRECTORY`\
        \ - ACTIVE_DIRECTORY,\\n * `API_CREATOR_DOMAIN` - API_CREATOR_DOMAIN,\\n *\
        \ `API_INTERNAL_DOMAIN` - API_INTERNAL_DOMAIN,\\n * `API_INVALID_DOMAIN` -\
        \ API_INVALID_DOMAIN,\\n * `API_NULL_DOMAIN` - API_NULL_DOMAIN,\\n * `API_OPERATOR_DOMAIN`\
        \ - API_OPERATOR_DOMAIN,\\n * `API_RESERVED_DOMAIN` - API_RESERVED_DOMAIN,\\\
        n * `LOCAL` - LOCAL,\\n * `POSIX_GROUP` - POSIX_GROUP,\\n * `POSIX_USER` -\
        \ POSIX_USER,\\n * `WORLD` - WORLD\"\n              },\n              \"auth_id\"\
        : {\n                \"description\": \"auth_id\",\n                \"type\"\
        : \"string\"\n              },\n              \"uid\": {\n               \
        \ \"description\": \"uid\",\n                \"type\": \"number\"\n      \
        \        },\n              \"gid\": {\n                \"description\": \"\
        gid\",\n                \"type\": \"number\"\n              },\n         \
        \     \"sid\": {\n                \"description\": \"sid\",\n            \
        \    \"type\": \"string\"\n              },\n              \"name\": {\n \
        \               \"description\": \"name\",\n                \"type\": \"string\"\
        \n              }\n            }\n          },\n          \"initiated\": {\n\
        \            \"description\": \"The time at which the upload was initiated.\"\
        ,\n            \"type\": \"string\"\n          },\n          \"last_modified\"\
        : {\n            \"description\": \"The time at which the upload was modified\
        \ last.\",\n            \"type\": \"string\"\n          },\n          \"total_blocks\"\
        : {\n            \"description\": \"The total number of blocks (data and meta\
        \ blocks) that the upload has used.\",\n            \"type\": \"string\"\n\
        \          },\n          \"datablocks\": {\n            \"description\": \"\
        The number of data blocks that the upload has used.\",\n            \"type\"\
        : \"string\"\n          },\n          \"metablocks\": {\n            \"description\"\
        : \"The number of meta blocks that the upload has used.\",\n            \"\
        type\": \"string\"\n          },\n          \"completing\": {\n          \
        \  \"description\": \"The upload is in progress.\",\n            \"type\"\
        : \"boolean\"\n          },\n          \"system_initiated\": {\n         \
        \   \"description\": \"The system has initiated the current upload as part\
        \ of a different request.\",\n            \"type\": \"boolean\"\n        \
        \  }\n        }\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: List all in-progress S3 uploads for a specific bucket.
rest_endpoint: /v1/s3/buckets/{name}/uploads/
api_version: v1
permalink: /rest-api-guide/s3-server-methods/s3_buckets_name_uploads.html
sidebar: rest_api_guide_sidebar
---
