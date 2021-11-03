---
title: Enabling and Using NFSv4 on a Qumulo Cluster
permalink: nfs4-enabling-using.html
tags:
  - nfs4
---

# Enabling and Using NFSv4 on a Qumulo Cluster
Qumulo Core 4.3.0 (and higher) supports Network File System version 4 (NFSv4). This section explains how you can configure your cluster for a supported export configuration and enable or disable NFSv4 on your cluster. It also provides detail about supported and unsupported features and NFSv4 minor versions.


## Configuring and Using Exports for NFSv4
Qumulo's NFS exports can present a view of your cluster over NFS that might differ from the contents of the underlying filesystem. You can mark NFS exports as read-only, restricted (to allow access only from certain IP adresses), or configure specific user mappings. For more information, see [Create an NFS Export](https://care.qumulo.com/hc/en-us/articles/360000723928-Create-an-NFS-Export) in Qumulo Care.

While NFSv3 and NFSv4 share each cluster's NFS export configuration, exports behave differently when you access them using NFSv4. This section explains these differences and the new requirements for export configurations with NFSv4.

### Differences Between NFSv3 and NFSv4 Exports
In the following example, a Qumulo cluster has the following export configuration.

| Export Name        | Filesystem Path      | Read-Only  |
|--------------------|----------------------|------------|
| `/home`            | `/home`              | No         |
| `/files`           | `/home/admin/files`  | No         |
| `/read_only/home`  | `/home`              | Yes        |
| `/read_only/files` | `/home/admin/files`  | Yes        |

NFSv3 lets you mount one of these exports by specifying the full export name, for example:

```bash
mount -onfsvers=3 cluster.qumulo.com:/read_only/home /mnt/cluster/home
```

This command gives read-only access to the `/home` directory on the cluster using the path `/mnt/cluster/home`. However, the following command fails with the `No such file or directory` message.

```bash
mount -onfsvers=3 cluster.qumulo.com:/read_only /mnt/cluster/read_only
```

NFSv4 still lets you mount exports by specifying the full export name. However, NFSv4 also supports navigating _above_ exports, as if they are part of the filesystem. The following command succeeds.

```bash
mount -onfsvers=4.1 cluster.qumulo.com:/read_only /mnt/cluster/read_only
```

At the mount, the exports under `/read_only` are visible: `/mnt/cluster/read_only` displays virtual directories named `files/` and `home/` with the contents of the corresponding directories in the filesystem, for example:

```bash
/mnt/cluster/read_only/
|--- files/<filesystem contents>
|--- home/
|------ admin/files/<filesystem contents>
|------ <other filesystem contents>
```

This presentation of exports lets you view existing exports using the filesystem's own interface. It also lets you view new exports as soon as someone creates or modifies them without remounting.

### Preparing Export Configurations for NFSv4
Qumulo's implementation of NFSv4 distinguishes between navigating _above_ exports and _inside_ an export. To avoid confusion between paths that refer to a virtual directory above an export or a real filesystem directory inside an export, no export name can be a prefix of another export name when NFSv4 is enabled.

In the following example, a Qumulo cluster has the following export configuration.

| Export Name        | Filesystem Path      |
|--------------------|----------------------|
| `/`                | `/`                  |
| `/admin`           | `/home/admin`        |

Because `/` is a prefix of `/admin`, you can't enable NFSv4 with this export configuration. This restriction prevents the situation where the path `/admin` can refer to both the export of `/home/admin` or the actual filesystem path `/admin`.

To prepare this configuration for NFSv4, you can do one of the following:
* Delete the `/` export and use NFSv4 presentation of exports when mounting `/`.
* Delete the `/admin` export.
* Give the `/` export a name that doesn't use other exports as a prefix, for example:

| Export Name        | Filesystem Path      |
|--------------------|----------------------|
| `/root`            | `/`                  |
| `/admin`           | `/home/admin`        |

