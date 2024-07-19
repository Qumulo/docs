---
category: /node
methods:
  get:
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"api_node_state\",\n  \"type\": \"object\",\n\
        \  \"properties\": {\n    \"node_id\": {\n      \"description\": \"node-id\
        \ of the node responding to the get\",\n      \"type\": \"number\"\n    },\n\
        \    \"state\": {\n      \"type\": \"string\",\n      \"enum\": [\n      \
        \  \"UNCONFIGURED\",\n        \"STOPPED\",\n        \"PAUSED\",\n        \"\
        ACTIVE\",\n        \"REMOVED\"\n      ],\n      \"description\": \"The state\
        \ of the node:\\n * `ACTIVE` - Configured node part of active quorum,\\n *\
        \ `PAUSED` - Configured node part of paused quorum,\\n * `REMOVED` - Configured\
        \ node that has been removed from its cluster,\\n * `STOPPED` - Configured\
        \ node not part of quorum,\\n * `UNCONFIGURED` - Unconfigured node\"\n   \
        \ },\n    \"cluster_id\": {\n      \"description\": \"Unique identifier of\
        \ cluster the node belongs to or the empty string ('') if the node is unconfigured\"\
        ,\n      \"type\": \"string\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Retrieves node state of the node that the call was made to.
rest_endpoint: /v1/node/state
permalink: /rest-api-guide/node/state.html
sidebar: rest_api_guide_sidebar
---
