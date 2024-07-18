---
category: /replication
methods:
  post:
    parameters: []
    request_body:
      example_value: TO DO
      schema: TO DO
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Reverse source and target for the specified replication relationship.
      This operation is initiated on the target cluster. The previous target directory
      will be made the new source, and the previous source directory will be made
      the new target. Any relationship configurations on the source will be retained,
      and any configurations on the target that have been retained from a previous
      reversal will be reapplied. To resume replication after reversal, edit any relationship
      configurations if desired and reconnect the relationship from the new target
      cluster.
rest_endpoint: /v2/replication/source-relationships/reverse-target-relationship
permalink: /rest-api-guide/replication/reverse-target-relationship.html
sidebar: rest_api_guide_sidebar
---
