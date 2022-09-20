---
title: "Enabling and Using NFSv4.1 on a Qumulo Cluster"
summary: "This section explains how to configure your cluster for a supported export configuration and enable or disable NFSv4.1 on your cluster."
permalink: /administrator-guide/protocols/nfsv4.1-enabling-using.html
redirect_from:
  - /nfsv4.1-enabling-using.html
  - /administrator-guide/nfsv4.1-enabling-using.html
sidebar: administrator_guide_sidebar
keywords: NFS, NFS3, NFSv3, NFSv4.1, export, exports, mount, cluster, enable NFS, disable NFS, floating IP
---

Qumulo Core 4.3.0 (and higher) supports Network File System version 4.1 (NFSv4.1). This section explains how to configure your cluster for a supported export configuration and enable or disable NFSv4.1 on your cluster. It also provides detail about supported and unsupported features. For more information about NFSv4.1 and file access permissions, see [Managing File Access Permissions by Using NFSv4.1 Access Control Lists (ACLs)](nfsv4.1-acls.md).

{{site.data.alerts.important}}
<ul>
  <li>Currently, Qumulo Core supports only NFSv4.1. Mounting with version 4.0 or 4.2 isn't supported.</li>
  <li>The NFSv4.1 protocol requires clients to provide the server with globally unique identifiers. By default, the NFSv4.1 client for Linux uses the machine's hostname as <code>co_ownerid</code>. Because the NFSv4.1 protocol requires a unique identifier for every client, an unpredictable failure can occur if two clients have the same hostname. To configure unique identification for your NFS clients, set the <code>nfs4_unique_id</code> value for them. For more information, see <a href="https://www.kernel.org/doc/html/v5.8/admin-guide/nfs/nfs-client.html#the-nfs4-unique-id-parameter">The nfs4_unique_id parameter</a> in the <em>Linux kernel user's and administrator's guide</em>.</li>
</ul>
{{site.data.alerts.end}}


## Configuring and Using Exports for NFSv4.1
Qumulo's NFS exports can present a view of your cluster over NFS that might differ from the contents of the underlying file system. You can mark NFS exports as read-only, restricted (to allow access only from certain IP adresses), or configure specific user mappings. For more information, see [Create an NFS Export](https://care.qumulo.com/hc/en-us/articles/360000723928-Create-an-NFS-Export) on Qumulo Care.

While NFSv3 and NFSv4.1 share each cluster's NFS export configuration, exports behave differently when you access them using NFSv4.1. This section explains these differences and the new requirements for export configurations with NFSv4.1.

### Differences Between NFSv3 and NFSv4.1 Exports
In the following example, a Qumulo cluster has the following export configuration.

| Export Name        | File System Path      | Read-Only  |
|--------------------|-----------------------|------------|
| `/home`            | `/home`               | No         |
| `/files`           | `/home/admin/files`   | No         |
| `/read_only/home`  | `/home`               | Yes        |
| `/read_only/files` | `/home/admin/files`   | Yes        |

NFSv3 lets you mount one of these exports by specifying the full export name, for example:

```bash
mount -o nfsvers=3 cluster.qumulo.com:/read_only/home /mnt/cluster/home
```

This command gives read-only access to the `/home` directory on the cluster by using the path `/mnt/cluster/home`. However, the following command fails with the `No such file or directory` message.

```bash
mount -o nfsvers=3 cluster.qumulo.com:/read_only /mnt/cluster/read_only
```

NFSv4.1 still lets you mount exports by specifying the full export name. However, NFSv4.1 also supports navigating _above_ exports, as if they are part of the file system. The following command succeeds.

```bash
mount -o nfsvers=4.1 cluster.qumulo.com:/read_only /mnt/cluster/read_only
```

At the mount, the exports under `/read_only` are visible: `/mnt/cluster/read_only` displays virtual directories named `files/` and `home/` with the contents of the corresponding directories in the file system, for example:

```bash
/mnt/cluster/read_only/
|--- files/<file system contents>
|--- home/
|------ admin/files/<file system contents>
|------ <other file system contents>
```

This presentation of exports lets you view existing exports by using the file system's own interface. It also lets you view new exports as soon as someone creates or modifies them without remounting.

### Preparing Export Configurations for NFSv4.1
Qumulo's implementation of NFSv4.1 distinguishes between navigating _above_ exports and _inside_ an export. To avoid confusion between paths that refer to a virtual directory above an export or a real file system directory inside an export, no export name can be a prefix of another export name when NFSv4.1 is enabled.

In the following example, a Qumulo cluster has the following export configuration.

| Export Name        | File System Path       |
|--------------------|----------------------- |
| `/`                | `/`                    |
| `/admin`           | `/home/admin`          |

Because `/` is a prefix of `/admin`, you can't enable NFSv4.1 with this export configuration. This restriction prevents the situation where the path `/admin` can refer to both the export of `/home/admin` or the actual file system path `/admin`.

To prepare this configuration for NFSv4.1, you can do one of the following:
* Delete the `/` export and use NFSv4.1 presentation of exports when mounting `/`.
* Delete the `/admin` export.
* Give the `/` export a name that doesn't use other exports as a prefix, for example:

| Export Name        | File System Path      |
|--------------------|---------------------- |
| `/root`            | `/`                   |
| `/admin`           | `/home/admin`         |

### Visibility of IP-Address-Restricted Exports
{% include note.html content="The names of exports are public to all NFSv4.1 clients, regardless of IP address restrictions. You can't disable this behavior." %}

