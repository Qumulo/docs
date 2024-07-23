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
By default, Qumulo Core formats audit log messages in CSV format. For example:

<details>
<summary>Click to expand</summary>
{% highlight %}
Jun 6 14:52:28 qfsd-1 qumulo {{exampleIP0}},"system",internal,remote_syslog_startup,ok,,"",""
Jun 6 14:52:28 qfsd-1 qumulo {{exampleIP0}},"admin",api,audit_modify_syslog_config,ok,,"",""
Jun 6 14:52:40 qfsd-1 qumulo {{exampleIP0}},"admin",api,rest_login,ok,,"",""
Jun 6 14:53:19 qfsd-1 qumulo {{exampleIPv60}},"admin",api,rest_login,ok,,"",""
Jun 6 14:53:22 qfsd-1 qumulo {{exampleIP0}},"admin",api,fs_read_metadata,ok,3,"/some_file",""
Jun 6 14:53:22 qfsd-1 qumulo {{exampleIP0}},"admin",api,fs_write_metadata,ok,3,"/some_file",""
Jun 6 14:53:22 qfsd-1 qumulo {{exampleIP0}},"admin",api,fs_write_data,ok,3,"/some_file",""
Jun 6 14:53:54 qfsd-1 qumulo {{exampleIP0}},"admin",api,fs_write_metadata,ok,3,"/some_file",""
Jun 6 14:54:05 qfsd-1 qumulo {{exampleIP0}},"admin",api,fs_read_metadata,ok,2,"/",""
Jun 6 14:54:05 qfsd-1 qumulo {{exampleIP0}},"admin",api,fs_rename,ok,3,"/some_file","/other_file"
Jun 6 14:54:19 qfsd-1 qumulo {{exampleIPv60}},"admin",api,rest_login,ok,,"",""
Jun 6 14:55:19 qfsd-1 qumulo {{exampleIPv60}},"admin",api,rest_login,ok,,"",""
Jun 6 14:55:24 qfsd-1 qumulo {{exampleIP0}},"admin",api,begin_audit_modify_syslog_config,ok,,"",""
Jun 6 14:55:24 qfsd-1 qumulo {{exampleIP0}},"system",internal,remote_syslog_startup,ok,,"","
{% endhighlight %}
</details>

You can configure Qumulo Core to format audit log messages in JSON format. For example:
