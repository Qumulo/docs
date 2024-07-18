---
category: /replication
methods:
  post:
    parameters:
    - description: Relationship identifier
      name: id
      required: true
    - description: Specifies whether the replication relationship may be authorized
        when the target directory is not empty. If set to true, existing data in the
        target directory that does not match the source directory will be overwritten
        or deleted. Defaults to false if not specified.
      name: allow-non-empty-directory
      required: false
    - description: Specifies whether the target directory may be created with inherited
        permissions if the directory does not already exist. Defaults to false if
        not specified.
      name: allow-fs-path-create
      required: false
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Authorize the specified replication relationship, establishing this cluster
      as the target of replication.
rest_endpoint: /v2/replication/target-relationships/{id}/authorize
sidebar: rest_api_command_guide_sidebar
---
