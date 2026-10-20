---
category: /Object Portals V1
methods:
  get:
    summary: '[preview] Returns the bridge''s configuration. A new bridge is returned
      as soon as it is created, shortly before it can be used. Returns HTTP 404 if
      no bridge has this UUID. Credentials are never returned.'
    parameters:
    - name: filesystem_uuid
      description: The bridge's filesystem UUID, as listing bridges reports it.
      required: true
    response_body:
      schema: "{\n  \"description\": \"api_object_bridge\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"filesystem_uuid\": {\n      \"description\"\
        : \"The bridge's filesystem UUID.\",\n      \"type\": \"string\"\n    },\n\
        \    \"mount_path\": {\n      \"description\": \"Absolute path of the bridge's\
        \ directory on the cluster, without a trailing slash.\",\n      \"type\":\
        \ \"string\"\n    },\n    \"bucket_uri\": {\n      \"description\": \"Full\
        \ URI of the bridge's bucket.\",\n      \"type\": \"string\"\n    },\n   \
        \ \"key_prefix\": {\n      \"description\": \"The prefix of the object names\
        \ the bridge covers. Absent when the bridge covers the whole bucket.\",\n\
        \      \"type\": \"string\"\n    },\n    \"delimiter\": {\n      \"description\"\
        : \"The character in object names that separates directories.\",\n      \"\
        type\": \"string\"\n    },\n    \"key_vault_hostname\": {\n      \"description\"\
        : \"Azure Key Vault hostname the bridge fetches SAS tokens from. Absent unless\
        \ the bucket is reached through a key vault.\",\n      \"type\": \"string\"\
        \n    },\n    \"notification_queue_url\": {\n      \"description\": \"The\
        \ SQS queue URL the cluster reads to learn of changes made in the bucket.\
        \ Absent when the bridge has none.\",\n      \"type\": \"string\"\n    },\n\
        \    \"protocol_access\": {\n      \"type\": \"string\",\n      \"enum\":\
        \ [\n        \"READ_WRITE_EXPORT\",\n        \"READ_ONLY\",\n        \"FROZEN\"\
        \n      ],\n      \"description\": \"How clients can change files on the bridge,\
        \ and whether it is a Frozen bridge; see the create request's field.:\\n *\
        \ `FROZEN` - BRIDGE_PROTOCOL_FROZEN,\\n * `READ_ONLY` - BRIDGE_PROTOCOL_READ_ONLY,\\\
        n * `READ_WRITE_EXPORT` - BRIDGE_PROTOCOL_READ_WRITE_EXPORT\"\n    },\n  \
        \  \"metadata_import\": {\n      \"type\": \"string\",\n      \"enum\": [\n\
        \        \"OFF\",\n        \"AUTO\"\n      ],\n      \"description\": \"Whether\
        \ files take their metadata from what a file-copy tool stored on each object;\
        \ see the create request's field.:\\n * `AUTO` - BRIDGE_METADATA_IMPORT_AUTO,\\\
        n * `OFF` - BRIDGE_METADATA_IMPORT_OFF\"\n    },\n    \"allow_archived_metadata_changes\"\
        : {\n      \"description\": \"Whether clients can change the metadata and\
        \ named streams of a FROZEN bridge's file that is frozen, offline or restoring;\
        \ see the create request's field. False on any other bridge.\",\n      \"\
        type\": \"boolean\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: true
  delete:
    summary: '[preview] Removes the bridge''s directory and everything the cluster
      stored for it. File access across the cluster pauses briefly during this call
      while the cluster restarts its services, and the space the bridge used is freed
      in the background afterwards. Changes not yet written to the bucket are lost.
      The bucket is left as it is, including any data in the Azure Archive tier, which
      Azure keeps charging for. Deleting a Frozen bridge also loses every file not
      yet frozen, and the owners, permissions and other attributes of the frozen files,
      which Azure doesn''t keep. Their objects stay in the container, but no new bridge
      can take them back, because a Frozen bridge can''t be created over a key prefix
      that holds objects. So this can''t be undone, and the call returns HTTP 409
      for a Frozen bridge that holds any file unless `force` is true. It also returns
      HTTP 409, unless `force` is true, while a Frozen job on the bridge is still
      running or stopping, or while the cluster is still deleting files deleted from
      a Frozen bridge, such as one a client holds open, or their objects, which usually
      takes up to a few hours. With `force`, those files'' objects stay in the container,
      and `force` is the only way past a delete of an object that never finishes.'
    parameters:
    - name: filesystem_uuid
      description: The bridge's filesystem UUID, as listing bridges reports it.
      required: true
    - name: force
      description: Delete a Frozen bridge even if it holds files or runs a job, or
        the cluster is still deleting files deleted from it or their objects. Defaults
        to false.
      required: false
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
