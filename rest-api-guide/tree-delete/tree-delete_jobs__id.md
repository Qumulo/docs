---
category: /tree-delete
methods:
  delete:
    parameters:
    - description: Job ID (uint64)
      name: id
      required: true
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Cancel directory-tree deletion on the specified directory. If the job
      has finished, returns 404. Also returns 404 if there was never a job on the
      given object
  get:
    parameters:
    - description: Job ID (uint64)
      name: id
      required: true
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Get status of directory-tree deletion on the specified directory. If
      the job has finished, returns 404. Also returns 404 if there was never a job
      on the given object
rest_endpoint: /v1/tree-delete/jobs/{id}
permalink: /rest-api-guide/tree-delete/tree-delete_jobs__id.html
sidebar: rest_api_guide_sidebar
---
