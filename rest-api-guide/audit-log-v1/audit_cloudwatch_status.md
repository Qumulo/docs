---
category: /Audit Log V1
methods:
  get:
    summary: Retrieves audit log CloudWatch status for the cluster.
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"cloudwatch_audit_status\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"node_statuses\": {\n      \"description\"\
        : \"node_statuses\",\n      \"type\": \"object\",\n      \"properties\": {},\n\
        \      \"additionalProperties\": {\n        \"description\": \"node_statuses\
        \ value\",\n        \"type\": \"object\",\n        \"properties\": {\n   \
        \       \"last_seen_error\": {\n            \"description\": \"last_seen_error\"\
        ,\n            \"type\": \"object\",\n            \"properties\": {\n    \
        \          \"error_message\": {\n                \"description\": \"error_message\"\
        ,\n                \"type\": \"string\"\n              },\n              \"\
        error_details\": {\n                \"description\": \"error_details\",\n\
        \                \"type\": \"string\"\n              }\n            }\n  \
        \        }\n        }\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
rest_endpoint: /v1/audit/cloudwatch/status
api_version: v1
permalink: /rest-api-guide/audit-log-v1/audit_cloudwatch_status.html
sidebar: rest_api_guide_sidebar
redirect_from: /rest-api-guide/audit-log/audit_cloudwatch_status.html
---
