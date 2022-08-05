---
title: "Troubleshooting NFSv4.1 with Kerberos"
summary: "This section describes common troubleshooting procedures when NFSv4.1 doesn't work with Kerberos."
permalink: /administrator-guide/kerberos/kerberos-troubleshooting.html
sidebar: administrator_guide_sidebar
keywords: NFS, NFS4.1, NFSv4.1, troubleshooting, Kerberos, debugging, sssd, idmapd, rpcdeug, LDAP, DNS, RPC, users, groups, kinit, krb5
---

This section describes common troubleshooting procedures when NFSv4.1 doesn't work with Kerberos.

## Following General Debugging Techniques
This section lists common debugging techniques.

### To Turn Up Logging Levels for Client-Side Tools
1. In the `/etc/sssd.conf` file, set `debug_level = 9`.
1. In the `/etc/idmapd.conf` file, set `Verbosity = 9`.
1. In the `[gssd]` section of the `/etc/nfs.conf` file, set `verbosity=9` and `rpc-verbosity=9`.

   {{site.data.alerts.note}}
   {{site.varNfsConf}}
   {{site.data.alerts.end}}

1. Turn on `rpcdebug`, for example:

   ```bash
   rpcdebug -m nfs -s all && rpcdebug -m rpc -s all
   ```

### Taking a Client-Side Packet Capture
Normally, there should be:

* Kerberos and LDAP traffic between the client and the domain controller
* DNS traffic between the client and DNS server
* RPC or NFS traffic between the client and the Qumulo cluster

Because a Kerberos mount requires the client to perform a series of steps, in most cases, the last traffic that the client issues indicates the source of failure. To view encrupted Kerberos traffic, use Wireshark with a Kerberos keytab file. For more information, see [https://wiki.wireshark.org/Kerberos.md](Kerberos) in the Wireshark documentation.

For help with interpreting logging and metrics from your Qumulo cluster and for insights from the telemetry of our Kerberos implementation, contact [Qumulo Care](https://care.qumulo.com/hc/en-us/articles/115008409408).


## Resolving Incorrect Display of Users or Groups
Under certain conditions, users or groups display as `nobody` when you run the `ls -l` or `stat` command.

### Differentiating Client and Cluster Issues
To resolve this issue, determine whether it is with the client or with the cluster by running the `nfs4_getfacl` command on a file. If the presentation in the ACL editor appears correct, the issue is with the client. Otherwise, the issue is with the cluster.

{% include note.html content="The ACL editor doesn't perform any ID mapping. It only passes ACE trustees through, in plaintext." %}

### Resolving Client-Side Issues
If the issue is with the client, it is most often an ID mapping issue. Confirm that your mappings are configured correctly. For more information, see [User-Defined Identity Mappings](https://care.qumulo.com/hc/en-us/articles/360017705814) on Qumulo Care.

If the issue persists, investigate logging and packet captures.

### Resolving Cluster-Side Issues
If the issue is with the cluster, confirm that your cluster's Active Directory settings include the Base DNs that contain the expected users. For more information, see [Prerequisites for Joining a Qumulo Cluster to Active Directory](kerberos-prerequisites-joining-cluster-active-directory.md).


## Diagnosing Mount-Failed Errors
Under certain conditions, you might receive mount-failed errors from `mount.nfs`. To diagnose this type of error, you can try the following procedures.

1. Confirm that the `rpc.gssd` service is running.

1. Confirm that the cluster and client both resolve from the client. It should be possible to reach the cluster and client through a fully qualified domain name (FQDN), such as `my-machine.my-domain.example.com`.

1. Confirm that reverse DNS works for the IP addresses on both the client and the cluster.

1. Confirm that the client has a `host` service principal name (SPN) and that the cluster has an `nfs` SPN that matches the DNS records.

1. Do one of the following:

   * If you use a machine account or `kinit` authentication, confirm that the credentials are correct. You can use the keytab `ktutil` command or the credential cache `klist` command to list the encryption methods.

   * Confirm that Kerberos tickets use AES-128 or AES-256 for service encryption by examining a packet capture or your Active Directory Kerberos settings.

1. If you use domain trusts, confirm that trust has AES-128 or AES-256 enabled.

1. Confirm that the clocks on the client, cluster, and domain controller are synchronized to the same time.

1. Confirm that the mount uses the `krb5` option.

   {% include note.html content="Qumulo Core doesn't support the `krb5i` and `krb5p` options." %}

1. Inspect logs and packet captures.
