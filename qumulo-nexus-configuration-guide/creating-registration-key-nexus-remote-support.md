---
title: "Creating a Registration Key for Qumulo Nexus Remote Support"
summary: 'This section explains how to create a registration key for your Qumulo cluster to provide <a href="https://docs.qumulo.com/administrator-guide/monitoring-and-metrics/enabling-nexus-remote-support.html">Nexus Remote Support</a> access to the Qumulo Care Team.'
permalink: /qumulo-nexus-configuration-guide/creating-registration-key-nexus-remote-support.html
sidebar: qumulo_nexus_configuration_guide_sidebar
---

A _registration key_ works like a one-time password (it is valid for 14 days). It associates your Qumulo cluster with your Qumulo Nexus account.

To generate a registration key, you must have administrative access to your organization's Nexus account.


<a id="create-registration-key"></a>
## To Create a Registration Key in Qumulo Nexus
1. [Log in to Qumulo Nexus](https://nexus.qumulo.com/login).

1. In the upper-right corner, click your username and then click **User Settings**.

1. On the **User Settings** page, click **Registration Keys**.

1. Enter the **Key Name** to identify your registration key and then click **Create Key**.

1. In the **Registration Key Created** dialog box, click **Copy Key** and they click **Done**.

   {{site.data.alerts.important}}
   <ul>
     <li>Nexus displays the registration key only once. Copy this key to secure location.</li>
     <li>If you misplace your key before enabling Nexus Remote Support, <a href="#revoke-registration-key">revoke the key</a> and then <a href="#create-registration-key">create a new one</a>.</li>
   </ul>
   {{site.data.alerts.end}}

   Your registration key appears in the **Registered Keys** section, which shows the key's name, creation date, and expiration date.

   When you use the registration key to enable Nexus Remote Support, Nexus removes the key from this list.


<a id="revoke-registration-key"></a>
### To Revoke an Unused Registration Key
You can revoke a registration key before you use it to enable Nexus Remote Support or before it expires.

1. [Log in to Qumulo Nexus](https://nexus.qumulo.com/login).

1. In the upper-right corner, click your username and then click **User Settings**.

1. On the **User Settings** page, click **Registration Keys**.

1. In the **Manage Registration Keys** section, locate the key to revoke and then click **Revoke**.

   {% include note.html content="Although revoking a registration key is a permanent action, you can [create a new key](#create-registration-key)." %}


## Next Steps
After you create a registration key, you can [enable Nexus Remote Support](https://docs.qumulo.com/administrator-guide/monitoring-and-metrics/enabling-nexus-remote-support.html) for your Qumulo cluster.
