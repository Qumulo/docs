---
category: /Frozen Deletes V1
methods:
  get:
    summary: '[preview] Lists the bridge''s deletes, oldest first, each in the form
      getting one delete returns, or only those in `state` when it''s given. A delete
      stays listed until it is removed. Results come in pages of up to 100 deletes.
      A page can hold fewer deletes than its limit, or none, and still not be the
      last, so keep requesting the next page until a response has no next page. Returns
      HTTP 404 if no Frozen bridge has this UUID.'
    parameters:
    - name: filesystem_uuid
      description: The Frozen bridge's filesystem UUID, as `GET /v1/frozen/bridges/`
        reports it.
      required: true
    - name: state
      description: "Only list deletes in this state.:\n * `CANCELED` - The delete\
        \ was canceled. What it already deleted stays deleted, and it deletes nothing\
        \ more.,\n * `FAILED` - The delete stopped before it finished; `failure_message`\
        \ says what to do.,\n * `FINISHED` - Everything its paths covered is deleted,\
        \ the paths themselves included.,\n * `IN_PROGRESS` - The delete is removing\
        \ what its paths cover."
      required: false
    - name: after
      description: Return entries after the given key (keys are returned in the paging
        object)
      required: false
    - name: limit
      description: Return no more than this many entries; the system may choose a
        smaller limit.
      required: false
    response_body:
      schema: "{\n  \"description\": \"api_frozen_deletes\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"entries\": {\n      \"type\": \"array\",\n \
        \     \"items\": {\n        \"description\": \"The deletes, oldest first.\"\
        ,\n        \"type\": \"object\",\n        \"properties\": {\n          \"\
        id\": {\n            \"description\": \"The delete's ID. Deletes take their\
        \ IDs from the same sequence as the bridge's freeze and thaw jobs, so the\
        \ deletes' IDs have gaps.\",\n            \"type\": \"string\"\n         \
        \ },\n          \"subtree\": {\n            \"description\": \"The directory,\
        \ with everything under it, or the one file the delete covers, as a path relative\
        \ to the bridge, such as `/projects/2019`. Absent when the delete has `files`.\"\
        ,\n            \"type\": \"string\"\n          },\n          \"files\": {\n\
        \            \"type\": \"array\",\n            \"items\": {\n            \
        \  \"description\": \"The paths the delete covers, relative to the bridge,\
        \ in the order given. A directory covers everything under it. Absent when\
        \ the delete has a `subtree`.\",\n              \"type\": \"string\"\n   \
        \         }\n          },\n          \"state\": {\n            \"type\": \"\
        string\",\n            \"enum\": [\n              \"IN_PROGRESS\",\n     \
        \         \"FINISHED\",\n              \"CANCELED\",\n              \"FAILED\"\
        \n            ],\n            \"description\": \"The delete's state.:\\n *\
        \ `CANCELED` - The delete was canceled. What it already deleted stays deleted,\
        \ and it deletes nothing more.,\\n * `FAILED` - The delete stopped before\
        \ it finished; `failure_message` says what to do.,\\n * `FINISHED` - Everything\
        \ its paths covered is deleted, the paths themselves included.,\\n * `IN_PROGRESS`\
        \ - The delete is removing what its paths cover.\"\n          },\n       \
        \   \"failure_message\": {\n            \"description\": \"For a failed delete,\
        \ where it stopped and what to do next.\",\n            \"type\": \"string\"\
        \n          },\n          \"start_time\": {\n            \"description\":\
        \ \"When the delete started, in RFC 3339 format.\",\n            \"type\"\
        : \"string\"\n          },\n          \"end_time\": {\n            \"description\"\
        : \"When the delete finished, was canceled or failed, in RFC 3339 format.\
        \ Absent while it is in progress.\",\n            \"type\": \"string\"\n \
        \         },\n          \"files_deleted\": {\n            \"description\"\
        : \"Files the delete has deleted, not counting directories or symbolic links.\"\
        ,\n            \"type\": \"string\"\n          },\n          \"bytes_deleted\"\
        : {\n            \"description\": \"Total size in bytes of the deleted files,\
        \ each as large as it was when deleted.\",\n            \"type\": \"string\"\
        \n          }\n        }\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: true
  post:
    summary: '[preview] Starts a delete of one directory or file (`subtree`) or a
      list of up to 256 (`files`), other than the bridge''s root, and returns the
      delete''s ID and a URI to check its progress. Paths are relative to the bridge:
      on a bridge at `/archive`, the cluster path `/archive/projects/2019` is `/projects/2019`.
      A refusal gives paths as cluster paths, as qq takes them, except a path that
      doesn''t start with `/` or contains `..`, which it gives as sent. Needs PRIVILEGE_PORTAL_SPOKE_WRITE
      as well. Returns HTTP 400 for a body it can''t accept, with a message that says
      why; HTTP 409 while a freeze or thaw is working on files under its paths, giving
      that job''s ID; and HTTP 404 if no Frozen bridge has this UUID.'
    parameters:
    - name: filesystem_uuid
      description: The Frozen bridge's filesystem UUID, as `GET /v1/frozen/bridges/`
        reports it.
      required: true
    response_body: {}
    responses:
    - code: '202'
      description: Return value on success
    preview: true
    request_body:
      schema: "{\n  \"description\": \"api_frozen_delete_request\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"subtree\": {\n      \"description\"\
        : \"One directory, with everything under it, or one file, as a path relative\
        \ to the bridge, such as `/projects/2019`. Not `/`, the whole bridge. Give\
        \ either `subtree` or `files`.\",\n      \"type\": \"string\"\n    },\n  \
        \  \"files\": {\n      \"type\": \"array\",\n      \"items\": {\n        \"\
        description\": \"1 to 256 paths relative to the bridge, deleted in the order\
        \ given. A directory covers everything under it. Give either `subtree` or\
        \ `files`.\",\n        \"type\": \"string\"\n      }\n    }\n  }\n}"
rest_endpoint: /v1/frozen/bridges/{filesystem_uuid}/deletes/
api_version: v1
deprecated: false
permalink: /rest-api-guide/frozen-deletes-v1/frozen_bridges_filesystem_uuid_deletes.html
sidebar: rest_api_guide_sidebar
---
