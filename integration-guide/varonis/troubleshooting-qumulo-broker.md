---
title: "Troubleshooting the Integration between Qumulo Core and Varonis"
summary: "This section explains how to troubleshoot the integration between Qumulo Core and Varonis."
permalink: /integration-guide/varonis/troubleshooting-qumulo-broker.html
redirect_from:
  - /integration-guide/qumulo-broker/troubleshooting-qumulo-broker.html
  - /integration-guide/varonis-collector/troubleshooting-qumulo-broker.html
sidebar: integration_guide_sidebar
---

## To Troubleshoot Qumulo Broker

1. Do one of the following:

   * View Qumulo Broker operation logs in the `/var/log/qumulo_audit.log` file.
   
   * View the logs for each container by using the `docker logs <container-id>` command.

1. If the logs show an issue related to audit log operations, uncomment the following line in the `/etc/rsyslog/10-qumulo.conf` file.

   ```
   # action(type="omfile" file="/var/log/qumulo_audit.log")
   ```

1. {{site.varonis.restartRsyslog}}

1. Get the input log that you suspect to cause an issue from the `/var/log/qumulo_audit.log` file.

   ```
   Mar  3 14:08:51 q-varonis-1 qumulo
   {
     "user_id": {
       "sid": "{{site.exampleSID3}}",
       "auth_id": "500",
       "name": "admin"
     },
     "user_ip": "{{site.exampleIP0}},
     "protocol": "smb2",
     "operation": "fs_create_file",
     "status": "ok",
     "details": {
       "file_id": "1000003",
       "path": "/my-file.txt"
     }
   }
   ```
   
1. Use the input log from the from the `/var/log/qumulo_audit.log` file to run the `/opt/qumulo/QumuloBroker/events/Broker` command manually.

   {% include note.html content="Change the timestamp definition in your input to [ISO 8601 with milliseconds](https://en.wikipedia.org/wiki/ISO_8601)." %}
   
   ```
   2023-03-03T14:08:51.058379Z q-varonis-1 qumulo
   {
     "user_id": {
       "sid": "{{site.exampleSID3}}",
       "auth_id": "500",
       "name": "admin"
     },
     "user_ip": "{{site.exampleIP0}}",
     "protocol": "smb2",
     "operation": "fs_create_file",
     "status": "ok",
     "details": {
     "file_id": "1000003",
     "path": "/my-file.txt"
     }
   }
   ```
   
1. For questions about any issues, {{site.contactQumuloCare}}.
