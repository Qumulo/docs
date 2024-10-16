---
category: /S3 Server Methods
methods:
  get:
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"api_bucket_description_list_model\",\n  \"\
        type\": \"object\",\n  \"properties\": {\n    \"buckets\": {\n      \"type\"\
        : \"array\",\n      \"items\": {\n        \"description\": \"buckets\",\n\
        \        \"type\": \"object\",\n        \"properties\": {\n          \"name\"\
        : {\n            \"description\": \"The name of the S3 bucket.\",\n      \
        \      \"type\": \"string\"\n          },\n          \"creation_time\": {\n\
        \            \"description\": \"The creation time of the S3 bucket.\",\n \
        \           \"type\": \"string\"\n          },\n          \"path\": {\n  \
        \          \"description\": \"The bucket root directory of the S3 bucket.\"\
        ,\n            \"type\": \"string\"\n          },\n          \"anonymous_access_enabled\"\
        : {\n            \"description\": \"Deprecated. To configure anonymous access\
        \ for an S3 bucket, use the qq s3_set_bucket policy command with an Allow\
        \ statement that targets the local:guest account.\",\n            \"type\"\
        : \"boolean\"\n          },\n          \"versioning\": {\n            \"description\"\
        : \"The versioning state of the current S3 bucket: Unversioned, Enabled, or\
        \ Suspended.\",\n            \"type\": \"string\"\n          },\n        \
        \  \"lock_config\": {\n            \"description\": \"The Object Lock configuration\
        \ for the S3 bucket.\",\n            \"type\": \"object\",\n            \"\
        properties\": {\n              \"enabled\": {\n                \"description\"\
        : \"Specifies whether Object Lock is enabled for the S3 bucket.\",\n     \
        \           \"type\": \"boolean\"\n              },\n              \"default_retention\"\
        : {\n                \"description\": \"The default retention period for the\
        \ S3 bucket.\",\n                \"type\": \"object\",\n                \"\
        properties\": {\n                  \"units\": {\n                    \"description\"\
        : \"The units of the retention, either DAYS or YEARS\",\n                \
        \    \"type\": \"string\"\n                  },\n                  \"value\"\
        : {\n                    \"description\": \"The number of either DAYS or YEARS\
        \ in the retention period\",\n                    \"type\": \"number\"\n \
        \                 }\n                }\n              }\n            }\n \
        \         }\n        }\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: List all S3 buckets present in the system.
  post:
    parameters: []
    request_body:
      schema: "{\n  \"description\": \"api_bucket_options\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"name\": {\n      \"description\": \"name\",\n\
        \      \"type\": \"string\"\n    },\n    \"path\": {\n      \"description\"\
        : \"The absolute path to the directory to use as bucket root directory. The\
        \ caller must have permission to look up this directory.\",\n      \"type\"\
        : \"string\"\n    },\n    \"create_fs_path\": {\n      \"description\": \"\
        Specifies whether to create the bucket root if it doesn't exist.\",\n    \
        \  \"type\": \"boolean\"\n    },\n    \"object_lock_enabled\": {\n      \"\
        description\": \"Specifies whether to enable object locking.\",\n      \"\
        type\": \"boolean\"\n    }\n  }\n}"
    response_body:
      schema: "{\n  \"description\": \"api_bucket_description\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"name\": {\n      \"description\": \"The name\
        \ of the S3 bucket.\",\n      \"type\": \"string\"\n    },\n    \"creation_time\"\
        : {\n      \"description\": \"The creation time of the S3 bucket.\",\n   \
        \   \"type\": \"string\"\n    },\n    \"path\": {\n      \"description\":\
        \ \"The bucket root directory of the S3 bucket.\",\n      \"type\": \"string\"\
        \n    },\n    \"anonymous_access_enabled\": {\n      \"description\": \"Deprecated.\
        \ To configure anonymous access for an S3 bucket, use the qq s3_set_bucket\
        \ policy command with an Allow statement that targets the local:guest account.\"\
        ,\n      \"type\": \"boolean\"\n    },\n    \"versioning\": {\n      \"description\"\
        : \"The versioning state of the current S3 bucket: Unversioned, Enabled, or\
        \ Suspended.\",\n      \"type\": \"string\"\n    },\n    \"lock_config\":\
        \ {\n      \"description\": \"The Object Lock configuration for the S3 bucket.\"\
        ,\n      \"type\": \"object\",\n      \"properties\": {\n        \"enabled\"\
        : {\n          \"description\": \"Specifies whether Object Lock is enabled\
        \ for the S3 bucket.\",\n          \"type\": \"boolean\"\n        },\n   \
        \     \"default_retention\": {\n          \"description\": \"The default retention\
        \ period for the S3 bucket.\",\n          \"type\": \"object\",\n        \
        \  \"properties\": {\n            \"units\": {\n              \"description\"\
        : \"The units of the retention, either DAYS or YEARS\",\n              \"\
        type\": \"string\"\n            },\n            \"value\": {\n           \
        \   \"description\": \"The number of either DAYS or YEARS in the retention\
        \ period\",\n              \"type\": \"number\"\n            }\n         \
        \ }\n        }\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Create a new S3 bucket.
rest_endpoint: /v1/s3/buckets/
api_version: v1
permalink: /rest-api-guide/s3-server-methods/s3_buckets.html
sidebar: rest_api_guide_sidebar
---
