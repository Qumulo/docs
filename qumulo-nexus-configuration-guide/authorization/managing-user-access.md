---
title: "Managing User Access in Qumulo Nexus"
summary: "This section explains how to manage users and user access by assigning preconfigured user roles in Qumulo Nexus."
permalink: /qumulo-nexus-configuration-guide/authorization/managing-user-access.html
sidebar: qumulo_nexus_configuration_guide_sidebar
---

## How User Roles Work in Qumulo Nexus {#how-user-roles-work-in-qumulo-nexus}
Nexus roles are preconfigured for specific user tasks in your Nexus organization.

{% include note.html content="You can assign multiple roles to a single user. The permissions granted by these roles are cumulative." %}

* **View:** Read-only access for viewing cluster information, analytics, and data flow

* **Admin:** Full administrative access to cluster operations, including managing users and the organization

* **Cluster API Access:** For users with [configured SSO](../authentication/index.html) and [role-based access control (RBAC) configured for the Qumulo cluster](https://docs.qumulo.com/administrator-guide/authorization-qumulo-core/managing-role-based-access-control-rbac.html), access to [Nexus Remote Management](../monitoring-and-metrics/enabling-nexus-remote-support-and-remote-management.html#enable-nexus-remote-management)

  {{site.data.alerts.important}}
  To be able to work with <a href="../monitoring-and-metrics/enabling-nexus-remote-support-and-remote-management.html">Nexus Remote Management</a>:
  <ul>
    <li>SSO users must have the Cluster API Access role and either the <code>View</code> or <code>Admin</code> role assigned.</li>
    <li>The user's email address in Nexus and Active Directory (AD) for the Qumulo cluster must match. The AD user must also have RBAC configured in Qumulo Core</a>.</li>
  </ul>
  {{site.data.alerts.end}}

* **Cluster Management Admin:** Full ability to create and destroy only Qumulo clusters created by using Nexus

## Assigning Roles to Nexus Users
This section explains how to view existing Nexus users, add a Nexus user, and remove a Nexus user.

### Prerequisites
* Administrative access to your organization's Nexus account

* Single sign-on (SSO) configured by your organization's [storage administrator](../authentication/enabling-sso-with-idp-storage-administrator-workflow.html) or [system administrator](../authentication/enabling-sso-with-idp-system-administrator-workflow.html)

### To List Existing Users
1. [Log in to Qumulo Nexus](https://nexus.qumulo.com/login).

1. In the upper-right corner, click your username and then click **Organization Settings**.

1. On your organization's page, click **Users**

   The **Users** page lists the users in your Nexus organization and the **Full Name**, **Email Address**, and **Role** for each user.

1. To show the roles for a user, click **&vellip; > View User**.

   The **View User Details** lists the user's full name, email address, and **Applied Roles**.

### To Add a Nexus User
1. [Log in to Qumulo Nexus](https://nexus.qumulo.com/login).

1. In the upper-right corner, click your username and then click **Organization Settings**.

1. On the **Users** page, click **Add Users**.

1. In the **Add Users** side panel, for **Email Address**, enter one or more email addresses.

   {% include tip.html content="Separate multiple email addresses with commas (`,`)." %}

1. (Optional) For SSO users, leave **Do not add as SSO user** unchecked.

1. Under **Roles**, click **&#8964;** and then select one or more [user roles](#how-user-roles-work-in-qumulo-nexus).

1. Click **Save**.

The **Users** page lists the added users.

### To Assign a Nexus Role to a User
1. [Log in to Qumulo Nexus](https://nexus.qumulo.com/login).

1. In the upper-right corner, click your username and then click **Organization Settings**.

1. On the **Users** page, next to a user's name, click **&vellip; > Edit User**.

1. In the **Edit User** dialog box, take the following steps:

   1. (Optional) Update the user's **First Name** or **Last Name**.

   1. To add a role, under **Roles** click **&#8964;** and then select one or more [user roles](#how-user-roles-work-in-qumulo-nexus).

   1. To remove a role, under **Roles** click **&times;** next to a role

   1. Click **Save**.

The **Users** page lists the **Role** assigned to the user.

### To Remove a User
{{site.data.alerts.important}}
<ul>
  <li>Removing a user from your identity provider (IdP) doesn't revoke user access immediately because existing sessions and access tokens remain active until they expire.</li>
  <li>To revoke user access immediately, you must remove the user directly from Nexus.</li> 
</ul>
{{site.data.alerts.end}}

1. [Log in to Qumulo Nexus](https://nexus.qumulo.com/login).

1. In the upper-right corner, click your username and then click **Organization Settings**.

1. On the **Users** page, next to a user's name, click **&vellip; > Remove User**.

1. Click **Remove user**.

1. In the **Remove &lt;Username&gt;** dialog box, click **Remove**.

The user is removed from the **Users** page.


## Next Steps
After you configure users and assign roles to them in Nexus, you can [enable Nexus Remote Support and Nexus Management](../monitoring-and-metrics/enabling-nexus-remote-support-and-remote-management.html) for your Qumulo clusters.
