---
title: "Managing File Access Permissions Using NFSv4.1 Access Control Lists (ACLs)"
summary: "This topic explains how you can use Qumulo Core's implementation of NFSv4.1 with access control lists (ACLs) and AUTH_SYS or AUTH_UNIX credentials."
permalink: /administrator-guide/protocols/nfsv4.1-auth-sys-acls.html
redirect_from:
  - /nfsv4.1-enabling-using.html
sidebar: administrator_guide_sidebar
keywords: nfs, nfs4.1, nfsv4.1, acl, access control list, auth_sys, auth_unix, auth, permissions, file access, file access permissions
---

NFSv4.1 lets you use access control lists (ACLs) to manage access permissions for files. The Qumulo Core implementation of NFSv4.1 supports ACLs using `AUTH_SYS` or `AUTH_UNIX` credentials. You can allow or deny various operations using the CLI tools in the `nfs-acl-tools` Linux package.

For more information about NFSv4.1, see [Enabling and Using NFSv4.1 on a Qumulo Cluster](/nfsv4.1-enabling-using.md).


## Using the NFSv4.1 CLI Commands to Manage ACLs
In most Linux distributions, the `nfs-acl-tools` package contains the NFSv4.1 commands that let you manage ACLs for files.

### Showing the ACL of a File
To show the ACL of a file, use the `nfs4_getfacl` command. In the following example, we create the file `my-file` and then show the ACL for it.

