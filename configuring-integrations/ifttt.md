---
title: "Configuring Qumulo Alerts Integration with IFTTT"
summary: "This section explains how to integrate IFTTT with Qumulo Alerts and test the integration."
permalink: /qumulo-alerts-guide/configuring-integrations/ifttt.html
redirect_from:
  - /qumulo-alerts-guide/installing-configuring/integration-ifttt.html
sidebar: qumulo_alerts_guide_sidebar
---

[IFTTT (If This Then That)](https://ifttt.com/) is a paid, third-party service that provides delivery of messages by using [Webhooks integrations](https://ifttt.com/maker_webhooks) and events. For more information, see the [IFTTT documentation](https://ifttt.com/docs).


## To Integrate IFTTT with Qumulo Alerts and Test the Integration by Using the Qumulo Alerts Web UI
1. Create a Webhooks applet in IFTTT and obtain the Webhooks key from the [IFTTT Maker Webhooks](https://ifttt.com/maker_webhooks) page.

1. Log in to Qumulo Alerts.

1. On the sidebar, under **Servers**, click **IFTTT**.

1. For the **Webhook Key** field, enter your IFTTT Webhooks key.

1. Click **Save Configuration**.

1. Click **Test Connection**.

1. Qumulo Alerts sends a test event to your IFTTT Webhooks.

   * If the test succeeds, a confirmation message appears.

   * If the test fails, check your Webhooks key and that your IFTTT applet is active.


## To Integrate IFTTT with Qumulo Alerts and Test the Integration by Using the alerts CLI
1. Run the `./alerts ifttt_server_add` command and specify the IFTTT server token, language, and time zone. For example:

   ```bash
   ./alerts ifttt_server_add \
     --token abcABde12f3g4567CDE89 \
     --language en_US \
     --timezone "America/Phoenix"
   ```

   {{site.data.alerts.note}}
   <ul>
     <li>{{site.qumuloalerts.locale}} {{site.qumuloalerts.consTrans}}</li>
     <li>{{site.qumuloalerts.tz}}</li>
   </ul>
   {{site.data.alerts.end}}

   {{site.exampleOutput}}

   ```json
   [{
     "language": "en_US",
     "timezone": "America/Phoenix",
     "token": "abcABde12f3g4567CDE89"
   }]
   ```

1. Run the `./alerts ifttt_server_test` command.

   {{site.qumuloalerts.testSuccess}}
