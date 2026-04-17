---
title: "Configuring Qumulo Alerts Integration with an Email Server"
summary: "This section explains how to integrate an email server with Qumulo Alerts and test the integration."
permalink: /qumulo-alerts-guide/configuring-integrations/email-server.html
redirect_from:
  - /qumulo-alerts-guide/installing-configuring/integration-email-server.html
sidebar: qumulo_alerts_guide_sidebar
---

{% include note.html content="After May 2022, only organizations with access to the Google Admin Console can use SMTP relay to [Route outgoing SMTP relay messages through Google](https://support.google.com/a/answer/2956491?hl=en)." %}


## To Integrate an Email Server with Qumulo Alerts and Test the Integration by Using the Qumulo Alerts Web UI
{{site.data.alerts.note}}
<ul>
  <li>Depending on your SMTP server configuration, the <strong>Username</strong>, <strong>Password</strong>, and <strong>Security</strong> fields might be optional.</li>
  <li>{{site.qumuloalerts.locale}} {{site.qumuloalerts.consTrans}}</li>
  <li>{{site.qumuloalerts.tz}}</li>
</ul>
{{site.data.alerts.end}}

1. On the sidebar, under **Servers**, click **Email Server**.

1. Enter the SMTP configuration details:

   1. For **SMTP Server**, enter the hostname or IP address of your SMTP server (for example, `mail.example.com`).
   
   1. For **Port**, select the following SMTP server port.
   
   1. For **From Address**, select the email address to appear in the **From** field of outgoing notifications (for example, `alerts@example.com`).
   
   1. For **Security**, select the following connection security types.
   
   1. (Optional) For **Username**, enter the username for SMTP authentication.
   
   1. (Optional) For **Password**, enter the password for SMTP authentication.

      {% include tip.html content="To keep the current password, leave **Password** empty." %}
   
   1. For **To Address (used only for testing the connection)**, enter the email address to receive the test message when you click **Test Connection**.
   
   1. For **Default Language**, enter a [supported language locale](../getting-started/supported-language-locales.html) to use for notification email templates when a user-level language isn't configured.
   
   1. For **Default Timezone**, enter the the time zone for formatting timestamps in notification emails when a user-level timezone isn't configured.

1. Click **Save Configuration**.

1. Click **Test Connection**.

1. Qumulo Alerts sends a test message to the configured email address.

   * If the test succeeds, a confirmation message appears.

   * If the test fails, check the configuration details.


## To Integrate an Email Server with Qumulo Alerts and Test the Integration by Using the alerts CLI
{{site.data.alerts.note}}
<ul>
  <li>Depending on the type of SMTP email server that you use, the <code>--login</code>, <code>--password</code>, and <code>--security</code> flags might be optional.</li>
  <li>{{site.qumuloalerts.locale}} {{site.qumuloalerts.consTrans}}</li>
  <li>{{site.qumuloalerts.tz}}</li>
</ul>
{{site.data.alerts.end}}

1. Run the `./alerts email_server_add` command and specify the sender's email address, recipient's email address, email server hostname and port, language, and time zone. For example:

   ```bash
   ./alerts email_server_add \
     --from-addr alerts@example.com \
     --to-addr name@example.com \
     --server mail.example.com \
     --port 25
     --language en_US
     --timezone "America/Los_Angeles"
    ```

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

1. Run the `./alerts email_server_test` command.

   {{site.qumuloalerts.testSuccess}}
