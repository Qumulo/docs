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
By default, Qumulo Core formats audit log messages in CSV format, prefaced by the date, time, and the machine that issued the operation. For example:

<details>
  <summary>Click to expand</summary>
  <pre>Jun 6 14:52:28 my-machine qumulo {{exampleIP0}},"system",internal,remote_syslog_startup,ok,,"",""
Jun 6 14:52:28 my-machine qumulo {{exampleIP0}},"admin",api,audit_modify_syslog_config,ok,,"",""
Jun 6 14:52:40 my-machine qumulo {{exampleIP0}},"admin",api,rest_login,ok,,"",""
Jun 6 14:53:19 my-machine qumulo {{exampleIPv60}},"admin",api,rest_login,ok,,"",""
Jun 6 14:53:22 my-machine qumulo {{exampleIP0}},"admin",api,fs_read_metadata,ok,3,"/my_file",""
Jun 6 14:53:22 my-machine qumulo {{exampleIP0}},"admin",api,fs_write_metadata,ok,3,"/my_file",""
Jun 6 14:53:22 my-machine qumulo {{exampleIP0}},"admin",api,fs_write_data,ok,3,"/my_file",""
Jun 6 14:54:05 my-machine qumulo {{exampleIP0}},"admin",api,fs_rename,ok,3,"/my_file","/another_file"
Jun 6 14:55:24 my-machine qumulo {{exampleIP0}},"admin",api,begin_audit_modify_syslog_config,ok,,"",""
Jun 6 14:55:24 my-machine qumulo {{exampleIP0}},"system",internal,remote_syslog_shutdown,ok,,"","</pre>
</details>

You can configure Qumulo Core to format audit log messages in JSON format. For example:

<details>
  <summary>Click to expand</summary>
  <pre>Jun 6 14:58:47 qfsd-1 qumulo {"user_id": {"auth_id": "1", "sid": "{{site.exampleSID7}}, "name": "system"}, "user_ip": "{{exampleIP0}}", "protocol": "internal", "operation": "remote_syslog_startup", "status": "ok", "details": {}}
Jun 6 14:55:24 qfsd-1 qumulo {"user_id": {"sid": "{{site.exampleSID8}}", "auth_id": "500", "name": "admin"}, "user_ip": "{{exampleIP0}}", "protocol": "api", "operation": "audit_modify_syslog_config", "status": "ok", "details": {"second_extra_name": "", "extra_name": ""}}
Jun 6 14:55:36 qfsd-1 qumulo {"user_id": {"auth_id": "500", "name": "admin", "sid": "{{site.exampleSID8}}"}, "user_ip": "{{exampleIP0}}", "protocol": "api", "operation": "rest_login", "status": "ok", "details": {"second_extra_name": "", "extra_name": ""}}
Jun 6 14:55:58 qfsd-1 qumulo {"user_id": {"sid": "{{site.exampleSID8}}", "name": "admin", "auth_id": "500"}, "user_ip": "{{exampleIP0}}", "protocol": "api", "operation": "fs_read_metadata", "status": "ok", "details": {"path": "/my_file", "file_id": "4"}}
Jun 6 14:55:58 qfsd-1 qumulo {"user_id": {"name": "admin", "sid": "{{site.exampleSID8}}", "auth_id": "500"}, "user_ip": "{{exampleIP0}}", "protocol": "api", "operation": "fs_write_metadata", "status": "ok", "details": {"file_id": "4", "after": {"ctime": "2024-06-11T14:55:58.187394089Z", "mtime": "2024-06-11T14:55:58.187394089Z", "owner": {"sid": "{{site.exampleSID8}}", "auth_id": "500"}}, "path": "/my_file", "before": {"ctime": "2024-06-11T14:55:43.616292461Z", "mtime": "2024-06-11T14:55:43.616292461Z", "owner": {"sid": "{{site.exampleSID8}}", "auth_id": "500"}}}}
Jun 6 14:55:58 qfsd-1 qumulo {"user_id": {"auth_id": "500", "sid": "{{site.exampleSID8}}", "name": "admin"}, "user_ip": "{{exampleIP0}}", "protocol": "api", "operation": "fs_write_data", "status": "ok", "details": {"path": "/my_file", "size": 261456, "file_id": "4", "offset": 0, "file_size": 261456}}
Jun 6 14:57:49 qfsd-1 qumulo {"user_id": {"name": "admin", "auth_id": "500", "sid": "{{site.exampleSID8}}"}, "user_ip": "{{exampleIP0}}", "protocol": "api", "operation": "fs_rename", "status": "fs_entry_exists_error", "details": {"path": "/my_file", "target": "/another_file", "file_id": "4"}}
Jun 6 14:58:47 qfsd-1 qumulo {"user_id": {"sid": "{{site.exampleSID8}}", "auth_id": "500", "name": "admin"}, "user_ip": "{{exampleIP0}}", "protocol": "api", "operation": "begin_audit_modify_syslog_config", "status": "ok", "details": {"second_extra_name": "", "extra_name": ""}}
Jun 6 14:58:47 qfsd-1 qumulo {"user_id": {"auth_id": "1", "sid": "{{site.exampleSID7}}, "name": "system"}, "user_ip": "{{exampleIP0}}", "protocol": "internal", "operation": "remote_syslog_shutdown", "status": "ok", "details": {}}</pre>
</details>
