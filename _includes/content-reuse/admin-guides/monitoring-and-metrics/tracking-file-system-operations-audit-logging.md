Qumulo Core creates a descriptive audit log message for every operation that a client attempts and sends the audit log messages to the remote syslog instance that the audit logging configuration specifies in compliance with {% include rfc.html rfc='5424' %}.

{{site.data.alerts.note}}
<p>Qumulo Core doesn't parse, analyze, index, or visualize the data. For more information, see the following articles on Qumulo Care:</p>
<ul>
  <li><a target="_blank" href="https://care.qumulo.com/s/article/Sending-Audit-Logs-for-a-Qumulo-Cloud-Cluster-to-CloudWatch">Sending Audit Logs for a Qumulo Cloud Cluster to Amazon CloudWatch</a></li>
  <li><a target="_blank" href="https://care.qumulo.com/s/article/Qumulo-Core-Audit-Logging-with-Elasticsearch">Using Qumulo Core Audit Logging with Elasticsearch</a></li>
  <li><a target="_blank" href="https://care.qumulo.com/s/article/Using-Splunk-with-Qumulo-Core-Audit-Logging">Using Splunk with Qumulo Core Audit Logging</a></li>
</ul>
{{site.data.alerts.end}}

## How Audit Log Messages are Structured
This section explains the differences between the levels of details that audit logging and CSV and JSON formats provide.

<a id="details-in-csv-format"></a>
### Details Included in the CSV Syslog Format
By default, Qumulo Core formats audit log messages in CSV format, prefaced by the date, time, and the name of the machine that issues the operation. The CSV format includes the following fields:

