  The `state` field indicates a `REPLICATION_RUNNING` status and `current_job` shows ongoing progress. When Qumulo Core copies files from S3, details for the most recent completed job become available in the `last_job` field, the `state` field changes to `REPLICATION_NOT_RUNNING` and the `current_job` field reverts to `null`.

  {% include note.html content="If you already ran a job for a relationship, it is possible for both the `current_job` and `last_job` fields to be non-null while you run a new job." %}

### Stopping a Copy Job in Progress
To stop a copy job already in progress, use the `replication_abort_object_relationship` command followed by the `--id` and the Shift relationship ID.

### Repeating a Completed Copy Job
To repeat a completed copy job, use the `replication_start_object_relationship` command followed by the `--id` and the Shift relationship ID.

This command begins a new job for the existing relationship and downloads any content that changed in the S3 bucket or on the Qumulo cluster since the time the previous job ran.

### Deleting a Shift Relationship
After your copy job is complete, you can delete your Shift relationship. To do this, run the `replication_delete_object_relationship` command followed by the `--id` and the Shift relationship ID.

{% include note.html content="You can run this command only against a relationship that doesn't have any active jobs running." %}

This command removes the copy job's record, leaving locally stored objects unchanged. Any storage that the relationship used to track downloaded objects becomes available when you delete the relationship.
