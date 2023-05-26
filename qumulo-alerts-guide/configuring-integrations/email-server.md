---
title: "Configuring Qumulo Alerts Integration with an Email Server"
summary: "This section explains how to configure Qumulo Alerts to work with an email server."
permalink: /qumulo-alerts-guide/configuring-integrations/email-server.html
redirect_from:
  - /qumulo-alerts-guide/installing-configuring/integration-email-server.html
sidebar: qumulo_alerts_guide_sidebar
keywords: Qumulo_Alerts, email, e-mail, integrate, integration
---

To configure Qumulo Alerts integration with an email server, use the `./alerts email_server_add` command.

{{site.data.alerts.note}}
<ul>
  <li>The <code>--login</code>, <code>--password</code>, and <code>--security</code> flags might be optional, depending on the type of SMTP email server that you use.</li>
  <li>{{site.qumuloalerts.locale}}</li>
  <li>{{site.qumuloalerts.tz}}</li>
  <li>After May 2022, only organizations with access to the Google Admin Console can use SMTP relay. If your organization has this access, see <a href="https://support.google.com/a/answer/2956491?hl=en">Route outgoing SMTP relay messages through Google</a>.</li>
</ul>
{{site.data.alerts.end}}

## Example: Adding a new email server to Qumulo Alerts

```bash
./alerts email_server_add --from-addr Alerts@xyzcorp.com --to-addr jsomebody@xyzcorp.com --server mail.xyzcorp.com --port 25 --language en_US --timezone "America/Los_Angeles"
```
```json
[alerts - 6.0.0 - CLI for Qumulo Alerts subsystem]
[{
    "from_address": "Alerts@xyzcorp.com",
    "language": "en_US",
    "login": null,
    "password": null,
    "port": 25,
    "security": null,
    "server": "mail.xyzcorp.com",
    "timezone": "America/Los_Angeles",
    "to_address": "jsomebody@xyzcorp.com"
}]
```

## To Test Integration with Your Email Server

It is recommended that you test to make sure that the email server is working properly.

```bash
./alerts email_server_test
```
```json
[alerts - 6.0.0 - CLI for Qumulo Alerts subsystem]
[{
    "ok": true
}]
  ```

The email server sends a test message to the email address specified in the `to_addr` key.