NFSv4.1 respects IP address restrictions on exports: Only clients with allowed IP addresses can access the contents of an export. However, clients without access to an export can still view the export as a directory when they traverse _above_ exports. The restrictions apply only when a client attempts to access the contents of the export.

### 32-Bit Sanitization
* In NFSv3, you can configure specific exports to return 32-bit sanitized data for individual fields. NFSv3 converts any data larger than 32 bits in configured fields to 32-bit data and returns the data. For example, it can sanitize file size to 32-bit format. This truncates the field to `max_uint32` whenever the NFSv3 server returns the attribute.
* NFSv4.1 doesn't support 32-bit sanitization and ignores any sanitizations configured for an export.


## Enabling NFSv4.1 on a Qumulo Cluster
{% include note.html content="Currently, you can enable NFSv4.1 only by using the `qq` CLI." %}

You can enable NFSv4.1 on your Qumulo cluster by using a single cluster-wide configuration command, for example:

```bash
qq nfs_modify_settings --enable-v4
```

When you enable NFSv4.1, all NFS exports are accessible using NFSv3 and NFSv4.1.

## Specifying the NFS Mount Option
Typically, NFS clients find and use the highest version of the protocol that both the client and server support. For example, the following command mounts using NFSv4.1 (if it is enabled) and using NFSv3 otherwise.

```bash
mount -t nfs your.qumulo.cluster:/mount_path /path/to/mountpoint
```

Because Qumulo's NFSv4.1 implementation currently doesn't have full feature parity with NFSv3, you must provide the `nfsvers=3` option for any mounts that require features (such as snapshot access) that only NFSv3 supports, for example:

```bash
mount -t nfs -o nfsvers=3 your.qumulo.cluster:/mount_path /path/to/mountpoint
```

{% include note.html content="We recommend specifying the `nfsvers=4` or `nfsvers=4.1` option for any mounts that use NFSv4.1." %}


## Checking Whether NFSv4.1 is enabled
To check whether NFSv4.1 is enabled on your cluster, use the following `qq` CLI command:

```bash
qq nfs_get_settings
```


## Disabling NFSv4.1 on a Qumulo Cluster
{% include important.html content="Disabling NFSv4.1 makes any NFSv4.1 mounts unusable immediately. We recommend switching any NFSv4.1 mounts to NFSv3 before disabling NFSv4.1." %}

To disable NFSv4.1 on an entire Qumulo cluster, use the following `qq` CLI command:

```bash
qq nfs_modify_settings --disable-v4
```


## Configuring Floating IPs for Nodes
Currently, each Qumulo node is limited to 1,000 clients connected using NFSv4.1 simultaneously. To account for nodes going down, we recommend balancing the number of client connections across your nodes by configuring a sufficient number of floating IP addresses per node. This prevents a node failover event from overloading the nodes to which the clients might fail over.

For example, if you configure only one IP address per node, on a cluster with 600 clients per node, a single node failure might overload one of the remaining nodes, preventing 200 clients from connecting. If you assign multiple floating IP addresses to each node, the clients' connections are distributed across multiple nodes.


## Listing NFSv4.1 Byte-Range Locks
Rather than lock an entire file, byte-range locking lets you lock specific portions of a file or an entire file in use. This feature is available in Qumulo Core 5.1.3 (and higher). It doesn't require client mount configuration.

The NFSv4.1 implementation in Qumulo Core has a non-configurable lease of one minute. During each lease period, clients send a heartbeat to your Qumulo cluster. The cluster uses this heartbeat to detect lost client connections and to revoke the client leases. When the cluster revokes a lease, it releases any byte-range locks and makes them available to other clients.

{{site.data.alerts.important}}
<ul>
  <li>NFSv4.1 byte-range locks are interoperable with NLM (NFSv3) byte-range locks. NFSv4.1 clients view and respect locks that NFSv3 clients hold (the opposite is also true).</li>
  <li>NFSv4.1 and NLM locks aren't interoperable with SMB locks.</li>
</ul>
{{site.data.alerts.end}}

To list NFSv4.1 byte-range locks in your cluster, use the following `qq` CLI command:

```bash
qq fs_list_locks --protocol nfs4 --lock-type byte-range
```

{{site.data.alerts.note}}
<ul>
  <li>Currently, Qumulo Core doesn't support revoking NFSv4.1 byte-range locks by using the CLI.</li>
  <li>The time to acquire or release a lock scales linearly with the number of locks that the system already holds on a specific file. If a file has a very large number of locks, system performance can degrade.</li>
</ul>
{{site.data.alerts.end}}


## Supported and Unsupported Features in Qumulo's Implementation of NFSv4.1
Qumulo's implementation of NFSv4.1 currently supports:
* Authentication with [Kerberos](../kerberos/)
* General file system access (reading, writing, and navigating files)
* Unstable writes
* Full use of the NFS exports configuration shared with NFSv3
* Navigation in the pseudo-file system above your exports
* NFSv3-style `AUTH_SYS` authentication (also known as `AUTH_UNIX`)
* Fine-grained control over file permissions using access control lists (ACLs)
* File locking (for example, by using the `fcntl` command)

Qumulo Core doesn't support the following NFSv3 features through NFSv4.1:
* Quota sizes don't appear through NFSv4.1 with certain commands, such as `df` (however, Qumulo Core respects directory quotas)
* You can't access snapshots through NFSv4.1

Qumulo Core doesn't currently support the following NFSv4.1 features:
* Delegations
