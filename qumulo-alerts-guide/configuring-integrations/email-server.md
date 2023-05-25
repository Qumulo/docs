---
title: "Configuring Qumulo Alerts Integration with an Email Server"
summary: "This section explains how to configure Qumulo Alerts to work with an email server."
permalink: /qumulo-alerts-guide/configuring-integrations/email-server.html
redirect_from:
  - /qumulo-alerts-guide/installing-configuring/integration-email-server.html
sidebar: qumulo_alerts_guide_sidebar
keywords: Qumulo_Alerts, email, e-mail, integrate, integration
---

## Configuring Qumulo Alerts Integration with an Email Server
To configure Qumulo Alerts to integrate with an email server, you must use the CLI to add an email server to Qumulo Alerts.

The format of the command to add a new email server is:

```bash
./alerts email_server_add --help
```
```json
[alerts - 6.0.0 - CLI for Qumulo Alerts subsystem]
Usage: alerts email_server_add [OPTIONS]

  Add an email server in order to send alerts to recipients

Options:
  --from-addr TEXT  'From' address used on every Qumulo Alerts email.
                    [required]
  --to-addr TEXT    'TO' address (required ONLY for testing).
  --login TEXT      Login username for email server.
  --password TEXT   Login password for email server.
  --server TEXT     Hostname for the email server.  [required]
  --security TEXT   Hostname for the email server.
  --port INTEGER    Port used to communicate with email server.  [required]
  --language TEXT   Default language used to send alerts to email recipients.
  --timezone TEXT   Default timezone used when expressing dates on alert
                    emails.
  --help            Show this message and exit.

```
{% include note.html content="The `login`, `password`, and `security` keys are optional depending on the type of SMTP email server that you use." %}

<table>
  <colgroup>
    <col span="1" style="width: 30%;">
    <col span="1" style="width: 70%;">
  </colgroup>
<thead>
  <tr>
    <th>Name</th>
    <th>Description</th>
  </tr>
</thead>
<tbody>
   <tr>
    <td><code>--from_addr</code></td>
    <td>The sender's email address</td>
  </tr>
  <tr>
    <td><code>--to_addr</code></td>
    <td>
      <p>The recipient's email address</p>
      {% include important.html content="This field is only for testing the email server. Normally, Qumulo Alerts uses the values from user configuration." %}
    </td>
  </tr>
  <tr>
    <td><code>--login</code></td>
    <td>(Optional) The username for the SMTP email server</td>
  </tr>
  <tr>
    <td><code>--password</code></td>
    <td>(Optional) The password for the SMTP email server</td>
  </tr>
  <tr>
    <td><code>--server</code></td>
    <td>The fully qualified domain name (FQDN) or IP address of the SMTP email server</td>
  </tr>  
  <tr>
    <td><code>--security</code></td>
    <td>(Optional) The security protocol to use: <code>ssl</code> or <code>tls</code></td>
  </tr>  
  <tr>
    <td><code>--port</code></td>
    <td>The port for the SMTP email server. The only allowed values are 25 and 2525 for no security, 465 for SSL and 587 for TLS.</td>
  </tr>  
 <tr>
    <td><code>--language</code></td>
    <td>
      {% include content-reuse/qumulo-alerts-see-locale.md %}
    </td>
  </tr>
  <tr>
    <td><code>--timezone</code></td>
    <td>
      {% include content-reuse/qumulo-alerts-see-tz.md %}
    </td>
  </tr>  
</tbody>
</table>

### Using Gmail as an SMTP Relay
After May 2022, only organizations with access to the Google Admin Console can use SMTP relay. If your organization has this access, see [Route outgoing SMTP relay messages through Google](https://support.google.com/a/answer/2956491?hl=en).

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
