---
title: "Creating an Instance Registration Key for Qumulo Nexus Remote Support"
summary: "This section explains how to create a key that lets you register your Qumulo cluster with Nexus to provide access to the Qumulo Care Team."
permalink: /qumulo-nexus-configuration-guide/creating-instance-registration-key.html
sidebar: qumulo_nexus_configuration_guide_sidebar
search: exclude
varRegKey: The registration key value is displayed only once when you create it. You must copy and store the key securely before closing the creation dialog. If you lose the key before using it, you may revoke it and generate a new one.
---

To register your Qumulo cluster with Nexus, you must first generate an registration key from the Qumulo Nexus portal. This one-time password securely associates your cluster with your Nexus account.

## Prerequisites
To generate a registration key:

* You must have access to <a target="_blank" href="https://nexus.qumulo.com">Qumulo Nexus</a>

* You must have a Nexus user account with appropriate permissions


## How Registration Keys Work
An _registration key_ is a one-time password that you use to register your Qumulo cluster with Nexus.

{% capture regKey %}{{ page.varRegKey }}{% endcapture %}
{% include important.html content=page.varRegKey %}

When you generate a registration key:

* The key is valid for 14 days from creation

* The key can only be used once

* After you use the key to register a cluster, the key is automatically removed from your active key list


## Generating a Registration Key
You can generate registration keys from the <a target="_blank" href="https://nexus.qumulo.com">Qumulo Nexus</a> user settings.

{% include important.html content=page.varRegKey %}

### To Generate a Registration Key
1. Log in to the Qumulo Nexus portal. 

1. Navigate to **User Settings**.

   {% include tip.html content="You can access User Settings by clicking your username in the upper-right corner of the Nexus portal." %}

1. Click the **Registration Keys** tab.

1. In the **Name** field, enter a descriptive name for the registration key.

   {% include note.html content="The description is solely to help identify the key later. It is visible in the active key list." %}

1. Click **Create**.

1. In the **Registration Key Created** dialog, copy the value.

   {% include important.html content="This is your only opportunity to view the key." %}

1. Click **Done** to close the dialog.


## Managing Active Registration Keys
After you create a registration key, it appears in the **Manage Registration Keys** section on the **Registration Keys** tab. The list shows:

* The name you provided when creating each key

* The creation date

* The expiration date

{% include note.html content="Once a registration key is used to register a cluster, it automatically disappears from the list." %}

### To Revoke an Unused Registration Key
If you need to revoke a registration key before it is used or expires:

1. Log in to the Qumulo Nexus portal.

1. Navigate to **User Settings > Registration Keys**.

1. In the **Manage Registration Keys** section, locate the key you want to revoke.

1. Click **Revoke** next to the key.

{% include important.html content="After you revoke a registration key, it cannot be used to register a cluster. This action cannot be undone." %}


## Next Steps
After generating an registration key, you can use it to enable Nexus Remote Support on your Qumulo cluster. For more information, see:

* [Enabling Nexus Remote Support](../administrator-guide/monitoring-and-metrics/enabling-nexus-remote-support.html)

