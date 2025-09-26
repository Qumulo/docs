---
category: /S3 Server Methods V1
methods:
  delete:
    summary: Delete an existing S3 bucket.
    parameters:
    - name: name
      description: Bucket name
      required: true
    - name: delete-root-dir
      description: If set to true, the root directory of the bucket will also be unlinked.
        Otherwise the root directory is not unlinked.
      required: true
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    preview: false
  patch:
    summary: Modify the versioning status or lock configuration for the specified
      S3 bucket
    parameters:
    - name: name
      description: Bucket name
      required: true
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
    preview: false
    request_body:
      schema: "{\n  \"description\": \"api_bucket_patch\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"anonymous_access_enabled\": {\n      \"description\"\
        : \"[Deprecated] Use bucket policies to enable anonymous access\",\n     \
        \ \"type\": \"boolean\"\n    },\n    \"versioning\": {\n      \"description\"\
        : \"The versioning state of the S3 bucket: Unversioned, Enabled, or Suspended.\
        \ Note: These values are case sensitive.\",\n      \"type\": \"string\"\n\
        \    },\n    \"lock_config\": {\n      \"description\": \"The lock configuration\
        \ of the S3 bucket.\",\n      \"type\": \"object\",\n      \"properties\"\
        : {\n        \"enabled\": {\n          \"description\": \"Specifies whether\
        \ Object Lock is enabled for the S3 bucket.\",\n          \"type\": \"boolean\"\
        \n        },\n        \"default_retention\": {\n          \"description\"\
        : \"The default retention period for the S3 bucket.\",\n          \"type\"\
        : \"object\",\n          \"properties\": {\n            \"units\": {\n   \
        \           \"description\": \"The units of the retention, either DAYS or\
        \ YEARS\",\n              \"type\": \"string\"\n            },\n         \
        \   \"value\": {\n              \"description\": \"The number of either DAYS\
        \ or YEARS in the retention period\",\n              \"type\": \"number\"\n\
        \            }\n          }\n        }\n      }\n    }\n  }\n}"
rest_endpoint: /v1/s3/buckets/{name}
api_version: v1
permalink: /rest-api-guide/s3-server-methods-v1/s3_buckets_name.html
sidebar: rest_api_guide_sidebar
redirect_from: /rest-api-guide/s3-server-methods/s3_buckets_name.html
---
