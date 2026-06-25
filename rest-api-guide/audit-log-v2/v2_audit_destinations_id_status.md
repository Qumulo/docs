---
category: /Audit Log V2
methods:
  get:
    summary: Retrieves the per-node connection status for the specified audit log
      destination.
    parameters:
    - name: id
      description: The audit log destination ID.
      required: true
    response_body:
      schema: "{\n  \"description\": \"audit_destination_cluster_status\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"node_statuses\": {\n      \"type\"\
        : \"array\",\n      \"items\": {\n        \"description\": \"node_statuses\"\
        ,\n        \"type\": \"object\",\n        \"properties\": {\n          \"\
        node_id\": {\n            \"description\": \"node_id\",\n            \"type\"\
        : \"number\"\n          },\n          \"status\": {\n            \"description\"\
        : \"status\",\n            \"type\": \"object\",\n            \"properties\"\
        : {\n              \"connection_status\": {\n                \"type\": \"\
        string\",\n                \"enum\": [\n                  \"AUDIT_DESTINATION_CONNECTED\"\
        ,\n                  \"AUDIT_DESTINATION_CONNECTING\",\n                 \
        \ \"AUDIT_DESTINATION_DISABLED\",\n                  \"AUDIT_DESTINATION_DISCONNECTED\"\
        \n                ],\n                \"description\": \"connection_status:\\\
        n * `AUDIT_DESTINATION_CONNECTED` - AUDIT_DESTINATION_CONNECTED,\\n * `AUDIT_DESTINATION_CONNECTING`\
        \ - AUDIT_DESTINATION_CONNECTING,\\n * `AUDIT_DESTINATION_DISABLED` - AUDIT_DESTINATION_DISABLED,\\\
        n * `AUDIT_DESTINATION_DISCONNECTED` - AUDIT_DESTINATION_DISCONNECTED\"\n\
        \              },\n              \"error_message\": {\n                \"\
        description\": \"error_message\",\n                \"type\": \"string\"\n\
        \              },\n              \"error_details\": {\n                \"\
        description\": \"error_details\",\n                \"type\": \"string\"\n\
        \              },\n              \"error_timestamp\": {\n                \"\
        description\": \"error_timestamp\",\n                \"type\": \"string\"\n\
        \              }\n            }\n          }\n        }\n      }\n    }\n\
        \  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
rest_endpoint: /v2/audit/destinations/{id}/status
api_version: v2
deprecated: false
permalink: /rest-api-guide/audit-log-v2/v2_audit_destinations_id_status.html
sidebar: rest_api_guide_sidebar
---
