---
title: "Configuring File System Protocols on a Tenant"
summary: "This section describes how to configure file system protocols for each tenant on a Qumulo cluster."
permalink: /administrator-guide/network-multitenancy/configuring-file-system-protocols.html
sidebar: administrator_guide_sidebar
varMustSpecifyTenantID: When multiple tenants exist on a cluster, you must specify the tenant ID.
---

After you [create tenants](partitioning-cluster-into-tenants.html) on your Qumulo cluster, you can manage access for clients that connect to the cluster from the tenant's network by enabling or disabling file system protocols, or configuring file system protocols specifically for each tenant.

## Prerequisites
To configure file system protocols, your user must have membership in a Qumulo role with the following privileges.

* `PRIVILEGE_NFS_EXPORT_READ`: View NFS exports

* `PRIVILEGE_NFS_EXPORT_WRITE`: Create, modify, and delete NFS exports

* `PRIVILEGE_NFS_SETTINGS_READ`: View NFS settings

* `PRIVILEGE_NFS_SETTINGS_WRITE`: Modify NFS settings

* `PRIVILEGE_SMB_SHARE_READ`: View SMB shares and settings

* `PRIVILEGE_SMB_EXPORT_WRITE`: Create, modify, and delete SMB shares; modify SMB settings

* `PRIVILEGE_TENANT_READ`: View tenants

* `PRIVILEGE_TENANT_WRITE`: Modify tenants


## Enabling NFS and Configuring Settings and Exports
This section explains how to enable the NFS protocol for a tenant, the difference between global settings and settings for each tenant, and how to configure NFS exports for a tenant.

### Enabling the NFS Protocol for a Tenant
To let a tenant use NFS to access a specific set of exports, use the `qq multitenancy_modify_tenant` command, specify the tenant ID, and use the `--enable-nfs` flag.

{% include note.html content="Initially, the tenant has no exports to mount." %}

In the following example, the cluster begins to accept NFS traffic on TCP and UDP ports 111 and 2019, on all networks assigned to the tenant.

```bash
$ qq multitenancy_modify_tenant \
  --id 2 \
  --enable-nfs
```

### Configuring the NFS Protocol Globally or for a Tenant
You can use _global settings_ that apply to all tenants. For example, to enable NFSv4.1 for all tenants, use the `qq nfs_modify_settings --enable-v4` command. For more information about NFS settings see [Enabling and Using NFSv4.1 on a Qumulo Cluster](../nfs/nfsv4.1-enabling-using.html) and [How NFSv4.1 works with Kerberos in Qumulo Core](../kerberos/kerberos-with-qumulo-core.html).

To override this global setting, use the `qq multitenancy_nfs_modify_settings` command to disable NFSv4.1 on a specific tenant, specify the tenant ID, and use the `--disable-v4` flag. In the following example, despite the global setting, the specified tenant no longer accepts NFSv4.1 traffic on port 2049, on all networks assigned to the tenant.

```bash
$ qq multitenancy_nfs_modify_settings \
  --tenant-id 2 \
  --disable-v4
```

To revert to the global setting for a specific tenant, use the `qq multitenancy_nfs_delete_settings` command and specify the tenant ID. For example:

```bash
$ qq multitenancy_nfs_delete_settings \
  --tenant-id 2
```

### Configuring NFS Exports
To isolate clients within a network in specific directories in the file system, you can configure NFS exports for each tenant.

{% include note.html content="Because each new tenant has no exports initially, to give clients within that tenant's network access to the cluster over NFS, you must add exports. For more information, see [Create an NFS Export](https://care.qumulo.com/hc/en-us/articles/360000723928) on Qumulo Care." %}

To create an NFS export for a tenant, use the `qq nfs_add_export` command and specify the tenant ID, the export path, and the file system path and use the `--no-restrictions` flag. In the following example, a cluster lets clients access directory `/my-directory` from the export `/my-export` when the clients are in the network assigned to the tenant.

```bash
$ qq nfs_add_export \
  --tenant-id 2 \
  --export-path /my-export \
  --fs-path /my-directory \
  --no-restrictions
```

{% capture mustSpecifyID %}{{page.varMustSpecifyTenantID}}{% endcapture %}
{% include important.html content=mustSpecifyID %}

To move an NFS export from one tenant to another, use the `qq nfs_mod_export` command. In the following example, while the cluster denies access to clients in tenant 2, it lets clients in tenant 1 access the export `/my-export`.

```bash
$ qq nfs_mod_export \
  --tenant-id 2 \
  --export-path /my-export \
  --new-tenant-id 1
```


## Enabling SMB and Configuring Settings and Shares
This section explains how to enable the SMB protocol for a tenant, the difference between global settings and settings for each tenant, and how to configure SMB shares for a tenant.

