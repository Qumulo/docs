---
category: /Object Portals V1
methods:
  post:
    summary: '[preview] Creates a bridge filesystem rooted at the given external bucket
      prefix. Requires a license whose `object_bridges` level permits the requested
      mode or, on a Qumulo-managed Azure cluster, a `key_vault_hostname` naming the
      cluster''s own key vault, an arrangement Qumulo operations sets up. Without
      either the call returns HTTP 404; a license that permits only READ_ONLY bridges
      refuses a READ_WRITE_EXPORT one with HTTP 403. A bucket that holds one of the
      cluster''s own object stores, or a Qumulo account''s managed container reached
      through the cluster''s vault, is refused with HTTP 409. A cluster that already
      holds `fs_bridge_max_count` bridges refuses the create with HTTP 409. The bridge
      sends no credentials of its own, or SAS tokens when `key_vault_hostname` names
      a vault.'
    parameters: []
    response_body: {}
    responses:
    - code: '201'
      description: Return value on success
    preview: true
    request_body:
      schema: "{\n  \"description\": \"api_object_bridge_request\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"bucket_uri\": {\n      \"description\"\
        : \"Full URI for the bucket. Examples: https://my-bucket.s3.us-west-2.amazonaws.com/\
        \ or https://myaccount.blob.core.windows.net/my-container\",\n      \"type\"\
        : \"string\"\n    },\n    \"mount_path\": {\n      \"description\": \"Absolute\
        \ path in the primary filesystem where the bridge will be mounted. The parent\
        \ directory must already exist; the basename is created during bridge creation\
        \ and becomes the bridge's mount point.\",\n      \"type\": \"string\"\n \
        \   },\n    \"key_prefix\": {\n      \"description\": \"Optional prefix inside\
        \ the bucket, matched against object keys as it is written. Must end with\
        \ the delimiter. An empty prefix is refused; omit the field to bridge the\
        \ whole bucket.\",\n      \"type\": \"string\"\n    },\n    \"delimiter\"\
        : {\n      \"description\": \"Object-key separator used to project bridge\
        \ directories. Required and must be non-empty.\",\n      \"type\": \"string\"\
        \n    },\n    \"key_vault_hostname\": {\n      \"description\": \"Azure Key\
        \ Vault hostname (e.g. my-vault.vault.azure.net) from which to fetch SAS tokens\
        \ for an Azure Blob bucket. Required for Azure buckets; omit for an AWS bucket.\"\
        ,\n      \"type\": \"string\"\n    },\n    \"notification_queue_url\": {\n\
        \      \"description\": \"Optional SQS queue URL for bucket-side change notifications\
        \ on an AWS S3 bucket. When set, qfsd long-polls this queue and routes events\
        \ into the bridge fs. Refused unless it has the form https://sqs.<region>.amazonaws.com/<account>/<queue>.\"\
        ,\n      \"type\": \"string\"\n    },\n    \"protocol_access\": {\n      \"\
        type\": \"string\",\n      \"enum\": [\n        \"READ_WRITE_EXPORT\",\n \
        \       \"READ_ONLY\"\n      ],\n      \"description\": \"READ_ONLY stops\
        \ protocol front doors from changing the bridge filesystem's data or namespace;\
        \ file attributes stay writable and internal convergence still writes. READ_WRITE_EXPORT\
        \ leaves both writable and requires the backing bucket to have versioning\
        \ enabled. Required; immutable after creation.:\\n * `READ_ONLY` - BRIDGE_PROTOCOL_READ_ONLY,\\\
        n * `READ_WRITE_EXPORT` - BRIDGE_PROTOCOL_READ_WRITE_EXPORT\"\n    },\n  \
        \  \"metadata_import\": {\n      \"type\": \"string\",\n      \"enum\": [\n\
        \        \"OFF\",\n        \"AUTO\"\n      ],\n      \"description\": \"Selects\
        \ import of file-mover object metadata (ownership, permissions, ACLs, timestamps,\
        \ DOS attributes) onto bridge inodes. AUTO translates each object matching\
        \ a known mover dialect; OFF inherits everything from the parent directory\
        \ with no per-object metadata reads. Required; immutable after creation.:\\\
        n * `AUTO` - BRIDGE_METADATA_IMPORT_AUTO,\\n * `OFF` - BRIDGE_METADATA_IMPORT_OFF\"\
        \n    }\n  }\n}"
  get:
    summary: '[preview] Lists every bridge on the cluster with its full configuration.
      A bridge appears as soon as its creation commits, before the quorum restart
      that joins its filesystem. A cluster with no bridges answers with an empty list,
      whatever its license or storage layout. Bridges are listed in filesystem UUID
      order. The list is not paginated. A bridge whose configuration or mount point
      cannot be read fails the whole call with HTTP 500. No credential material is
      ever returned.'
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"api_object_bridges\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"entries\": {\n      \"type\": \"array\",\n \
        \     \"items\": {\n        \"description\": \"Every bridge on the cluster,\
        \ in filesystem id order.\",\n        \"type\": \"object\",\n        \"properties\"\
        : {\n          \"filesystem_uuid\": {\n            \"description\": \"Filesystem\
        \ UUID of the bridge\",\n            \"type\": \"string\"\n          },\n\
        \          \"mount_path\": {\n            \"description\": \"Absolute path\
        \ in the primary filesystem where the bridge is mounted, written without a\
        \ trailing slash.\",\n            \"type\": \"string\"\n          },\n   \
        \       \"bucket_uri\": {\n            \"description\": \"Full URI of the\
        \ bridge's bucket.\",\n            \"type\": \"string\"\n          },\n  \
        \        \"key_prefix\": {\n            \"description\": \"Prefix inside the\
        \ bucket the bridge serves. Absent when the bridge serves the whole bucket.\"\
        ,\n            \"type\": \"string\"\n          },\n          \"delimiter\"\
        : {\n            \"description\": \"Object-key separator the bridge projects\
        \ directories from.\",\n            \"type\": \"string\"\n          },\n \
        \         \"key_vault_hostname\": {\n            \"description\": \"Azure\
        \ Key Vault hostname the bridge fetches SAS tokens from. Absent unless the\
        \ bucket is reached through a key vault.\",\n            \"type\": \"string\"\
        \n          },\n          \"notification_queue_url\": {\n            \"description\"\
        : \"Queue URL the bridge polls for bucket-side change notifications. Absent\
        \ when the bridge has none.\",\n            \"type\": \"string\"\n       \
        \   },\n          \"protocol_access\": {\n            \"type\": \"string\"\
        ,\n            \"enum\": [\n              \"READ_WRITE_EXPORT\",\n       \
        \       \"READ_ONLY\"\n            ],\n            \"description\": \"Whether\
        \ protocol front doors may change the bridge filesystem's data and namespace.:\\\
        n * `READ_ONLY` - BRIDGE_PROTOCOL_READ_ONLY,\\n * `READ_WRITE_EXPORT` - BRIDGE_PROTOCOL_READ_WRITE_EXPORT\"\
        \n          },\n          \"metadata_import\": {\n            \"type\": \"\
        string\",\n            \"enum\": [\n              \"OFF\",\n             \
        \ \"AUTO\"\n            ],\n            \"description\": \"Whether the bridge\
        \ imports file-mover object metadata onto its inodes.:\\n * `AUTO` - BRIDGE_METADATA_IMPORT_AUTO,\\\
        n * `OFF` - BRIDGE_METADATA_IMPORT_OFF\"\n          }\n        }\n      }\n\
        \    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: true
rest_endpoint: /v1/object-portal/bridges/
api_version: v1
deprecated: false
permalink: /rest-api-guide/object-portals-v1/object-portal_bridges.html
sidebar: rest_api_guide_sidebar
---
