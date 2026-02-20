---
category: /Replication V2
methods:
  delete:
    summary: Release a snapshot queued for replication from the queue of the specified
      source replication relationship. This action will permanently remove the snapshot
      from the relationship's replication queue, but not delete the snapshot from
      the cluster.
    parameters:
    - name: relationship_id
      description: Relationship identifier
      required: true
    - name: snapshot_id
      description: Snapshot identifier
      required: true
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    preview: false
rest_endpoint: /v2/replication/source-relationships/{relationship_id}/queued-snapshots/{snapshot_id}
api_version: v2
permalink: /rest-api-guide/replication-v2/v2_replication_source-relationships_relationship_id_queued-snapshots_snapshot_id.html
sidebar: rest_api_guide_sidebar
redirect_from: /rest-api-guide/replication/v2_replication_source-relationships_relationship_id_queued-snapshots_snapshot_id.html
deprecated: false
---