### Visibility of IP-Restricted Exports
**Note:** The names of exports are public to all NFSv4 clients, regardless of IP restrictions. You can't disable this behavior.

NFSv4 respects IP restrictions on exports: only clients with allowed IP addresses can access the contents of an export. However, clients without access to an export can still view the export as a directory when they traverse _above_ exports. The restrictions apply only when a client attempts to access the contents of the export. 

### 32-Bit Sanitization
* In NFSv3, you can configure specific exports to return 32-bit sanitized data for individual fields. NFSv3 converts any data larger than 32 bits in configured fields to 32-bit data and returns the data. For example, it can sanitize file size to 32-bit format. This truncates the field to `max_uint32` whenever the NFSv3 server returns the attribute.
* NFSv4 doesn't support 32-bit sanitization and ignores any sanitizations configured for an export.


## Enabling NFSv4 on the Cluster

NFSv4 support is configured via a single cluster-wide configuration. When NFSv4 is turned on, all NFS exports will be accessible over both NFSv3 and NFSv4. To turn NFSv4 on, use the following `qq` command:
```
qq nfs_modify_settings --enable-v4
```
Once NFSv4 is enabled, clients should be able to mount the cluster over NFSv4 just as NFSv3.

The QQ CLI is currently the only supported way to enable NFSv4; there is not yet a way to enable NFSv4 in the Web UI.

## NFS Mounts with NFSv4 Enabled

NFS clients typically find and use the highest version of the protocol supported by both client and server. For example, the following command will mount with NFSv4 if it is enabled, and NFSv3 otherwise:
```
mount -t nfs your.qumulo.cluster:/mount_path /path/to/mountpoint
```
Since Qumulo's implementation of NFSv4 is not yet at feature parity with NFSv3, for any mounts that need features only supported by NFSv3 (such as snapshot access) the `nfsvers=3` option should be provided:
```
mount -t nfs -o nfsvers=3 your.qumulo.cluster:/mount_path /path/to/mountpoint
```
Conversely, it is advisable to specify `nfsvers=4` or `nfsvers=4.1` for any mounts that are specifically intended to use NFSv4.

## Disabling NFSv4 on the Cluster

NFSv4 can be globally disabled with the following `qq` command:
```
qq nfs_modify_settings --disable-v4
```
To check whether NFSv4 is enabled, run:
```
qq nfs_get_settings
```
Disabling NFSv4 immediately renders any NFSv4 mounts unusable. For that reason it is advisable to switch over any NFSv4 mounts to NFSv3 before disabling NFSv4.

## Supported and Unsupported Features

Qumulo's implementation of NFSv4 currently supports:
- General filesystem access: reading, writing, and navigating files
- Unstable writes
- Full use of the NFS exports configuration, shared with NFSv3
- Navigation in the pseudo-filesystem above your exports
- NFSv3-style AUTH\_SYS authentication
- Fine-grained control over file permissions with ACLs

Some features of the NFSv3 implementation are not yet supported over NFSv4:
- Quota sizes will not appear over NFSv4 with, for example, the Unix `df` command; directory quotas are nonetheless respected
- Snapshots are not accessible over NFSv4
- Server-side file locking (e.g. with `fcntl`) is not yet supported

Finally, some new features of NFSv4 are not yet supported, most notably:
- Secure authentication with Kerberos
- Delegations

## NFSv4 Minor Versions

There are three minor versions of NFSv4: 4.0, 4.1, and 4.2. Qumulo Core currently supports only version 4.1; attempting to mount with other minor versions will fail. 4.0 is not supported because 4.1 includes backwards-incompatible fixes for correctness and performance problems in 4.0. 4.2 simply adds performance-oriented features such as server-side copy; since Qumulo Core does not yet support any of those features 4.2 is not supported either.

While most relatively recent distributions of Linux come with support for NFSv4.1., MacOS only has a client for NFSv4.0, and Windows does not come with an NFSv4 client.
