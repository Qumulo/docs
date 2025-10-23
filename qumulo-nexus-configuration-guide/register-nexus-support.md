---
title: "Generating an Instance Registration Key for Nexus Remote Support"
summary: "This section explains how to generate a one-time password (OTP) token to register your Qumulo cluster with Nexus for remote support."
permalink: /qumulo-nexus-configuration-guide/register-nexus-support.html
sidebar: qumulo_nexus_configuration_guide_sidebar
search: exclude
varRegKey: The registration key value is displayed only once when you create it. You must copy and store the key securely before closing the token creation dialog. If you lose the key before using it, you must revoke it and generate a new one.
---

To register your Qumulo cluster with Nexus for remote support, you must first generate an instance registration key (also called an OTP token) from the Qumulo Nexus portal. This one-time password securely associates your cluster with your Nexus account.

## Prerequisites
To generate an instance registration key:

* You must have access to <a target="_blank" href="https://nexus.qumulo.com">Qumulo Nexus</a>

* You must have a Nexus user account with appropriate permissions


## How Instance Registration Keys Work
An _instance registration key_ (or _OTP token_) is a one-time password that you use to register your Qumulo cluster with Nexus.

{% capture regKey %}{{ page.varRegKey }}{% endcapture %}
{% include important.html content=page.varRegKey %}

When you generate a registration key:

* The key is valid for 14 days from creation

* The key can only be used once for instance registration

* After you use the key to register a cluster, the key is automatically removed from your active tokens list


## Generating an Instance Registration Key
You can generate instance registration keys from the <a target="_blank" href="https://nexus.qumulo.com">Qumulo Nexus</a> user settings.

{% include important.html content=page.varRegKey %}

### To Generate an Instance Registration Key
1. Log in to the Qumulo Nexus portal. 

1. Navigate to **User Settings**.

   {% include tip.html content="You can access User Settings by clicking your username in the upper-right corner of the Nexus portal." %}

1. Click the **Instance Registration OTP** tab.

1. Click **Generate OTP**.

1. In the **Description** field, enter a descriptive name for the registration key.

   {% include note.html content="The description is solely to help identify the token later. It is visible in the Active OTP Tokens list." %}

1. Click **Create OTP Token**.

1. In the **OTP Token Created** dialog, copy the token value.

   {% include important.html content="This is your only opportunity to view the token value." %}

1. Click **Done** to close the dialog.


## Managing Active Registration Keys
After you create a registration key, it appears in the **Active OTP Tokens** section on the **Instance Registration OTP** tab. The list shows:

* The description you provided when creating the token

* The creation date

* The expiration date

{% include note.html content="Once a registration key is used to register a cluster, it automatically disappears from the Active OTP Tokens list." %}

### To Revoke an Unused Registration Key
If you need to revoke a registration key before it is used or expires:

1. Log in to the Qumulo Nexus portal.

1. Navigate to **User Settings > Instance Registration OTP**.

1. In the **Active OTP Tokens** section, locate the token you want to revoke.

1. Click **Revoke** next to the token.

{% include important.html content="After you revoke a registration key, it cannot be used to register a cluster. This action cannot be undone." %}


## Next Steps
After generating an instance registration key, you can use it to enable Nexus Remote Support on your Qumulo cluster. For more information, see:

* [Enabling Nexus Remote Support](../administrator-guide/monitoring-and-metrics/enabling-nexus-remote-support.html)

