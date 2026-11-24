---
category: /Frozen V1
methods:
  post:
    summary: '[preview] Creates a Frozen bridge at `mount_path` and returns it. File
      access across the cluster pauses briefly while the cluster restarts its services,
      so create a bridge while clients are quiet. On AWS the bridge uses the bucket,
      event queue and archive class the request names; on a Qumulo-managed Azure cluster,
      storage Qumulo set aside for it. Returns HTTP 409 if another bridge already
      uses the bucket, and HTTP 503 while the cluster or AWS is briefly unavailable,
      which a retry clears. Other refusals say what to fix.'
    parameters: []
    response_body: {}
    responses:
    - code: '201'
      description: Return value on success
    preview: true
    request_body:
      schema: "{\n  \"description\": \"api_frozen_bridge_request\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"mount_path\": {\n      \"description\"\
        : \"Absolute path of the bridge's directory, which the create makes. Its parent\
        \ must exist, and must not be inside another bridge.\",\n      \"type\": \"\
        string\"\n    },\n    \"allow_archived_metadata_changes\": {\n      \"description\"\
        : \"When true, clients can change the metadata of a file that is frozen, offline\
        \ or restoring: its mode, owner, group, ACL, times and DOS attributes, and\
        \ its named streams. When false, every protocol and the REST API refuse those\
        \ changes with access denied. Defaults to false, and can't be changed after\
        \ creation.\",\n      \"type\": \"boolean\"\n    },\n    \"bucket_uri\": {\n\
        \      \"description\": \"AWS only, and required there: a versioned S3 bucket\
        \ that holds no objects.\",\n      \"type\": \"string\"\n    },\n    \"notification_queue_url\"\
        : {\n      \"description\": \"AWS only, and required there: the SQS queue,\
        \ in the bucket's region, that receives the bucket's restore events.\",\n\
        \      \"type\": \"string\"\n    },\n    \"archive_class\": {\n      \"type\"\
        : \"string\",\n      \"enum\": [\n        \"GLACIER\",\n        \"DEEP_ARCHIVE\"\
        \n      ],\n      \"description\": \"AWS only, and required there: the S3\
        \ storage class the bridge's freezes put files in, GLACIER or DEEP_ARCHIVE,\
        \ fixed for the bridge's life.:\\n * `DEEP_ARCHIVE` - S3 Glacier Deep Archive,\
        \ cheaper to store than GLACIER. AWS charges for at least 180 days of storage\
        \ for each object.,\\n * `GLACIER` - S3 Glacier Flexible Retrieval. AWS charges\
        \ for at least 90 days of storage for each object.\"\n    }\n  }\n}"
  get:
    summary: '[preview] Lists every Frozen bridge on the cluster, in path order.'
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"api_frozen_bridges\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"entries\": {\n      \"type\": \"array\",\n \
        \     \"items\": {\n        \"description\": \"Every Frozen bridge on the\
        \ cluster, in path order.\",\n        \"type\": \"object\",\n        \"properties\"\
        : {\n          \"filesystem_uuid\": {\n            \"description\": \"The\
        \ bridge's filesystem UUID.\",\n            \"type\": \"string\"\n       \
        \   },\n          \"mount_path\": {\n            \"description\": \"Absolute\
        \ path of the bridge's directory on the cluster, without a trailing slash.\"\
        ,\n            \"type\": \"string\"\n          },\n          \"allow_archived_metadata_changes\"\
        : {\n            \"description\": \"Whether clients can change the metadata\
        \ and named streams of a file that is frozen, offline or restoring; see the\
        \ create request's field.\",\n            \"type\": \"boolean\"\n        \
        \  },\n          \"provider\": {\n            \"type\": \"string\",\n    \
        \        \"enum\": [\n              \"AZURE\",\n              \"AWS\"\n  \
        \          ],\n            \"description\": \"The cloud whose storage holds\
        \ the bridge's data: AZURE or AWS.:\\n * `AWS` - The bridge's data is in an\
        \ S3 bucket in the cluster's AWS account, and a freeze puts it in the bridge's\
        \ `archive_class`.,\\n * `AZURE` - The bridge's data is in Azure storage that\
        \ Qumulo manages, and a freeze moves it to the Azure Archive tier.\"\n   \
        \       },\n          \"archive_class\": {\n            \"type\": \"string\"\
        ,\n            \"enum\": [\n              \"GLACIER\",\n              \"DEEP_ARCHIVE\"\
        \n            ],\n            \"description\": \"On AWS, the S3 storage class\
        \ the bridge's freezes put files in, chosen when the bridge was created. Absent\
        \ on Azure.:\\n * `DEEP_ARCHIVE` - S3 Glacier Deep Archive, cheaper to store\
        \ than GLACIER. AWS charges for at least 180 days of storage for each object.,\\\
        n * `GLACIER` - S3 Glacier Flexible Retrieval. AWS charges for at least 90\
        \ days of storage for each object.\"\n          },\n          \"restore_days_max\"\
        : {\n            \"description\": \"On AWS, the most days a thaw's `restore_days`\
        \ may be; the least is 1. Absent on Azure.\",\n            \"type\": \"number\"\
        \n          }\n        }\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: true
rest_endpoint: /v1/frozen/bridges/
api_version: v1
deprecated: false
permalink: /rest-api-guide/frozen-v1/frozen_bridges.html
sidebar: rest_api_guide_sidebar
---
