---
title: Configuring and Using Exports for NFS4
permalink: nfs4-exports.html
tags:
  - nfs4
  - qumulo_core
  - exports
---

# Configuring and Using Exports for NFS4

Qumulo's NFS exports allow presenting a view of the cluster over NFS that potentially differs from the contents of the underlying filesystem. NFS exports can also be accessible to only limited IP addresses, or can only allow users to authenticate as the root user from a limited set of IP addresses. See [Create an NFS Export](https://care.qumulo.com/hc/en-us/articles/360000723928-Create-an-NFS-Export) for a guide on creating and configuring NFS exports.

While each cluster's NFS exports configuration is shared between NFS3 and NFS4, exports behave somewhat differently when accessed with NFS4. This page will explain the differences and new requirements for exports configurations with NFS4 enabled.

## Comparison of NFS3 and NFS4 Exports

As an example, consider a cluster with the following exports configuration:

| Export Name        | Filesystem Path      | Read only? |
----------------------------------------------------------
| `/home`            | `/home`              | No         |
| `/files`           | `/home/admin/files`  | No         |
| `/read_only/home`  | `/home`              | Yes        |
| `/read_only/files` | `/home/admin/files`  | Yes        |

### NFS3 Mount Behavior

With NFS3 it is only possible to mount one of these exports by specifying the full name of the export; for example, on the Linux command line, the mount:
```
mount -overs=3 cluster.qumulo.com:/read_only/home /mnt/cluster/home
```
would give read-only access to `/home` on the cluster via the path `/mnt/cluster/home`. However, the mount:
```
mount -overs=3 cluster.qumulo.com:/read_only /mnt/cluster/read_only
```
Would fail with a message like:
```
mount.nfs: mounting cluster.qumulo.com:/read_only failed, reason given by server: No such file or directory
```

### NFS4 Mount Behavior

With NFS4, it is still possible to mount exports directly by specifying their full name. However, the protocol also supports navigating "above" exports as if they were part of the filesystem. Running the mount from before with NFS4:
```
mount -overs=4.1 cluster.qumulo.com:/read_only /mnt/cluster/read_only
```
The mount will succeed, and at the mount the exports under `/read_only` will be visible; specifically, `/mnt/cluster/read_only` will show "directories" named `files/` and `home/` with the contents of the corresponding directories in the filesystem:
```
/mnt/cluster/read_only
|--- files/[filesystem contents]
|--- home/
|------ admin/files/[filesystem contents]
|------ [other filesystem contents]
```
This presentation of exports allows users to explore what exports are present with the filesystem interface itself, and to see new exports as soon as they are created or modified without remounting.

## Restrictions on Export Configurations with NFS4

As described above, Qumulo's implementation of NFS4 distinguishes between navigating above the exports and inside an export. To avoid ambiguity about whether a path refers to a virtual directory above an export or a real filesystem directory inside an export, we impose the restriction that when NFS4 is enabled, no export name can be a prefix of another export name.

For example, consider the exports configuration:

| Export Name        | Filesystem Path      |
---------------------------------------------
| `/`                | `/`                  |
| `/admin`           | `/home/admin`        |

Because `/` is a prefix of `/admin`, NFS4 cannot be enabled with this export configuration. This prevents the possibly confusing situation where the path `/admin` could refer to either the export of `/home/admin`, or an actual filesystem path `/admin`.

To ready this configuration for NFS4, you can either delete the export at `/` and rely on NFS4's presentation of exports when mounting `/`, or rename the `/` export to something that does not prefix other exports, like:

| Export Name        | Filesystem Path      |
---------------------------------------------
| `/root`            | `/`                  |
| `/admin`           | `/home/admin`        |

## Visibility of IP-Restricted Exports

NFS4 respects IP restrictions on exports in that only clients with allowed IPs will be able to access the contents of an export. However, clients without access to an export will still be able to see it as a directory when traversing above exports; the restrictions are only applied when attempting to access the contents of the export. In other words, the names of exports are public to all NFS4 clients, regardless of IP restrictions.
