### Stopping a Copy Job in Progress
To stop a copy job already in progress, run the {% include qq.html command="replication_abort_object_replication" %} command and use the `--id` flag to specify the Shift relationship ID.

### Repeating a Completed Copy Job
To repeat a completed copy job, run the {% include qq.html command="replication_start_object_relationship" %} command and use the `--id` flag to specify the Shift relationship ID.

This command begins a new job for the existing relationship and downloads any content that changed in the S3 bucket or on the Qumulo cluster since the time the previous job ran.

### Deleting a Shift Relationship
After your copy job is complete, you can delete your Shift relationship. To do this, run the `replication_delete_object_relationship` command and use the `--id` flag to specify the Shift relationship ID.

{% include note.html content="You can run this command only against a relationship that doesn't have any active jobs running." %}

This command removes the copy job's record, leaving locally stored objects unchanged. Any storage that the relationship used to track downloaded objects becomes available when you delete the relationship.
