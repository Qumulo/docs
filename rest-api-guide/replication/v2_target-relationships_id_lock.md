---
category: /replication
methods:
  post:
    parameters:
    - description: Relationship identifier
      name: id
      required: true
    request_body:
      schema: "{\n  \"description\": \"api_target_relationship_lock\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"lock_key_ref\": {\n      \"description\"\
        : \"The key that locks the policy-created snapshots for the specified target\
        \ replication relationship. If set to null, the system does not lock the snapshots\
        \ that the specified target replication relationship creates. Only snapshots\
        \ created by a policy will be locked. Unless you configure an expiration on\
        \ the snapshot policy on the target cluster, the system does not lock snapshots.\
        \ If you reverse the relationship (switch the source and the target), the\
        \ new target does not use this lock key. To enable snapshot locking, you must\
        \ configure the new target separately. However, if you revert the reversed\
        \ relationship (return the source and target to their original assignments),\
        \ the system preserves the original target replication relationship lock key.\
        \ Unless you reverse the relationship, you cannot disable or delete a lock\
        \ key while a target replication relationship uses the key. If you disable\
        \ or delete a lock key while the relationship is reversed and you then revert\
        \ the reversal, the original source-target relationship has no lock key until\
        \ you configure a new one.\",\n      \"type\": \"string\"\n    }\n  }\n}"
    response_body:
      schema: "{\n  \"description\": \"api_target_relationship_lock\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"lock_key_ref\": {\n      \"description\"\
        : \"The key that locks the policy-created snapshots for the specified target\
        \ replication relationship. If set to null, the system does not lock the snapshots\
        \ that the specified target replication relationship creates. Only snapshots\
        \ created by a policy will be locked. Unless you configure an expiration on\
        \ the snapshot policy on the target cluster, the system does not lock snapshots.\
        \ If you reverse the relationship (switch the source and the target), the\
        \ new target does not use this lock key. To enable snapshot locking, you must\
        \ configure the new target separately. However, if you revert the reversed\
        \ relationship (return the source and target to their original assignments),\
        \ the system preserves the original target replication relationship lock key.\
        \ Unless you reverse the relationship, you cannot disable or delete a lock\
        \ key while a target replication relationship uses the key. If you disable\
        \ or delete a lock key while the relationship is reversed and you then revert\
        \ the reversal, the original source-target relationship has no lock key until\
        \ you configure a new one.\",\n      \"type\": \"string\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Set or clear the snapshot lock key ID for snapshots that this target
      replication relationship creates. Changing the lock key applies only to snapshots
      that the system takes after you make a configuration change.
rest_endpoint: /v2/replication/target-relationships/{id}/lock
api_version: v2
permalink: /rest-api-guide/replication/v2_target-relationships_id_lock.html
sidebar: rest_api_guide_sidebar
---
