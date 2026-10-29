---
category: /Frozen V1
methods:
  get:
    summary: '[preview] Returns the bridge. Returns HTTP 404 if no Frozen bridge has
      this UUID.'
    parameters:
    - name: filesystem_uuid
      description: The Frozen bridge's filesystem UUID, as `GET /v1/frozen/bridges/`
        reports it.
      required: true
    response_body:
      schema: "{\n  \"description\": \"api_frozen_bridge\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"filesystem_uuid\": {\n      \"description\"\
        : \"The bridge's filesystem UUID.\",\n      \"type\": \"string\"\n    },\n\
        \    \"mount_path\": {\n      \"description\": \"Absolute path of the bridge's\
        \ directory on the cluster, without a trailing slash.\",\n      \"type\":\
        \ \"string\"\n    },\n    \"allow_archived_metadata_changes\": {\n      \"\
        description\": \"Whether clients can change the metadata and named streams\
        \ of a file that is frozen, offline or restoring; see the create request's\
        \ field.\",\n      \"type\": \"boolean\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: true
  delete:
    summary: '[preview] Deletes the bridge, which must be empty. To delete a bridge''s
      files and their data, delete its top-level files and folders with a Frozen delete
      first, and wait for the cluster to finish deleting them. File access across
      the cluster pauses briefly during this call while the cluster restarts its services,
      so delete a bridge while clients are quiet. Returns HTTP 409 if the bridge holds
      any file or folder, while a job on the bridge is still running or stopping,
      or while the cluster is still deleting files deleted from the bridge, such as
      one a client holds open, or still deleting their data, which usually takes up
      to a few hours; and HTTP 404 if no Frozen bridge has this UUID. If the cluster
      is still deleting files after a day, contact Qumulo.'
    parameters:
    - name: filesystem_uuid
      description: The Frozen bridge's filesystem UUID, as `GET /v1/frozen/bridges/`
        reports it.
      required: true
    response_body: {}
    responses:
    - code: '204'
      description: Return value on success
    preview: true
rest_endpoint: /v1/frozen/bridges/{filesystem_uuid}
api_version: v1
deprecated: false
permalink: /rest-api-guide/frozen-v1/frozen_bridges_filesystem_uuid.html
sidebar: rest_api_guide_sidebar
---
