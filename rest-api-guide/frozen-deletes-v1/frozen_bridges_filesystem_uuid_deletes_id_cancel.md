---
category: /Frozen Deletes V1
methods:
  post:
    summary: '[preview] Cancels the delete, which is CANCELED as soon as the call
      returns, and returns the delete. What it already deleted stays deleted, and
      it deletes nothing more. Canceling a CANCELED delete succeeds, so the call is
      safe to retry. Returns HTTP 409 for a FINISHED or FAILED delete, and HTTP 404
      if no Frozen bridge has this UUID or the bridge has no delete with this ID.'
    parameters:
    - name: filesystem_uuid
      description: The Frozen bridge's filesystem UUID, as `GET /v1/frozen/bridges/`
        reports it.
      required: true
    - name: id
      description: The delete's ID, as starting or listing the delete reports it.
      required: true
    response_body:
      schema: "{\n  \"description\": \"api_frozen_delete\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"id\": {\n      \"description\": \"The delete's\
        \ ID. Deletes take their IDs from the same sequence as the bridge's freeze\
        \ and thaw jobs, so the deletes' IDs have gaps.\",\n      \"type\": \"string\"\
        \n    },\n    \"subtree\": {\n      \"description\": \"The directory, with\
        \ everything under it, or the one file the delete covers, as a path relative\
        \ to the bridge, such as `/projects/2019`. Absent when the delete has `files`.\"\
        ,\n      \"type\": \"string\"\n    },\n    \"files\": {\n      \"type\": \"\
        array\",\n      \"items\": {\n        \"description\": \"The paths the delete\
        \ covers, relative to the bridge, in the order given. A directory covers everything\
        \ under it. Absent when the delete has a `subtree`.\",\n        \"type\":\
        \ \"string\"\n      }\n    },\n    \"state\": {\n      \"type\": \"string\"\
        ,\n      \"enum\": [\n        \"IN_PROGRESS\",\n        \"FINISHED\",\n  \
        \      \"CANCELED\",\n        \"FAILED\"\n      ],\n      \"description\"\
        : \"The delete's state.:\\n * `CANCELED` - The delete was canceled. What it\
        \ already deleted stays deleted, and it deletes nothing more.,\\n * `FAILED`\
        \ - The delete stopped before it finished; `failure_message` says what to\
        \ do.,\\n * `FINISHED` - Everything its paths covered is deleted, the paths\
        \ themselves included.,\\n * `IN_PROGRESS` - The delete is removing what its\
        \ paths cover.\"\n    },\n    \"failure_message\": {\n      \"description\"\
        : \"For a failed delete, where it stopped and what to do next.\",\n      \"\
        type\": \"string\"\n    },\n    \"start_time\": {\n      \"description\":\
        \ \"When the delete started, in RFC 3339 format.\",\n      \"type\": \"string\"\
        \n    },\n    \"end_time\": {\n      \"description\": \"When the delete finished,\
        \ was canceled or failed, in RFC 3339 format. Absent while it is in progress.\"\
        ,\n      \"type\": \"string\"\n    },\n    \"files_deleted\": {\n      \"\
        description\": \"Files the delete has deleted, not counting directories or\
        \ symbolic links.\",\n      \"type\": \"string\"\n    },\n    \"bytes_deleted\"\
        : {\n      \"description\": \"Total size in bytes of the deleted files, each\
        \ as large as it was when deleted.\",\n      \"type\": \"string\"\n    }\n\
        \  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: true
rest_endpoint: /v1/frozen/bridges/{filesystem_uuid}/deletes/{id}/cancel
api_version: v1
deprecated: false
permalink: /rest-api-guide/frozen-deletes-v1/frozen_bridges_filesystem_uuid_deletes_id_cancel.html
sidebar: rest_api_guide_sidebar
---
