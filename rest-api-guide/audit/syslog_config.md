---
category: /audit
methods:
  get:
    parameters: []
    response_body:
      example_value: '"TO DO"'
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
    summary: Retrieves audit log syslog configuration for the cluster.
  patch:
    parameters:
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
      example_value: '"TO DO"'
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
    response_body:
      example_value: '"TO DO"'
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
    summary: Modifies audit log syslog configuration for the cluster.
  put:
    parameters:
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
      example_value: '"TO DO"'
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
    response_body:
      example_value: '"TO DO"'
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
    summary: Modifies audit log syslog configuration for the cluster.
rest_endpoint: /v1/audit/syslog/config
permalink: /rest-api-guide/audit/syslog_config.html
sidebar: rest_api_guide_sidebar
---
