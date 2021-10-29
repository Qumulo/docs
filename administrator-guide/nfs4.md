---
title: Enabling and Using NFSv4
permalink: nfs4.html
tags:
  - nfs4
  - qumulo_core
---

# Enabling and Using NFSv4

As of version 4.3.0, Qumulo Core supports NFSv4. This guide introduces Qumulo's implementation of NFSv4, including a guide to enabling the protocol and an overview of what features it does and does not support.

## Preparing the Cluster

NFSv4 can only be enabled on clusters that are on at least version 4.3.0, and have a supported exports configuration; see [Configuring and Using Exports for NFSv4](administrator-guide/nfs4-exports.md).

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
