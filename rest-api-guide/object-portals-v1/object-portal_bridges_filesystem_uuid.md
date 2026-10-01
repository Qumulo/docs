---
category: /Object Portals V1
methods:
  get:
    summary: '[preview] Returns the full configuration of the bridge with the given
      filesystem UUID, whatever its license or storage layout. A bridge answers as
      soon as its creation commits, before the quorum restart that joins its filesystem.
      A UUID naming no bridge, or one that is malformed, answers with HTTP 404. A
      bridge whose configuration or mount point cannot be read answers with HTTP 500.
      No credential material is ever returned.'
    parameters:
    - name: filesystem_uuid
      description: Bridge filesystem UUID
      required: true
    response_body:
      schema: "{\n  \"description\": \"api_object_bridge\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"filesystem_uuid\": {\n      \"description\"\
        : \"Filesystem UUID of the bridge\",\n      \"type\": \"string\"\n    },\n\
        \    \"mount_path\": {\n      \"description\": \"Absolute path in the primary\
        \ filesystem where the bridge is mounted, written without a trailing slash.\"\
        ,\n      \"type\": \"string\"\n    },\n    \"bucket_uri\": {\n      \"description\"\
        : \"Full URI of the bridge's bucket.\",\n      \"type\": \"string\"\n    },\n\
        \    \"key_prefix\": {\n      \"description\": \"Prefix inside the bucket\
        \ the bridge serves. Absent when the bridge serves the whole bucket.\",\n\
        \      \"type\": \"string\"\n    },\n    \"delimiter\": {\n      \"description\"\
        : \"Object-key separator the bridge projects directories from.\",\n      \"\
        type\": \"string\"\n    },\n    \"key_vault_hostname\": {\n      \"description\"\
        : \"Azure Key Vault hostname the bridge fetches SAS tokens from. Absent unless\
        \ the bucket is reached through a key vault.\",\n      \"type\": \"string\"\
        \n    },\n    \"notification_queue_url\": {\n      \"description\": \"Queue\
        \ URL the bridge polls for bucket-side change notifications. Absent when the\
        \ bridge has none.\",\n      \"type\": \"string\"\n    },\n    \"protocol_access\"\
        : {\n      \"type\": \"string\",\n      \"enum\": [\n        \"READ_WRITE_EXPORT\"\
        ,\n        \"READ_ONLY\"\n      ],\n      \"description\": \"Whether protocol\
        \ front doors may change the bridge filesystem's data and namespace.:\\n *\
        \ `READ_ONLY` - BRIDGE_PROTOCOL_READ_ONLY,\\n * `READ_WRITE_EXPORT` - BRIDGE_PROTOCOL_READ_WRITE_EXPORT\"\
        \n    },\n    \"metadata_import\": {\n      \"type\": \"string\",\n      \"\
        enum\": [\n        \"OFF\",\n        \"AUTO\"\n      ],\n      \"description\"\
        : \"Whether the bridge imports file-mover object metadata onto its inodes.:\\\
        n * `AUTO` - BRIDGE_METADATA_IMPORT_AUTO,\\n * `OFF` - BRIDGE_METADATA_IMPORT_OFF\"\
        \n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: true
  delete:
    summary: '[preview] Unmounts the bridge from the primary filesystem and deletes
      it. The cluster restarts its quorum during this call, which briefly interrupts
      service; the bridge''s cached data and metadata are reclaimed in the background
      afterwards. Local changes not yet exported to the bucket are lost; the bucket
      itself is never modified.'
    parameters:
    - name: filesystem_uuid
      description: Bridge filesystem UUID
      required: true
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    preview: true
rest_endpoint: /v1/object-portal/bridges/{filesystem_uuid}
api_version: v1
deprecated: false
permalink: /rest-api-guide/object-portals-v1/object-portal_bridges_filesystem_uuid.html
sidebar: rest_api_guide_sidebar
---
