---
category: /snapshots
methods:
  get:
    parameters:
    - description: Filter the list of snapshots to exclude any combination of snapshots
        in process of being deleted, snapshots not in process of being deleted, locked
        snapshots, and unlocked snapshots. By default, includes all snapshots.
      name: filter
      required: false
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Returns the information for every snapshot. If a snapshot was created
      from a snapshot policy, returns information about the policy.
rest_endpoint: /v4/snapshots/status/
permalink: /rest-api-guide/snapshots/v4_status.html
sidebar: rest_api_guide_sidebar
---
