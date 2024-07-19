---
category: /replication
methods:
  delete:
    parameters:
    - description: Relationship identifier
      name: id
      required: true
    - description: ETag for expected version
      name: If-Match
      required: false
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    summary: Delete the specified replication relationship where this cluster is the
      source.
  get:
    parameters:
    - description: Relationship identifier
      name: id
      required: true
    response_body:
      schema: "{\n  \"description\": \"api_source_relationship\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"id\": {\n      \"description\": \"Unique\
        \ identifier of the replication relationship\",\n      \"type\": \"string\"\
        \n    },\n    \"target_address\": {\n      \"description\": \"The target IP\
        \ address\",\n      \"type\": \"string\"\n    },\n    \"target_port\": {\n\
        \      \"description\": \"Network port to replicate to on the target\",\n\
        \      \"type\": \"number\"\n    },\n    \"source_root_id\": {\n      \"description\"\
        : \"File ID of the source directory\",\n      \"type\": \"string\"\n    },\n\
        \    \"source_root_read_only\": {\n      \"description\": \"Whether the source\
        \ directory is read-only\",\n      \"type\": \"boolean\"\n    },\n    \"map_local_ids_to_nfs_ids\"\
        : {\n      \"description\": \"Whether to map local user/group identities to\
        \ their associated NFS UID/GID when replicating them to the target cluster.\
        \ Replication of local identities fails if this option is false\",\n     \
        \ \"type\": \"boolean\"\n    },\n    \"replication_enabled\": {\n      \"\
        description\": \"Whether automatic replication is enabled\",\n      \"type\"\
        : \"boolean\"\n    },\n    \"replication_mode\": {\n      \"type\": \"string\"\
        ,\n      \"enum\": [\n        \"REPLICATION_CONTINUOUS\",\n        \"REPLICATION_SNAPSHOT_POLICY\"\
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
        string\"\n          }\n        }\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Get information about the specified replication relationship where this
      cluster is the source.
  patch:
    parameters:
    - description: Relationship identifier
      name: id
      required: true
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
      schema: "{\n  \"description\": \"api_source_relationship\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"id\": {\n      \"description\": \"Unique\
        \ identifier of the replication relationship\",\n      \"type\": \"string\"\
        \n    },\n    \"target_address\": {\n      \"description\": \"The target IP\
        \ address\",\n      \"type\": \"string\"\n    },\n    \"target_port\": {\n\
        \      \"description\": \"Network port to replicate to on the target\",\n\
        \      \"type\": \"number\"\n    },\n    \"source_root_id\": {\n      \"description\"\
        : \"File ID of the source directory\",\n      \"type\": \"string\"\n    },\n\
        \    \"source_root_read_only\": {\n      \"description\": \"Whether the source\
        \ directory is read-only\",\n      \"type\": \"boolean\"\n    },\n    \"map_local_ids_to_nfs_ids\"\
        : {\n      \"description\": \"Whether to map local user/group identities to\
        \ their associated NFS UID/GID when replicating them to the target cluster.\
        \ Replication of local identities fails if this option is false\",\n     \
        \ \"type\": \"boolean\"\n    },\n    \"replication_enabled\": {\n      \"\
        description\": \"Whether automatic replication is enabled\",\n      \"type\"\
        : \"boolean\"\n    },\n    \"replication_mode\": {\n      \"type\": \"string\"\
        ,\n      \"enum\": [\n        \"REPLICATION_CONTINUOUS\",\n        \"REPLICATION_SNAPSHOT_POLICY\"\
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
        string\"\n          }\n        }\n      }\n    }\n  }\n}"
    response_body:
      schema: "{\n  \"description\": \"api_source_relationship\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"id\": {\n      \"description\": \"Unique\
        \ identifier of the replication relationship\",\n      \"type\": \"string\"\
        \n    },\n    \"target_address\": {\n      \"description\": \"The target IP\
        \ address\",\n      \"type\": \"string\"\n    },\n    \"target_port\": {\n\
        \      \"description\": \"Network port to replicate to on the target\",\n\
        \      \"type\": \"number\"\n    },\n    \"source_root_id\": {\n      \"description\"\
        : \"File ID of the source directory\",\n      \"type\": \"string\"\n    },\n\
        \    \"source_root_read_only\": {\n      \"description\": \"Whether the source\
        \ directory is read-only\",\n      \"type\": \"boolean\"\n    },\n    \"map_local_ids_to_nfs_ids\"\
        : {\n      \"description\": \"Whether to map local user/group identities to\
        \ their associated NFS UID/GID when replicating them to the target cluster.\
        \ Replication of local identities fails if this option is false\",\n     \
        \ \"type\": \"boolean\"\n    },\n    \"replication_enabled\": {\n      \"\
        description\": \"Whether automatic replication is enabled\",\n      \"type\"\
        : \"boolean\"\n    },\n    \"replication_mode\": {\n      \"type\": \"string\"\
        ,\n      \"enum\": [\n        \"REPLICATION_CONTINUOUS\",\n        \"REPLICATION_SNAPSHOT_POLICY\"\
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
        string\"\n          }\n        }\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Modify a subset of fields of an existing replication relationship where
      this cluster is the source.
  put:
    parameters:
    - description: Relationship identifier
      name: id
      required: true
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
      schema: "{\n  \"description\": \"api_source_relationship\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"id\": {\n      \"description\": \"Unique\
        \ identifier of the replication relationship\",\n      \"type\": \"string\"\
        \n    },\n    \"target_address\": {\n      \"description\": \"The target IP\
        \ address\",\n      \"type\": \"string\"\n    },\n    \"target_port\": {\n\
        \      \"description\": \"Network port to replicate to on the target\",\n\
        \      \"type\": \"number\"\n    },\n    \"source_root_id\": {\n      \"description\"\
        : \"File ID of the source directory\",\n      \"type\": \"string\"\n    },\n\
        \    \"source_root_read_only\": {\n      \"description\": \"Whether the source\
        \ directory is read-only\",\n      \"type\": \"boolean\"\n    },\n    \"map_local_ids_to_nfs_ids\"\
        : {\n      \"description\": \"Whether to map local user/group identities to\
        \ their associated NFS UID/GID when replicating them to the target cluster.\
        \ Replication of local identities fails if this option is false\",\n     \
        \ \"type\": \"boolean\"\n    },\n    \"replication_enabled\": {\n      \"\
        description\": \"Whether automatic replication is enabled\",\n      \"type\"\
        : \"boolean\"\n    },\n    \"replication_mode\": {\n      \"type\": \"string\"\
        ,\n      \"enum\": [\n        \"REPLICATION_CONTINUOUS\",\n        \"REPLICATION_SNAPSHOT_POLICY\"\
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
        string\"\n          }\n        }\n      }\n    }\n  }\n}"
    response_body:
      schema: "{\n  \"description\": \"api_source_relationship\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"id\": {\n      \"description\": \"Unique\
        \ identifier of the replication relationship\",\n      \"type\": \"string\"\
        \n    },\n    \"target_address\": {\n      \"description\": \"The target IP\
        \ address\",\n      \"type\": \"string\"\n    },\n    \"target_port\": {\n\
        \      \"description\": \"Network port to replicate to on the target\",\n\
        \      \"type\": \"number\"\n    },\n    \"source_root_id\": {\n      \"description\"\
        : \"File ID of the source directory\",\n      \"type\": \"string\"\n    },\n\
        \    \"source_root_read_only\": {\n      \"description\": \"Whether the source\
        \ directory is read-only\",\n      \"type\": \"boolean\"\n    },\n    \"map_local_ids_to_nfs_ids\"\
        : {\n      \"description\": \"Whether to map local user/group identities to\
        \ their associated NFS UID/GID when replicating them to the target cluster.\
        \ Replication of local identities fails if this option is false\",\n     \
        \ \"type\": \"boolean\"\n    },\n    \"replication_enabled\": {\n      \"\
        description\": \"Whether automatic replication is enabled\",\n      \"type\"\
        : \"boolean\"\n    },\n    \"replication_mode\": {\n      \"type\": \"string\"\
        ,\n      \"enum\": [\n        \"REPLICATION_CONTINUOUS\",\n        \"REPLICATION_SNAPSHOT_POLICY\"\
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
        string\"\n          }\n        }\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Modify an existing replication relationship where this cluster is the
      source.
rest_endpoint: /v2/replication/source-relationships/{id}
permalink: /rest-api-guide/replication/v2_source-relationships_id.html
sidebar: rest_api_guide_sidebar
---
