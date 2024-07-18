---
category: /replication
methods:
  get:
    parameters:
    - description: Relationship identifier
      name: id
      required: true
    response_body:
      description: Return value on success
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"api_source_relationship_status\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"id\": {\n      \"description\":\
        \ \"Unique identifier of the replication relationship\",\n      \"type\":\
        \ \"string\"\n    },\n    \"target_address\": {\n      \"description\": \"\
        The target IP address\",\n      \"type\": \"string\"\n    },\n    \"target_port\"\
        : {\n      \"description\": \"Network port to replicate to on the target\"\
        ,\n      \"type\": \"number\"\n    },\n    \"source_root_read_only\": {\n\
        \      \"description\": \"Whether the source directory is read-only\",\n \
        \     \"type\": \"boolean\"\n    },\n    \"map_local_ids_to_nfs_ids\": {\n\
        \      \"description\": \"Whether to map local user/group identities to their\
        \ associated NFS UID/GID when replicating them to the target cluster. Replication\
        \ of local identities fails if this option is False.\",\n      \"type\": \"\
        boolean\"\n    },\n    \"replication_enabled\": {\n      \"description\":\
        \ \"Whether automatic replication is enabled\",\n      \"type\": \"boolean\"\
        \n    },\n    \"replication_mode\": {\n      \"type\": \"string\",\n     \
        \ \"enum\": [\n        \"REPLICATION_CONTINUOUS\",\n        \"REPLICATION_SNAPSHOT_POLICY\"\
        ,\n        \"REPLICATION_SNAPSHOT_POLICY_WITH_CONTINUOUS\"\n      ],\n   \
        \   \"description\": \"Whether to replicate continuously, replicate snapshots\
        \ from linked snapshot policies, or both:\\n * `REPLICATION_CONTINUOUS` -\
        \ REPLICATION_CONTINUOUS,\\n * `REPLICATION_SNAPSHOT_POLICY` - REPLICATION_SNAPSHOT_POLICY,\\\
        n * `REPLICATION_SNAPSHOT_POLICY_WITH_CONTINUOUS` - REPLICATION_SNAPSHOT_POLICY_WITH_CONTINUOUS\"\
        \n    },\n    \"blackout_window_timezone\": {\n      \"description\": \"The\
        \ timezone in which the blackout windows should be interpreted (e.g, America/Los_Angeles\
        \ or UTC)\",\n      \"type\": \"string\"\n    },\n    \"blackout_windows\"\
        : {\n      \"type\": \"array\",\n      \"items\": {\n        \"description\"\
        : \"List of blackout windows for the relationship\",\n        \"type\": \"\
        object\",\n        \"properties\": {\n          \"start_hour\": {\n      \
        \      \"description\": \"Hour of day [0, 23] at which the blackout window\
        \ begins\",\n            \"type\": \"number\"\n          },\n          \"\
        start_minute\": {\n            \"description\": \"Minute of hour [0, 59] at\
        \ which the blackout window begins\",\n            \"type\": \"number\"\n\
        \          },\n          \"end_hour\": {\n            \"description\": \"\
        Hour of day [0, 23] at which the blackout window ends\",\n            \"type\"\
        : \"number\"\n          },\n          \"end_minute\": {\n            \"description\"\
        : \"Minute of hour [0, 59] at which the blackout window ends\",\n        \
        \    \"type\": \"number\"\n          },\n          \"on_days\": {\n      \
        \      \"description\": \"List of days of the week on which the replication\
        \ schedule applies. Choose from SUN, MON, TUE, WED, THU, FRI, and/or SAT.\
        \ EVERY_DAY can be used to specify all days.\",\n            \"type\": \"\
        array\",\n            \"items\": {\n              \"type\": \"string\",\n\
        \              \"enum\": [\n                \"SUN\",\n                \"MON\"\
        ,\n                \"TUE\",\n                \"WED\",\n                \"\
        THU\",\n                \"FRI\",\n                \"SAT\",\n             \
        \   \"EVERY_DAY\"\n              ],\n              \"description\": \"List\
        \ of days of the week on which the replication schedule applies. Choose from\
        \ SUN, MON, TUE, WED, THU, FRI, and/or SAT. EVERY_DAY can be used to specify\
        \ all days.:\\n * `EVERY_DAY` - EVERY_DAY,\\n * `FRI` - FRI,\\n * `MON` -\
        \ MON,\\n * `SAT` - SAT,\\n * `SUN` - SUN,\\n * `THU` - THU,\\n * `TUE` -\
        \ TUE,\\n * `WED` - WED\"\n            }\n          }\n        }\n      }\n\
        \    },\n    \"snapshot_policies\": {\n      \"type\": \"array\",\n      \"\
        items\": {\n        \"description\": \"List of snapshot policies linked with\
        \ the relationship along with the corresponding expiration time of the replicated\
        \ snapshots on the target for each linked policy\",\n        \"type\": \"\
        object\",\n        \"properties\": {\n          \"id\": {\n            \"\
        description\": \"Unique identifier for the snapshot policy linked with the\
        \ relationship\",\n            \"type\": \"number\"\n          },\n      \
        \    \"target_expiration\": {\n            \"description\": \"Duration after\
        \ which to expire snapshots on the target cluster that were replicated from\
        \ this snapshot policy, in format <quantity><units>, where <quantity> is a\
        \ positive integer less than 100 and <units> is one of [months, weeks, days,\
        \ hours, minutes], e.g. 5days or 1hours. 'never' indicates snapshots should\
        \ never expire and 'same_as_policy' indicates snapshots should expire at the\
        \ same time as the snapshot policy specifies.\",\n            \"type\": \"\
        string\"\n          }\n        }\n      }\n    },\n    \"state\": {\n    \
        \  \"type\": \"string\",\n      \"enum\": [\n        \"AWAITING_AUTHORIZATION\"\
        ,\n        \"DISCONNECTED\",\n        \"DISCONNECTING\",\n        \"ENDED\"\
        ,\n        \"ESTABLISHED\",\n        \"RECONNECTING\",\n        \"REESTABLISHING\"\
        \n      ],\n      \"description\": \"Current state of replication relationship:\\\
        n * `AWAITING_AUTHORIZATION` - AWAITING_AUTHORIZATION,\\n * `DISCONNECTED`\
        \ - DISCONNECTED,\\n * `DISCONNECTING` - DISCONNECTING,\\n * `ENDED` - ENDED,\\\
        n * `ESTABLISHED` - ESTABLISHED,\\n * `RECONNECTING` - RECONNECTING,\\n *\
        \ `REESTABLISHING` - REESTABLISHING\"\n    },\n    \"end_reason\": {\n   \
        \   \"description\": \"If the relationship has ENDED, this states the reason.\
        \ Otherwise, this field is empty\",\n      \"type\": \"string\"\n    },\n\
        \    \"source_cluster_name\": {\n      \"description\": \"Name of the source\
        \ cluster\",\n      \"type\": \"string\"\n    },\n    \"source_cluster_uuid\"\
        : {\n      \"description\": \"UUID of the source cluster\",\n      \"type\"\
        : \"string\"\n    },\n    \"source_root_path\": {\n      \"description\":\
        \ \"Path to the source directory\",\n      \"type\": \"string\"\n    },\n\
        \    \"target_cluster_name\": {\n      \"description\": \"Name of the target\
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
        \    }\n      }\n    },\n    \"source_root_id\": {\n      \"description\"\
        : \"File ID of the source directory\",\n      \"type\": \"string\"\n    },\n\
        \    \"next_active_time\": {\n      \"description\": \"The time when the current\
        \ blackout period ends (in UTC). If replication is currently enabled and not\
        \ in a blackout period, this field will be empty\",\n      \"type\": \"string\"\
        \n    },\n    \"replication_job_status\": {\n      \"description\": \"Information\
        \ about the progress of a job. This field is null if there is no job status\
        \ available.\",\n      \"type\": \"object\",\n      \"properties\": {\n  \
        \      \"percent_complete\": {\n          \"description\": \"Percent of way\
        \ through the job, computed from a weighting of data and files processed\"\
        ,\n          \"type\": \"number\"\n        },\n        \"estimated_seconds_remaining\"\
        : {\n          \"description\": \"Estimated number of seconds remaining in\
        \ the job, derived from percent_complete. This may be null if there is no\
        \ estimate.\",\n          \"type\": \"string\"\n        },\n        \"bytes_transferred\"\
        : {\n          \"description\": \"Number of bytes copied\",\n          \"\
        type\": \"string\"\n        },\n        \"bytes_unchanged\": {\n         \
        \ \"description\": \"Number of bytes not copied because they didn't change\"\
        ,\n          \"type\": \"string\"\n        },\n        \"bytes_remaining\"\
        : {\n          \"description\": \"Number of bytes left to be processed in\
        \ order to complete this job\",\n          \"type\": \"string\"\n        },\n\
        \        \"bytes_deleted\": {\n          \"description\": \"Number of bytes\
        \ deleted\",\n          \"type\": \"string\"\n        },\n        \"bytes_total\"\
        : {\n          \"description\": \"Total number of bytes that will be processed\
        \ during this job (this will be close but not exact)\",\n          \"type\"\
        : \"string\"\n        },\n        \"files_transferred\": {\n          \"description\"\
        : \"Number of files copied\",\n          \"type\": \"string\"\n        },\n\
        \        \"files_unchanged\": {\n          \"description\": \"Number of files\
        \ not copied because they didn't change\",\n          \"type\": \"string\"\
        \n        },\n        \"files_remaining\": {\n          \"description\": \"\
        Number of files left to be processed in order to complete this job\",\n  \
        \        \"type\": \"string\"\n        },\n        \"files_deleted\": {\n\
        \          \"description\": \"Number of files deleted\",\n          \"type\"\
        : \"string\"\n        },\n        \"files_total\": {\n          \"description\"\
        : \"Total number of files that will be processed during this job (this will\
        \ be close but not exact)\",\n          \"type\": \"string\"\n        },\n\
        \        \"throughput_overall\": {\n          \"description\": \"Overall average\
        \ throughput in bytes per second of data copied since the beginning of the\
        \ job\",\n          \"type\": \"string\"\n        },\n        \"throughput_current\"\
        : {\n          \"description\": \"Average throughput in bytes per second of\
        \ data copied in the last one minute\",\n          \"type\": \"string\"\n\
        \        }\n      }\n    },\n    \"queued_snapshot_count\": {\n      \"description\"\
        : \"The number of snapshots from linked snapshot policies awaiting replication\
        \ by this relationship\",\n      \"type\": \"number\"\n    },\n    \"recovery_point_snapshot\"\
        : {\n      \"description\": \"The snapshot replicated by the last successful\
        \ job. This field is null if no job has ever run successfully.\",\n      \"\
        type\": \"object\",\n      \"properties\": {\n        \"id\": {\n        \
        \  \"description\": \"Unique identifier of the snapshot\",\n          \"type\"\
        : \"number\"\n        },\n        \"name\": {\n          \"description\":\
        \ \"Name of the snapshot\",\n          \"type\": \"string\"\n        },\n\
        \        \"timestamp\": {\n          \"description\": \"Creation timestamp\
        \ of the snapshot, encoded as RFC 3339, which is a normalized subset of ISO\
        \ 8601. See http://tools.ietf.org/rfc/rfc3339.txt, section 5.6 for ABNF.\"\
        ,\n          \"type\": \"string\"\n        },\n        \"directory_name\"\
        : {\n          \"description\": \"Snapshot directory name, as would be seen\
        \ in the .snapshot directory over SMB or NFS.\",\n          \"type\": \"string\"\
        \n        },\n        \"source_file_id\": {\n          \"description\": \"\
        Source directory of the snapshot\",\n          \"type\": \"string\"\n    \
        \    },\n        \"created_by_policy\": {\n          \"description\": \"This\
        \ snapshot was created by a policy. The name of that policy will be stored\
        \ in the name field in place of a user-defined name.\",\n          \"type\"\
        : \"boolean\"\n        },\n        \"expiration\": {\n          \"description\"\
        : \"Time at which snapshot will be expired. Empty string if no expiration\
        \ time set. Encoded as RFC 3339, which is a normalized subset of ISO 8601.\
        \ See http://tools.ietf.org/rfc/rfc3339.txt, section 5.6 for ABNF.\",\n  \
        \        \"type\": \"string\"\n        },\n        \"in_delete\": {\n    \
        \      \"description\": \"Whether or not the snapshot is in the process of\
        \ being deleted\",\n          \"type\": \"boolean\"\n        }\n      }\n\
        \    },\n    \"replicating_snapshot\": {\n      \"description\": \"The snapshot\
        \ that is being replicated by the current job. This field is null if no job\
        \ is in progress.\",\n      \"type\": \"object\",\n      \"properties\": {\n\
        \        \"id\": {\n          \"description\": \"Unique identifier of the\
        \ snapshot\",\n          \"type\": \"number\"\n        },\n        \"name\"\
        : {\n          \"description\": \"Name of the snapshot\",\n          \"type\"\
        : \"string\"\n        },\n        \"timestamp\": {\n          \"description\"\
        : \"Creation timestamp of the snapshot, encoded as RFC 3339, which is a normalized\
        \ subset of ISO 8601. See http://tools.ietf.org/rfc/rfc3339.txt, section 5.6\
        \ for ABNF.\",\n          \"type\": \"string\"\n        },\n        \"directory_name\"\
        : {\n          \"description\": \"Snapshot directory name, as would be seen\
        \ in the .snapshot directory over SMB or NFS.\",\n          \"type\": \"string\"\
        \n        },\n        \"source_file_id\": {\n          \"description\": \"\
        Source directory of the snapshot\",\n          \"type\": \"string\"\n    \
        \    },\n        \"created_by_policy\": {\n          \"description\": \"This\
        \ snapshot was created by a policy. The name of that policy will be stored\
        \ in the name field in place of a user-defined name.\",\n          \"type\"\
        : \"boolean\"\n        },\n        \"expiration\": {\n          \"description\"\
        : \"Time at which snapshot will be expired. Empty string if no expiration\
        \ time set. Encoded as RFC 3339, which is a normalized subset of ISO 8601.\
        \ See http://tools.ietf.org/rfc/rfc3339.txt, section 5.6 for ABNF.\",\n  \
        \        \"type\": \"string\"\n        },\n        \"in_delete\": {\n    \
        \      \"description\": \"Whether or not the snapshot is in the process of\
        \ being deleted\",\n          \"type\": \"boolean\"\n        }\n      }\n\
        \    }\n  }\n}"
      status_code: '200'
    summary: Get current status of the specified replication relationship where this
      cluster is the source.
rest_endpoint: /v2/replication/source-relationships/{id}/status
permalink: /rest-api-guide/replication/v2_source-relationships_id_status.html
sidebar: rest_api_guide_sidebar
---
