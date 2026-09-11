Qumulo Core creates a descriptive audit log message for every operation that a client attempts. Qumulo Core routes audit log messages to one or more configured destinations: remote `syslog` servers (in compliance with {% include rfc.html rfc='5424' %}) or Amazon CloudWatch (configured through the audit logging REST API).

This section explains the differences between the levels of detail of audit logs in [`syslog` CSV](#details-in-syslog-csv-format), [`syslog` JSON](#details-in-syslog-json-format), and [CloudWatch JSON](#details-in-cloudwatch-json-format) formats. (In general, the `syslog` CSV and CloudWatch JSON formats contain an identical number of fields, some named differently, while the `syslog` JSON format has additional audit logging information.)

{{site.data.alerts.note}}
<ul>
  <li>A Qumulo cluster uses the static IP address assigned to each of its nodes to send audit logs to the audit log server.</li>
  <li>
    <p>Qumulo Core doesn't parse, analyze, index, or visualize the data. For more information, see the following articles on Qumulo Care:</p>
    <ul>
      <li><a target="_blank" href="https://care.qumulo.com/s/article/Sending-Audit-Logs-for-a-Qumulo-Cloud-Cluster-to-CloudWatch">Sending Audit Logs for a Qumulo Cloud Cluster to Amazon CloudWatch</a></li>
      <li><a target="_blank" href="https://care.qumulo.com/s/article/Qumulo-Core-Audit-Logging-with-Elasticsearch">Using Qumulo Core Audit Logging with Elasticsearch</a></li>
      <li><a target="_blank" href="https://care.qumulo.com/s/article/Using-Splunk-with-Qumulo-Core-Audit-Logging">Using Splunk with Qumulo Core Audit Logging</a></li>
    </ul>
  </li>
</ul>
{{site.data.alerts.end}}


## Details Included in the Default syslog CSV Format {#details-in-syslog-csv-format}
{{site.data.alerts.note}}
<ul>
  <li>Because the user ID, path fields, and secondary path fields can contain characters that must be escaped (such as quotation marks and commas), you must enclose these fields in quotation marks.</li>
  <li>Qumulo Core system strips out the <code>\n</code> and <code>\r</code> newline characters from the user ID, file path, and secondary file path fields.</li>
  <li>Both <code>syslog</code> CSV and <code>syslog</code> JSON formats deduplicate repeated file reads. However, for metadata changes&mdash;such as modifications to an access-control list (ACL)&mdash;only the <code>syslog</code> CSV deduplicates repeated operations.</li>
  <li>Unlike the <a href="#details-in-syslog-json-format">`syslog` JSON format</a>, the `syslog` CSV format has only values (no keys) and the fields are empty when unused. The following table helps explain the fields and their possible values.</li> 
</ul>
{{site.data.alerts.end}}

By default, Qumulo Core formats audit log messages in the `syslog` CSV format, prefaced by the date, time, and the name of the machine that issues the operation. The `syslog` CSV format includes the following fields in the following order within the log message body.

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
      {% include note.html content="Qumulo Core specifies the Qumulo authentication ID if it can't resolve any of the other user ID types." %}
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
        <li>Audit logging operation, such as <code>remote_syslog_startup</code></li>
        <li>Connectivity operation, such as <code>ftp_login</code></li>
        <li>File system operation, such as <code>fs_create</code></li>
        <li>Protocol management operation, such as <code>smb_create_share</code></li>
        <li>REST API operation, such as <code>ad_join</code></li>
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
            <li>Credential error message, such as <code>cred_invalid_sid_error</code></li>
            <li>File system operation error message, such as <code>fs_access_perm_not_owner_error</code></li>
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


## Details Included in the syslog JSON Format {#details-in-syslog-json-format}
You can configure Qumulo Core to format audit log messages in the `syslog` JSON format. The fields in this format are similar to [the fields that the `syslog` CSV format provides](#details-in-syslog-csv-format), with the following exceptions.

{% include note.html content="The `syslog` JSON format isn't available in the Qumulo Core Web UI." %}

<table>
  <tr>
    <th style="width: 20%;">Field</th>
    <th style="width: 40%;">Description</th>
    <th style="width: 40%;">Possible Values</th>
  </tr> 
  <tr>
    <td><code>user_id</code> Object</td>
    <td>In Qumulo Core 6.0.1 (and higher) the <code>user_id</code> object replaces the single user ID field in the `syslog` CSV format and contains the fields <code>sid</code>, <code>auth_id</code>, and <code>name</code>.</td>
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
        <li>For most file system operations, the <code>details</code> object replaces the file path, secondary file path, and file ID fields in the `syslog` CSV format and contains the fields <code>path</code>, <code>target</code>, and <code>file_id</code>.</li>
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


## Details Included in the Amazon CloudWatch JSON Format {#details-in-cloudwatch-json-format}
You can configure Qumulo Core to format audit log messages in the Amazon CloudWatch JSON format.

{% include tip.html content="To download the audit log from the CloudWatch console, on the left navigation panel click **Logs &gt; Log groups**, click a log group, and then on the **Log events** page click **Actions &gt; Copy search results (ASCII)**." %}

Rather than preface each line of CSV or JSON with the date and time, CloudWatch creates an ASCII table, which contains Unix timestamps in its first column. The second column contains the fields that are similar to the fields that both [the `syslog` CSV format](#details-in-syslog-csv-format) and [the `syslog` JSON format](#details-in-syslog-json-format) provide, with the following exceptions.

* The <code>result</code> field replaces the Operation Status or <code>status</code> field.

* The <code>object_id</code> field replaces the File ID <code>file_id</code> field.

* The <code>path_1</code> field replaces the File Path or <code>path</code> field.

* The <code>path_2</code> field replaces the Target File Path or <code>target</code> field.

For example:

{% if site.output == "web" %}
{% include tip.html content=scrollTip %}
{% endif %}

<div class="highlight"><pre class="highlight wide-example">------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
|   timestamp   |                                                                                         message                                                                                    |
|---------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
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


## Operation Types in Audit Logging
This following operation types are included in Qumulo Core audit logging.

* Audit logging operations
* Connectivity operations
* File system operations
* Protocol management operations
* REST API operations

## Error Status Messages
The following error status message types are included in Qumulo Core audit logging.

* Credential error messages
* File system operation error messages
