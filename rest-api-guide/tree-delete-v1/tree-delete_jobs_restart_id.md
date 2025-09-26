---
category: /Tree Delete V1
methods:
  post:
    summary: Restart execution of a directory tree deletion job that has hit an error
      on a filelock.
    parameters:
    - name: id
      description: Job ID
      required: true
    response_body: {}
    responses:
    - code: '202'
      description: Return value on success
    preview: false
rest_endpoint: /v1/tree-delete/jobs/restart/{id}
api_version: v1
permalink: /rest-api-guide/tree-delete-v1/tree-delete_jobs_restart_id.html
sidebar: rest_api_guide_sidebar
redirect_from: /rest-api-guide/tree-delete/tree-delete_jobs_restart_id.html
---
