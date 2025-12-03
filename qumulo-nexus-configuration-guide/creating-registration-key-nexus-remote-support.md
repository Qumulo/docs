---
title: "Enabling Nexus Remote Support for Qumulo Core"
summary: 'This section explains how to enable Nexus Remote Support for Qumulo Core by creating a registration key in Nexus and then registering the key by using the <code>qq</code> CLI.'
permalink: /qumulo-nexus-configuration-guide/enabling-nexus-remote-support.html
redirect-from:
  - /qumulo-nexus-configuration-guide/creating-registration-key-nexus-remote-support.html
sidebar: qumulo_nexus_configuration_guide_sidebar
---

## Prerequisites
* Administrative access to your organization's Nexus account

* TCP traffic on port 443 for the `api.nexus.qumulo.com` hostname to allow Nexus Monitoring and Nexus Remote Support connectivity


## Step 1: Create a Registration Key in Qumulo Nexus {#create-registration-key}
A registration key associates your Qumulo cluster with your Qumulo Nexus account. It works like a one-time password and it is valid for 14 days after being created.

{{site.data.alerts.important}}
<ul>
  <li>Nexus displays the registration key only once. Copy this key to secure location.</li>
  <li>If you misplace your key before enabling Nexus Remote Support or before it expires, in the <strong>Manage Registration Keys</strong> section, locate the key and then click <strong>Revoke</strong>. Next, create a new key.</li>
  <li>Revoking a registration key is a permanent action. However, you can create a new registration key at any time.</li>
</ul>
{{site.data.alerts.end}}

1. [Log in to Qumulo Nexus](https://nexus.qumulo.com/login).

1. In the upper-right corner, click your username and then click **User Settings**.

1. On the **User Settings** page, click **Registration Keys**.

1. Enter the **Key Name** to identify your registration key and then click **Create Key**.

1. In the **Registration Key Created** dialog box, click **Copy Key** and they click **Done**.

   Your registration key appears in the **Registered Keys** section, which shows the key's name, creation date, and expiration date.

   When you use the registration key to enable Nexus Remote Support, Nexus removes the key from this list.


## Step 2: Enable Nexus Remote Support by Using the qq CLI {#enable-nexus-remote-support}
When you enable Nexus Remote Support, Qumulo Core assigns the <code>qumulosupport:everyone</code> trustee to the <code>Qumulo-Support</code> RBAC role. This RBAC role determines the level of REST API access that Nexus gives to the Qumulo Care Team. For more information, see [the Qumulo-Support section in Managing Role-Based Access Control (RBAC) for Users and Groups](https://docs.qumulo.com/administrator-guide/authorization-qumulo-core/managing-role-based-access-control-rbac.html#qumulo-support).

Run the {% include qq.html command="set_monitoring_conf" %} with the `--nexus-enabled` flag and specify your registration key. For example:

```bash
qq set_monitoring_conf \
  --nexus-enabled
  --nexus-registration-key "1A2B3CDEF4"
```

{% capture disableNRS %}To disable Nexus Remote Support, run the {% include qq.html command="set_monitoring_conf" %} command with the `--nexus-disabled` flag.{% endcapture %}
{% include tip.html content=disableNRS %}
