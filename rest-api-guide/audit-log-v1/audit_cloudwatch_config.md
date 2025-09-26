---
category: /Audit Log V1
methods:
  get:
    summary: Retrieves audit log CloudWatch configuration for the cluster.
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"cloudwatch_audit_user_config\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"enabled\": {\n      \"description\"\
        : \"enabled\",\n      \"type\": \"boolean\"\n    },\n    \"log_group_name\"\
        : {\n      \"description\": \"log_group_name\",\n      \"type\": \"string\"\
        \n    },\n    \"region\": {\n      \"description\": \"region\",\n      \"\
        type\": \"string\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
  put:
    summary: Sets audit log CloudWatch configuration for the cluster.
    parameters:
    - name: If-Match
      description: ETag for expected version
      required: false
    response_body:
      schema: "{\n  \"description\": \"cloudwatch_audit_user_config\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"enabled\": {\n      \"description\"\
        : \"enabled\",\n      \"type\": \"boolean\"\n    },\n    \"log_group_name\"\
        : {\n      \"description\": \"log_group_name\",\n      \"type\": \"string\"\
        \n    },\n    \"region\": {\n      \"description\": \"region\",\n      \"\
        type\": \"string\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
    request_body:
      schema: "{\n  \"description\": \"cloudwatch_audit_user_config\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"enabled\": {\n      \"description\"\
        : \"enabled\",\n      \"type\": \"boolean\"\n    },\n    \"log_group_name\"\
        : {\n      \"description\": \"log_group_name\",\n      \"type\": \"string\"\
        \n    },\n    \"region\": {\n      \"description\": \"region\",\n      \"\
        type\": \"string\"\n    }\n  }\n}"
  patch:
    summary: Modifies audit log CloudWatch configuration for the cluster.
    parameters:
    - name: If-Match
      description: ETag for expected version
      required: false
    response_body:
      schema: "{\n  \"description\": \"cloudwatch_audit_user_config\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"enabled\": {\n      \"description\"\
        : \"enabled\",\n      \"type\": \"boolean\"\n    },\n    \"log_group_name\"\
        : {\n      \"description\": \"log_group_name\",\n      \"type\": \"string\"\
        \n    },\n    \"region\": {\n      \"description\": \"region\",\n      \"\
        type\": \"string\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
    request_body:
      schema: "{\n  \"description\": \"cloudwatch_audit_user_config_delta\",\n  \"\
        type\": \"object\",\n  \"properties\": {\n    \"enabled\": {\n      \"description\"\
        : \"enabled\",\n      \"type\": \"boolean\"\n    },\n    \"log_group_name\"\
        : {\n      \"description\": \"log_group_name\",\n      \"type\": \"string\"\
        \n    },\n    \"region\": {\n      \"description\": \"region\",\n      \"\
        type\": \"string\"\n    }\n  }\n}"
rest_endpoint: /v1/audit/cloudwatch/config
api_version: v1
permalink: /rest-api-guide/audit-log-v1/audit_cloudwatch_config.html
sidebar: rest_api_guide_sidebar
redirect_from: /rest-api-guide/audit-log/audit_cloudwatch_config.html
---
