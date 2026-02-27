## How Cross-Protocol Permissions (XPP) Work in Qumulo Core
Qumulo Core works with clients that use multiple protocols, such as [SMB](../smb/) and [NFS](../nfs/). While SMB and NFS permission models are interoperable at a basic level, SMB offers a complex permission definition which isn't fully compatible with NFS. For this reason, it is necessary to "translate" between the two protocols when clients access the same files and directories over SMB and NFS.

XPP enables mixed SMB and NFS protocol workflows by preserving SMB access control lists, by maintaining permission inheritance, and by reducing application permission incompatibility.

When there are no cross-protocol interactions, Qumulo Core operates according to precise protocol specifications. When protocol conflicts arise, XPP minimizes the possibility of application incompatibility.

{{site.data.alerts.important}}
<ul>
  <li>XPP doesn't break compatibility with previous Qumulo Core releases.</li>
  <li>Changing permissions mode doesn't change the rights for existing files in your file system. These changes take place during future operations that modify file permissions.</li>
</ul>
{{site.data.alerts.end}}

For more information, see the following resources:

* [Qumulo Core Permission Modes](https://care.qumulo.com/hc/en-us/articles/360020318054)
* [Cross-Protocol Permissions (XPP) in Common Scenarios](https://care.qumulo.com/s/article/Cross-Protocol-Permissions-XPP-in-Common-Scenarios)
* [Cross-Protocol Permissions Test Drive Website](https://sites.google.com/qumulo.com/xpp-test-drive).

### Common Workflow Scenarios for Working with Cross-Protocol Permissions (XPP)
This section gives examples of common workflow scenarios and explains how Qumulo Core functions when you enable XPP in these scenarios.

* **Single-Protocol Workflows (Only SMB or NFS):** Qumulo Core operates as expected, according to original protocol specifications.

* **Mixed-Protocol Workflows (Mostly Windows or SMB):** Qumulo Core operates as expected, with the following exceptions:

  * Because running the `chmod` command on a directory doesn't affect the ACL that the directory's children inherit, the command doesn't break the permission inheritance.
    
  * To preserve compatibility, the `chmod` command retains the ability to strip rights from privileged groups and to override the inherited rights for individual files.

* **Mixed-Protocol Workflows (Mostly NFS)** Qumulo core operates as expected, with one exception: To preserve compatibility, Qumulo Core permits SMB clients to add access control entries (ACEs) to files and directories
 

## To Manage Cross-Protocol Permissions (XPP)
XPP is enabled on new Qumulo clusters by default.

{{site.data.alerts.important}}
<ul>
  <li>When you disable or enable XPP, the change takes effect immediately, without Qumulo Core scanning the directory tree. Existing file and directory permissions remain unaffected unless&mdash;or until&mdash;your workflow modifies them.</li>
  <li>It is important to remember that the <code>native</code> sub-command is a simple means of handling mixed protocol permissions by keping the most recent change to a file's or directory's permissions. While this is sufficient for most scenarios that don't require cross-protocol use, disabling XPP can cause issues to occur for mixed-protocol workloads when POSIX-mode bits can replace SMB access control lists (ACLs), or the other way around.</li>
  <li>Before enabling XPP in a production environment, we recommend <a href="../snapshots/managing-snapshots.html">create a snapshot</a> of your file system.</li>
</ul>
{{site.data.alerts.end}}

* To disable XPP, run the {% include qq.html command="fs_set_permissions_settings" %} `native` command.

* To enable XPP, run the {% include qq.html command="fs_set_permissions_settings" %} `cross_protocol` command.

* To check the current permissions mode, run the {% include qq.html command="fs_get_permissions_settings" %} command.


## Best Practices for Using SSH with Cross-Protocol Permissions (XPP) Mode
{{site.data.alerts.important}}
XPP Mode can "reveal" the permissions that Native Permission Mode "hides" by translating the access control entry (ACE) rights for users or groups that aren't the file or group owners to the <code>Others</code> POSIX-mode bits, which:

<ul>
  <li>Helps avoid potential interoperability issues with POSIX applications that might misbehave if XPP Mode <em>appears</em> to deny access (which is actually permitted)</li>
  <li>Ensures that XPP doesn't provide a false sense of security by accurately reflecting actual access rights in the <code>Others</code> POSIX mode bits</li>
</ul>

This behavior can trigger security checks from SSH or SSHD when you attempt to access NFSv4.1 home directories.
{{site.data.alerts.end}}

* **Ensure that the access control list (ACL) grants access only to its owner:** Private keys (for example, `$HOME/.ssh/id_rsa`) must not be accessible to any principal other than the owner (their permissions must not be higher than `600`).

* **Ensure that the `authorized_keys` file and its parent directories are writable only by their owner:** Choose one of the following guidelines based on your organization's requirements.

  * Ensure that the ACLs for `$HOME`, `$HOME/.ssh`, and `$HOME/.ssh/authorized_keys` don't grant write permissions to anyone other than the owner.
    
  * If anyone other than the owner of user home directories must be able to modify the directories, move the `authorized_keys` file to a location that can be secured according to OpenSSH requirements by setting the value of the `AuthorizedKeys` configuration option to the path to the `authorized_keys` file in the `/etc/ssh/sshd_config` file on every SSH server.

  * If anyone other than the owner of the `authorized_keys` file must be able to modify the file, disable the security check by setting the `StrictModes` configuration option to `no` in the `/etc/ssh/sshd_config` file on every SSH server.

    {% include caution.html content="Disabling the `StrictModes` configuration option disables OpenSSH permission checks entirely, for _all_ of the files that it checks." %}


## Troubleshooting the Permissions for a File or Directory
Explain Permissions Tools is a suite of diagnostic utilities that examines a file or directory and explains the structure of permissions for the file or directory. For more information, see the following sections in the {{site.guides.cli}}:

* {% include qq.html command="fs_acl_explain_chmod" %}

* {% include qq.html command="fs_acl_explain_posix_mode" %}

* {% include qq.html command="fs_acl_explain_rights" %}

{% include note.html content="If an inheritable ACL is set on home directories, it will generally be necessary to fix permissions on new private key files before they are usable." %}
