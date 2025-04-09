---
category: /File System
methods:
  get:
    summary: Get file system public key usage by using the name or identifier of the
      specified key.
    parameters:
    - name: key_ref
      description: The name or identifier of the public key for which to show snapshot
        and snapshot policy usage.
      required: true
    - name: after
      description: Return entries after the given key (keys are returned in the paging
        object)
      required: false
    - name: limit
      description: Return no more than this many entries; the system may choose a
        smaller limit.
      required: false
    response_body:
      schema: "{\n  \"description\": \"api_change_lock_key_usage_page\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"usages\": {\n      \"type\": \"\
        array\",\n      \"items\": {\n        \"description\": \"Usages of the key\"\
        ,\n        \"type\": \"object\",\n        \"properties\": {\n          \"\
        type\": {\n            \"type\": \"string\",\n            \"enum\": [\n  \
        \            \"snapshot\",\n              \"snapshot_policy\",\n         \
        \     \"replication_target\"\n            ],\n            \"description\"\
        : \"type:\\n * `replication_target` - FS_CHANGE_LOCK_KEY_USAGE_REPLICATION,\\\
        n * `snapshot` - FS_CHANGE_LOCK_KEY_USAGE_SNAPSHOT,\\n * `snapshot_policy`\
        \ - FS_CHANGE_LOCK_KEY_USAGE_SNAPSHOT_POLICY\"\n          },\n          \"\
        id\": {\n            \"description\": \"id\",\n            \"type\": \"string\"\
        \n          }\n        }\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
rest_endpoint: /v1/file-system/security/keys/{key_ref}/usages
api_version: v1
permalink: /rest-api-guide/file-system/file-system_security_keys_key_ref_usages.html
sidebar: rest_api_guide_sidebar
---
