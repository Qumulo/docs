---
category: /Audit Log V2
methods:
  get:
    summary: Lists all configured audit log destinations.
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"api_audit_destination_list\",\n  \"type\":\
        \ \"object\",\n  \"properties\": {\n    \"destinations\": {\n      \"type\"\
        : \"array\",\n      \"items\": {\n        \"description\": \"destinations\"\
        ,\n        \"type\": \"object\",\n        \"properties\": {\n          \"\
        id\": {\n            \"description\": \"id\",\n            \"type\": \"string\"\
        \n          },\n          \"config\": {\n            \"description\": \"config\"\
        ,\n            \"type\": \"object\",\n            \"properties\": {\n    \
        \          \"type\": {\n                \"type\": \"string\",\n          \
        \      \"enum\": [\n                  \"SYSLOG\",\n                  \"CLOUDWATCH\"\
        \n                ],\n                \"description\": \"type:\\n * `CLOUDWATCH`\
        \ - AUDIT_DESTINATION_CLOUDWATCH,\\n * `SYSLOG` - AUDIT_DESTINATION_SYSLOG\"\
        \n              },\n              \"name\": {\n                \"description\"\
        : \"name\",\n                \"type\": \"string\"\n              },\n    \
        \          \"enabled\": {\n                \"description\": \"enabled\",\n\
        \                \"type\": \"boolean\"\n              },\n              \"\
        server_address\": {\n                \"description\": \"server_address\",\n\
        \                \"type\": \"string\"\n              },\n              \"\
        server_port\": {\n                \"description\": \"server_port\",\n    \
        \            \"type\": \"number\"\n              },\n              \"format\"\
        : {\n                \"description\": \"format\",\n                \"type\"\
        : \"string\"\n              },\n              \"local_enabled\": {\n     \
        \           \"description\": \"local_enabled\",\n                \"type\"\
        : \"boolean\"\n              },\n              \"log_group_name\": {\n   \
        \             \"description\": \"log_group_name\",\n                \"type\"\
        : \"string\"\n              },\n              \"region\": {\n            \
        \    \"description\": \"region\",\n                \"type\": \"string\"\n\
        \              }\n            }\n          }\n        }\n      }\n    }\n\
        \  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
  post:
    summary: Creates a new audit log destination.
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"api_audit_destination\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"id\": {\n      \"description\": \"id\",\n  \
        \    \"type\": \"string\"\n    },\n    \"config\": {\n      \"description\"\
        : \"config\",\n      \"type\": \"object\",\n      \"properties\": {\n    \
        \    \"type\": {\n          \"type\": \"string\",\n          \"enum\": [\n\
        \            \"SYSLOG\",\n            \"CLOUDWATCH\"\n          ],\n     \
        \     \"description\": \"type:\\n * `CLOUDWATCH` - AUDIT_DESTINATION_CLOUDWATCH,\\\
        n * `SYSLOG` - AUDIT_DESTINATION_SYSLOG\"\n        },\n        \"name\": {\n\
        \          \"description\": \"name\",\n          \"type\": \"string\"\n  \
        \      },\n        \"enabled\": {\n          \"description\": \"enabled\"\
        ,\n          \"type\": \"boolean\"\n        },\n        \"server_address\"\
        : {\n          \"description\": \"server_address\",\n          \"type\": \"\
        string\"\n        },\n        \"server_port\": {\n          \"description\"\
        : \"server_port\",\n          \"type\": \"number\"\n        },\n        \"\
        format\": {\n          \"description\": \"format\",\n          \"type\": \"\
        string\"\n        },\n        \"local_enabled\": {\n          \"description\"\
        : \"local_enabled\",\n          \"type\": \"boolean\"\n        },\n      \
        \  \"log_group_name\": {\n          \"description\": \"log_group_name\",\n\
        \          \"type\": \"string\"\n        },\n        \"region\": {\n     \
        \     \"description\": \"region\",\n          \"type\": \"string\"\n     \
        \   }\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
    request_body:
      schema: "{\n  \"description\": \"api_audit_destination_post\",\n  \"type\":\
        \ \"object\",\n  \"properties\": {\n    \"config\": {\n      \"description\"\
        : \"config\",\n      \"type\": \"object\",\n      \"properties\": {\n    \
        \    \"type\": {\n          \"type\": \"string\",\n          \"enum\": [\n\
        \            \"SYSLOG\",\n            \"CLOUDWATCH\"\n          ],\n     \
        \     \"description\": \"type:\\n * `CLOUDWATCH` - AUDIT_DESTINATION_CLOUDWATCH,\\\
        n * `SYSLOG` - AUDIT_DESTINATION_SYSLOG\"\n        },\n        \"name\": {\n\
        \          \"description\": \"name\",\n          \"type\": \"string\"\n  \
        \      },\n        \"enabled\": {\n          \"description\": \"enabled\"\
        ,\n          \"type\": \"boolean\"\n        },\n        \"server_address\"\
        : {\n          \"description\": \"server_address\",\n          \"type\": \"\
        string\"\n        },\n        \"server_port\": {\n          \"description\"\
        : \"server_port\",\n          \"type\": \"number\"\n        },\n        \"\
        format\": {\n          \"description\": \"format\",\n          \"type\": \"\
        string\"\n        },\n        \"local_enabled\": {\n          \"description\"\
        : \"local_enabled\",\n          \"type\": \"boolean\"\n        },\n      \
        \  \"log_group_name\": {\n          \"description\": \"log_group_name\",\n\
        \          \"type\": \"string\"\n        },\n        \"region\": {\n     \
        \     \"description\": \"region\",\n          \"type\": \"string\"\n     \
        \   }\n      }\n    }\n  }\n}"
rest_endpoint: /v2/audit/destinations/
api_version: v2
deprecated: false
permalink: /rest-api-guide/audit-log-v2/v2_audit_destinations.html
sidebar: rest_api_guide_sidebar
---
