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
NFSv4 provides access control lists (ACLs) to manage access permissions for files. Qumulo’s early access NFSv4 supports ACLs using AUTH_SYS credentials.  You can allow/deny a variety of different operations using the `nfs4_editfacl` utility (or `nfs4_setfacl`). For more information about NFSv4.1, see [Enabling and Using NFSv4.1 on a Qumulo Cluster](/nfsv4.1-enabling-using.md).

## nfs4_set/get/editfacl tools and examples
`nfs4_getfacl`, `nfs4_editfacl`, and `nfs4_setfacl` can be found in the package `nfs4-acl-tools` on
most Linux distributions.  `nfs4_getfacl` can show the current ACL of a file:

```bash
$ touch /mnt/qumulo/foo
$ nfs4_getfacl /mnt/qumulo/foo
A::1001:rwatTnNcy
A:g:1001:rwatTnNcy
A::EVERYONE@:rtncy
```

The entries in the access control list are given in four parts, separated by colons (a thorough
description of the format and allowed flags can be found in man `nfs4_acl`.)
 - The type of the ACE. One letter representing whether the ACE is **A**llow, **D**eny, a**U**dit or
   a**L**arm. Only Allow and Deny ACEs are supported.
 - Additional flags on the ACE. In the example’s second ACE, the g flag indicates that the ID in the
   following part represents a group rather than a user. The `S` and `F` flags are not supported.
 - Who the ACE applies to. Can be either an `AUTH_SYS` `UID`/`GID`, or one of the special
   identifiers `EVERYONE@`, `OWNER@`, or `GROUP@`. Currently, Kerberos principals are not supported
   in ACLs.
 - The types of access the ACE applies to. Some examples are `r` for read, `w` for write, `t` for
   read attributes. `nfs4_setfacl` also allows the use of the shorthands `R`, `W`, and `X` which
   expand to generic read, write, and execute permissions - specifics can be found in `man
   nfs4_setfacl`. Note: we’ve observed that the ACL tools do not allow setting any of the flags
   `dnNo` in a Deny ACE.

The above example corresponds to a mode of 664: The owner and group of the file are allowed to read
and write, while others (`EVERYONE@`) are only allowed to read.

```bash
$ stat -c %a /mnt/qumulo/foo
664
```

`nfs4_editfacl` (or `nfs4_setfacl -e`) allows editing a file’s ACL in the text editor specified by
the `$EDITOR` environment variable. You can add ACEs in new lines, or make changes to the existing
entries in the ACL. The `nfs4_setfacl` tool provides a variety of other ways to edit ACLs from the
command line, for example adding a single ACE with `nfs4_setfacl -a <ACE>` or setting an entire ACL
with `nfs4_setfacl -s <ACL>`.

## Special Identifiers
Qumulo supports 3 of the special identifiers defined by NFSv4: `EVERYONE@`, `OWNER@`, and `GROUP@`.
These can be used to make an ACE apply to the owner of a file, the group owner of a file, or any
user of the filesystem.

## Interaction with Mode
You can manage access permissions over NFSv4 with either ACLs or POSIX-style modes, or use them in
combination with each other. If you set an ACLs on a file and then set a mode on it, the
restrictions expressed by the mode will be applied to the ACL to modify or remove ACEs that apply to
the owner, group, or other users. If you use the `OWNER@` or `GROUP@` identifiers in an ACL that
allows read/write/execute permissions, this will be reflected when reading the file’s mode, in the
owner or group bits of the mode. Note that permissions granted to `EVERYONE@` are broader than the
“other” bits in a mode, as `EVERYONE@` includes the owner and group of a file while the “other” bits
of a mode do not apply to the owner or group.

## Interaction with Other Protocols
NFSv4 ACLs are comparable to SMB’s access controls, and often can be written/read between the two
protocols without issue.

In many cases, identities used in an ACE can map to an NFS UID or GID. Mappings may succeed when:
 - The cluster is joined to an Active Directory domain, RFC2307 is enabled, and NFS UIDs/GIDs are
   associated with AD users/groups in the Active Directory configuration.
 - UID/GID mappings are configured for the cluster’s local users/local groups.

Otherwise in cases where SMB ACLs refer to users or groups that are not mapped to a corresponding
NFS UID/GID, they will appear with the NOBODY UID (65534).

For more information on what mappings your cluster may perform for a given file, see the following
`qq` CLI commands for identity inspection:
 - `qq fs_get_acl`
 - `qq auth_find_identity`
 - `qq auth_expand_identity`

## Changing Owner
When the owner of a file is changed, ACEs that refer to that owner will be changed to apply to the
new owner.

```bash
$ nfs4_getfacl /mnt/qumulo/foo
A::1001:rwatTnNcy
A:g:1001:rwatTnNcy
A::EVERYONE@:rtncy

$ sudo chown 1002 /mnt/qumulo/foo

$ nfs4_getfacl /mnt/qumulo/foo
A::1002:rwatTnNcy
A:g:1001:rwatTnNcy
A::EVERYONE@:rtncy
```


