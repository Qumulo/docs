---
title: "Configuring Qumulo Alerts Integration with ClickSend (SMS)"
summary: "This section explains how to integrate ClickSend with Qumulo Alerts and test the integration."
permalink: /qumulo-alerts-guide/configuring-integrations/sms-clicksend.html
redirect_from:
  - /qumulo-alerts-guide/installing-configuring/integration-clicksend.html
sidebar: qumulo_alerts_guide_sidebar
---

[ClickSend](https://www.clicksend.com/en/) is a paid, third-party service that provides delivery of messages as SMS (and other formats). For more information, see [How to get started with ClickSend](https://help.clicksend.com/article/3pp05c4fcs-how-to-get-started-with-clicksend) in the ClickSend documentation.

{% include important.html content="To be able to send SMS in the U.S. and Canada, you must sign up for a dedicated toll-free number (TFN)." %}


## To Integrate ClickSend with Qumulo Alerts and Test the Integration by Using the Qumulo Alerts Web UI

1. On the sidebar, under **Servers**, click **ClickSend SMS**.

1. Enter the ClickSend configuration details:

   1. For **Username**, enter your ClickSend account username (typically, your email address).
  
   1. For **API Key**, enter the API key from your ClickSend account dashboard.

      {% include tip.html content="To keep the current key, leave **API Key** empty when you edit an existing ClickSend configuration." %}
 
   1. For **From Number**, enter the phone number or sender ID to appear as the sender of outgoing SMS messages, formatted according to the [E.164 standard](https://en.wikipedia.org/wiki/E.164) (for example, `+15555550100`).
 
   1. For **Test Number**, enter the phone number to receive the test SMS when you click **Test Connection**.

1. Click **Save Configuration**.

   {% include note.html content="You must configure recipient phone numbers separately for each user on the **Alert Recipients** page. For more information, see [Configuring Alarm and Alert Notifications to an Administrative Account](../configuring-notifications/alarms-and-alert-notifications-to-administrators.html)." %}

1. Click **Test Connection**.

1. Qumulo Alerts sends a test SMS to the configured test number.

   * If the test succeeds, a confirmation message appears.

   * If the test fails, check the configuration details.


## To Integrate ClickSend with Qumulo Alerts and Test the Integration by Using the alerts CLI
1. Run the `./alerts clicksend_server_add` command and specify the username, token, sender ID, and recipient's phone number.

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
     <li>The <code>--senderid</code> flag is mandatory for the U.S. and Canada. For more information, see <a href="https://help.clicksend.com/article/nu1dkqqpi0-how-to-register-a-toll-free-number-tfn-with-click-send">How to Register a Toll-Free Number (TFN) with ClickSend</a> in the ClickSend documentation.</li>
     <li>{{site.qumuloalerts.locale}} {{site.qumuloalerts.consTrans}}</li>
     <li>{{site.qumuloalerts.tz}}</li>
   </ul>
   {{site.data.alerts.end}}

   {{site.exampleOutput}}

   ```json
   [{
     "language": "en_GB",
     "senderid": "+15551234567",
     "timezone": "UTC",
     "to_address": "+15550987654",
     "username": "name@example.com"
   }]
   ```

1. Run the `./alerts clicksend_server_test` command.

   {% include note.html content="For integration testing to complete successfully, the `--to-address` flag must be configured already." %}

   {{site.qumuloalerts.testSuccess}} In addition, the recipient's phone number receives a test message.
