---
category: /replication
methods:
  delete:
    parameters:
    - description: Relationship identifier
      name: relationship_id
      required: true
    - description: Snapshot identifier
      name: snapshot_id
      required: true
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Release a snapshot queued for replication from the queue of the specified
      source replication relationship. This action will permanently remove the snapshot
      from the relationship's replication queue, but not delete the snapshot from
      the cluster.
rest_endpoint: /v2/replication/source-relationships/{relationship_id}/queued-snapshots/{snapshot_id}
permalink: /rest-api-guide/replication/v2_replication_source-relationships__relationship_id_queued-snapshots__snapshot_id.html
sidebar: rest_api_guide_sidebar
---
