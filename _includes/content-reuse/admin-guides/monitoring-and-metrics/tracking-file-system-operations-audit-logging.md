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
This section explains the differences between the levels of details that audit logging in syslog CSV and JSON and CloudWatch JSON formats provide.

<a id="details-in-syslog-csv-format"></a>
### Details Included in the Syslog CSV Format
By default, Qumulo Core formats audit log messages in the syslog CSV format, prefaced by the date, time, and the name of the machine that issues the operation. The CSV format includes the following fields in the following order within the log message body.

{{site.data.alerts.note}}
<ul>
  <li>Because the user ID, path fields, and secondary path fields can contain characters that must be escaped (such as quotation marks and commas), you must enclose these fields in quotation marks.</li>
  <li>Qumulo Core system strips out the <code>\n</code> and <code>\r</code> newline characters from the user ID, file path, and secondary file path fields.</li>
  <li>The system deduplicates only multiple, repeated operations that cause metadata changes, such as multiple, repeated attempts to modify an access-control list (ACL).</li>
  <li>Unlike the <a href="#details-in-syslog-json-format">syslog JSON format</a>, there are only values (no keys) and the fields are empty when unused. The following table helps explain the fields and their possible values.</li> 
</ul>
{{site.data.alerts.end}}

<table>
  <tr>
    <th>Field</th>
    <th>Description</th>
    <th>Possible Values</th>
  </tr> 
  <tr>
    <td>User IP address</td>
    <td>The IP address of the user that performed the operation.</td>
    <td>
      <ul>
        <li>IPv4 address</li>
        <li>IPv6 address</li>
      </ul>
    </td>
  </tr>
  <tr>
    <td>User ID</td>
    <td>The ID of the user who performed the operation.</td>
    <td>
      String in quotation marks:
      <ul>
        <li>Active Directory (AD) username</li>
        <li>Qumulo local username</li>
        <li>POSIX user ID (UID)</li>
        <li>Windows security identifier (SID)</li>
        <li>
          Qumulo authentication ID
          {% include note.html content="Qumulo Core uses this user ID if it can't resolve any of the other user ID types." %}
        </li>
      </ul>
    </td>
  </tr>
  <tr>
    <td>Protocol</td>
    <td>The protocol that the operation uses.</td>
    <td>
      <ul>
        <li><code>api</code></li>
        <li><code>ftp</code></li>
        <li><code>internal</code></li>
        <li><code>nfsv3</code></li>
        <li><code>nfsv4.1</code></li>
        <li><code>s3</code></li>        
        <li><code>smb</code></li>
      </ul>
    </td>
  </tr>
  <tr>
    <td>Operation Type</td>
    <td>The operation that the user or the system attempts to perform.</td>
    <td>
      <ul>
        <li>
          File system operation, for example:
          <ul>
            <li>
              <code>fs_create</code>
              {% include note.html content="This operation type applies to any but the following file types." %}
            </li>
            <li><code>fs_create_directory</code></li>
            <li><code>fs_create_file</code></li>
            <li><code>fs_create_hard_link</code></li>
            <li><code>fs_create_symlink</code></li>
            <li><code>fs_delete</code></li>
            <li><code>fs_fsstat</code></li>
            <li><code>fs_read_metadata</code></li>
            <li><code>fs_list_directory</code></li>
            <li><code>fs_open</code></li>
            <li><code>fs_read_data</code></li>
            <li><code>fs_read_link</code></li>
            <li><code>fs_rename</code></li>
            <li><code>fs_write_data</code></li>
            <li><code>fs_write_metadata</code></li>
          </ul>
        </li>
        <li>
          Management operation, for example:
          <ul>
            <li><code>auth_create_user</code></li>
            <li><code>smb_create_share</code></li>
            <li><code>smb_login</code></li>
            <li><code>nfs_create_export</code></li>
            <li><code>nfs_mount</code></li>
            <li><code>replication_create_source_relationship</code></li>       
            <li><code>snapshot_create_snapshot</code></li>
          </ul>
        </li>
      </ul>
    </td>
  </tr>
  <tr>
    <td>Operation Status</td>
    <td>A success status or an error status.</td>
    <td>
      <ul>
        <li>Success status message: <code>ok</code></li>
        <li><a href="possible-error-status-messages">Error status message</a></li>
      </ul>
    </td>
  </tr>
  <tr>
    <td>File ID</td>
    <td>
      The ID of the file on which the system performed an operation.
      {% include note.html content="For non-file entities, this field is empty." %}
    </td>
    <td>Integer</td>
  </tr>
  <tr>
    <td>File Path</td>
    <td>
      The path to the file on which the system performed an operation.
      {% include note.html content="For files accessed by using a snapshot, the system prefixes the path with <code>/.snapshot</code>. (This is the same path prefix that the system uses to access snapshotted files through NFSv3 and SMB.)" %}</td>
    <td>String in quotation marks</td>
  </tr>
  <tr>
    <td>Secondary File Path</td>
    <td>The target path to the file on which the system performed a rename or move operation.</td>
    <td>String in quotation marks</td>
  </tr>
