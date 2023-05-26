---
title: "Configuring Qumulo Alerts Integration with SMS (ClickSend)"
summary: "This section explains how to configure Qumulo Alerts to work with SMS by using ClickSend."
permalink: /qumulo-alerts-guide/configuring-integrations/sms-clicksend.html
redirect_from:
  - /qumulo-alerts-guide/installing-configuring/integration-clicksend.html
sidebar: qumulo_alerts_guide_sidebar
keywords: Qumulo_Alerts, ClickSend, SMS, integrate, integration
---

[ClickSend](https://www.clicksend.com/en/) is a paid, third-party service that provides delivery of messages as SMS (and other formats).  For more information, see [How to get started with ClickSend](https://help.clicksend.com/article/3pp05c4fcs-how-to-get-started-with-clicksend) in the ClickSend documentation.

{% include important.html content="To be able to send SMS in the U.S. and Canada, you must sign up for a dedicated toll-free number (TFN)." %}

## To Integrate ClickSend with Qumulo Alerts
Use the `./alerts clicksend_server_add` command and specify the username, token, sender ID, and recipient's phone number.

```bash
./alerts clicksend_server_add \
  --username name@example.com \
  --token 12345678-ABCDEFGH-12345678-ABCDEFGH \
  --senderid "+15551234567" \
  --to-address "+15550987654"
```

{{site.data.alerts.note}}
<ul>
  <li>For the <code>--username</code> and <code>--token</code> flags, see <a href="https://help.clicksend.com/article/dghaoyf7tg-api-credentials">API Credentials</a> in the ClickSend documentation.</li>
  <li>The <code>--senderid</code> flag is mandatory for the U.S. and Canada. For more information, see <a href="https://help.clicksend.com/article/b06v2x81sy-toll-free-number-tfn-verification">Toll-Free Number (TFN) Verification</a> in the ClickSend documentation.</li>
  <li>{{site.qumuloalerts.consTrans}} {{site.qumuloalerts.locale}}</li>
  <li>{{site.qumuloalerts.tz}}</li>
</ul>
{{site.data.alerts.end}}
      
{{site.qumuloalerts.jsonOutput}}
  
```json
[{
  "language": "en_GB",
  "senderid": "+15551234567,
  "timezone": "UTC",
  "to_address": "+15550987654"",
  "username": "name@example.com"
}]
```

## To Test Integration with ClickSend
Use the `./alerts clicksend_server_test` command.

{% include note.html content="For integration testing to complete successfully, the `--to-address` flag must be configured already." %}

{{site.qumuloalerts.testSuccess}} In addition, the recipient's phone number receives a test message.
