---
category: /Object Portals V1
methods:
  post:
    summary: '[preview] Creates a bridge filesystem rooted at the given external bucket
      prefix. Requires a license whose `object_bridges` level permits the requested
      mode or, on a Qumulo-managed Azure cluster, a `key_vault_hostname` naming the
      cluster''s own key vault, an arrangement Qumulo operations sets up. Without
      either the call returns HTTP 404; a license that permits only READ_ONLY bridges
      refuses a READ_WRITE_EXPORT one with HTTP 403. A FROZEN bridge requires a Qumulo-managed
      Azure cluster and a `key_vault_hostname` naming the cluster''s own key vault,
      and is refused with HTTP 400 otherwise. A bucket that holds one of the cluster''s
      own object stores, or a Qumulo account''s managed container reached through
      the cluster''s vault, is refused with HTTP 409. A FROZEN bridge requires a container
      that holds no objects under its `key_prefix`, and is refused with HTTP 409 otherwise.
      A cluster that already holds `fs_bridge_max_count` bridges refuses the create
      with HTTP 409, and while the `fs_api_file_id_omit_fs_id` tunable is set every
      create is refused with HTTP 412. A READ_WRITE_EXPORT bridge over an AWS S3 bucket
      requires `notification_queue_url`, and the create is refused with HTTP 400 without
      it. `allow_archived_metadata_changes` on a bridge that is not FROZEN is refused
      with HTTP 400. On Azure, the create is refused with HTTP 400 when the storage
      account has no change feed, when the bridge''s credentials can''t read it, or
      when the cluster can''t confirm it can read it. The bridge sends no credentials
      of its own, or SAS tokens when `key_vault_hostname` names a vault.'
    parameters: []
    response_body: {}
    responses:
    - code: '201'
      description: Return value on success
    preview: true
    request_body:
      schema: "{\n  \"description\": \"api_object_bridge_request\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"bucket_uri\": {\n      \"description\"\
        : \"Full URI of the bucket, including the container for Azure. Examples: https://my-bucket.s3.us-west-2.amazonaws.com/\
        \ or https://myaccount.blob.core.windows.net/my-container\",\n      \"type\"\
        : \"string\"\n    },\n    \"mount_path\": {\n      \"description\": \"Absolute\
        \ path on the cluster for the bridge's directory, such as `/archive`. The\
        \ parent directory must already exist, and creating the bridge creates the\
        \ last component.\",\n      \"type\": \"string\"\n    },\n    \"key_prefix\"\
        : {\n      \"description\": \"Optional. The bridge covers only objects whose\
        \ names start with this prefix, matched exactly, including case. Must end\
        \ with the delimiter, as in `projects/`. An empty prefix is refused; omit\
        \ the field to cover the whole bucket.\",\n      \"type\": \"string\"\n  \
        \  },\n    \"delimiter\": {\n      \"description\": \"The one character in\
        \ object names that separates directories, usually `/`. Required.\",\n   \
        \   \"type\": \"string\"\n    },\n    \"key_vault_hostname\": {\n      \"\
        description\": \"Azure Key Vault hostname, such as my-vault.vault.azure.net,\
        \ from which the cluster fetches SAS tokens for an Azure Blob container. Required\
        \ for Azure; omit for AWS. For a Frozen bridge, it must be the cluster's own\
        \ key vault, which Qumulo sets up.\",\n      \"type\": \"string\"\n    },\n\
        \    \"notification_queue_url\": {\n      \"description\": \"SQS queue URL\
        \ for bucket-side change notifications on an AWS S3 bucket. Required for a\
        \ READ_WRITE_EXPORT bridge over an AWS bucket; optional otherwise, and omitted\
        \ for a bucket that is not AWS S3. When set, the cluster reads this queue\
        \ to learn of changes made directly in the bucket. Refused unless it has the\
        \ form https://sqs.<region>.amazonaws.com/<account>/<queue>.\",\n      \"\
        type\": \"string\"\n    },\n    \"protocol_access\": {\n      \"type\": \"\
        string\",\n      \"enum\": [\n        \"READ_WRITE_EXPORT\",\n        \"READ_ONLY\"\
        ,\n        \"FROZEN\"\n      ],\n      \"description\": \"How clients can\
        \ change files on the bridge. Required, and can't be changed later. READ_ONLY:\
        \ clients can read files and change their permissions and other metadata,\
        \ but not their data or names; the bridge still picks up changes made in the\
        \ bucket. READ_WRITE_EXPORT: clients can change anything; requires bucket\
        \ versioning. FROZEN: a Frozen bridge. Freeze jobs move files to the Azure\
        \ Archive tier and thaw jobs bring them back (see the Frozen endpoints); only\
        \ those jobs change the bucket. Clients can't change the data of a file that\
        \ is frozen, offline or restoring, delete it or replace it at its path, and\
        \ can change its metadata and named streams only on a bridge created with\
        \ allow_archived_metadata_changes. They can change any other file. Requires\
        \ a Qumulo-managed Azure cluster, the cluster's own key vault in key_vault_hostname,\
        \ and a versioned container that holds no objects under key_prefix.:\\n *\
        \ `FROZEN` - BRIDGE_PROTOCOL_FROZEN,\\n * `READ_ONLY` - BRIDGE_PROTOCOL_READ_ONLY,\\\
        n * `READ_WRITE_EXPORT` - BRIDGE_PROTOCOL_READ_WRITE_EXPORT\"\n    },\n  \
        \  \"metadata_import\": {\n      \"type\": \"string\",\n      \"enum\": [\n\
        \        \"OFF\",\n        \"AUTO\"\n      ],\n      \"description\": \"Whether\
        \ files take their ownership, permissions, ACLs, timestamps and DOS attributes\
        \ from metadata a file-copy tool stored on each object. AUTO reads it from\
        \ each object that carries it in a format the cluster recognizes. OFF reads\
        \ no object metadata, and every file takes these from its parent directory.\
        \ Required, and can't be changed after creation.:\\n * `AUTO` - BRIDGE_METADATA_IMPORT_AUTO,\\\
        n * `OFF` - BRIDGE_METADATA_IMPORT_OFF\"\n    },\n    \"allow_archived_metadata_changes\"\
        : {\n      \"description\": \"Optional, for a FROZEN bridge only. When true,\
        \ clients can change the metadata of a file that is frozen, offline or restoring:\
        \ its mode, owner, group, ACL, times and DOS attributes, and its named streams.\
        \ When false, every protocol and the REST API refuse those changes with access\
        \ denied. Defaults to false, is refused for any other protocol_access, and\
        \ can't be changed after creation.\",\n      \"type\": \"boolean\"\n    }\n\
        \  }\n}"
  get:
    summary: '[preview] Lists every bridge on the cluster with its configuration,
      in filesystem UUID order. A new bridge is listed as soon as it is created, shortly
      before it can be used. A cluster with no bridges returns an empty list. The
      list is not paged. Credentials are never returned.'
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"api_object_bridges\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"entries\": {\n      \"type\": \"array\",\n \
        \     \"items\": {\n        \"description\": \"Every bridge on the cluster,\
        \ in filesystem id order.\",\n        \"type\": \"object\",\n        \"properties\"\
        : {\n          \"filesystem_uuid\": {\n            \"description\": \"The\
        \ bridge's filesystem UUID.\",\n            \"type\": \"string\"\n       \
        \   },\n          \"mount_path\": {\n            \"description\": \"Absolute\
        \ path of the bridge's directory on the cluster, without a trailing slash.\"\
        ,\n            \"type\": \"string\"\n          },\n          \"bucket_uri\"\
        : {\n            \"description\": \"Full URI of the bridge's bucket.\",\n\
        \            \"type\": \"string\"\n          },\n          \"key_prefix\"\
        : {\n            \"description\": \"The prefix of the object names the bridge\
        \ covers. Absent when the bridge covers the whole bucket.\",\n           \
        \ \"type\": \"string\"\n          },\n          \"delimiter\": {\n       \
        \     \"description\": \"The character in object names that separates directories.\"\
        ,\n            \"type\": \"string\"\n          },\n          \"key_vault_hostname\"\
        : {\n            \"description\": \"Azure Key Vault hostname the bridge fetches\
        \ SAS tokens from. Absent unless the bucket is reached through a key vault.\"\
        ,\n            \"type\": \"string\"\n          },\n          \"notification_queue_url\"\
        : {\n            \"description\": \"The SQS queue URL the cluster reads to\
        \ learn of changes made in the bucket. Absent when the bridge has none.\"\
        ,\n            \"type\": \"string\"\n          },\n          \"protocol_access\"\
        : {\n            \"type\": \"string\",\n            \"enum\": [\n        \
        \      \"READ_WRITE_EXPORT\",\n              \"READ_ONLY\",\n            \
        \  \"FROZEN\"\n            ],\n            \"description\": \"How clients\
        \ can change files on the bridge, and whether it is a Frozen bridge; see the\
        \ create request's field.:\\n * `FROZEN` - BRIDGE_PROTOCOL_FROZEN,\\n * `READ_ONLY`\
        \ - BRIDGE_PROTOCOL_READ_ONLY,\\n * `READ_WRITE_EXPORT` - BRIDGE_PROTOCOL_READ_WRITE_EXPORT\"\
        \n          },\n          \"metadata_import\": {\n            \"type\": \"\
        string\",\n            \"enum\": [\n              \"OFF\",\n             \
        \ \"AUTO\"\n            ],\n            \"description\": \"Whether files take\
        \ their metadata from what a file-copy tool stored on each object; see the\
        \ create request's field.:\\n * `AUTO` - BRIDGE_METADATA_IMPORT_AUTO,\\n *\
        \ `OFF` - BRIDGE_METADATA_IMPORT_OFF\"\n          },\n          \"allow_archived_metadata_changes\"\
        : {\n            \"description\": \"Whether clients can change the metadata\
        \ and named streams of a FROZEN bridge's file that is frozen, offline or restoring;\
        \ see the create request's field. False on any other bridge.\",\n        \
        \    \"type\": \"boolean\"\n          }\n        }\n      }\n    }\n  }\n}"
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