</table>

For example:

```
Jun 6 14:52:28 my-machine qumulo {{site.exampleIP0}},"system",internal,remote_syslog_startup,ok,,"",""
Jun 6 14:52:28 my-machine qumulo {{site.exampleIP0}},"AD\alice",api,audit_modify_syslog_config,ok,,"",""
Jun 6 14:52:40 my-machine qumulo {{site.exampleIP0}},"AD\alice",api,rest_login,ok,,"",""
Jun 6 14:53:22 my-machine qumulo {{site.exampleIP0}},"AD\alice",api,fs_read_metadata,ok,3,"/my_file",""
Jun 6 14:53:22 my-machine qumulo {{site.exampleIP0}},"AD\alice",api,fs_write_metadata,ok,3,"/my_file",""
Jun 6 14:53:22 my-machine qumulo {{site.exampleIP0}},"AD\alice",api,fs_write_data,ok,3,"/my_file",""
Jun 6 14:54:05 my-machine qumulo {{site.exampleIP0}},"AD\alice",api,fs_rename,ok,3,"/my_file","/another_file"
Jun 6 14:55:24 my-machine qumulo {{site.exampleIP0}},"AD\alice",api,begin_audit_modify_syslog_config,ok,,"",""
Jun 6 14:55:24 my-machine qumulo {{site.exampleIP0}},"system",internal,remote_syslog_shutdown,ok,,"","
```

