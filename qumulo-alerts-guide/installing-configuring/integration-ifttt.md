---
title: "Configuring Qumulo Alerts Integration with IFTTT"
summary: "This section explains how to configure Qumulo Alerts to work with the IFTTT service."
permalink: /qumulo-alerts-guide/installing-configuring/integration-ifttt.html
sidebar: qumulo_alerts_guide_sidebar
keywords: Qumulo_Alerts, IFTTT, integrate, integration
---

[IFTTT](https://ifttt.com/) is a paid, third-party service that provides delivery of messages using webhooks and events.

IFTTT is an acronym for "If This Then That". It is the leading "no code" platform on the internet

For more information, see [How to get started with IFTTT](https://ifttt.com/about) in the IFTTT documentation.

## Configuring Qumulo Alerts Integration with the IFTTT Service
To configure Qumulo Alerts to integrate with the IFTTT Service, you must add a IFTTT server using the CLI.

The command syntax is:

```bash
# ./alerts ifttt_server_add --help
[alerts - 6.0.0 - CLI for Qumulo Alerts subsystem]
Usage: alerts ifttt_server_add [OPTIONS]

  Add an IFTTT server in order to send alerts to recipients

Options:
  --token TEXT     Token for IFTTT server.
  --language TEXT  Default language used to send alerts to IFTTT recipients.
  --timezone TEXT  Default timezone used when expressing dates on IFTTT.
  --help           Show this message and exit.

```

The following is an explanation of the options that configure integration with an IFTTT server.

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
    <td><code>--token</code></td>
    <td>
      <p>The webhook token for the IFTTT service.</p>
      <p>For more information, see <a href="https://ifttt.com/maker_webhooks">Webhook Integrations</a> in the IFTTT documentation.</p>
    </td>
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
  
## Example: Adding a IFTTT server to Qumulo Alerts
  
```bash
# ./alerts ifttt_server_add --token dygWSfq55w0m1234RHJ45 --language en_US --timezone "America/Phoenix"
[alerts - 6.0.0 - CLI for Qumulo Alerts subsystem]
[{
    "language": "en_US",
    "timezone": "America/Phoenix",
    "token": "dygWSfq55w0m1234RHJ45"
}]
```
## Testing the IFTTT service

If order to determine if the IFTT service is configured properly, a test message should be sent.
  
```bash
# ./alerts ifttt_server_test
[alerts - 6.0.0 - CLI for Qumulo Alerts subsystem]
[{
    "ok": true
}]
```