### Enabling the SMB Protocol for a Tenant
To let a tenant use SMB to access a specific set of shares, use the `qq multitenancy_modify_tenant` command, specify the tenant ID, and use the `--enable-smb` flag.

{% include note.html content="Initially, the tenant has no shares to mount." %}

In the following example, the cluster begins to accept SMB traffic on TCP port 445, on all networks assigned to the tenant.

```bash
$ qq multitenancy_modify_tenant \
  --id 2 \
  --enable-smb
```

### Configuring the SMB Protocol Globally or for a Tenant
You can use _global settings_ that apply to all tenants. For example, to require encryption for all tenants, use the `qq smb_modify_settings --encryption-mode required` command. For more information about SMB settings, see the following resources in Qumulo Care:

* [SMB3 Encryption with Qumulo Core](https://care.qumulo.com/hc/en-us/articles/360037249854)

* [SMB Host Restrictions](https://care.qumulo.com/hc/en-us/articles/360041155254)

* [Hide an SMB Share](https://care.qumulo.com/hc/en-us/articles/360005375333)

* [Snapshots: Snapshot Directory Mode](https://care.qumulo.com/hc/en-us/articles/360042053973)

To override this global setting, use the `qq multitenancy_smb_modify_settings` command to allow clients on only specific networks to require encryption. In the following example, despite the global setting, the specified tenant accepts unencrypted SMB requests on all networks assigned to the tenant.

```bash
$ qq multitenancy_smb_modify_settings \
  --tenant-id 2 \
  --encryption-mode none
```

To revert to the global setting for a specific tenant, use the `qq multitenancy_smb_delete_settings` command and specify the tenant ID. For example:

```bash
$ qq multitenancy_smb_delete_settings \
  --tenant-id 2
```

### Configuring SMB Shares
To isolate clients within a network in specific directories in the file system, you can configure SMB shares for each tenant.

{% include note.html content="Because each new tenant has no shares initially, to give clients within that tenant's network access to the cluster over SMB, you must add shares. For more information, see [Create an SMB Share](https://care.qumulo.com/hc/en-us/articles/360000722428) on Qumulo Care." %}

To create an SMB share for a tenant, use the `qq smb_add_share` command and specify the tenant ID, the share path, and the file system path and use the `--all-access` flag. In the following example, a cluster lets clients access access directory `/my-directory` from the share `/my-share` when the clients are in the network assigned to the tenant.

```bash
$ qq smb_add_share \
  --tenant-id 2 \
  --name /my-share \
  --fs-path /my-directory \
  --all-access
```

{% include important.html content=mustSpecifyID %}

To move an SMB share from one tenant to another, use the `qq smb_mode_share` command. In then following example, while the cluster denies access to clients in tenant 2, it lets clients in tenant 1 access the share `/my-share`.

```bash
$ qq smb_mod_share -–tenant-id 2 \
  --name foo \
  --new-tenant-id 1
```

#### Using the Microsoft Management Console (MMC)
To create, modify, and delete SMB shares for each tenant, you can use the MMC Shared Folders snap-in. For more information, see [Managing Qumulo Core File Shares by Using the Shared Folders MMC Snap-In](../smb/managing-file-shares-shared-folders-mmc.html).

{% include important.html content="Because folder paths always start at the root of the file shstem, using the MMC on a Windows client on a tenant’s network causes the MMC to modify that tenant’s shares." %}


## Global Configuration of S3 and FTP Protocols
Qumulo Core doesn't permit configuring file system protocols such as S3 and FTP for each tenant. You must enable, disable, and configure these protocols globally.

{% include important.html content="Enabling these protocols makes them available on all networks." %}

For more information, see [S3 API](../s3-api/configuring-using-s3-api.html) in this guide and [FTP in Qumulo Core](https://care.qumulo.com/hc/en-us/articles/115014912268) on Qumulo Care.


## Listing Client Connections
To determine tenant activity and client types connected to the tenant, use the `qq network_list_connections` command. For more information about balancing client connections to your Qumulo cluster, see [`qq network_list_connections`](https://docs.qumulo.com/qq-cli-command-guide/network/network_list_connections.html) in the {{site.guides.cli}}.

{{site.exampleOutput}}

```json
[
  {
    "connections": [
      {
        "type": "CONNECTION_TYPE_NFS",
        "ip_address": "{{site.exampleSubnet1}}",
          "tenant_id": 1
      },
      {
        "type": "CONNECTION_TYPE_SMB",
        "ip_address": "{{site.exampleGateway1}}",
        "tenant_id": 2
      }
    ],
    "id": 1
  },
  ...
]
```
