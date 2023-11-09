---
title: "Using Kerberos Permissions in the Qumulo File System"
summary: "This section describes how NFSv4.1 interacts with the secure file permissions that Kerberos enables for the Qumulo Core file system."
permalink: /administrator-guide/kerberos/kerberos-qumulo-permissions.html
sidebar: administrator_guide_sidebar
keywords: NFS, NFS4.1, NFSv4.1, Kerberos, permissions, file_permissions, owner, group_owner, access_control_list, ACL, access_control_entry, ACE, security_identifier, SID, Kerberos_principal, ACL_editor, AUTH_SYS
---

For more information, see [Qumulo File Permissions Overview](https://care.qumulo.com/hc/en-us/articles/115008211868) on Qumulo Care.


## Listing Permissions for Files
{{site.data.alerts.note}}
<ul>
  <li>This section uses the Kerberos term <em>trustee</em> and Qumulo term <em>identity</em> (or <code>auth_id</code>) interchangeably.</li>
  <li>The term <em>file</em> in the Qumulo file system can refer to:
    <ul>
      <li>A file</li>
      <li>A directory</li>
      <li>A symbolic link</li>
      <li>A special block device</li>
    </ul>
  </li>
</ul>
{{site.data.alerts.end}}

All files in the Qumulo file system have the following fields associated with them:

* Owner
* Group owner
* Access control list (ACL)&mdash;a list of access control entries (ACEs)

These fields, stored in the metadata for a file or directory, determine the access permissions that a trustee or identity has to files.

For any file operation, the system checks the authenticated user against file permissions to determine whether the operation should be allowed. When you create a new file, the authenticated user becomes the owner of the new file.

In the following example, we create a file in a mount over NFS.

{{site.data.alerts.note}}
<ul>
  <li>Because this example uses an <code>AUTH_SYS</code> mount, it has UID and GID identity values set to <code>1000</code>.</li>
  <li>We recommend becoming familiar with the following commands to better understand the various elements for permissions types that the system stores on disk.</li>
</ul>
{{site.data.alerts.end}}

```bash
touch /mnt/mount_point/filename
```

To view the exact permissions metadata for this file, use the `qq fs_file_get_attr` command. For example:

```bash
$ qq fs_file_get_attr --path /filename
{
  "group_details": {
    "id_type": "NFS_GID",
    "id_value": "1000"
  },
  "owner_details": {
    "id_type": "NFS_UID",
    "id_value": "1000"
  },
  ...
}
```

To view the permissions configured in an ACL, use the `qq fs_get_acl` command. For example:

```bash
$ qq fs_get_acl --path /filename
Control: Present
Posix Special Permissions: None

Permissions:
Position  Trustee   Type     Flags  Rights
========  ========  =======  =====  ==============================
1         uid:1000  Allowed         Delete child, Read, Write file
2         gid:1000  Allowed         Delete child, Read, Write file
3         Everyone  Allowed         Read
```


## Listing Security Identifiers (SIDs)
The SID is a globally unique identifier for a user or group object in a domain. For more information, see [Security identifiers](https://docs.microsoft.com/en-us/windows/security/identity-protection/access-control/security-identifiers) in the Microsoft documentation.

Because Qumulo's Kerberos implementation requires AD, every user is also an Active Directory user. The domain controller (DC) has an equivalent mapping for AD users and SIDs. Qumulo uses LDAP to determine the AD-user &harr; SID mapping. For this reason, it is important to configure the Base DN for your cluster correctly.

Qumulo's Kerberos implementation stores SIDs on disk for files that have Kerberos identities in the user, group, or ACL. When a user authenticates by using Kerberos and creates a file, Qumulo Core configures the user, group, and ACL automatically.

To set the identity for an AD user, you can modify the permissions for an existing file by using the `chown` or `nfs4_setfacl` command.

In the following example, the Kerberos-authenticated AD domain user `AD\myusername` creates a file over NFSv4.1 and the system gives an ACL response from the REST API. The response contains an ACE entry for the owner and group owner of the user `AD\myusername`, with corresponding SIDs for both.

```bash
$ qq fs_get_acl --path /filename --json
{
  "aces": [{
    "trustee": {
      "name": "AD\\myusername",
      "sid": "S-1-5-21-4202559609-EXAMPLE158-3224923410-13507",
      ...
    },
    ...
  }, {
    "trustee": {
      "name": "AD\\Domain Users",
      "sid": "S-1-5-21-4202559609-EXAMPLE158-3224923410-513",
      ...
    },
    ...
  }]
}
```

## Using Kerberos Principals
Although Qumulo stores SIDs on disk, SIDs appear rarely when you use NFSv4.1 on Linux systems. Instead, the system represents Kerberos identities as Kerberos principals. A _Kerberos principal_, a string in the `<user@domain>` or `<group@domain>` format, is easier to read.

{% include note.html content="There is an equivalent mapping between AD users, SIDs and Kerberos principals. Each of these representations is unique (a primary key to the AD identity database)." %}

Qumulo's implementation of the SID &harr; Kerberos principal mapping uses the [`sAMAccountName`](https://docs.microsoft.com/en-us/windows/win32/ad/naming-properties#samaccountname) field, which is always present and unique for all AD users and groups. The system forms the Kerberos principal by concatenating the name and domain in the `<sAMAccountName>@<domain>` format.

AD has fields with similar content but without the guarantee of uniqueness (such as the `name`, `distinguishedName`, `CN`, and `servicePrincipalName`). However, AD permits setting these fields to unrelated values. For this reason, it is unlikely but possible that certain environments use special values in these fields. Qumulo's Kerberos implementation ignores these fields and uses only the value in the `sAMAccountName` field. 

{% include note.html content="The fields can diverge significantly if an administrator edits them." %}

The following example shows how the system represents the SIDs from the previous example as Kerberos principals.

```bash
$ nfs4_getfacl filename
A::test2@ad.eng.qumulo.com:rwatTnNcy
A:g:Domain Users@ad.eng.qumulo.com:rtncy
A::EVERYONE@:rtncy
```

Although the system stores raw SIDs on disk, the `nfs_getfacl` command displays users and groups as Kerberos principals. This format is valid for setting identities on a file by using commands such as `nfs4_setfacl`, `chown`, and so on.

### Understanding Kerberos Principal Caveats
This section explains some of the caveats of working with Kerberos principals.

#### Machine Account Object Names
When you work with machine accounts, AD stores the `sAMAccountName` as the object name and appends `$` to it. If a client named `myclient` is joined to the domain `stuff.example.com`, the name of the machine account object in **Active Directory Users or Computers** appears as `myclient` while the Kerberos principal representation over NFS appears as `myclient$@stuff.example.com`.

This functionality is different from other account types in AD, where the object name usually matches the `sAMAccountName` exactly.

#### ID Mapping on Linux systems
Linux systems perform their own ID mapping separately from the Qumulo cluster ID mapping. Linux systems also use `sAMAccountName` as the AD user primary key when joined to an AD domain. However, Linux systems use `CN` when looking up groups. Thus, in groups where the `sAMAccountName` and `CN` don't match (possibly due to edits by an administrator), a Linux system and Qumulo Core might understand differently the group that the Kerberos principal refers to.

Ensure the two fields are in sync to prevent the following possible scenarios:
* An error appears when you configure the group.
* Group configuration succeeds but the configured group is incorrect.

#### Unicode Characters in Kerberos Principals
For most standard Linux tools, Qumulo Core supports all arbitrary Unicode characters in Kerberos principals. However, we don't recommend using the period (`.`) character in principals, except in the domain name.


## Using the chown Tool With Kerberos
`chown` is a Linux tool that changes the owner or group owner for a file. You can generally use `chown` with Kerberos principals. On most Linux systems,  `chown` requires the root user (`sudo chown`).

### The AUTH_SYS Root User
`AUTH_SYS` has the concept of the root user. Using `sudo` on a Linux NFS client fills in `0` for the UID and GID. As long as the mounted export doesn't _root squash_&mdash;maps a client's UID `0` (root) to `65534` (nobody) or to another non-root user&mdash;the Linux client receives root permissions on the Qumulo file system, where the client can perform `chown` operations.

### The Kerberos Root User
Kerberos doesn't have the concept of the root user. However, you can still use it to run `chown` operations under the following conditions.

* The ACL for the file must grant the `CHANGE_OWNER` privilege to an authenticated user.

* The currently authenticated user must be a member of the destination group (if provided) or a member of the current group (if the group isn't being modified).

If both conditions are true, a `chown` operation on files performed as a Kerberos user over NFSv4.1 succeeds. For example:

```bash
$ chown user3:group4 filename
```

{% include note.html content="Including `@<domain>` for the destination user and group is optional." %}

### Viewing the Owner and Group
The following examples show how to display user and group membership by using the `ls -l` and `stat -c` commands.

```bash
$ ls -l filename
-rw-r--r--    1 user3    group4         0 Jun  9 23:18 filename
```

```bash
$ stat -c '%U, %G' filename
user3, group4
```

{% include note.html content="The Kerberos restrictions for `chown` also apply to other Linux tools that use the `chown` system call, such as `cp` and `rsync`, when you run them in ownership-preserving modes." %}

## Using the Linux ACL Editor
The Linux ACL Editor consists of the following tools:

* `nfs4_editfacl`
* `nfs4_getfacl`
* `nfs4_setfacl`

You can use the editor to read and write ACLs on a Qumulo cluster that uses NFSv4.1 with Kerberos. For more information, see [Managing File Access Permissions by Using NFSv4.1 Access Control Lists (ACLs)](../nfs/nfsv4.1-acls.html).
