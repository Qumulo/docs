---
category: /snapshots
methods:
  get:
    parameters:
    - description: "Filter the list of snapshots to exclude snapshots in process of\
        \ being deleted, or include only snapshots in process of being deleted. By\
        \ default, includes all snapshots.:\n * `all` - all,\n * `exclude_in_delete`\
        \ - exclude_in_delete,\n * `only_in_delete` - only_in_delete"
      name: filter
      required: true
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Returns the statuses for all snapshots. Each snapshot's status includes
      additional non-configurable information about a snapshot.
rest_endpoint: /v3/snapshots/status/
permalink: /rest-api-guide/snapshots/v3_status.html
sidebar: rest_api_guide_sidebar
---
