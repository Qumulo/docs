---
title: "Configuring Qumulo Alerts Integration with an Email Server"
summary: "This section explains how to configure Qumulo Alerts to work with an email server."
permalink: /qumulo-alerts-guide/configuring-integrations/email-server.html
redirect_from:
  - /qumulo-alerts-guide/installing-configuring/integration-email-server.html
sidebar: qumulo_alerts_guide_sidebar
---

{% include note.html content="After May 2022, only organizations with access to the Google Admin Console can use SMTP relay. If your organization has this access, see [Route outgoing SMTP relay messages through Google](https://support.google.com/a/answer/2956491?hl=en)." %}


## To Add a New Email Server to Qumulo Alerts
Run the `./alerts email_server_add` command and specify the sender's email address, recipient's email address, email server hostname and port, language, and time zone. For example:

```bash
./alerts email_server_add \
  --from-addr alerts@example.com \
  --to-addr name@example.com \
  --server mail.example.com \
  --port 25
  --language en_US
  --timezone "America/Los_Angeles"
```

{{site.data.alerts.note}}
<ul>
  <li>The <code>--login</code>, <code>--password</code>, and <code>--security</code> flags might be optional, depending on the type of SMTP email server that you use.</li>
  <li>{{site.qumuloalerts.locale}} {{site.qumuloalerts.consTrans}}</li>
  <li>{{site.qumuloalerts.tz}}</li>
</ul>
{{site.data.alerts.end}}

{{site.exampleOutput}}

```json
[{
  "from_address": "alerts@example.com",
  "language": "en_US",
  "login": null,
  "password": null,
  "port": 25,
  "security": null,
  "server": "mail.example.com",
  "timezone": "America/Los_Angeles",
  "to_address": "name@example.com"
}]
```


## To Test Integration with Your Email Server
Run the `./alerts email_server_test` command.

{{site.qumuloalerts.testSuccess}}
