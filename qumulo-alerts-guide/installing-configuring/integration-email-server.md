---
title: "Configuring Qumulo Alerts Integration with an Email Server"
summary: "This section explains how to configure Qumulo Alerts to work with an email server."
permalink: /qumulo-alerts-guide/installing-configuring/integration-email-server.html
sidebar: qumulo_alerts_guide_sidebar
keywords: Qumulo_Alerts, email, e-mail, integrate, integration
---

## Configuring Qumulo Alerts Integration with an Email Server
To configure Qumulo Alerts to integrate with an email server, you must edit `QumuloEmailServer.json`, located in the `config/consumers` directory, in the directory [that you cloned from GitHub](installing-connecting-to-qumulo-cluster.md#clone-qumuloalerts-repository).

The following is an explanation of the JSON keys that configure integration with an email server.

{% include note.html content="The `login`, `password`, and `use` keys are optional depending on the type of SMTP email server that you use." %}

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
    <td><code>from_addr</code></td>
    <td>The sender's email address</td>
  </tr>
  <tr>
    <td><code>login</code></td>
    <td>(Optional) The username for the SMTP email server</td>
  </tr>
  <tr>
    <td><code>password</code></td>
    <td>(Optional) The password for the SMTP email server</td>
  </tr>
  <tr>
    <td><code>port</code></td>
    <td>The port for the SMTP email server, commonly <code>587</code> for SSL or TLS</td>
  </tr>  
  <tr>
    <td><code>server</code></td>
    <td>The fully qualified domain name (FQDN) or IP address of the SMTP email server</td>
  </tr>  
  <tr>
    <td><code>to_addr</code></td>
    <td>
      <p>The recipient's email address</p>
      {% include important.html content="This field is only for testing the email server. Normally, Qumulo Alerts uses the values from `QumuloUsers.json`." %}
    </td>
  </tr>
  <tr>
    <td><code>use</code></td>
    <td>(Optional) The security protocol to use: <code>ssl</code> or <code>tls</code></td>
  </tr>  
</tbody>
</table>

### Using Gmail as an SMTP Relay
After May 2022, only organizations with access to the Google Admin Console can use SMTP relay. If your organization has this access, see [Route outgoing SMTP relay messages through Google](https://support.google.com/a/answer/2956491?hl=en).

## Example: Configured Email Server Integration

```json
{
  "from_addr": "robert@example.com",
  "to_addr": "test@example.com",
  "login": "robert@xyzcorp.com",
  "password": "<password>",
  "server": "smtp.xyzcorp.com",
  "port": 587,
  "use": "tls",
  "default_language": "en_GB",
  "default_timezone": "UTC"
}
```

## To Test Integration with Your Email Server
1. To add execution permissions to the `test_email.macos-latest` and `test_email.ubuntu-latest` files, run the following command.

   ```bash
   chmod a+x test_email.*
   ```
   
1. To test the integration, run the executable for your operating system. For example:

   ```bash
   ./test_email.ubuntu-latest --config ./config/consumer/
   ```

   The email server sends a test message to the email address specified in the `to_addr` key.