<a id="details-in-syslog-json-format"></a>
### Details Included in the Syslog JSON Format
You can configure Qumulo Core to format audit log messages in the syslog JSON format. The fields in this format are similar to [the fields that the syslog CSV format provides](#details-in-csv-format), with the following exceptions.

{% include note.html content="The syslog JSON format isn't available in the Web UI." %}

<table>
  <tr>
    <th>Field</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><code>user_id</code> Object</td>
    <td>
      Instead of a single user ID field, in Qumulo Core 6.0.1 (and higher) the <code>user_id</code> object comprises:
      <ul>
        <li><code>sid</code>: Security identifier</li>
        <li><code>auth_id</code>: Authentication ID</li>
        <li><code>name</code>: User role</li>
      </ul>
    </td>
  </tr>
  <tr>
    <td><code>details</code> Object</td>
    <td>
      <ul>
        <li>
          For most file system operations, instead of the file path, secondary file path, and file ID fields, the <code>details</code> object comprises:
          <ul>
            <li><code>path</code>: File path</li>
            <li><code>target</code>: Secndary file path</li>
            <li><code>file_id</code>: File ID</li>
          </ul>
        </li>
        <li>
          For operations that write metadata or change access-control lists (ACLs), the <code>details</code> object also includes the <code>after</code> and <code>before</code> objects that include the following fields for the current and previous metadata:
          <ul>
            <li><code>ctime</code>: Changed timestamp</li>
            <li><code>mtime</code>: Modified timestamp</li>
            <li>
              <code>owner</code>
              <ul>
                <li><code>sid</code>: Security identifier</li>
                <li><code>auth_id</code>: Authentication ID</li>
              </ul>
            </li>
          </ul>
          Ea
        </li>
        <li>
          For <code>fs_write_*</code> and <code>fs_read_*</code> operations, the object includes:
          <ul>
            <li><code>offset</code>: The starting position of the operation</li>
            <li><code>file_size</code>: The size of the operation</li>
          </ul>
        </li>
      </ul>
    </td>
  </tr>
</table>

For example:

```
Jun 6 14:52:28 my-machine qumulo {"user_id": {"auth_id": "1", "sid": "{{site.exampleSID7}}", "name": "system"}, "user_ip": "{{site.exampleIP0}}", "protocol": "internal", "operation": "remote_syslog_startup", "status": "ok", "details": {}}
Jun 6 14:52:28 my-machine qumulo {"user_id": {"sid": "{{site.exampleSID8}}", "auth_id": "500", "name": "admin"}, "user_ip": "{{site.exampleIP0}}", "protocol": "api", "operation": "audit_modify_syslog_config", "status": "ok", "details": {"second_extra_name": "", "extra_name": ""}}
Jun 6 14:52:40 my-machine qumulo {"user_id": {"auth_id": "500", "name": "admin", "sid": "{{site.exampleSID8}}"}, "user_ip": "{{site.exampleIP0}}", "protocol": "api", "operation": "rest_login", "status": "ok", "details": {"second_extra_name": "", "extra_name": ""}}
Jun 6 14:53:22 my-machine qumulo {"user_id": {"sid": "{{site.exampleSID8}}", "name": "admin", "auth_id": "500"}, "user_ip": "{{site.exampleIP0}}", "protocol": "api", "operation": "fs_read_metadata", "status": "ok", "details": {"path": "/my_file", "file_id": "4"}}
Jun 6 14:53:22 my-machine qumulo {"user_id": {"name": "admin", "sid": "{{site.exampleSID8}}", "auth_id": "500"}, "user_ip": "{{site.exampleIP0}}", "protocol": "api", "operation": "fs_write_metadata", "status": "ok", "details": {"file_id": "4", "after": {"ctime": "2024-06-11T14:55:58.187394089Z", "mtime": "2024-06-11T14:55:58.187394089Z", "owner": {"sid": "{{site.exampleSID8}}", "auth_id": "500"}}, "path": "/my_file", "before": {"ctime": "2024-06-11T14:55:43.616292461Z", "mtime": "2024-06-11T14:55:43.616292461Z", "owner": {"sid": "{{site.exampleSID8}}", "auth_id": "500"}}}}
Jun 6 14:53:22 my-machine qumulo {"user_id": {"auth_id": "500", "sid": "{{site.exampleSID8}}", "name": "admin"}, "user_ip": "{{site.exampleIP0}}", "protocol": "api", "operation": "fs_write_data", "status": "ok", "details": {"path": "/my_file", "size": 261456, "file_id": "4", "offset": 0, "file_size": 261456}}
Jun 6 14:54:05 my-machine qumulo {"user_id": {"name": "admin", "auth_id": "500", "sid": "{{site.exampleSID8}}"}, "user_ip": "{{site.exampleIP0}}", "protocol": "api", "operation": "fs_rename", "status": "fs_entry_exists_error", "details": {"path": "/my_file", "target": "/another_file", "file_id": "4"}}
Jun 6 14:55:24 my-machine qumulo {"user_id": {"sid": "{{site.exampleSID8}}", "auth_id": "500", "name": "admin"}, "user_ip": "{{site.exampleIP0}}", "protocol": "api", "operation": "begin_audit_modify_syslog_config", "status": "ok", "details": {"second_extra_name": "", "extra_name": ""}}
Jun 6 14:55:24 my-machine qumulo {"user_id": {"auth_id": "1", "sid": "{{site.exampleSID7}}", "name": "system"}, "user_ip": "{{site.exampleIP0}}", "protocol": "internal", "operation": "remote_syslog_shutdown", "status": "ok", "details": {}}
```

### Possible Error Status Messages
The following are possible error status messages in Qumulo Core.

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
    <li><code>fs_user_metadata_continuation_token_type_mismatch</code></li>
    <li><code>fs_user_metadata_empty_insertion_error</code></li>
    <li><code>fs_user_metadata_hash_exhaustion_error</code></li>
    <li><code>fs_user_metadata_key_already_exists</code></li>
    <li><code>fs_user_metadata_key_not_found</code></li>
    <li><code>fs_user_metadata_too_large</code></li>
    <li><code>fs_watcher_missed_events_error</code></li>
  </ul>
</details>
