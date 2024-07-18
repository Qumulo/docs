---
category: /audit
methods:
  get:
    parameters: []
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Retrieves audit log syslog configuration for the cluster.
  patch:
    parameters:
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
      example_value: TO DO
      schema: TO DO
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Modifies audit log syslog configuration for the cluster.
  put:
    parameters:
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
      example_value: TO DO
      schema: TO DO
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Modifies audit log syslog configuration for the cluster.
rest_endpoint: /v1/audit/syslog/config
permalink: /rest-api-guide/audit/audit_syslog_config.html
sidebar: rest_api_guide_sidebar
---
