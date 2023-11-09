---
title: "Managing Cross-Protocol Permissions (XPP) in Qumulo Core"
summary: "This section explains how Cross-Protocol Permissions (XPP) work in Qumulo Core and how to enable, disable, and check the status of XPP by using the <code>qq</code> CLI."
permalink: /administrator-guide/authorization-qumulo-core/managing-cross-protocol-permissions-xpp.html
sidebar: administrator_guide_sidebar
keywords: cross_protocol_permissions, cross_protocol, protocol_permissions, protocol, permissions, xpp
---

## How Cross-Protocol Permissions (XPP) Work in Qumulo Core
Qumulo Core works with clients that use multiple protocols, such as [SMB](../smb/) and [NFS](../nfs/). While SMB and NFS permission models are interoperable at a basic level, SMB offers a complex permission definition which isn't fully compatible with NFS. For this reason, it is necessary to "translate" between the two protocols when clients access the same files and directories over SMB and NFS.

XPP enables mixed SMB and NFS protocol workflows by preserving SMB access control lists, by maintaining permission inheritance, and by reducing application permission incompatibility.

When there are no cross-protocol interactions, Qumulo Core operates according to precise protocol specifications. When protocol conflicts arise, XPP minimizes the possibility of application incompatibility.

{{site.data.alerts.important}}
<ul>
  <li>XPP doesn't break compatibility with previous Qumulo Core releases.</li>
  <li>Enabling XPP doesn't change the rights on <em>existing</em> files in your file system. Changes take place only <em>after</em> you enable XPP.</li>
</ul>
{{site.data.alerts.end}}

For more information, see the following resources:

* [Qumulo Core Permission Modes](https://care.qumulo.com/hc/en-us/articles/360020318054)
* [Cross-Protocol Permissions (XPP) in Common Scenarios](https://care.qumulo.com/hc/en-us/articles/360020324014)
* [Cross-Protocol Permissions Test Drive Website](https://sites.google.com/qumulo.com/xpp-test-drive).

### Common Workflow Scenarios for Working with Cross-Protocol Permissions (XPP)
This section gives examples of common workflow scenarios and explains how Qumulo Core functions when you enable XPP in these scenarios.

* **Single-Protocol Workflows (Only SMB or NFS):** Qumulo Core operates as expected, according to original protocol specifications.

* **Mixed-Protocol Workflows (Mostly Windows or SMB):** Qumulo Core operates as expected, with the following exceptions:

  * Because running the `chmod` command on a directory doesn't affect the ACL that the directory's children inherit, the command doesn't break the permission inheritance.
    
  * To preserve compatibility, the `chmod` command retains the ability to strip rights from privileged groups and to override the inherited rights for individual files.

* **Mixed-Protocol Workflows (Mostly NFS)** Qumulo core operates as expected, with one exception: To preserve compatibility, Qumulo Core permits SMB clients to add access control entries (ACEs) to files and directories
 
{% include note.html content="XPP reveals permissions that Native Permissions Mode hides. This can trigger security checks from `ssh` and `sshd` commands. If you use `ssh` to access NFS home directories, see [Using SSH with Cross-Protocol Permissions](https://care.qumulo.com/hc/en-us/articles/360022920274) for more information." %}


## To Manage Cross-Protocol Permissions (XPP)
Qumulo Core enables and disables XPP immediately, without scanning the directory tree. Existing file and directory permissions remain unaffected unless&mdash;or until&mdash;your workflow modifies them.

* To enable XPP, run the `qq fs_set_permissions_settings cross_protocol` command.

  {% include tip.html content="We recommend creating a snapshot before enabling XPP in a production environment." %}

* To disable XPP, run the `qq fs_set_permissions_settings native` command.

* To check the current permissions mode, run the `qq fs_get_permissions_settings` command.


## Troubleshooting the Permissions for a File or Directory
Explain Permissions Tools is a suite of diagnostic utilities that examines a file or directory and explains how the permissions for the file or directory were devised. For more information, see [Cross-Protocol (XPP) Explain Permissions Tools](https://care.qumulo.com/hc/en-us/articles/360019923994-Cross-Protocol-Explain-Permissions-Tools) on Qumulo Care.
