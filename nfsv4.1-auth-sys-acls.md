---
title: Managing File Access Permissions Using NFSv4.1 Access Control Lists (ACLs)
permalink: nfsv4.1-auth-sys-acls.html
tags:
  - nfs
  - nfs4.1
  - acl
  - access_control_list
  - auth_sys
  - auth
  - permissions
  - file_access
  - file_access_permissions
sidebar: administrator_guide_sidebar
---

# Managing File Access Permissions Using NFSv4.1 Access Control Lists (ACLs)
NFSv4.1 lets you use access control lists (ACLs) to manage access permissions for files. The Qumulo Core implementation of NFSv4.1 supports ACLs using `AUTH_SYS` credentials. You can allow or deny various operations using the CLI tools in the `nfs-acl-tools` Linux package.

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

   **Note:** Qumulo Core supports only `A` and `D` ACEs.

   * **A:** Allow
   * **D:** Deny
   * **U:** Audit
   * **L:** Alarm

1. Additional ACE flags. In this example, the second ACE has the flag `g` that shows that the ID in the following part represents a _group_ (rather than a user).

   **Note:** Qumulo Core doesn't support The `S` and `F` flags.

1. Whom the ACE applies to. The available options are:

   * `AUTH_SYS`: A user authenticated at the client
   * `EVERYONE@`: Any user of the file system
   * `GID`: The GID of the file
   * `GROUP@`: The group owner of the file
   * `UID`: The UID of the file
   * `OWNER@`: The owner of the file

   **Note:** Currently, Qumulo Core doesn't support Kerberos principals in ACLs.

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

**Note:** Because the `EVERYONE@` identifier includes the owner and group of a file and the `other` bits of a mode don't apply to the owner or group, the permissions you grant to the `EVERYONE@` identifier are more broad than a mode's `other` bits.

## Using NFSv4.1 ACLs with SMB Access Control
NFSv4.1 ACLs are comparable with SMB access controls. In most cases, you can write and read using both protocols without issues.

Often, the identities in ACEs map to an NFS UID or GID. These mappings succeed when you:
* Connect your cluster to an Active Directory (AD) domain.
* Enable [RFC2307 (An Approach for Using LDAP as a Network Information Service)](https://datatracker.ietf.org/doc/html/rfc2307).
* Associate all NFS UIDs or GIDs with AD users or groups in your AD configuration.
* Configure UID or GID mappings for the cluster's local users or groups.

When SMB ACLs refer to users or groups not mapped to a corresponding NFS UID or GID, the users or groups appear with the `nobody` UID (`65534`).

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
