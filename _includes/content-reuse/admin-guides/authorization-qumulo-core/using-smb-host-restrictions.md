Depending on the configuration of your Qumulo clustr, you can grant full access, read-only access, or deny access. It is also possible to configure a Qumulo cluster to prevent shares that a client can't access from being enumerated.

{% include important.html content="Because host restrictions interact with user or group share permissions and file permissions on a _least privilege_ basis, in order for Qumulo Core to grant a privilege for a particular file, the file's permissions, the share's user permissions, and the share's host permissions must _all_ permit the privilege." %}

Host restrictions apply in the order in which you write them, from top to bottom. For example, if you deny a privilege to a host at the beginning of the permission list, and a later entry allows the same privilege to the same host, Qumulo Core doesn't grant the privilege.

## To Manage SMB Host Restrictions by Using the qq CLI
For information about viewing, modifying, nd removing host restrictions and hiding SMB shares from unauthorized hosts by using the `qq` CLI, see the following sections in the {{site.guides.cli}}:

* [`qq smb_a

* {% include qq.html command="auth_assign_role" %}
* {% include qq.html command="auth_create_role" %}
* {% include qq.html command="auth_list_privileges" %}
* {% include qq.html command="auth_modify_role" %}
* {% include qq.html command="auth_unassign_role" %}
