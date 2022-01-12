  The `state` field indicates a `REPLICATION_RUNNING` status and `current_job` shows ongoing progress. When Qumulo Core copies files from S3, details for the most recent completed job become available in the `last_job` field, the `state` field changes to `REPLICATION_NOT_RUNNING` and the `current_job` field reverts to `null`.

  {% include note.html content="If you already ran a job for a relationship, it is possible for both the `current_job` and `last_job` fields to be non-null while you run a new job." %}

  The `total_bytes` and `total_files` fields represent the total amount of data and number of files to be transferred by a Shift job. The `bytes_remaining` and `files_remaining` fields show the amount of data and number of files not transferred yet and `percent_complete` displays the overall progress of the job.
