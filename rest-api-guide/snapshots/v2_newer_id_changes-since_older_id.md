---
category: /snapshots
methods:
  get:
    parameters:
    - description: Newer snapshot
      name: newer_id
      required: true
    - description: Older snapshot
      name: older_id
      required: true
    - description: Return entries after the given key (keys are returned in the paging
        object)
      name: after
      required: false
    - description: Return no more than this many entries; the system may choose a
        smaller limit.
      name: limit
      required: false
    response_body:
      description: Return value on success
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"api_snapshot_tree_diff\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"entries\": {\n      \"type\": \"array\",\n \
        \     \"items\": {\n        \"description\": \"entries\",\n        \"type\"\
        : \"object\",\n        \"properties\": {\n          \"op\": {\n          \
        \  \"type\": \"string\",\n            \"enum\": [\n              \"CREATE\"\
        ,\n              \"MODIFY\",\n              \"DELETE\"\n            ],\n \
        \           \"description\": \"op:\\n * `CREATE` - CREATE,\\n * `DELETE` -\
        \ DELETE,\\n * `MODIFY` - MODIFY\"\n          },\n          \"path\": {\n\
        \            \"description\": \"path\",\n            \"type\": \"string\"\n\
        \          }\n        }\n      }\n    }\n  }\n}"
      status_code: '200'
    summary: Returns a list of changed files and directories between two snapshots.
rest_endpoint: /v2/snapshots/{newer_id}/changes-since/{older_id}
permalink: /rest-api-guide/snapshots/v2_newer_id_changes-since_older_id.html
sidebar: rest_api_guide_sidebar
---
