## How Snapshots Work
Qumulo Core 2.5.0 (and higher) can take instant snapshots of the file system. A _snapshot_ is an entry for every version of file system elements such as files, directories, creation and modification timestamps, permissions, and so on. Each new entry points only to changed data and, to allow original and new entries to share data, Qumulo Core writes the entries alongside each other.

Taking a snapshot doesn't consume storage or incur a performance penalty. There is only a negligible performance penalty for reading and writing snapshotted file system data.

### How Snapshots Grow Over Time
The following example shows how Qumulo Core allocates storage to data and links it to file metadata as file system data changes.

In this scenario:

1. A user creates a file with 4 MB of data.

1. Qumulo Core takes a snapshot of the file.

1. A user modifies 1 MB of data within the file.

1. Qumulo Core allocates a new 1 MB region to the modified data.

{% include shared_image.html alt="The following example diagram uses a 4 MB file to explain how a snapshot grows over time." file="shared-images/admin-guides/snapshots/how-snapshots-work.png" %}

Now, the following is true:

* **5 MB:** The total storage that the file occupies

  * **3 MB:** Data shared between the original and new versions of the file

  * **1 MB:** Original data that exists only in the _saved_ (snapshotted) version of the file

  * **1 MB:** New data that exists only in the _live_ (latest) version of the file

Next, the following conditions take effect:

* If the user rewrites that particular 1 MB of data, the system overwrites the existing live data without allocating new space.

* If the user rewrites a different region of the file, Qumulo Core allocates additional storage.


## Determining Snapshots' Storage Usage
When Qumulo Core tracks the difference between the _saved_ (snapshotted) and _live_ (latest) versions of a file, it creates a _lineage_ of snapshots independent from each other. To determine the amount of data that a single snapshot references, run the {% include qq.html command="snapshot_get_capacity_used_per_snapshot" %} command and specify the snapshot ID. For example:

```bash
qq snapshot_get_capacity_used_per_snapshot \
  --id 1682119059
```

More than one snapshot can reference _covered data_. It isn't possible to release covered data until you delete all _covering snapshots_ that reference it.

* To determine the total covered data, including data no longer present in the snapshot, run the {% include qq.html command="snapshot_get_capacity_used_per_snapshot" %} command and specify multiple, comma-separated snapshot IDs.

* To determine the total amount of data, including covered data that multiple snapshots reference, run the {% include qq.html command="snapshot_get_total_used_capacity" %} command.

When you delete a snapshot, Qumulo Core removes the data which that snapshot references but retains the data which any other snapshot references. This ensures a full file representation within the remaining snapshots. Qumulo Core uses a background process to recover the storage that the snapshot had consumed.

{% include note.html content="When you delete a snapshot, the background process might take some time. To track the reclaimed storage, run the `qq snapshot_get_total_used_capacity` command." %}

### Example: Tracking Covering Snapshots and Data Changes
For example, if you run the {% include qq.html command="snapshot_get_total_used_capacity" %} command, Qumulo Core shows that storage usage is 1,319,413,953,331 Bytes (1.2 TiB). This amount includes the total snapshot data and the covering snapshots.

If you add up the usage for all snapshots currently in the file system (by using the `qq snapshot_get_capacity_used_per_snapshot` command), Qumulo Core shows that total snapshot storage usage is 2,147,483,648 Bytes (2 GiB). This amount includes the data changes that each snapshot stores but doesn't include the unchanged file portions within each snapshot.

### Example: Tracking File Snapshot Changes Over Time
For example, you have a 1 TiB file that you modify over time.

* **Snapshot 1:** This snapshot is 1,099,511,627,776 Bytes in size and contains the full 1 TiB file.

* **Snapshot 2:** This snapshot is 1,073,741,824 Bytes in size and contains 1 GiB of data changes.

* **Snapshot 3:** This snapshot is 1,073,741,824 Bytes in size and contains an additional 1 GiB of data changes.

If you delete snapshot 1, only 1,023 GiB of data (covered by snapshots 2 and 3) remain. Qumulo Core doesn't release this 1,023 GiB of data until you delete all snapshots that reference the original file.

{% include note.html content="Without the data that snapshots 2 and 3 cover, no full file representation is possible." %}
