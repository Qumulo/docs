---
title: "Managing Snapshots in Qumulo Core"
summary: "This section explains how to create on-demand snapshots and snapshot policies, view and search for existing snapshots, and delete snapshots by using the Web UI and how to create snapshots on a schedule, create a snapshot with an expiration time, modify a snapshot's expiration time, and lock or unlock a snapshot by using by using a key located in the Qumulo file system key store and the <code>qq</code> CLI."
permalink: /administrator-guide/snapshots/managing-snapshots.html
redirect_from:
  - /managing-snapshots.html
  - /administrator-guide/managing-snapshots.html
  - /administrator-guide/qumulo-core/managing-snapshots.html
  - /administrator-guide/protecting-data/managing-snapshots.html
sidebar: administrator_guide_sidebar
keywords: snapshots, filter, web_ui, qumulo_core, snapshot_policy
varLogin: 1. Log in to the Qumulo Core Web UI.
varSaved: 1. Click **Cluster > Saved Snapshots**.
var433Only: In Qumulo Core version 4.3.3 (and higher),
---

For more information, see [Managing Security Keys in the Qumulo File System Key Store](../protecting-data/managing-security-keys.html).

## Managing Snapshots by Using the Web UI
This section explains how to create on-demand snapshots and snapshot policies, view and search for existing snapshots, and delete snapshots by using the Web UI.

### To Create an On-Demand Snapshot
{{page.varLogin}}

{{page.varSaved}}

1. On the **Saved Snapshots** page, in the upper right, click **Take Snapshot**.

1. In the **On Demand Snapshot** dialog box, do the following.

   1. Enter the **Snapshot Name**.

   1. For **Apply to Directory**, enter the directory to snapshot.

   1. For **Delete Snapshot**, specify whether Qumulo Core should never delete the snapshot or delete it after a specified time period.
 
   1. Click **Save**.

### To Create a Snapshot Policy
{{page.varLogin}}

1. Click **Cluster > Policy**.

1. On the **Snapshot Policies** page, in the upper right, click **Create Policy**.

1. On the **Create Snapshot Policy** page, do the following:

   1. Enter the **Policy Name**.
   
   1. For **Apply to Directory**, enter the directory to snapshot.
   
   1. In the **Run Policy on the Following Schedule** section, specify the snapshot frequency and when to delete snapshots.

   1. Click **Enable policy upon creation**.
 
   1. Click **Create Policy**.

### To View Existing Snapshots
The **Snapshots** page lets you navigate a large number of snapshots.

{{page.varLogin}}

{{page.varSaved}}

1. {{page.var433Only}} if you have more than 50 snapshots, use {% include inline_image.html alt="Pagination controls" file="managing-snapshots-pagination.png" max-width="40" %} to navigate the snapshot pages.

   You can also use the controls at the bottom of the table to navigate to a specific page or change the number of rows for each page.

### To Find a Specific Snapshot
{{page.var433Only}} you can search for a specific snapshot by name, creation time, and so on.

{{page.varLogin}}

{{page.varSaved}}

1. At the top of the table, click **enable filters**.

   The **Search...** field appears.

1. Enter a search query.

   The table rows match your query as you type.

1. (Optional) To turn off filtering, click **disable filters**.

### To Delete a Single Snapshot
{{page.varLogin}}

{{page.varSaved}}

1. On the right side of a snapshot's row, click {% include inline_image.html alt="Delete icon" file="managing-snapshots-delete.png" max-width="25" %}.

### To Delete Multiple Snapshots
{{page.var433Only}} you can delete multiple snapshots at once.

{{page.varLogin}}

{{page.varSaved}}

1. On the left side of the table, select every snapshot to delete.

   When you select more than one row, the **Bulk Delete** button appears.

1. When you finish selecting snapshots, click **Bulk Delete**.

{% include note.html content="Because all selection and deletion controls operate only on the current page, it isn't possible to delete a snapshot accidentally if it isn't listed on the current page." %}


## Managing Snapshots by Using the qq CLI
This section explains how to create snapshots on a schedule, create a snapshot with an expiration time, and modify a snapshot's expiration time by using the `qq` CLI.

{% include important.html content="Creating and modifying snapshot policies with an associated lock requires the `SNAPSHOT_LOCK` permission in addition to policy permissions." %}

<a id="create-snapshot-with-policy"></a>
### Creating Snapshots on a Schedule by Using a Snapshot Policy
Use the `qq snapshot_create_policy` command to create a snapshot policy and specify the interval at which Qumulo Core takes and deletes snapshots.

In the following example, we create a policy named `every_day` that takes a snapshot every midnight in the Pacific time zone and retains the snapshot for two days. Every new snapshot that this policy creates is locked with a key named `my-key-name`.

{% include note.html content="The `timezone` flag uses values from the [tz database](https://en.wikipedia.org/wiki/Tz_database). If you don't specify a time zone, the snapshot policy uses UTC time." %}

```bash
qq snapshot_create_policy daily \
  --name every_day \
  --days-of-week all \
  --at 00:00 \
  --timezone America/Los_Angeles \
  --time-to-live 7days
  --lock-key-name my-key-name
```

