---
category: /Audit Log V2
methods:
  get:
    summary: Retrieves configuration for a specific audit log destination.
    parameters:
    - name: id
      description: ID of the audit destination
      required: true
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
  put:
    summary: Replaces configuration for an existing audit log destination.
    parameters:
    - name: id
      description: ID of the audit destination
      required: true
    - name: If-Match
      description: ETag for expected version
      required: false
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
      schema: "{\n  \"description\": \"api_audit_destination_config\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"type\": {\n      \"type\": \"string\"\
        ,\n      \"enum\": [\n        \"SYSLOG\",\n        \"CLOUDWATCH\"\n      ],\n\
        \      \"description\": \"type:\\n * `CLOUDWATCH` - AUDIT_DESTINATION_CLOUDWATCH,\\\
        n * `SYSLOG` - AUDIT_DESTINATION_SYSLOG\"\n    },\n    \"name\": {\n     \
        \ \"description\": \"name\",\n      \"type\": \"string\"\n    },\n    \"enabled\"\
        : {\n      \"description\": \"enabled\",\n      \"type\": \"boolean\"\n  \
        \  },\n    \"server_address\": {\n      \"description\": \"server_address\"\
        ,\n      \"type\": \"string\"\n    },\n    \"server_port\": {\n      \"description\"\
        : \"server_port\",\n      \"type\": \"number\"\n    },\n    \"format\": {\n\
        \      \"description\": \"format\",\n      \"type\": \"string\"\n    },\n\
        \    \"local_enabled\": {\n      \"description\": \"local_enabled\",\n   \
        \   \"type\": \"boolean\"\n    },\n    \"log_group_name\": {\n      \"description\"\
        : \"log_group_name\",\n      \"type\": \"string\"\n    },\n    \"region\"\
        : {\n      \"description\": \"region\",\n      \"type\": \"string\"\n    }\n\
        \  }\n}"
  patch:
    summary: Modifies configuration for a specific audit log destination.
    parameters:
    - name: id
      description: ID of the audit destination
      required: true
    - name: If-Match
      description: ETag for expected version
      required: false
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
      schema: "{\n  \"description\": \"audit_destination_config_delta\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"enabled\": {\n      \"description\"\
        : \"enabled\",\n      \"type\": \"boolean\"\n    }\n  }\n}"
  delete:
    summary: Deletes an audit log destination.
    parameters:
    - name: id
      description: ID of the audit destination
      required: true
    - name: If-Match
      description: ETag for expected version
      required: false
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    preview: false
rest_endpoint: /v2/audit/destinations/{id}
api_version: v2
deprecated: false
permalink: /rest-api-guide/audit-log-v2/v2_audit_destinations_id.html
sidebar: rest_api_guide_sidebar
---