* User IP address (IPv4 and IPv6) 
* User role
* Operation protocol
* Operation type
* Operation status (either `ok` or an [error status](#error-statuses))
* Additional fields related to the inputs or outputs of an operation (empty if unused)

For example:

<details>
  <summary>Click to expand</summary>
  <pre>Jun 6 14:52:28 my-machine qumulo {{site.exampleIP0}},"system",internal,remote_syslog_startup,ok,,"",""
Jun 6 14:52:28 my-machine qumulo {{site.exampleIP0}},"admin",api,audit_modify_syslog_config,ok,,"",""
Jun 6 14:52:40 my-machine qumulo {{site.exampleIP0}},"admin",api,rest_login,ok,,"",""
Jun 6 14:53:19 my-machine qumulo {{site.exampleIPv60}},"admin",api,rest_login,ok,,"",""
Jun 6 14:53:22 my-machine qumulo {{site.exampleIP0}},"admin",api,fs_read_metadata,ok,3,"/my_file",""
Jun 6 14:53:22 my-machine qumulo {{site.exampleIP0}},"admin",api,fs_write_metadata,ok,3,"/my_file",""
Jun 6 14:53:22 my-machine qumulo {{site.exampleIP0}},"admin",api,fs_write_data,ok,3,"/my_file",""
Jun 6 14:54:05 my-machine qumulo {{site.exampleIP0}},"admin",api,fs_rename,ok,3,"/my_file","/another_file"
Jun 6 14:55:24 my-machine qumulo {{site.exampleIP0}},"admin",api,begin_audit_modify_syslog_config,ok,,"",""
Jun 6 14:55:24 my-machine qumulo {{site.exampleIP0}},"system",internal,remote_syslog_shutdown,ok,,"","</pre>
</details>

### Details Included in the JSON Syslog Format
You can configure Qumulo Core to format audit log messages in JSON format. In addition to [the fields that the CSV syslog format provides](#details-in-csv-format), the JSON syslog format also includes:

* A `user_id` object that comprises:
  * `sid`: security identifier
  * `auth_id`: authentication ID
  * `name`: user role
* A `details` object that comprises additional fields related to the inputs or outputs of an operation (the key is always included even if the value is empty because it is unused)

For example:

<details>
  <summary>Click to expand</summary>
  <pre>Jun 6 14:52:28 qfsd-1 qumulo {"user_id": {"auth_id": "1", "sid": "{{site.exampleSID7}}", "name": "system"}, "user_ip": "{{site.exampleIP0}}", "protocol": "internal", "operation": "remote_syslog_startup", "status": "ok", "details": {}}
Jun 6 14:52:28 qfsd-1 qumulo {"user_id": {"sid": "{{site.exampleSID8}}", "auth_id": "500", "name": "admin"}, "user_ip": "{{site.exampleIP0}}", "protocol": "api", "operation": "audit_modify_syslog_config", "status": "ok", "details": {"second_extra_name": "", "extra_name": ""}}
Jun 6 14:52:40 qfsd-1 qumulo {"user_id": {"auth_id": "500", "name": "admin", "sid": "{{site.exampleSID8}}"}, "user_ip": "{{site.exampleIP0}}", "protocol": "api", "operation": "rest_login", "status": "ok", "details": {"second_extra_name": "", "extra_name": ""}}
Jun 6 14:53:22 qfsd-1 qumulo {"user_id": {"sid": "{{site.exampleSID8}}", "name": "admin", "auth_id": "500"}, "user_ip": "{{site.exampleIP0}}", "protocol": "api", "operation": "fs_read_metadata", "status": "ok", "details": {"path": "/my_file", "file_id": "4"}}
Jun 6 14:53:22 qfsd-1 qumulo {"user_id": {"name": "admin", "sid": "{{site.exampleSID8}}", "auth_id": "500"}, "user_ip": "{{site.exampleIP0}}", "protocol": "api", "operation": "fs_write_metadata", "status": "ok", "details": {"file_id": "4", "after": {"ctime": "2024-06-11T14:55:58.187394089Z", "mtime": "2024-06-11T14:55:58.187394089Z", "owner": {"sid": "{{site.exampleSID8}}", "auth_id": "500"}}, "path": "/my_file", "before": {"ctime": "2024-06-11T14:55:43.616292461Z", "mtime": "2024-06-11T14:55:43.616292461Z", "owner": {"sid": "{{site.exampleSID8}}", "auth_id": "500"}}}}
Jun 6 14:53:22 qfsd-1 qumulo {"user_id": {"auth_id": "500", "sid": "{{site.exampleSID8}}", "name": "admin"}, "user_ip": "{{site.exampleIP0}}", "protocol": "api", "operation": "fs_write_data", "status": "ok", "details": {"path": "/my_file", "size": 261456, "file_id": "4", "offset": 0, "file_size": 261456}}
Jun 6 14:54:05 qfsd-1 qumulo {"user_id": {"name": "admin", "auth_id": "500", "sid": "{{site.exampleSID8}}"}, "user_ip": "{{site.exampleIP0}}", "protocol": "api", "operation": "fs_rename", "status": "fs_entry_exists_error", "details": {"path": "/my_file", "target": "/another_file", "file_id": "4"}}
Jun 6 14:55:24 qfsd-1 qumulo {"user_id": {"sid": "{{site.exampleSID8}}", "auth_id": "500", "name": "admin"}, "user_ip": "{{site.exampleIP0}}", "protocol": "api", "operation": "begin_audit_modify_syslog_config", "status": "ok", "details": {"second_extra_name": "", "extra_name": ""}}
Jun 6 14:55:24 qfsd-1 qumulo {"user_id": {"auth_id": "1", "sid": "{{site.exampleSID7}}", "name": "system"}, "user_ip": "{{site.exampleIP0}}", "protocol": "internal", "operation": "remote_syslog_shutdown", "status": "ok", "details": {}}</pre>
</details>

<a id="error-statuses"></a>
### List of Possible Error Statuses
The following is a list of possible error statuses in Qumulo Core.

<details>
  <summary>Click to expand</summary>
  <ul>
    <li><code>cred_error</code></li>
    <li><code>cred_identity_not_supported_error</code></li>
    <li><code>cred_invalid_local_user_error</code></li>
    <li><code>cred_invalid_sid_error</code></li>
    <li><code>cred_remote_resource_unavailable_error</code></li>
    <li><code>fs_access_denied_error</code></li>
    <li><code>fs_access_error</code></li>
    <li><code>fs_access_perm_not_owner_error</code></li>
    <li><code>fs_already_read_only_error</code></li>
    <li><code>fs_default_stream_of_directory_error</code></li>
    <li><code>fs_directory_cycle_error</code></li>
    <li><code>fs_directory_error</code></li>
    <li><code>fs_directory_hash_exhaustion_error</code></li>
    <li><code>fs_directory_is_symlink_error</code></li>
    <li><code>fs_directory_not_empty_error</code></li>
    <li><code>fs_encountered_portal_error</code></li>
    <li><code>fs_entry_exists_error</code></li>
    <li><code>fs_entry_hardlink_ambiguity_error</code></li>
    <li><code>fs_entry_not_in_subtree_error</code></li>
    <li><code>fs_exceeded_maximum_stream_count_error</code></li>
    <li><code>fs_file_dirent_id_stale_error</code></li>
    <li><code>fs_file_is_named_stream_error</code></li>
    <li><code>fs_file_is_symlink_error</code></li>
    <li><code>fs_file_not_covered_by_snapshot_error</code></li>
    <li><code>fs_file_not_empty_error</code></li>
    <li><code>fs_file_path_invalid_error</code></li>
    <li><code>fs_file_size_error</code></li>
    <li><code>fs_file_too_many_links_error</code></li>
    <li><code>fs_invalid_acl_error</code></li>
    <li><code>fs_invalid_attrs_error</code></li>
    <li><code>fs_invalid_file_type_error</code></li>
    <li><code>fs_invalid_name_error</code></li>
    <li><code>fs_invalid_offset_error</code></li>
    <li><code>fs_invalid_size_error</code></li>
    <li><code>fs_name_size_error</code></li>
    <li><code>fs_no_such_entry_error</code></li>
    <li><code>fs_no_such_file_version_error</code></li>
    <li><code>fs_no_such_inode_error</code></li>
    <li><code>fs_no_such_path_error</code></li>
    <li><code>fs_not_a_directory_error</code></li>
    <li><code>fs_not_a_file_error</code></li>
    <li><code>fs_not_a_symlink_error</code></li>
    <li><code>fs_opened_file_stale_error</code></li>
    <li><code>fs_path_size_error</code></li>
    <li><code>fs_permissions_mode_operation_unsupported_error</code></li>
    <li><code>fs_portal_create_orphanage_error</code></li>
    <li><code>fs_portal_disconnected_error</code></li>
    <li><code>fs_portal_ended_error</code></li>
    <li><code>fs_portal_error</code></li>
    <li><code>fs_portal_eviction_error</code></li>
    <li><code>fs_portal_inconsistent_data_error</code></li>
    <li><code>fs_portal_incorrect_state_error</code></li>
    <li><code>fs_portal_invalid_lease_break_range_error</code></li>
    <li><code>fs_portal_not_covered_by_snapshot_error</code></li>
    <li><code>fs_portal_not_found_error</code></li>
    <li><code>fs_portal_out_of_order_lease_break_error</code></li>
    <li><code>fs_quota_limit_already_set_error</code></li>
    <li><code>fs_quota_limit_does_not_exist_error</code></li>
    <li><code>fs_quota_no_space_error</code></li>
    <li><code>fs_read_only_error</code></li>
    <li><code>fs_revision_mismatch_error</code></li>
    <li><code>fs_s3_versioning_full_error</code></li>
    <li><code>fs_same_inode_error</code></li>
    <li><code>fs_sharing_violation_error</code></li>
    <li><code>fs_smb_share_root_deleted_error</code></li>
    <li><code>fs_stream_is_default_error</code></li>
    <li><code>fs_symlink_loop_error</code></li>
    <li><code>fs_tag_mismatch_error</code></li>
    <li><code>fs_too_many_aces_error</code></li>
    <li><code>fs_user_metadata_continuation_token_type_mismatch
    <li><code>fs_user_metadata_empty_insertion_error</code></li>
    <li><code>fs_user_metadata_hash_exhaustion_error</code></li>
    <li><code>fs_user_metadata_key_already_exists
    <li><code>fs_user_metadata_key_not_found
    <li><code>fs_user_metadata_too_large
    <li><code>fs_watcher_missed_events_error</code></li>
  </ul>
</details>
