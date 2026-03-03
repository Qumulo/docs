---
title: "Enabling Nexus Remote Support and Nexus Remote Management for Qumulo Core"
summary: "This section explains how to create a registration key and register your Qumulo cluster from Nexus and how to enable Nexus Remote Support and Nexus Management by using the <code>qq</code> CLI."
permalink: /qumulo-nexus-configuration-guide/monitoring-and-metrics/enabling-nexus-remote-support-and-remote-management.html
redirect_from:
  - /qumulo-nexus-configuration-guide/creating-registration-key-nexus-remote-support.html
sidebar: qumulo_nexus_configuration_guide_sidebar
---

Qumulo Nexus includes two remote access components:

{% capture nexusRemoteSupport %}For clusters that run Qumulo Core 7.7.0 (and higher), Nexus Remote Support lets the Qumulo Care Team access your cluster and work on it remotely.{% endcapture %}
{% capture nexusRemoteManagement %}For clusters that run Qumulo Core 7.7.3 (and higher), Nexus Remote Management lets users in your organization with single sign-on (SSO) manage your cluster from Nexus.{% endcapture %}

* {{ nexusRemoteSupport }}
* {{ nexusRemoteManagement }}

{% capture strongRec %}To let the Qumulo Care Team provide fast support when you need it most, we strongly recommend enabling both Nexus Remote Support and Nexus Remote Management.{% endcapture %}
{% include important.html content=strongRec %}

## Prerequisites
* Administrative access to your organization's Nexus account

* TCP traffic on port 443 for the `api.nexus.qumulo.com` hostname to allow Nexus connectivity

* <a id="nexus-remote-management-prerequisites"></a>For Nexus Remote Management:

  * A configured identity provider (IdP) and enabled SSO for Nexus

    {% include tip.html content="For more information, see the [storage administrator workflow](../authentication/enabling-sso-with-idp-storage-administrator-workflow.html) or the [system administrator workflow](../authentication/enabling-sso-with-idp-system-administrator-workflow.html)." %}

  * A Qumulo cluster [joined to Active Directory (AD)](https://docs.qumulo.com/administrator-guide/authentication-qumulo-core/configuring-ad.html)

  * Users configured in your IdP with the following [roles in Nexus](../authorization/managing-user-access.html#how-user-roles-work-in-qumulo-nexus):

    * `View` or `Admin`

    * `Cluster API Access`

  * Users who log in to Nexus by using the IdP [resolve to AD users](../authentication/enabling-sso-with-idp-system-administrator-workflow.html#configure-identity-provider).

    {% include note.html content="The resolved AD user must have appropriate [RBAC roles assigned in Qumulo Core](https://docs.qumulo.com/administrator-guide/authorization-qumulo-core/managing-role-based-access-control-rbac.html)." %} 


## Step 1: Create a Registration Key in Qumulo Nexus
A registration key associates your Qumulo cluster with your Qumulo Nexus account. It works like a one-time password and is valid for 14 days after being created.

{{site.data.alerts.important}}
<ul>
  <li>Nexus displays the registration key only once. Copy this key to a secure location.</li>
  <li>
    If you misplace your key before registering your cluster or before it expires:
    <ol>
      <li>In the <strong>Manage Registration Keys</strong> section, locate the key, and then click <strong>Revoke</strong>.</li>
      <li>Create a new key.</li>
    </ol>
  </li>
  <li>Revoking a registration key is a permanent action. However, you can create a new registration key at any time.</li>
</ul>
{{site.data.alerts.end}}

1. [Log in to Qumulo Nexus](https://nexus.qumulo.com/login).

1. In the upper-right corner, click your username and then click **User Settings**.

1. On the **User Settings** page, click **Registration Keys**.

1. Enter the **Key Name** to identify your registration key and then click **Create Key**.

1. In the **Registration Key Created** dialog box, click **Copy Key** and then click **Done**.

   Your registration key appears in the **Registered Keys** section, which shows the key's name, creation date, and expiration date.

When you use the registration key to register your cluster with Nexus, Nexus removes the key from this the <strong>Registered Keys</strong> list.


## Step 2: Register Your Cluster with Nexus
Run the {% include qq.html command="nexus_set_registration" %} command with the `--join-key` flag and specify your registration key. For example:

```bash
qq nexus_set_registration \
  --join-key "1A2B3CDEF4"
```


## Step 3: Enable Nexus Remote Support and Nexus Remote Management
{% include important.html content=strongRec %}

### To Enable Nexus Remote Support
{{ nexusRemoteSupport }}

Run the {% include qq.html command="nexus_set_config" %} command with the `--enable` and `--enable-remote-support` flags. For example:

```bash
qq nexus_set_config \
  --enable \
  --enable-remote-support
```

When you enable Nexus Remote Support, Qumulo Core assigns the <code>qumulosupport:everyone</code> trustee to the <code>Qumulo-Support</code> RBAC role. This RBAC role determines the level of REST API access that Nexus gives to the Qumulo Care Team. For more information, see [the Qumulo-Support section in Managing Role-Based Access Control (RBAC) for Users and Groups](https://docs.qumulo.com/administrator-guide/authorization-qumulo-core/managing-role-based-access-control-rbac.html#qumulo-support).

### To Enable Nexus Remote Management {#enable-nexus-remote-management}
{{ nexusRemoteManagement }}

{% include important.html content="Before you begin, review the [Nexus Remote Management Prerequisites](#nexus-remote-management-prerequisites)." %}

Run the {% include qq.html command="nexus_set_config" %} command with the `--enable` and `--enable-sso` flags. For example:

```bash
qq nexus_set_config \
  --enable \
  --enable-sso
```

## Disabling Nexus Functionality
* To unregister your cluster, run the {% include qq.html command="nexus_set_registration" %} command with the `--delete` flag.

* To disable Nexus Remote Support, run the {% include qq.html command="nexus_set_config" %} command with the `--disable-remote-support` flag.

* To disable Nexus Remote Management, run the {% include qq.html command="nexus_set_config" %} command with the `--disable-sso` flag.

* To disable all Nexus functionality, run the {% include qq.html command="nexus_set_config" %} command with the `--disable` flag.
