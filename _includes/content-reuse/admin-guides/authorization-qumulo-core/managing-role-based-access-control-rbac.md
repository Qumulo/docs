To share management responsibilities with others, you can grant specific privileges to a user or group&mdash;locally or through Active Directory&mdash;by using role-based access control (RBAC).

{{site.data.alerts.important}}
<ul>
  <li>For changes to take effect, a user account with newly assigned roles must log out of Qumulo Core and then log back in (or its sessions must time out).</li>
  <li>Because certain privileges (such as replication-write privileges) can overwrite or move data to a location where a user has greater permissions, use special care when you grant privileges to roles and users.</li>
</ul>
{{site.data.alerts.end}}

## Role Types in Qumulo Core
This section explains the Administrators, Data-Administrators Observers, and Custom role types in Qumulo Core.

### Attributes of the Administrators Role
{% include note.html content="Only the default administrator account can access a Qumulo cluster by using SSH." %}

This role is suitable for system administrators. Users with this role have full access to, and control of, the cluster, including:

* Configuration and management of general cluster settings for audit logging, snapshots, replication, quotas, and so on by using the Qumulo Core Web UI, REST API, or `qq` CLI
* Creation of files and directories in any current and future directories
* Reading of any files and file attributes and listing of any directories in any current and future directories
* Deletion or renaming of any files and directories in any current and future directories
* Changing of ownership and permissions for any files and directories in any current and future directories

### Attributes of the Data-Administrators Role
This role is suitable for Qumulo Core REST API and `qq` CLI users who don't have access to the Qumulo Core Web UI but have the same file privileges as those of the Administrators role, including:

* Read and write permissions for all NFS, SMB, quota, and snapshot API calls
* Read-only permissions for local API users
* Access to analytics and file system
