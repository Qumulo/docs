Qumulo Core creates a descriptive audit log message for every operation that a client attempts. Then, Qumulo Core sends the audit log messages to the remote syslog instance that the audit logging configuration specifies in compliance with {% include rfc.html rfc='5424' %}. 

This section explains the differences between the levels of detail of audit logs in [syslog CSV](#details-in-syslog-csv-format), [syslog JSON](#details-in-syslog-json-format), and [CloudWatch JSON](#details-in-cloudwatch-json-format) formats. (In general, the syslog CSV and CloudWatch JSON formats contain audit logs contain an identical number of fields, some named differently, while the syslog JSON format has additional audit logging information.)

{{site.data.alerts.note}}
<p>Qumulo Core doesn't parse, analyze, index, or visualize the data. For more information, see the following articles on Qumulo Care:</p>
<ul>
  <li><a target="_blank" href="https://care.qumulo.com/s/article/Sending-Audit-Logs-for-a-Qumulo-Cloud-Cluster-to-CloudWatch">Sending Audit Logs for a Qumulo Cloud Cluster to Amazon CloudWatch</a></li>
  <li><a target="_blank" href="https://care.qumulo.com/s/article/Qumulo-Core-Audit-Logging-with-Elasticsearch">Using Qumulo Core Audit Logging with Elasticsearch</a></li>
  <li><a target="_blank" href="https://care.qumulo.com/s/article/Using-Splunk-with-Qumulo-Core-Audit-Logging">Using Splunk with Qumulo Core Audit Logging</a></li>
</ul>
{{site.data.alerts.end}}


<a id="details-in-syslog-csv-format"></a>
## Details Included in the Default Syslog CSV Format
{{site.data.alerts.note}}
<ul>
  <li>Because the user ID, path fields, and secondary path fields can contain characters that must be escaped (such as quotation marks and commas), you must enclose these fields in quotation marks.</li>
  <li>Qumulo Core system strips out the <code>\n</code> and <code>\r</code> newline characters from the user ID, file path, and secondary file path fields.</li>
  <li>The system deduplicates only multiple, repeated operations that cause metadata changes, such as multiple, repeated attempts to modify an access-control list (ACL).</li>
  <li>Unlike the <a href="#details-in-syslog-json-format">syslog JSON format</a>, the syslog CSV format has only values (no keys) and the fields are empty when unused. The following table helps explain the fields and their possible values.</li> 
</ul>
{{site.data.alerts.end}}

By default, Qumulo Core formats audit log messages in the syslog CSV format, prefaced by the date, time, and the name of the machine that issues the operation. The syslog CSV format includes the following fields in the following order within the log message body.

<table>
  <tr>
    <th style="width: 20%;">Field</th>
    <th style="width: 40%;">Description</th>
    <th style="width: 40%;">Possible Values</th>
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
    <td>
      The ID of the user who performed the operation.
      {% include note.html content="Qumulo Core specifies the Qumulo authentication ID if it can't resolve any of the other following user ID types." %}
    </td>
    <td>
      String in quotation marks:
      <ul>
        <li>Active Directory (AD) username</li>
        <li>Qumulo local username</li>
        <li>POSIX user ID (UID)</li>
        <li>Windows security identifier (SID)</li>
        <li>Qumulo authentication ID</li>
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
        <li><a href="#connectivity-operations">Connectivity operation</a>, such as <code>ftp_login</code></li>
        <li><a href="#smb-specific-operations">SMB-Specific operation</a>, such as <code>smb_create_share</code></li>        
        <li><a href="#audit-logging-operations">Audit logging operation</a>, such as <code>remote_syslog_startup</code></li>
        <li><a href="#file-system-operations">File system operation</a>, such as <code>fs_create</code></li>
        <li><a href="#rest-api-operations">REST API operation</a>, such as <code>ad_join</code></li>
      </ul>
    </td>
  </tr>
  <tr>
    <td>Operation Status</td>
    <td>A success status or an error status.</td>
    <td>
      <ul>
        <li>Success status message: <code>ok</code></li>
        <li>
          Error message:
          <ul>
            <li><a href="#credential-error-messages">Credential error message</a>, such as <code>cred_invalid_sid_error</code></li>
            <li><a href="#file-system-operation-error-messages">File system operation error message</a>, such as <code>fs_access_perm_not_owner_error</code></li>
          </ul>
        </li>
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
    <td>Target File Path</td>
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
## Details Included in the Syslog JSON Format
You can configure Qumulo Core to format audit log messages in the syslog JSON format. The fields in this format are similar to [the fields that the syslog CSV format provides](#details-in-syslog-csv-format), with the following exceptions.

{% include note.html content="The syslog JSON format isn't available in the Web UI." %}

<table>
  <tr>
    <th style="width: 20%;">Field</th>
    <th style="width: 40%;">Description</th>
    <th style="width: 40%;">Possible Values</th>
  </tr> 
  <tr>
    <td><code>user_id</code> Object</td>
    <td>In Qumulo Core 6.0.1 (and higher) the <code>user_id</code> object replaces the single user ID field in the syslog CSV format and contains the fields <code>sid</code>, <code>auth_id</code>, and <code>name</code>.</td>
    <td>
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
        <li>For most file system operations, the <code>details</code> object replaces the file path, secondary file path, and file ID fields in the syslog CSV format and contains the fields <code>path</code>, <code>target</code>, and <code>file_id</code>.</li>
        <li>For <code>fs_write_*</code> and <code>fs_read_*</code> operations, the <code>details</code> object also includes the <code>offset</code> and <code>file_size</code> fields.</li>
        <li>For operations that write metadata or change access-control lists (ACLs), the <code>details</code> object also includes the <code>after</code> and <code>before</code> objects that include fields for current and previous metadata.</li>
      </ul>
    </td>
    <td>
      <ul>
        <li>
          <code>details</code> object:
          <ul>
            <li><code>path</code>: File path</li>
            <li><code>target</code>: Target file path</li>
            <li><code>file_id</code>: File ID</li>
          </ul>
          <code>fs_write_*</code> and <code>fs_read_*</code> operations only:
          <ul>
            <li><code>offset</code>: The starting position of the operation</li>
            <li><code>file_size</code>: The size of the operation</li>                
          </ul>          
        </li>
        <li>
          <code>after</code> and <code>before</code> objects:
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
        </li>
      </ul>
    </td>
  </tr>
</table>

For example:

{% if site.output == "web" %}
{% capture scrollTip %}{{site.exampleTooWide}}{% endcapture %}
{% include tip.html content=scrollTip %}
{% endif %}

<div class="highlight"><pre class="highlight wide-example">Jun 6 14:52:28 my-machine qumulo {"user_id": {"auth_id": "1", "sid": "{{site.exampleSID7}}", "name": "system"}, "user_ip": "{{site.exampleIP0}}", "protocol": "internal", "operation": "remote_syslog_startup", "status": "ok", "details": {}}
Jun 6 14:52:28 my-machine qumulo {"user_id": {"sid": "{{site.exampleSID8}}", "auth_id": "500", "name": "AD\alice"}, "user_ip": "{{site.exampleIP0}}", "protocol": "api", "operation": "audit_modify_syslog_config", "status": "ok", "details": {"second_extra_name": "", "extra_name": ""}}
Jun 6 14:52:40 my-machine qumulo {"user_id": {"auth_id": "500", "name": "AD\alice", "sid": "{{site.exampleSID8}}"}, "user_ip": "{{site.exampleIP0}}", "protocol": "api", "operation": "rest_login", "status": "ok", "details": {"second_extra_name": "", "extra_name": ""}}
Jun 6 14:53:22 my-machine qumulo {"user_id": {"sid": "{{site.exampleSID8}}", "name": "AD\alice", "auth_id": "500"}, "user_ip": "{{site.exampleIP0}}", "protocol": "api", "operation": "fs_read_metadata", "status": "ok", "details": {"path": "/my_file", "file_id": "4"}}
Jun 6 14:53:22 my-machine qumulo {"user_id": {"name": "AD\alice", "sid": "{{site.exampleSID8}}", "auth_id": "500"}, "user_ip": "{{site.exampleIP0}}", "protocol": "api", "operation": "fs_write_metadata", "status": "ok", "details": {"file_id": "4", "after": {"ctime": "2024-06-11T14:55:58.187394089Z", "mtime": "2024-06-11T14:55:58.187394089Z", "owner": {"sid": "{{site.exampleSID8}}", "auth_id": "500"}}, "path": "/my_file", "before": {"ctime": "2024-06-11T14:55:43.616292461Z", "mtime": "2024-06-11T14:55:43.616292461Z", "owner": {"sid": "{{site.exampleSID8}}", "auth_id": "500"}}}}
Jun 6 14:53:22 my-machine qumulo {"user_id": {"auth_id": "500", "sid": "{{site.exampleSID8}}", "name": "AD\alice"}, "user_ip": "{{site.exampleIP0}}", "protocol": "api", "operation": "fs_write_data", "status": "ok", "details": {"path": "/my_file", "size": 261456, "file_id": "4", "offset": 0, "file_size": 261456}}
Jun 6 14:54:05 my-machine qumulo {"user_id": {"name": "AD\alice", "auth_id": "500", "sid": "{{site.exampleSID8}}"}, "user_ip": "{{site.exampleIP0}}", "protocol": "api", "operation": "fs_rename", "status": "fs_entry_exists_error", "details": {"path": "/my_file", "target": "/another_file", "file_id": "4"}}
Jun 6 14:55:24 my-machine qumulo {"user_id": {"sid": "{{site.exampleSID8}}", "auth_id": "500", "name": "AD\alice"}, "user_ip": "{{site.exampleIP0}}", "protocol": "api", "operation": "begin_audit_modify_syslog_config", "status": "ok", "details": {"second_extra_name": "", "extra_name": ""}}
Jun 6 14:55:24 my-machine qumulo {"user_id": {"auth_id": "1", "sid": "{{site.exampleSID7}}", "name": "system"}, "user_ip": "{{site.exampleIP0}}", "protocol": "internal", "operation": "remote_syslog_shutdown", "status": "ok", "details": {}}</pre></div>


<a id="details-in-cloudwatch-json-format"></a>
## Details Included in the Amazon CloudWatch JSON Format
You can configure Qumulo Core to format audit log messages in the Amazon CloudWatch JSON format.

{% include tip.html content="To download the audit log from the CloudWatch console, on the left navigation panel click **Logs &gt; Log groups &gt;**, click a log group, and then on the **Log events** page, in the upper-right, click **Actions &gt; Copy search results (ASCII)**." %}

Rather than preface each line of CSV or JSON with the date and time, CloudWatch creates an ASCII table, which contains Unix timestamps in its first column. The second column contains the fields that are similar to the fields that both [the syslog CSV format](#details-in-syslog-csv-format) and [the syslog JSON format](#details-in-syslog-json-format) provide, with the following exceptions.

* The <code>result</code> field replaces the Operation Status or <code>status</code> field.

* The <code>object_id</code> field replaces the File ID <code>file_id</code> field.

* The <code>path_1</td> field replaces the File Path or <code>path</code> field.

* The <code>path_2</td> field replaces the Target File Path or <code>target</code> field.

For example:

{% if site.output == "web" %}
{% include tip.html content=scrollTip %}
{% endif %}

<div class="highlight"><pre class="highlight wide-example">-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
|   timestamp   |                                                                                         message                                                                                     |
|---------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 1717679548000 | {"ip_address": "{{site.exampleIP0}}", "user": "system", "protocol": "internal", "operation": "remote_syslog_startup", "result": "ok", "object_id": "", "path_1": "", "path_2": ""}         |
| 1717679548000 | {"ip_address": "{{site.exampleIP0}}", "user": "AD\alice", "protocol": "api", "operation": "audit_modify_syslog_config", "result": "ok", "object_id": "", "path_1": "", "path_2": ""}       |
| 1717679560000 | {"ip_address": "{{site.exampleIP0}}", "user": "AD\alice", "protocol": "api", "operation": "rest_login", "result": "ok", "object_id": "", "path_1": "", "path_2": ""}                       |
| 1717679602000 | {"ip_address": "{{site.exampleIP0}}", "user": "AD\alice", "protocol": "api", "operation": "fs_read_metadata", "result": "ok", "object_id": "3", "path_1": "/my_file", "path_2": ""}        |
| 1717679602000 | {"ip_address": "{{site.exampleIP0}}", "user": "AD\alice", "protocol": "api", "operation": "fs_write_metadata", "result": "ok", "object_id": "3", "path_1": "/my_file", "path_2": ""}       |
| 1717679602000 | {"ip_address": "{{site.exampleIP0}}", "user": "AD\alice", "protocol": "api", "operation": "fs_write_data", "result": "ok", "object_id": "3", "path_1": "/my_file", "path_2": ""}           |
| 1717679645000 | {"ip_address": "{{site.exampleIP0}}", "user": "AD\alice", "protocol": "api", "operation": "fs_rename", "result": "ok", "object_id": "3", "path_1": "/my_file", "path_2": "/another_file"}  |
| 1717679724000 | {"ip_address": "{{site.exampleIP0}}", "user": "AD\alice", "protocol": "api", "operation": "begin_audit_modify_syslog_config", "result": "ok", "object_id": "", "path_1": "", "path_2": ""} |
| 1717679724000 | {"ip_address": "{{site.exampleIP0}}", "user": "system", "protocol": "internal", "operation": "remote_syslog_shutdown", "result": "ok", "object_id": "", "path_1": "", "path_2": ""}        |
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------</pre></div>


## Operation Names in Audit Logging
This section lists the operation names in Qumulo Core audit logging.

<a id="connectivity-operations"></a>
### Connectivity Operations
* `ftp_login`
* `nfs_mount`
* `rest_login`
* `share_connect`
* `smb_close_handle`
* `smb_close_session`
* `smb_login`

<a id="smb-specific-operations"></a>
### SMB-Specific Operations
* `smb_create_share`
* `smb_modify_share`
* `smb_delete_share`
* `smb2_notify_req`

<a id="audit-logging-operations"></a>
### Audit Logging Operations
* `remote_syslog_shutdown`
* `remote_syslog_startup`

<a id="file-system-operations"></a>
### File System Operations
* `fs_copy_chunk`
* `fs_create_directory`
* `fs_create_directories`
* `fs_create_file`
* `fs_create_hard_link`
* `fs_create_symlink`
* `fs_create_stream`
* `fs_create`
  {% include note.html content="This operation type applies to any but the previous file types." %}
* `fs_delete`
* `fs_fsstat`
* `fs_list_directory`
* `fs_open`
* `fs_read_data`
* `fs_read_link`
* `fs_read_metadata`
* `fs_read_user_metadata`
* `fs_rename`
* `fs_set_quota`
* `fs_tree_delete`
* `fs_write_data`
* `fs_write_metadata`
* `fs_write_file_lock`
* `fs_write_user_metadata`

<a id="rest-api-operations"></a>
### REST API Operations
<details>
  <summary>Click to expand</summary>
  <ul>
    <li><code>ad_cancel_operation</code></li>
    <li><code>ad_dismiss_error</code></li>
    <li><code>ad_join</code></li>
    <li><code>ad_kerberos_renew_ticket</code></li>
    <li><code>ad_leave</code></li>
    <li><code>ad_modify_settings</code></li>
    <li><code>ad_reconfigure</code></li>
    <li><code>audit_modify_cloudwatch_config</code></li>
    <li><code>audit_modify_syslog_config</code></li>
    <li><code>auth_add_group</code></li>
    <li><code>auth_add_member_to_group</code></li>
    <li><code>auth_assign_role</code></li>
    <li><code>auth_create_access_token</code></li>
    <li><code>auth_create_role</code></li>
    <li><code>auth_create_user</code></li>
    <li><code>auth_delete_access_token</code></li>
    <li><code>auth_delete_group</code></li>
    <li><code>auth_delete_identity_attributes</code></li>
    <li><code>auth_delete_role</code></li>
    <li><code>auth_delete_user</code></li>
    <li><code>auth_get_access_token</code></li>
    <li><code>auth_get_access_tokens</code></li>
    <li><code>auth_modify_access_token</code></li>
    <li><code>auth_modify_group</code></li>
    <li><code>auth_modify_identity_attributes</code></li>
    <li><code>auth_modify_role</code></li>
    <li><code>auth_modify_user</code></li>
    <li><code>auth_modify_user_password</code></li>
    <li><code>auth_remove_member_from_group</code></li>
    <li><code>auth_set_user_defined_mappings</code></li>
    <li><code>auth_unassign_role</code></li>
    <li><code>cluster_add_nodes</code></li>
    <li><code>cluster_calculate_node_add_capacity</code></li>
    <li><code>cluster_generate_vpn_private_key</code></li>
    <li><code>cluster_initiate_node_replacement_plan</code></li>
    <li><code>cluster_install_vpn_keys</code></li>
    <li><code>cluster_locate_disk_slot</code></li>
    <li><code>cluster_modify_config</code></li>
    <li><code>cluster_modify_monitoring_config</code></li>
    <li><code>cluster_modify_nodes</code></li>
    <li><code>cluster_modify_nodes_dry_run</code></li>
    <li><code>cluster_modify_upgrade_config</code></li>
    <li><code>cluster_nodes_resolve_indeterminate_modification</code></li>
    <li><code>dns_create</code></li>
    <li><code>dns_delete</code></li>
    <li><code>dns_modify</code></li>
    <li><code>dns_set_lookup_overrides</code></li>
    <li><code>encryption_create_key</code></li>
    <li><code>encryption_rotate_keys</code></li>
    <li><code>encryption_update_config</code></li>
    <li><code>fs_create_public_key</code></li>
    <li><code>fs_delete_public_key</code></li>
    <li><code>fs_modify_atime_settings</code></li>
    <li><code>fs_modify_notify_settings</code></li>
    <li><code>fs_modify_permissions_settings</code></li>
    <li><code>fs_modify_public_key</code></li>
    <li><code>fs_release_nlm_locks_by_client</code></li>
    <li><code>fs_release_nlm_locks_by_file</code></li>
    <li><code>fs_replace_public_key</code></li>
    <li><code>fs_sample</code></li>
    <li><code>ftp_modify_settings</code></li>
    <li><code>identity_create</code></li>
    <li><code>identity_delete</code></li>
    <li><code>identity_modify</code></li>
    <li><code>kerberos_delete_keytab</code></li>
    <li><code>kerberos_modify_settings</code></li>
    <li><code>kerberos_set_keytab</code></li>
    <li><code>ldap_modify_settings</code></li>
    <li><code>network_create_config</code></li>
    <li><code>network_delete_config</code></li>
    <li><code>network_modify_config</code></li>
    <li><code>network_modify_interface</code></li>
    <li><code>nfs_create_export</code></li>
    <li><code>nfs_delete_export</code></li>
    <li><code>nfs_delete_settings</code></li>
    <li><code>nfs_modify_export</code></li>
    <li><code>nfs_modify_settings</code></li>
    <li><code>node_halt</code></li>
    <li><code>node_restart</code></li>
    <li><code>node_set_identify_light</code></li>
    <li><code>reboot_pause</code></li>
    <li><code>reboot_resume</code></li>
    <li><code>reboot_start</code></li>
    <li><code>replication_abort</code></li>
    <li><code>replication_abort_object_relationship</code></li>
    <li><code>replication_authorize_target_relationship</code></li>
    <li><code>replication_create_object_relationship</code></li>
    <li><code>replication_create_source_relationship</code></li>
    <li><code>replication_delete_object_relationship</code></li>
    <li><code>replication_delete_source_relationship</code></li>
    <li><code>replication_delete_target_relationship</code></li>
    <li><code>replication_dismiss_source_relationship_error</code></li>
    <li><code>replication_dismiss_target_relationship_error</code></li>
    <li><code>replication_make_target_writable</code></li>
    <li><code>replication_modify_source_relationship</code></li>
    <li><code>replication_reconnect_target_relationship</code></li>
    <li><code>replication_release_queued_snapshot</code></li>
    <li><code>replication_replicate_object_relationship</code></li>
    <li><code>replication_reverse_target_relationship</code></li>
    <li><code>replication_start</code></li>
    <li><code>replication_target_relationship_lock</code></li>
    <li><code>s3_abort_upload</code></li>
    <li><code>s3_add_bucket</code></li>
    <li><code>s3_bucket_policy_explain_access</code></li>
    <li><code>s3_create_key</code></li>
    <li><code>s3_delete_bucket</code></li>
    <li><code>s3_delete_key</code></li>
    <li><code>s3_get_bucket_policy</code></li>
    <li><code>s3_modify_bucket</code></li>
    <li><code>s3_modify_settings</code></li>
    <li><code>s3_put_bucket_policy</code></li>
    <li><code>saml_modify_settings</code></li>
    <li><code>session_change_password</code></li>
    <li><code>shutdown_halt</code></li>
    <li><code>smb_delete_settings</code></li>
    <li><code>smb_modify_settings</code></li>
    <li><code>snapshot_create_policy</code></li>
    <li><code>snapshot_create_snapshot</code></li>
    <li><code>snapshot_delete_policy</code></li>
    <li><code>snapshot_delete_snapshot</code></li>
    <li><code>snapshot_lock_snapshot</code></li>
    <li><code>snapshot_modify_policy</code></li>
    <li><code>snapshot_modify_snapshot</code></li>
    <li><code>snapshot_unlock_snapshot</code></li>
    <li><code>snapshot_unlock_snapshot_challege</code></li>
    <li><code>ssl_delete_ca_certificate</code></li>
    <li><code>ssl_modify_ca_certificate</code></li>
    <li><code>ssl_modify_certificate</code></li>
    <li><code>tenant_create</code></li>
    <li><code>tenant_delete</code></li>
    <li><code>tenant_modify</code></li>
    <li><code>time_modify_config</code></li>
    <li><code>tree_delete_cancel</code></li>
    <li><code>tree_delete_start</code></li>
    <li><code>web_ui_modify_settings</code></li>
  </ul>
</details>    


## Error Status Messages
This section lists the error status messages in Qumulo Core audit logging.

<a id="credential-error-messages"></a>
### Credential Error Messages
* `cred_error`
* `cred_identity_not_supported_error`
* `cred_invalid_local_user_error`
* `cred_invalid_sid_error`
* `cred_remote_resource_unavailable_error`

<a id="file-system-operation-error-messages"></a>
### File System Operation Error Messages
<details>
  <summary>Click to expand</summary>
  <ul>
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
