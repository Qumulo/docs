---
category: /replication
methods:
  get:
    parameters:
    - description: Relationship identifier
      name: id
      required: true
    response_body:
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"api_target_relationship_status\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"id\": {\n      \"description\":\
        \ \"Unique identifier of the replication relationship\",\n      \"type\":\
        \ \"string\"\n    },\n    \"state\": {\n      \"type\": \"string\",\n    \
        \  \"enum\": [\n        \"AWAITING_AUTHORIZATION\",\n        \"DISCONNECTED\"\
        ,\n        \"DISCONNECTING\",\n        \"ENDED\",\n        \"ESTABLISHED\"\
        ,\n        \"RECONNECTING\",\n        \"REESTABLISHING\"\n      ],\n     \
        \ \"description\": \"Current state of replication relationship:\\n * `AWAITING_AUTHORIZATION`\
        \ - AWAITING_AUTHORIZATION,\\n * `DISCONNECTED` - DISCONNECTED,\\n * `DISCONNECTING`\
        \ - DISCONNECTING,\\n * `ENDED` - ENDED,\\n * `ESTABLISHED` - ESTABLISHED,\\\
        n * `RECONNECTING` - RECONNECTING,\\n * `REESTABLISHING` - REESTABLISHING\"\
        \n    },\n    \"end_reason\": {\n      \"description\": \"If the relationship\
        \ has ENDED, this states the reason. Otherwise, this field is empty\",\n \
        \     \"type\": \"string\"\n    },\n    \"source_cluster_name\": {\n     \
        \ \"description\": \"Name of the source cluster\",\n      \"type\": \"string\"\
        \n    },\n    \"source_cluster_uuid\": {\n      \"description\": \"UUID of\
        \ the source cluster\",\n      \"type\": \"string\"\n    },\n    \"source_root_path\"\
        : {\n      \"description\": \"Path to the source directory\",\n      \"type\"\
        : \"string\"\n    },\n    \"source_root_read_only\": {\n      \"description\"\
        : \"Whether the source directory is read-only\",\n      \"type\": \"boolean\"\
        \n    },\n    \"source_address\": {\n      \"description\": \"The previously\
        \ connected source IP address\",\n      \"type\": \"string\"\n    },\n   \
        \ \"source_port\": {\n      \"description\": \"Network port previously used\
        \ to replicate to on the source\",\n      \"type\": \"number\"\n    },\n \
        \   \"target_cluster_name\": {\n      \"description\": \"Name of the target\
        \ cluster\",\n      \"type\": \"string\"\n    },\n    \"target_cluster_uuid\"\
        : {\n      \"description\": \"UUID of the target cluster\",\n      \"type\"\
        : \"string\"\n    },\n    \"target_root_path\": {\n      \"description\":\
        \ \"Path to the target directory\",\n      \"type\": \"string\"\n    },\n\
        \    \"target_root_read_only\": {\n      \"description\": \"Whether the target\
        \ directory is read-only\",\n      \"type\": \"boolean\"\n    },\n    \"job_state\"\
        : {\n      \"type\": \"string\",\n      \"enum\": [\n        \"REPLICATION_NOT_RUNNING\"\
        ,\n        \"REPLICATION_RUNNING\"\n      ],\n      \"description\": \"Current\
        \ state of the job:\\n * `REPLICATION_NOT_RUNNING` - REPLICATION_NOT_RUNNING,\\\
        n * `REPLICATION_RUNNING` - REPLICATION_RUNNING\"\n    },\n    \"job_start_time\"\
        : {\n      \"description\": \"If the job state is REPLICATION_RUNNING, this\
        \ is the time that the job started, encoded as RFC 3339\",\n      \"type\"\
        : \"string\"\n    },\n    \"recovery_point\": {\n      \"description\": \"\
        The time that the last successful job started, encoded as RFC 3339\",\n  \
        \    \"type\": \"string\"\n    },\n    \"error_from_last_job\": {\n      \"\
        description\": \"The error message from the previous job. If the previous\
        \ job succeeded or no job has ever run, this field will be empty\",\n    \
        \  \"type\": \"string\"\n    },\n    \"duration_of_last_job\": {\n      \"\
        description\": \"The elapsed execution time of the previous job, in nanoseconds.\
        \ If no job has ever run, this field will be null.\",\n      \"type\": \"\
        object\",\n      \"properties\": {\n        \"nanoseconds\": {\n         \
        \ \"description\": \"nanoseconds\",\n          \"type\": \"string\"\n    \
        \    }\n      }\n    },\n    \"target_root_id\": {\n      \"description\"\
        : \"File ID of the target directory\",\n      \"type\": \"string\"\n    },\n\
        \    \"replication_enabled\": {\n      \"description\": \"Whether automatic\
        \ replication is enabled\",\n      \"type\": \"boolean\"\n    },\n    \"replication_job_status\"\
        : {\n      \"description\": \"Information about the progress of a job. This\
        \ field is null if there is no job status available.\",\n      \"type\": \"\
        object\",\n      \"properties\": {\n        \"percent_complete\": {\n    \
        \      \"description\": \"Percent of way through the job, computed from a\
        \ weighting of data and files processed\",\n          \"type\": \"number\"\
        \n        },\n        \"estimated_seconds_remaining\": {\n          \"description\"\
        : \"Estimated number of seconds remaining in the job, derived from percent_complete.\
        \ This may be null if there is no estimate.\",\n          \"type\": \"string\"\
        \n        },\n        \"bytes_transferred\": {\n          \"description\"\
        : \"Number of bytes copied\",\n          \"type\": \"string\"\n        },\n\
        \        \"bytes_unchanged\": {\n          \"description\": \"Number of bytes\
        \ not copied because they didn't change\",\n          \"type\": \"string\"\
        \n        },\n        \"bytes_remaining\": {\n          \"description\": \"\
        Number of bytes left to be processed in order to complete this job\",\n  \
        \        \"type\": \"string\"\n        },\n        \"bytes_deleted\": {\n\
        \          \"description\": \"Number of bytes deleted\",\n          \"type\"\
        : \"string\"\n        },\n        \"bytes_total\": {\n          \"description\"\
        : \"Total number of bytes that will be processed during this job (this will\
        \ be close but not exact)\",\n          \"type\": \"string\"\n        },\n\
        \        \"files_transferred\": {\n          \"description\": \"Number of\
        \ files copied\",\n          \"type\": \"string\"\n        },\n        \"\
        files_unchanged\": {\n          \"description\": \"Number of files not copied\
        \ because they didn't change\",\n          \"type\": \"string\"\n        },\n\
        \        \"files_remaining\": {\n          \"description\": \"Number of files\
        \ left to be processed in order to complete this job\",\n          \"type\"\
        : \"string\"\n        },\n        \"files_deleted\": {\n          \"description\"\
        : \"Number of files deleted\",\n          \"type\": \"string\"\n        },\n\
        \        \"files_total\": {\n          \"description\": \"Total number of\
        \ files that will be processed during this job (this will be close but not\
        \ exact)\",\n          \"type\": \"string\"\n        },\n        \"throughput_overall\"\
        : {\n          \"description\": \"Overall average throughput in bytes per\
        \ second of data copied since the beginning of the job\",\n          \"type\"\
        : \"string\"\n        },\n        \"throughput_current\": {\n          \"\
        description\": \"Average throughput in bytes per second of data copied in\
        \ the last one minute\",\n          \"type\": \"string\"\n        }\n    \
        \  }\n    },\n    \"recovery_point_snapshot\": {\n      \"description\": \"\
        The snapshot that the last successful job replicated. If no replication job\
        \ has ever run successfully, this field is set to null.\",\n      \"type\"\
        : \"object\",\n      \"properties\": {\n        \"id\": {\n          \"description\"\
        : \"Unique identifier of the snapshot\",\n          \"type\": \"number\"\n\
        \        },\n        \"name\": {\n          \"description\": \"Name of the\
        \ snapshot\",\n          \"type\": \"string\"\n        },\n        \"timestamp\"\
        : {\n          \"description\": \"Creation timestamp of the snapshot, encoded\
        \ as RFC 3339, which is a normalized subset of ISO 8601. See http://tools.ietf.org/rfc/rfc3339.txt,\
        \ section 5.6 for ABNF.\",\n          \"type\": \"string\"\n        },\n \
        \       \"directory_name\": {\n          \"description\": \"Snapshot directory\
        \ name, as would be seen in the .snapshot directory over SMB or NFS.\",\n\
        \          \"type\": \"string\"\n        },\n        \"source_file_id\": {\n\
        \          \"description\": \"Source directory of the snapshot\",\n      \
        \    \"type\": \"string\"\n        },\n        \"created_by_policy\": {\n\
        \          \"description\": \"This snapshot was created by a policy. The name\
        \ of that policy will be stored in the name field in place of a user-defined\
        \ name.\",\n          \"type\": \"boolean\"\n        },\n        \"expiration\"\
        : {\n          \"description\": \"Time at which snapshot will be expired.\
        \ Empty string if no expiration time set. Encoded as RFC 3339, which is a\
        \ normalized subset of ISO 8601. See http://tools.ietf.org/rfc/rfc3339.txt,\
        \ section 5.6 for ABNF.\",\n          \"type\": \"string\"\n        },\n \
        \       \"in_delete\": {\n          \"description\": \"Whether or not the\
        \ snapshot is in the process of being deleted\",\n          \"type\": \"boolean\"\
        \n        }\n      }\n    },\n    \"lock_key\": {\n      \"description\":\
        \ \"The key that locks the policy-created snapshots for the specified target\
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
    summary: Get current status of the specified replication relationship where this
      cluster is the target.
rest_endpoint: /v2/replication/target-relationships/{id}/status
permalink: /rest-api-guide/replication/v2_target-relationships_id_status.html
sidebar: rest_api_guide_sidebar
---
