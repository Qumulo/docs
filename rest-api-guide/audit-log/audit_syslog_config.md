---
category: /Audit Log
methods:
  get:
    summary: Retrieves audit log syslog configuration for the cluster.
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"syslog_audit_config\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"enabled\": {\n      \"description\": \"Enable\
        \ remote audit log.\",\n      \"type\": \"boolean\"\n    },\n    \"server_address\"\
        : {\n      \"description\": \"The IP address, hostname, or fully qualified\
        \ domain name of your remote syslog server.\",\n      \"type\": \"string\"\
        \n    },\n    \"server_port\": {\n      \"description\": \"server_port\",\n\
        \      \"type\": \"number\"\n    },\n    \"local_enabled\": {\n      \"description\"\
        : \"Enable per-node local audit log.\",\n      \"type\": \"boolean\"\n   \
        \ },\n    \"format\": {\n      \"type\": \"string\",\n      \"enum\": [\n\
        \        \"csv\",\n        \"json\"\n      ],\n      \"description\": \"Output\
        \ syslog as CSV or JSON.:\\n * `csv` - SYSLOG_AUDIT_FORMAT_CSV,\\n * `json`\
        \ - SYSLOG_AUDIT_FORMAT_JSON\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
  put:
    summary: Modifies audit log syslog configuration for the cluster.
    parameters:
    - name: If-Match
      description: ETag for expected version
      required: false
    response_body:
      schema: "{\n  \"description\": \"syslog_audit_config\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"enabled\": {\n      \"description\": \"Enable\
        \ remote audit log.\",\n      \"type\": \"boolean\"\n    },\n    \"server_address\"\
        : {\n      \"description\": \"The IP address, hostname, or fully qualified\
        \ domain name of your remote syslog server.\",\n      \"type\": \"string\"\
        \n    },\n    \"server_port\": {\n      \"description\": \"server_port\",\n\
        \      \"type\": \"number\"\n    },\n    \"local_enabled\": {\n      \"description\"\
        : \"Enable per-node local audit log.\",\n      \"type\": \"boolean\"\n   \
        \ },\n    \"format\": {\n      \"type\": \"string\",\n      \"enum\": [\n\
        \        \"csv\",\n        \"json\"\n      ],\n      \"description\": \"Output\
        \ syslog as CSV or JSON.:\\n * `csv` - SYSLOG_AUDIT_FORMAT_CSV,\\n * `json`\
        \ - SYSLOG_AUDIT_FORMAT_JSON\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
    request_body:
      schema: "{\n  \"description\": \"syslog_audit_config\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"enabled\": {\n      \"description\": \"Enable\
        \ remote audit log.\",\n      \"type\": \"boolean\"\n    },\n    \"server_address\"\
        : {\n      \"description\": \"The IP address, hostname, or fully qualified\
        \ domain name of your remote syslog server.\",\n      \"type\": \"string\"\
        \n    },\n    \"server_port\": {\n      \"description\": \"server_port\",\n\
        \      \"type\": \"number\"\n    },\n    \"local_enabled\": {\n      \"description\"\
        : \"Enable per-node local audit log.\",\n      \"type\": \"boolean\"\n   \
        \ },\n    \"format\": {\n      \"type\": \"string\",\n      \"enum\": [\n\
        \        \"csv\",\n        \"json\"\n      ],\n      \"description\": \"Output\
        \ syslog as CSV or JSON.:\\n * `csv` - SYSLOG_AUDIT_FORMAT_CSV,\\n * `json`\
        \ - SYSLOG_AUDIT_FORMAT_JSON\"\n    }\n  }\n}"
  patch:
    summary: Modifies audit log syslog configuration for the cluster.
    parameters:
    - name: If-Match
      description: ETag for expected version
      required: false
    response_body:
      schema: "{\n  \"description\": \"syslog_audit_config\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"enabled\": {\n      \"description\": \"Enable\
        \ remote audit log.\",\n      \"type\": \"boolean\"\n    },\n    \"server_address\"\
        : {\n      \"description\": \"The IP address, hostname, or fully qualified\
        \ domain name of your remote syslog server.\",\n      \"type\": \"string\"\
        \n    },\n    \"server_port\": {\n      \"description\": \"server_port\",\n\
        \      \"type\": \"number\"\n    },\n    \"local_enabled\": {\n      \"description\"\
        : \"Enable per-node local audit log.\",\n      \"type\": \"boolean\"\n   \
        \ },\n    \"format\": {\n      \"type\": \"string\",\n      \"enum\": [\n\
        \        \"csv\",\n        \"json\"\n      ],\n      \"description\": \"Output\
        \ syslog as CSV or JSON.:\\n * `csv` - SYSLOG_AUDIT_FORMAT_CSV,\\n * `json`\
        \ - SYSLOG_AUDIT_FORMAT_JSON\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
    request_body:
      schema: "{\n  \"description\": \"syslog_audit_config_delta\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"enabled\": {\n      \"description\"\
        : \"Enable remote audit log.\",\n      \"type\": \"boolean\"\n    },\n   \
        \ \"server_address\": {\n      \"description\": \"The IP address, hostname,\
        \ or fully qualified domain name of your remote syslog server.\",\n      \"\
        type\": \"string\"\n    },\n    \"server_port\": {\n      \"description\"\
        : \"server_port\",\n      \"type\": \"number\"\n    },\n    \"local_enabled\"\
        : {\n      \"description\": \"Enable per-node local audit log.\",\n      \"\
        type\": \"boolean\"\n    },\n    \"format\": {\n      \"type\": \"string\"\
        ,\n      \"enum\": [\n        \"csv\",\n        \"json\"\n      ],\n     \
        \ \"description\": \"Output syslog as CSV or JSON.:\\n * `csv` - SYSLOG_AUDIT_FORMAT_CSV,\\\
        n * `json` - SYSLOG_AUDIT_FORMAT_JSON\"\n    }\n  }\n}"
rest_endpoint: /v1/audit/syslog/config
api_version: v1
permalink: /rest-api-guide/audit-log/audit_syslog_config.html
sidebar: rest_api_guide_sidebar
---
