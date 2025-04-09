---
category: /Snapshots
methods:
  get:
    summary: Returns a list of changed files and directories between two snapshots.
    parameters:
    - name: newer_id
      description: Newer snapshot
      required: true
    - name: older_id
      description: Older snapshot
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
      schema: "{\n  \"description\": \"api_snapshot_tree_diff\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"entries\": {\n      \"type\": \"array\",\n \
        \     \"items\": {\n        \"description\": \"entries\",\n        \"type\"\
        : \"object\",\n        \"properties\": {\n          \"op\": {\n          \
        \  \"type\": \"string\",\n            \"enum\": [\n              \"CREATE\"\
        ,\n              \"MODIFY\",\n              \"DELETE\"\n            ],\n \
        \           \"description\": \"op:\\n * `CREATE` - API_SNAPSHOT_TREE_DIFF_OP_CREATE,\\\
        n * `DELETE` - API_SNAPSHOT_TREE_DIFF_OP_DELETE,\\n * `MODIFY` - API_SNAPSHOT_TREE_DIFF_OP_MODIFY\"\
        \n          },\n          \"path\": {\n            \"description\": \"path\"\
        ,\n            \"type\": \"string\"\n          }\n        }\n      }\n   \
        \ }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
rest_endpoint: /v2/snapshots/{newer_id}/changes-since/{older_id}
api_version: v2
permalink: /rest-api-guide/snapshots/v2_snapshots_newer_id_changes-since_older_id.html
sidebar: rest_api_guide_sidebar
---
