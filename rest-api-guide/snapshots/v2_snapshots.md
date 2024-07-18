---
category: /snapshots
methods:
  get:
    parameters:
    - description: Specifies whether or not to include snapshots that are currently
        being deleted. Defaults to false if not specified.
      name: include-in-delete
      required: false
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Returns information about all snapshots.
  post:
    parameters:
    - description: Duration after which to expire the snapshot, in format <quantity><units>,
        where <quantity> is a positive integer less than 1000 and <units> is one of
        [months, weeks, days, hours, minutes], e.g. 5days or 1hours. Empty string
        or never indicates the snapshot should never expire. Defaults to never if
        not specified.
      name: expiration-time-to-live
      required: false
    request_body:
      example_value: TO DO
      schema: TO DO
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Creates a new snapshot and returns its details.
rest_endpoint: /v2/snapshots/
permalink: /rest-api-guide/snapshots/v2_snapshots.html
sidebar: rest_api_guide_sidebar
---
