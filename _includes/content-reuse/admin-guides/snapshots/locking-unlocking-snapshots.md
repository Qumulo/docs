## How Snapshot Locking Works in Qumulo Core
Qumulo Core allows locking snapshots to prevent them from being deleted before their expiration time. Qumulo Core removes both locked and unlocked snapshots at their expiration time automatically.

While it isn't possible to delete or shorten the expiration time of a locked snapshot, it is possible to extend the expiration time of a locked snapshot.

You can lock a snapshot by using the following methods.

### Locking a Snapshot by Using a Public Key
In Qumulo Core 6.1.0.3 (and higher) you can lock a snapshot by using a public key.

1. [Generate a private key](../encryption-data-security/generating-storing-ecdsa-keys.html#generating-an-ecdsa-private-key).

1. [Extract a public key from the private key](../encryption-data-security/generating-storing-ecdsa-keys.html#extracting-the-public-key-from-an-ecdsa-private-key).

1. [Store the public key on your cluster](../encryption-data-security/managing-security-keys.html#adding-a-public-key).

1. [Lock your snapshot by using the `qq` CLI](#lock-snapshot-qq-cli).

### Locking a Snapshot by Using a Private Key
In Qumulo Core 6.1.1 (and higher) you can lock a snapshot by using a _lock key_ (private key).

1. [Generate a private key](../encryption-data-security/generating-storing-ecdsa-keys.html#generating-an-ecdsa-private-key).

1. [Lock your snapshot by using the `qq` CLI](#lock-snapshot-qq-cli).

### Locking a Snapshot by Using a Private Key in a Snapshot Policy
In Qumulo Core 6.1.0.3 (and higher), you can configure a snapshot policy to lock all new snapshots with a _lock key_ (private key).
 
1. [Generate a private key](../encryption-data-security/generating-storing-ecdsa-keys.html#generating-an-ecdsa-private-key).

1. [Associate your lock key with a snapshot policy by using the Web UI](managing-snapshots.html#to-associate-a-lock-key-with-a-snapshot-policy).

### Locking a Snapshot by Using a Private Key on a Target Cluster Following Replication
For clusters in a replication relationship, you can lock a snapshot on the destination cluster after the replication process finishes.

1. [Generate a private key](../encryption-data-security/generating-storing-ecdsa-keys.html#generating-an-ecdsa-private-key).

1. [Retrieve the relationship ID from the source cluster by using the `qq` CLI](#retrieve-relationship-id).

1. [Associate your lock key with a replication target relationship by using the `qq` CLI](#associate-lock-key-with-replication-target-relationship).


## How Snapshot Unlocking Works in Qumulo Core
Unlocking a snapshot requires a cryptographic signature generated from a private key. To unlock a snapshot after its expiration time, [use the `qq` CLI](#unlock-snapshot-qq-cli).


<a id="locking-unlocking-snapshots"></a>
## Locking and Unlocking Snapshots by Using the qq CLI
This section explains how to lock and unlock snapshots by using the `qq` CLI.

{% include tip.html content="To list your snapshots and their lock statuses, use the `sudo qq snapshot_list_statuses | egrep 'lock_key|source_file_path'` command." %}

<a id="lock-snapshot-qq-cli"></a>
### Locking a Snapshot
Run the {% include qq.html command="snapshot_lock_snapshot" %} command and specify the snapshot ID and either the key ID or key name. For example:

```bash
qq snapshot_lock_snapshot \
  --id 1682119059 \
  --lock-key my-key-name
```

<a id="unlock-snapshot-qq-cli"></a>
### Unlocking a Snapshot
Unlocking a snapshot requires proving that you can sign a challenge by using the same key that locked the snapshot.

{% capture cryptoLib %}{{site.protectingData.mustHaveCryptoLib}}{% endcapture %}
{% include note.html content=cryptoLib %}

Run the {% include qq.html command="snapshot_unlock_snapshot" %} command and specify the snapshot ID and the path to the private key file. For example:

```bash
qq snapshot_unlock_snapshot \
  --id 1682119059 \
  --private-key-file /path/to-my-file.pem
```

<a id="replication-target-locking"></a>
## Associating a Lock Key with a Replication Target Relationship by Using the qq CLI
To lock all policy-created snapshots by using a lock key, you can associate the key with a replication target relationship.

### How Relationship Reversal Affects Replication
It is important to understand how reversing the relationship between clusters can affect the replication process:

* If you reverse the relationship by switching the source and target, the new target can't use the existing key and you must set a key for the new target.

  However, if you revert the relationship by returning the source and target to their original assignments, Qumulo Core lets you use the key from the original source-target relationship.

* If a target replication relationship uses a key, you can't disable or delete the key, unless you reverse the relationship.

* If you disable or delete a key while a target replication relationship is reversed and then return the source and target to their original assignments, you must set a new key to be able to lock future snapshots.

<a id="retrieve-relationship-id">
### Retrieving the Relationship ID from the Source Cluster
Before you begin, retrieve the relationship ID from the source cluster by using the {% include qq.html command="replication_list_source_relationship_statuses" %} command.

If the command returns multiple relationships, you can pipe the command to the following `jq` query to sort the output. The first column lists the replication IDs.

```bash
qq replication_list_source_relationship_statuses | jq -r \
  '(["id", "srcRoot", "tgtRoot", "replicationSnap", \
  "replicationMode", "tgtClusterName", "targetIP"]), \
  (.[] | [.id, .source_root_path, .target_root_path, \
  (if .replicating_snapshot.id == null then "null" else \
  .replicating_snapshot.id end), \
  .replication_mode, .target_cluster_name, .target_address]) \
  | @tsv' | column -t -s $'\t'
```

<a id="associate-lock-key-with-replication-target-relationship">
### Associating a Lock Key with a Replication Target Relationship
On the target cluster, run the {% include qq.html command="replication_set_target_relationship_lock" %} command and specify the relationship ID and key name or ID. For example:

```bash
qq replication_set_target_relationship_lock \
  --relationship-id {{site.exampleUUID41}} \
  --lock-key my-key-name
```

<a id="disassociating-lock-key-from-replication-target-relationship">
### Disassociating a Lock Key from a Replication Target Relationship
On the target cluster, run the {% include qq.html command="replication_set_target_relationship_lock" %} command, specify the relationship ID, and use the `--clear-lock-key` flag. For example:

```bash
qq replication_set_target_relationship_lock \
  --relationship-id {{site.exampleUUID41}} \
  --clear-lock-key
```
