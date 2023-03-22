---
title: "Configuring Qumulo Alerts Integration with ClickSend"
summary: "This section explains how to configure Qumulo Alerts to work with the ClickSend service."
permalink: /qumulo-alerts-guide/installing-configuring/integration-clicksend.html
sidebar: qumulo_alerts_guide_sidebar
keywords: Qumulo Alerts, ClickSend, SMS, integrate, integration
---

[ClickSend](https://www.clicksend.com/en/) is a paid, third-party service that provides delivery of messages as SMS (and other formats). For more information, see [How to get started with ClickSend](https://help.clicksend.com/article/3pp05c4fcs-how-to-get-started-with-clicksend) in the ClickSend documentation.

{% include note.html content="To be able to send SMS in the U.S. and Canada, you must sign up for a dedicated TFN." %}

## Configuring Qumulo Alerts Integration with the ClickSend Service
To configure Qumulo Alerts to integrate with the ClickSend Service, you must edit `QumuloClickSendServer.json`, located in the `config/consumers` directory, in the directory [that you cloned from GitHub](installing-connecting-to-qumulo-cluster.md#step-1-install-qumuloalerts).

The following is an explanation of the JSON keys that configure integration with an email server.

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
    <td><code>default_language</code></td>
    <td>
      {% include content-reuse/qumulo-alerts-see-locale.md %}
    </td>
  </tr>
  <tr>
    <td><code>default_timezone</code></td>
    <td>
      {% include content-reuse/qumulo-alerts-see-tz.md %}
    </td>
  </tr>
  <tr>
    <td><code>senderid</code></td>
    <td>
      <p>Your ClickSend toll-free number (TFN)</p>
      {% include important.html content="This field is mandatory for the U.S. and Canada." %}
      <p>For more information, see <a href="https://help.clicksend.com/article/b06v2x81sy-toll-free-number-tfn-verification">Toll-Free Number (TFN) Verification</a> in the ClickSend documentation.</p>
    </td>
  </tr>
  <tr>
    <td><code>token</code></td>
    <td>
      <p>Your ClickSend API key</p>
      <p>For more information, see <a href="https://help.clicksend.com/article/dghaoyf7tg-api-credentials">API credentials</a> in the ClickSend documentation.</p>
    </td>
  </tr> 
</tbody>
</table>
  
## Example: Configured ClickSend Service Integration 
  
```json
{
    "username": "mary@example.com",
    "token": "A12BC345-D6EF-7890-G1234-56HIJ7890",
    "senderid": "+15555555555",
    "default_language": "en_GB",
    "default_timezone": "UTC"
}
```
