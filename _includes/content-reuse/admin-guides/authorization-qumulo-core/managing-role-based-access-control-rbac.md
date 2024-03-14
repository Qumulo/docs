To share management responsibilities with others, you can grant specific privileges to a user or group&mdash;locally or through Active Directory&mdash;by using RBAC.

<a id="custom-roles"></a>

{{site.data.alerts.important}}
<ul>
  <li>For changes to take effect, a user account with newly assigned roles must log out of Qumulo Core and then log back in (or its sessions must time out).</li>
  <li>Because certain privileges (such as replication-write privileges) can overwrite or move data to a location where a user has greater (or total) permissions, use special care when you grant privileges to roles and users.</li>
</ul>
{{site.data.alerts.end}}

## Qumulo Core Role Types
This section explains the Administrators, Data-Administrators, Observers, and Custom role types in Qumulo Core.

### Administrators
{% include note.html content="Only the default administrator account can access a Qumulo cluster by using SSH." %}

This role is suitable for system administrators. Users with this role have full access to, and control of, the cluster, including:

* Configuration and management of general cluster settings for audit logging, snapshots, replication, quotas, and so on by using the Qumulo Core Web UI, REST API, or `qq` CLI
* Creation of files and directories in any current and future directories
* Reading of any files and file attributes and listing of any directories in any current and future directories
* Deletion or renaming of any files and directories in any current and future directories
* Changing of ownership and permissions for any files and directories in any current and future directories

### Data-Administrators
This role is suitable for Qumulo Core REST API and `qq` CLI users who don't have access to the Qumulo Core Web UI but have the same file privileges as those of the Administrators role, including:

* Read and write permissions for all NFS, SMB, quota, and snapshot APIs
* Read-only permissions for local API users
* Access to analytics and file system

### Observers
This role is suitable for users or groups who can access the Qumulo Core Web UI and read-only APIs (with the exception of debug APIs and authentication settings).

{{site.data.alerts.note}}
<ul>
  <li>Clusters that run Qumulo Core 3.0.5 (and higher) don't assign the Observers role automatically and non-administrative users don't have access to the Qumulo Core Web UI or read-only APIs (unless you explicitly assign the necessary role to specific usernames).</li>
  <li>It is possible to assign both Data-Administrators and Observers roles to a single user. This can give the user the ability to manage data on your Qumulo cluster by using the Qumulo Core Web UI without full administrative access.</li>
</ul>
{{site.data.alerts.end}}

### Custom
For information about managing RBAC and creating custom rols by using the `qq` CLI, see the following sections in the {{site.guides.cli}}:

* [`qq auth_assign_role`](https://docs.qumulo.com/qq-cli-command-guide/auth/auth_assign_role.html)
* [`qq auth_create_role`](https://docs.qumulo.com/qq-cli-command-guide/auth/auth_create_role.html)
* [`qq auth_list_privileges`](https://docs.qumulo.com/qq-cli-command-guide/auth/auth_list_privileges.html)
* [`qq auth_modify_role`](https://docs.qumulo.com/qq-cli-command-guide/auth/auth_modify_role.html)
* [`qq auth_unassign_role`](https://docs.qumulo.com/qq-cli-command-guide/auth/auth_unassign_role.html)


## Managing Roles by Using the Qumulo Core Web UI
This section explains how to add a member to, and remove a member from, an existing Qumulo Core role and how to create and edit a custom role.

### To Add a Member to an Existing Qumulo Core Role
1. {{site.logIntoWebUI}}

1. Click **Cluster > Role Management**.

1. On the **Role Management** page, next to the role to assign, click **Add Member**.

1. In the **Add Member to <Role Type>** dialog box, enter the **Trustee** and then click **Yes, Add Member**.

   {% capture validExamples %}For examples of valid trustees, click {% include shared_inline_image.html alt="Question Mark" file="shared-images/admin-guides/question-mark.png" max-width="40" %}.{% endcapture %}
   {% include tip.html content=validExamples %}
   
1. Click **Yes, Assign Role**.

### To Remove a Member from an Existing Qumulo Core Role
1. {{site.logIntoWebUI}}

1. Click **Cluster > Role Management**.

1. On the **Role Management** page, next to the user or group to remove from a role, click {% include shared_inline_image.html alt="Delete" file="shared-images/admin-guides/edit-large.png" max-width="40" %}.

### To Create a Custom Qumulo Core Role
1. {{site.logIntoWebUI}}

1. Click **Cluster > Role Management**.

1. On the **Role Management** page, on the the upper-right side, click **Create Role**.

1. On the **Create Role** page, do the following:

   1. Enter a **Name** and **Description**.

   1. Select the privileges to add to the role and click **Save**.

### To Edit a Custom Qumulo Core Role
1. {{site.logIntoWebUI}}

1. Click **Cluster > Role Management**.

1. On the **Cluster Management** page, next to the role to edit, click {% include shared_inline_image.html alt="Edit" file="shared-images/admin-guides/pencil.png" max-width="40" %}.

1. On the **Edit <Role Name>** page, select the privileges to include in the role and click **Save**.
