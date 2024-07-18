---
category: /multitenancy
methods:
  delete:
    parameters:
    - description: The unique ID of the tenant
      name: tenant_id
      required: true
    - description: ETag for expected version
      name: If-Match
      required: false
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Delete configuration of a tenant.
  get:
    parameters:
    - description: The unique ID of the tenant
      name: tenant_id
      required: true
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Get configuration of a tenant.
  patch:
    parameters:
    - description: The unique ID of the tenant
      name: tenant_id
      required: true
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
    summary: Update the configuration of a tenant.
  put:
    parameters:
    - description: The unique ID of the tenant
      name: tenant_id
      required: true
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
    summary: Set configuration of a tenant.
rest_endpoint: /v1/multitenancy/tenants/{tenant_id}
permalink: /rest-api-guide/multitenancy/tenants_tenant_id.html
sidebar: rest_api_guide_sidebar
---
