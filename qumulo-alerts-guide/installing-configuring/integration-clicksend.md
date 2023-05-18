---
title: "Configuring Qumulo Alerts Integration with ClickSend"
summary: "This section explains how to configure Qumulo Alerts to work with the ClickSend service."
permalink: /qumulo-alerts-guide/installing-configuring/integration-clicksend.html
sidebar: qumulo_alerts_guide_sidebar
keywords: Qumulo_Alerts, ClickSend, SMS, integrate, integration
---

[ClickSend](https://www.clicksend.com/en/) is a paid, third-party service that provides delivery of messages as SMS (and other formats). 

For more information, see [How to get started with ClickSend](https://help.clicksend.com/article/3pp05c4fcs-how-to-get-started-with-clicksend) in the ClickSend documentation.

{% include note.html content="To be able to send SMS in the U.S. and Canada, you must sign up for a dedicated TFN." %}

## Configuring Qumulo Alerts Integration with the ClickSend Service

To configure Qumulo Alerts to integrate with the ClickSend Service, you must add a clicksend server using the CLI.

The command syntax is:

```bash
./alerts clicksend_server_add --help
```
```json
[alerts - 6.0.0 - CLI for Qumulo Alerts subsystem]
Usage: alerts clicksend_server_add [OPTIONS]

  Add a clicksend server in order to send alerts to recipients

Options:
  --username TEXT    'username' needed to login to the ClickSend service.
                     [required]
  --token TEXT       'token' needed to login to the ClickSend service.
                     [required]
  --senderid TEXT    Sender ID used by ClickSend.
  --to-address TEXT  'to-address' used to test ClickSend.
  --language TEXT    Default language used to send alerts to clicksend
                     recipients.
  --timezone TEXT    Default timezone used when expressing dates on clicksend
                     sms messages.
  --help             Show this message and exit.

```

The following is an explanation of the options that configure integration with an email server.

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
    <td><code>--username</code></td>
    <td>
      <p>The login username for the ClickSend service.</p>
      <p>For more information, see <a href="https://help.clicksend.com/article/dghaoyf7tg-api-credentials">API credentials</a> in the ClickSend documentation.</p>
    </td>
  </tr> 
  <tr>
    <td><code>--token</code></td>
    <td>
      <p>Your ClickSend API key</p>
      <p>For more information, see <a href="https://help.clicksend.com/article/dghaoyf7tg-api-credentials">API credentials</a> in the ClickSend documentation.</p>
    </td>
  </tr> 
  <tr>
    <td><code>--senderid</code></td>
    <td>
      <p>Your ClickSend toll-free number (TFN)</p>
      {% include important.html content="This field is mandatory for the U.S. and Canada." %}
      <p>For more information, see <a href="https://help.clicksend.com/article/b06v2x81sy-toll-free-number-tfn-verification">Toll-Free Number (TFN) Verification</a> in the ClickSend documentation.</p>
    </td>
  </tr>
  <tr>
    <td><code>--to-address</code></td>
    <td>
      <p>A valid phone number where a test message can be sent (TFN)</p>
      {% include important.html content="This is ONLY used during a test of the ClickSend service!" %}
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
  
## Example: Adding a ClickSend server to Qumulo Alerts
  
```bash
./alerts clicksend_server_add --username jsomebody@xyzcorp.com --token 12345678-ABCDEFGH-12345678-ABCDEFGH --senderid "+18441234567" --to-address "+14801234567"
```
```json
[alerts - 6.0.0 - CLI for Qumulo Alerts subsystem]
[{
    "language": "en_GB",
    "senderid": "+18441234567",
    "timezone": "UTC",
    "to_address": "+14801234567",
    "username": "jsomebody@xyzcorp.com"
}]
```
## Testing the ClickSend service

If order to determine if the ClickSend service is configured properly, a test message should be sent.
This can only be done if the `--to-address` is configured.
  
```bash
./alerts clicksend_server_test
```
```json
[alerts - 6.0.0 - CLI for Qumulo Alerts subsystem]
[{
    "ok": true
}]
```
If the Clicksend service was configured properly, the phone number configured in `to-address` should receive a test message.