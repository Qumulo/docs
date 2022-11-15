---
title: "Performing Additional Cluster Configuration after Joining Active Directory"
summary: "This section describes additional Qumulo cluster configuration that can affect the behavior of NFSv4.1 with Kerberos."
permalink: /administrator-guide/kerberos/kerberos-additional-cluster-configuration.html
sidebar: administrator_guide_sidebar
keywords: NFS, NFS4.1, NFSv4.1, Kerberos, Active Directory, AD, security, security settings, AUTH_SYS, AUTH_KRB5
---

When your Qumulo cluster is [joined to AD](kerberos-prerequisites-joining-cluster-active-directory.md), you must configure the [NFSv4.1 server](../file-system-protocols/nfsv4.1-enabling-using.md) and NFSv4.1 security settings.

## To Configure Security Settings by Using the qq CLI
Qumulo provides configuration for the permitted NFSv4.1 authentication flavors in the `qq` CLI or directly through the REST API.

1. Use the `qq` CLI to get the current settings:

   ```bash
   $ qq nfs_get_settings
   {
     "auth_sys_enabled": true,
     "krb5_enabled": true,
     "krb5p_enabled": true,
     "v4_enabled": false
   }
   ```

   This is the default configuration:
   * NFSv4.1 is disabled by default.
   * `AUTH_SYS`, `AUTH_KRB5`, and `AUTH_KRB5P` are enabled by default (however, the `AUTH_KRB5` configuration has no effect on NFSv3 because Qumulo Core doesn't support Kerberos with NFSv3).

1. To harden security, configure your cluster to use only Kerberos by disabling `AUTH_SYS` (without changing `AUTH_KRB5`). For example:

   {% include important.html content="Because it uses authentication based on a simple UID and GID passed over the wire in plain text, RPC `AUTH_SYS` is inherently insecure. In a trusted environment, `AUTH_SYS` might be sufficient for enforcing basic permissions and preventing good-faith actors from making mistakes. In all other cases, you must treat `AUTH_SYS` as if it provides _no security whatseover_." %}

   ```bash
   $ qq nfs_modify_settings --disable-auth-sys  
   {
     "v4_enabled": false,
     "auth_sys_enabled": false,
     "auth_krb5_enabled": true
     "auth_krb5p_enabled": true
   }
   ```
1. (Optional) You can also use the following commands.

   | Command | Description |
   | ------- | ----------- |
   | `qq nfs_modify_settings --enable-auth-sys` | Enables `AUTH_SYS` without changing `AUTH_KRB5` |
   | `qq nfs_modify_settings --enable-krb5` | Enables `AUTH_KRB5` without changing `AUTH_SYS` |
   | `qq nfs_modify_settings --enable-krb5p` | Enables `AUTH_KRB5P` without changing `AUTH_SYS` |
   | `qq nfs_modify_settings --enable-v4` | Enables NFSv4.1 |
   | `qq nfs_modify_settings --disable-v4` | Disables NFSv4.1 |
   | `qq nfs_modify_settings --disable-krb5` | Disables `AUTH_KRB5` without changing `AUTH_SYS` |
   | `qq nfs_modify_settings --disable-krb5p` | Disables `AUTH_KRB5P` without changing `AUTH_SYS` |

{{site.data.alerts.note}}
<ul>
  <li>Security configuration options apply to <em>all</em> versions of NFS (NFSv3 and NFSv4.1). Thus, disabling <code>AUTH_SYS</code> also disables NFSv3, because <code>AUTH_SYS</code> is the only authentication flavor that NFSv3 supports by design.</li>
  <li>In a secure environment, where Kerberos is required, <code>AUTH_SYS</code> NFSv3 connections aren't allowed.</li>
  <li>These configuration options apply cluster-wide to all NFS exports and files.</li>
</ul>
{{site.data.alerts.end}}


## Configuring Export Configuration
You can use [NFSv4.1 exports](../file-system-protocols/nfsv4.1-enabling-using.md) to configure access to the Qumulo file system.

{% include note.html content="The user-mapping portion of the export configuration has no effect on Kerberos configuration. Specifying `root` or `any` user mapping for a particular export applies only to `AUTH_SYS` mounts that access this export."%}

In all other ways, exports behave the same for `AUTH_KRB5` or `AUTH_KRB5P` as they do for `AUTH_SYS`. IP address restrictions that you specify in an export work as expected.
