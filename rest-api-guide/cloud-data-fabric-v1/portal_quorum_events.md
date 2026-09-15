---
category: /Cloud Data Fabric V1
methods:
  get:
    summary: List recent portal quorum success and abandon events recorded by the
      nodes of this cluster, oldest first. Success events are recorded by the cluster
      quorum leader; abandon events are recorded by each node that observed a reason
      for the abandon. History is bounded by event log rotation; roughly the trailing
      24 hours are available.
    parameters:
    - name: begin-time
      description: Inclusive lower bound on event time, in RFC 3339 format or epoch
        seconds. If not specified, all available history is returned.
      required: false
    - name: end-time
      description: Exclusive upper bound on event time, in RFC 3339 format or epoch
        seconds. If not specified, defaults to the current system time.
      required: false
    - name: type
      description: 'Only return events of this kind: success or abandon.<ul><li><code>abandon</code>
        - abandon</li><li><code>success</code> - success</li></ul>'
      required: false
    - name: node-id
      description: Only return events recorded by this node.
      required: false
    - name: fs-id
      description: Only return events for this file system.
      required: false
    - name: limit
      description: Maximum entries returned, oldest first. Defaults to 1000.
      required: false
    response_body:
      schema: "{\n  \"description\": \"v1_portal_quorum_events\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"entries\": {\n      \"type\": \"array\"\
        ,\n      \"items\": {\n        \"description\": \"Matching events from all\
        \ queried nodes, oldest first\",\n        \"type\": \"object\",\n        \"\
        properties\": {\n          \"type\": {\n            \"type\": \"string\",\n\
        \            \"enum\": [\n              \"success\",\n              \"abandon\"\
        \n            ],\n            \"description\": \"Event kind: success (portal\
        \ quorum formed) or abandon:\\n * `abandon` - PORTAL_QUORUM_EVENT_KIND_ABANDON,\\\
        n * `success` - PORTAL_QUORUM_EVENT_KIND_SUCCESS\"\n          },\n       \
        \   \"node_id\": {\n            \"description\": \"Node that recorded the\
        \ event\",\n            \"type\": \"number\"\n          },\n          \"event_time\"\
        : {\n            \"description\": \"When the node recorded the event\",\n\
        \            \"type\": \"string\"\n          },\n          \"portal_quorum_id\"\
        : {\n            \"description\": \"portal_quorum_id\",\n            \"type\"\
        : \"object\",\n            \"properties\": {\n              \"portal_quorum_seq\"\
        : {\n                \"description\": \"portal_quorum_seq\",\n           \
        \     \"type\": \"string\"\n              }\n            }\n          },\n\
        \          \"fs_id\": {\n            \"description\": \"File system the portal\
        \ quorum serves\",\n            \"type\": \"number\"\n          },\n     \
        \     \"total_clusters\": {\n            \"description\": \"Total clusters\
        \ this node knows about, in quorum or not\",\n            \"type\": \"number\"\
        \n          },\n          \"missing_clusters\": {\n            \"type\": \"\
        array\",\n            \"items\": {\n              \"description\": \"Cluster\
        \ UUIDs missing from the portal quorum\",\n              \"type\": \"string\"\
        \n            }\n          },\n          \"end_reason\": {\n            \"\
        description\": \"Why the portal quorum was abandoned; abandon events only\"\
        ,\n            \"type\": \"string\"\n          },\n          \"uptime\": {\n\
        \            \"description\": \"Seconds the portal quorum was active; abandon\
        \ events only\",\n            \"type\": \"number\"\n          },\n       \
        \   \"downtime\": {\n            \"description\": \"Seconds since the previous\
        \ portal quorum abandoned; success events only\",\n            \"type\": \"\
        number\"\n          },\n          \"formation_time\": {\n            \"description\"\
        : \"Seconds this node spent starting; success events only\",\n           \
        \ \"type\": \"number\"\n          }\n        }\n      }\n    },\n    \"nodes_queried\"\
        : {\n      \"type\": \"array\",\n      \"items\": {\n        \"description\"\
        : \"Nodes whose event logs contributed; nodes outside cluster quorum are absent\
        \ and their events are unavailable until they rejoin\",\n        \"type\"\
        : \"number\"\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
rest_endpoint: /v1/portal/quorum/events
api_version: v1
deprecated: false
permalink: /rest-api-guide/cloud-data-fabric-v1/portal_quorum_events.html
sidebar: rest_api_guide_sidebar
---
