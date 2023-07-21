---
title: "Locking and Unlocking Snapshots in Qumulo Core"
summary: "This section explains how to lock or unlock a snapshot by using a key located in the Qumulo file system key store and the <code>qq</code> CLI. In addition, it explains how to lock policy-created snapshots for local policies and for policies that are part of a replication target relationship."
permalink: /administrator-guide/snapshots/locking-unlocking-snapshots.html
redirect_from:
  - /managing-snapshots.html#locking-and-unlocking-snapshots
sidebar: administrator_guide_sidebar
keywords: snapshots, filter, qumulo_core, snapshot_policy, lock, unlock
---

For more information, see [Managing Security Keys in the Qumulo File System Key Store](../encryption-data-security/managing-security-keys.html).

<a id="locking-unlocking-snapshots"></a>
## Locking and Unlocking Snapshots
{{site.data.alerts.important}}
<ul>
  <li>Unlocking a snapshot requires a cryptographic signature. Before you lock a snapshot, make sure that you have access to your private keys and that you understand the unlocking procedure.</li> 
  <li>It isn't possible to delete or shorten the expiration time of a locked snapshot. However, you can extend the expiration time of a locked snapshot.</li>
  <li>Qumulo Core removes both locked and unlocked snapshots at their expiration time automatically.</li>
</ul>
{{site.data.alerts.end}}

In Qumulo Core 6.1.0.1 (and higher), you can [lock a snapshot by using a key located in the Qumulo file system key store](../encryption-data-security/managing-security-keys.html). You can also ensure that [a snapshot policy locks all new snapshots with a particular key](managing-snapshots.html#create-snapshot-with-policy) by associating the key with the snapshot policy.

In Qumulo Core 6.1.1 (and higher), you can [ensure that a replication target relationship locks all new policy snapshots with a specific key](#replication-target-locking) by associating the key with the replication target.

### To Lock a Snapshot by Using the qq CLI
Use the `qq snapshot_lock_snapshot` command and specify the snapshot ID and either the key ID or key name. For example:

```bash
qq snapshot_lock_snapshot \
  --id 1682119059 \
  --lock-key my-key-name
```

### To Unlock a Snapshot by Using the qq CLI
Unlocking a snapshot requires proving that you can sign a challenge by using the same key that locked the snapshot. You can do this by using either of the following methods.

#### If You Have Direct Access to the Private Key
{% capture cryptoLib %}{{site.protectingData.mustHaveCryptoLib}}{% endcapture %}
{% include note.html content=cryptoLib %}

Use the `qq snapshot_unlock_snapshot` command and specify the snapshot ID and the path to the private key file. For example:

```bash
qq snapshot_unlock_snapshot \
  --id 1682119059 \
  --private-key-file /path/to-my-file.pem
```

#### If You Don't Have Direct Access to the Private Key
If you can use the private key only to sign data, take the following steps.

1. To receive the unlock challenge, run the `qq snapshot_get_unlock_challenge` command and specify the snapshot ID. For example:

   ```bash
   qq snapshot_get_unlock_challenge \
     --id 1682119059
   ```
   
   {% include important.html content="Any change to the snapshot after you receive the unlock challenge, but before you perform the unlock, causes the challenge to change." %}

1. To generate a verification signature, use the response from the challenge with your private key.

   For more information about creating a verification signature by using a private key or key management service, see [Signing a Security Challenge by Using an ECDSA Private Key](../encryption-data-security/generating-storing-ecdsa-keys.html#signing-a-security-challenge-by-using-an-ecdsa-private-key).

1. To unlock the snapshot, use the `qq snapshot_unlock_snapshot` command and specify the snapshot ID and the Base64-encoded unlock challenge that your private key signed. For example:

   ```bash
   qq snapshot_unlock_snapshot \
     --id 1682119059 \
     --signature "VGhpcyBpcyBteSB1bmxvY2sgY2hhbGxlbmdlLg=="
   ```

<a id="replication-target-locking"></a>
## Associating a Lock Key with a Replication Target Relationship
To lock all policy-created snapshots by using a lock key, you can associate the key with a replication target relationship. Consider the following system behavior:

* Qumulo Core locks only policy-created snapshots that have an expiration time.

* If you reverse the relationship by switching the source and target, the new target can't use the existing key and you must set a key for the new target. However, if you revert the relationship by returning the source and target to their original assignments, Qumulo Core lets you use the key from the original source-target relationship.

* If a target replication relationship uses a key, you can't disable or delete the key, unless you reverse the relationship.

* If you disable or delete a key while a target replication relationship is reversed and then return the source and target to their original assignments, you must set a new key to be able to lock future snapshots.


### To Associate a Lock Key with a Replication Target Relationship
Run the `qq replication_set_target_relationship_lock` command and specify the relationship ID and key name or ID. For example:

```bash
qq replication_set_target_relationship_lock \
  --relationship-id {{site.exampleUUID41}}
  --lock-key my-key-name
```

### To Disassociate a Lock Key from a Replication Target Relationship
Run the `qq replication_set_target_relationship_lock` command and specify the relationship ID and and `--clear-lock-key` flag. For example:

```bash
qq replication_set_target_relationship_lock \
  --relationship-id {{site.exampleUUID41}}
  --clear-lock-key
```
