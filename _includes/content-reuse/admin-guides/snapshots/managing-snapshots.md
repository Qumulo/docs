## Managing Snapshots by Using the Qumulo Core Web UI
This section explains how to create on-demand snapshots and snapshot policies, view and search for existing snapshots, and delete snapshots by using the Qumulo Core Web UI.

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

1. {{page.var433Only}} if you have more than 50 snapshots, use {% include shared_inline_image.html alt="Pagination controls" file="shared-images/admin-guides/snapshots/managing-snapshots-pagination.png" max-width="40" %} to navigate the snapshot pages.

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

1. On the right side of a snapshot's row, click {% include shared_inline_image.html alt="Delete icon" file="shared-images/admin-guides/snapshots/managing-snapshots-delete.png" max-width="25" %}.

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

In the following example, we create a policy named `every_day` that takes a snapshot every midnight in the Pacific time zone and retains the snapshot for two days. Every new snapshot that this policy creates is locked with a key named `my-key-name`.  {{page.varSeeLockUnlock}}

{% include note.html content="The `timezone` flag uses values from the [tz database](https://en.wikipedia.org/wiki/Tz_database). If you don't specify a time zone, the snapshot policy uses UTC time." %}

```bash
qq snapshot_create_policy daily \
  --name every_day \
  --days-of-week all \
  --at 00:00 \
  --timezone America/Los_Angeles \
  --time-to-live 7days
  --lock-key my-key-name
```

In the following example, we change a previously created policy with ID `1` to a policy named `hourly` that takes a snapshot every hour, but only during business hours (Monday to Friday, 8am to 6pm in the Pacific time zone), and retains snapshots for two days. Every new snapshot that this policy creates is unlocked (previously created snapshots remain locked). {{page.varSeeLockUnlock}}

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
Use the `qq snapshot_modify_snapshot` command and specify the snapshot ID from the **Saved Snapshots** page in the Qumulo Core Web UI (for example, for the `1234567_replication_from_prod` snapshot, the ID is `1234567`).

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
