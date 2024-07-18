---
category: /audit
methods:
  get:
    parameters: []
    response_body:
      description: Return value on success
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"cloudwatch_audit_user_config\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"enabled\": {\n      \"description\"\
        : \"enabled\",\n      \"type\": \"boolean\"\n    },\n    \"log_group_name\"\
        : {\n      \"description\": \"log_group_name\",\n      \"type\": \"string\"\
        \n    },\n    \"region\": {\n      \"description\": \"region\",\n      \"\
        type\": \"string\"\n    }\n  }\n}"
      status_code: '200'
    summary: Retrieves audit log CloudWatch configuration for the cluster.
  patch:
    parameters:
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"cloudwatch_audit_user_config_delta\",\n  \"\
        type\": \"object\",\n  \"properties\": {\n    \"enabled\": {\n      \"description\"\
        : \"enabled\",\n      \"type\": \"boolean\"\n    },\n    \"log_group_name\"\
        : {\n      \"description\": \"log_group_name\",\n      \"type\": \"string\"\
        \n    },\n    \"region\": {\n      \"description\": \"region\",\n      \"\
        type\": \"string\"\n    }\n  }\n}"
    response_body:
      description: Return value on success
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"cloudwatch_audit_user_config\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"enabled\": {\n      \"description\"\
        : \"enabled\",\n      \"type\": \"boolean\"\n    },\n    \"log_group_name\"\
        : {\n      \"description\": \"log_group_name\",\n      \"type\": \"string\"\
        \n    },\n    \"region\": {\n      \"description\": \"region\",\n      \"\
        type\": \"string\"\n    }\n  }\n}"
      status_code: '200'
    summary: Modifies audit log CloudWatch configuration for the cluster.
  put:
    parameters:
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"cloudwatch_audit_user_config\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"enabled\": {\n      \"description\"\
        : \"enabled\",\n      \"type\": \"boolean\"\n    },\n    \"log_group_name\"\
        : {\n      \"description\": \"log_group_name\",\n      \"type\": \"string\"\
        \n    },\n    \"region\": {\n      \"description\": \"region\",\n      \"\
        type\": \"string\"\n    }\n  }\n}"
    response_body:
      description: Return value on success
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"cloudwatch_audit_user_config\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"enabled\": {\n      \"description\"\
        : \"enabled\",\n      \"type\": \"boolean\"\n    },\n    \"log_group_name\"\
        : {\n      \"description\": \"log_group_name\",\n      \"type\": \"string\"\
        \n    },\n    \"region\": {\n      \"description\": \"region\",\n      \"\
        type\": \"string\"\n    }\n  }\n}"
      status_code: '200'
    summary: Sets audit log CloudWatch configuration for the cluster.
rest_endpoint: /v1/audit/cloudwatch/config
permalink: /rest-api-guide/audit/cloudwatch_config.html
sidebar: rest_api_guide_sidebar
---