In the following example, we change a previously created policy with ID `1` to a policy named `hourly` that takes a snapshot every hour, but only during business hours (Monday to Friday, 8am to 6pm in the Pacific time zone), and retains snapshots for two days. Every new snapshot that this policy creates is unlocked (previously created snapshots remain locked).

```bash
qq snapshot_modify_policy change_to_hourly_or_less \
  -i 1 \
  --name hourly \
  --period 1hours \
  --days-of-week MON,TUE,WED,THU,FRI \
  --start-time 08:00 \
  --end-time 18:00 \
  --timezone America/Los_Angeles \
  --time-to-live 2days
  --clear-lock-key
```

### Creating an On-Demand Snapshot with an Expiration Time
Use the `qq_snapshot_create_snapshot` command to specify an expiration date or expiration time before Qumulo Core deletes the snapshot.

{% include note.html content="If you don't specify an expiration date or expiration time before deletion, Qumulo Core never deletes the snapshot." %}

In the following example, the snapshot expires on December 31, 2030, at midnight, in UTC time.

```bash
qq snapshot_create_snapshot \
  --expiration 2030-12-31T00:00:00Z
```

In the following example, Qumulo Core deletes the snapshot in one year from the snapshot's creation time.

```bash
qq snapshot_create_snapshot \
  --time-to-live 12months
```

### Modifying a Snapshot's Expiration Time
Use the `qq snapshot_modify_snapshot` command and specify the snapshot ID from the **Saved Snapshots** page in the Web UI (for example, for the `1234567_replication_from_prod` snapshot, the ID is `1234567`).

In the following example, the snapshot with ID `1234567` never expires.

```bash
qq snapshot_modify_snapshot \
  -i 1234567
  -e ''
```

In the following example, the snapshot with ID `1234567` expires after one month.

```bash
qq snapshot_modify_snapshot \
  -i 1234567 \
  -t 1month
```

<a id="locking-unlocking-snapshots"></a>
### Locking and Unlocking Snapshots
{{site.data.alerts.important}}
<ul>
  <li>Unlocking a snapshot requires a cryptographic signature. Before you lock a snapshot, make sure that you have access to your private keys and that you understand the unlocking procedure.</li> 
  <li>It isn't possible to delete or shorten the expiration time of a locked snapshot. However, you can extend the expiration time of a locked snapshot.</li>
  <li>Qumulo Core removes both locked and unlocked snapshots at their expiration time automatically.</li>
</ul>
{{site.data.alerts.end}}

In Qumulo Core 6.1.0 (and higher), you can lock a snapshot by using [a key located in the Qumulo file system key store](../protecting-data/managing-security-keys.html). You can also ensure that [a snapshot policy locks all new snapshots with a particular key](#create-snapshot-with-policy) by associating the key with the snapshot policy.

#### To Lock a Snapshot by Using the qq CLI
Use the `qq snapshot_lock_snapshot` command and specify the snapshot ID and either the key identifier (by using the `--lock-key-id` flag) or the key name (by using the `--lock-key-name` flag). For example:

```bash
qq snapshot_lock_snapshot \
  --id 1682119059 \
  --lock-key-name my-key-name
```

#### To Unlock a Snapshot by Using the qq CLI
Unlocking a snapshot requires proving that you can sign a challenge by using the same key that locked the snapshot. You can do this by using either of the following methods.

##### If You Have Direct Access to the Private Key
{% capture cryptoLib %}{{site.protectingData.mustHaveCryptoLib}}{% endcapture %}
{% include note.html content=cryptoLib %}

Use the `qq snapshot_unlock_snapshot` command and specify the snapshot ID and the path to the private key file. For example:

```bash
qq snapshot_unlock_snapshot \
  --id 1682119059 \
  --private-key-file /path/to-my-file.pem
```

##### If You Don't Have Direct Access to the Private Key
If you can use the private key only to sign data, take the following steps.

1. To receive the unlock challenge, run the `qq snapshot_get_unlock_challenge` command and specify the snapshot ID. For example:

   ```bash
   qq snapshot_get_unlock_challenge \
     --id 1682119059
   ```
   
   {% include important.html content="Any change to the snapshot after you receive the unlock challenge, but before you perform the unlock, causes the challenge to change." %}

1. To generate a verification signature, use the response from the challenge with your private key.

   For more information about creating a verification signature by using a private key or key management service, see [Signing a Security Challenge by Using an ECDSA Private Key](../protecting-data/generating-storing-ecdsa-keys.html#signing-a-security-challenge-by-using-an-ecdsa-private-key).

1. To unlock the snapshot, use the `qq snapshot_unlock_snapshot` command and specify the snapshot ID and the Base64-encoded unlock challenge that your private key signed. For example:

   ```bash
   qq snapshot_unlock_snapshot \
     --id 1682119059 \
     --signature "VGhpcyBpcyBteSB1bmxvY2sgY2hhbGxlbmdlLg=="
   ```