```bash
$ touch /mnt/qumulo/my-file
$ nfs4_getfacl /mnt/qumulo/my-file
A::1001:rwatTnNcy
A:g:1001:rwatTnNcy
A::EVERYONE@:rtncy
```
The entries in the access control list have four parts separated by colons. For a detailed description, see the [man page for `nfs4_acl`](https://linux.die.net/man/5/nfs4_acl) in the Linux Documentation.

1. The type of access control entry (ACE). In this example, all three ACEs are set to `A` (allow).

   {% include note.html content="Qumulo Core supports only `A` and `D` ACEs." %}

   * **A:** Allow
   * **D:** Deny
   * **U:** Audit
   * **L:** Alarm

1. Additional ACE flags. In this example, the second ACE has the flag `g` that shows that the ID in the following part represents a _group_ (rather than a user).


   {% include note.html content="Qumulo Core doesn't support The `S` and `F` flags." %}

1. Whom the ACE applies to. The available options are:

   * `AUTH_SYS` or `AUTH_UNIX`: A user authenticated at the client
   * `EVERYONE@`: Any user of the file system
   * `GID`: The GID of the file
   * `GROUP@`: The group owner of the file
   * `UID`: The UID of the file
   * `OWNER@`: The owner of the file

   {% include note.html content="Currently, Qumulo Core doesn't support Kerberos principals in ACLs." %}

1. The access types the ACE applies to. For example:

   * `r`: Read
   * `t`: Read attributes
   * `w`: Write

   The `nfs4_setfacl` command also lets you use the following shorthand:

   * `R`: Generic read
   * `W`: Generic write
   * `X`: Execute permissions

   For a detailed description, see the [man page for `nfs4_setfacl`](https://linux.die.net/man/1/nfs4_setfacl) in the Linux Documentation.

The ACL in this example corresponds the the `664` mode: The owner and group of the file are allowed to read and write, while others (`EVERYONE@`) are allowed to only read. To check the current mode, run the `stat` command, for example:

```bash
$ stat -c %a /mnt/qumulo/my-file
664
```

### Editing the ACL of a File
To edit the ACL of a file using the text editor specified in the `$EDITOR` environment variable, use the `nfs4_editfacl` (or `nfs4_setfacl -e`) command. For a detailed description, see the [man page for `nfs4_editfacl`](https://linux.die.net/man/1/nfs4_editfacl) and [`nfs4_setfacl`](https://linux.die.net/man/1/nfs4_setfacl) in the Linux Documentation.

### Setting the ACL of a File
To set the ACL of a file, you can use one of the following commands:

* **Add a Single ACE:** `nfs4_setfacl -a <ace>`
* **Set an Entire ACL:** `nfs4_setfacl -s <acl>`


## Using Special NFSv4.1 Identifiers
Qumulo supports three of the special identifiers that NFSv4.1 defines. These identifiers get the ACE to apply to:

* `EVERYONE@`: Any user of the file system
* `GROUP@`: The group owner of the file
* `OWNER@`: The owner of the file


## Managing NFSv4.1 Permissions with ACLs and POSIX-Style Modes
You can manage NFSv4.1 access permissions with ACLs, POSIX-style modes, or a combination of both.

* If you set an ACL on a file and then also set a mode on it, the restrictions that the mode espresses are also applied to the ACL. These restrictions change or remove ACEs that apply to the owner, group, or other users.

* If you use the `OWNER@` or `GROUP@` identifiers in an ACL that allows read, write, or execute permissions, the identifiers appear in the `owner` or `group` bits of the mode when you read the file’s mode.

{% include note.html content="Because the `EVERYONE@` identifier includes the owner and group of a file and the `other` bits of a mode don't apply to the owner or group, the permissions you grant to the `EVERYONE@` identifier are more broad than a mode's `other` bits." %}

## Using NFSv4.1 ACLs with SMB Access Control
NFSv4.1 ACLs are comparable with SMB access controls. In most cases, you can write and read using both protocols without issues.

Often, the identities in ACEs map to an NFS UID or GID. These mappings succeed when you:
* Connect your cluster to an Active Directory (AD) domain.
* Enable [RFC2307 (An Approach for Using LDAP as a Network Information Service)](https://datatracker.ietf.org/doc/html/rfc2307).
* Associate all NFS UIDs or GIDs with AD users or groups in your AD configuration.

Alternatively, you can configure UID or GID mappings for the cluster's local users or groups. When SMB ACLs refer to users or groups not mapped to a corresponding NFS UID or GID, the users or groups appear with the `NOBODY` UID (`65534`).

To discover which mappings your cluster can perform for a file, use the following CLI commands:

* `qq auth_expand_identity`: Find equivalent identities and full group membership for an `auth_id`
* `qq auth_find_identity`: Find all representations for an `auth_id`
* `qq fs_get_acl`: Get the ACL for a file or directory


## Changing File Owners
When you change the owner of a file, the ACEs that refer to the owner change to the new owner, for example:

```bash
$ nfs4_getfacl /mnt/qumulo/my-file
A::1001:rwatTnNcy
A:g:1001:rwatTnNcy
A::EVERYONE@:rtncy

$ sudo chown 1002 /mnt/qumulo/my_file

$ nfs4_getfacl /mnt/qumulo/my-file
A::1002:rwatTnNcy
A:g:1001:rwatTnNcy
A::EVERYONE@:rtncy
```

## Using Equivalent NFSv4.1 and Qumulo ACL Commands
The syntax for the `nfs4_setfacl` is command `<type>:<flags>:<principal>:<permissions>`, for example `A:fd:GROUP@:rwaDdxtTnNcCoy`. You can use equivalent NFS (`nfs4_setfacl`) and Qumulo (`qq fs_modify_acl`) CLI commands to set ACL permissions.

The following tables compare elements of NFS and Qumulo ACL permissions.

| NFSv4.1 ACL Type | Qumulo ACL Type |
| ---------------- | --------------- |
| `A`              | `Allowed`       |
| `D`              | `Denied`        |

| NFSv4.1 ACL Flag | Qumulo ACL Flag           |
| ---------------- | ------------------------- |
| `d`              | `Container inherit`       |
| `f`              | `Object inherit`          |

| NFSv4.1 Rights  | Qumulo Rights                                                     |
| --------------- | ----------------------------------------------------------------- |
| `a`             | `Extend file`                                                     |
| `c`             | `Read ACL`                                                        |
| `C`             | `Write ACL`                                                       |
| `d`             | `Delete`                                                          |
| `n`             | `Read EA`                                                         |
| `o`             | `Take Ownership`                                                  |
| `r`             | `Read contents`                                                   |
| `R`             | `Read`, `Synchronize`                                             |
| `t`             | `Read attr`                                                       |
| `T`             | `Write attr`                                                      |
| `w`             | `Write data`                                                      |
| `W`             | `Read ACL`, `Read attr`, `Synchronize`, `Write ACL`, `Write file` |
| `x`             | `Execute/Traverse`                                                |
| `X`             | `Execute/Traverse`, `Read ACL`, `Read attr`, `Synchronize`        |
| `y`             | `Synchronize`                                                     |

The following table gives examples of permissions and equivalent NFS and Qumulo CLI commands.

| Permissions                                                           | NFSv4.1 Command                                            | Qumulo Command                                                                                                                    |
| --------------------------------------------------------------------- | ---------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------- |
| Add Read Permission to File                                           | `nfs4_setfacl -a "A::OWNER@:R" myfile.ext`                 | `qq fs_modify_acl --path /myfile.ext add_entry -y Allowed -t "File Owner" -r Read`                                                |
| Add Read and Execute Permissions to File                              | `nfs4_setfacl -a "A::EVERYONE@:rtRX" myfile.ext`           | `qq fs_modify_acl --path /myfile.ext add_entry -y Allowed -t "EVERYONE" -r Execute/Traverse, Read`                                |
| Add Read, Write, and Execute Permissions to File                      | `nfs4_setfacl -a "A::GROUP@:rtwRWX" myfile.ext`            | `qq fs_modify_acl --path /myfile.ext add_entry -y Allowed -t "File Group Owner" -r Execute/Traverse, Read, Write ACL, Write file` |
| Add Full Access to File                                               | `nfs4_setfacl -a "A::GROUP@:rtwRWX" myfile.ext`            | `qq fs_modify_acl --path /myfile.ext add_entry -y Allowed -t "File Group Owner" -r Execute/Traverse, Read, Write ACL, Write file` |
| Remove Write and Execute Permission to File                           | `nfs4_setfacl -a "D::OWNER@:wx" myfile.ext`                | `qq fs_modify_acl --path /myfile.ext add_entry -y Denied -t "File Owner" -r Execute/Traverse, Write data`                         |
| Add Full Access to Group File and Directory Inheritances to Directory | `nfs4_setfacl -a "A:fd:GROUP@:rwaDdxtTnNcCoy" mydirectory` | `qq fs_modify_acl --path /mydirectory add_entry -y Allowed -t "File Group Owner" -r All -f 'Container inherit' 'Object inherit'`  |

## Working with Trustees and Access Control Entries (ACEs) in the NFSv4.1 ACL Editor on Linux
This section explains the different ways of working with trustees and ACEs in the NFSv4.1 editor (`nfs4_acl`) on Linux.

After Qumulo Core joins a cluster to an AD domain, you can store the ACEs of your ACLs in a file with the `trustee` field set to an AD user or group. For ACEs in such cases, the cluster displays the trustee in the `sAMAccountName@domain` format when you retrieve it by using the `nfs_getfacl` or `nfs4_editfacl` command.

When you set ACEs in your ACL by using this format and the `nfs4_setfacl` and `nfs4_editfacl` commands, Qumulo Core stores the AD trustee on disk, in the ACE of your ACL.

Alternatively, you can set trustees for ACEs of ACLs by using a UID or GID. In this case, the system stores the UID or GID on disk, also in the ACE of the ACL.

{% include note.html content="This behavior affects only the ACL Editor on Linux and doesn't affect other Linux commands such as `ls -l`, `chown`, `stat`, and so on." %}
