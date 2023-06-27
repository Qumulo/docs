---
title: "Configuring Active Directory for Use With Kerberos"
summary: "This section describes the Active Directory Domain Controller (DC) configuration changes necessary for enabling NFSv4.1 with Kerberos."
permalink: /administrator-guide/kerberos/kerberos-configuring-active-directory.html
sidebar: administrator_guide_sidebar
keywords: NFS, NFS4.1, NFSv4.1, DNS, Active_Directory, AD, DNS_configuration, DNS, A_record, PTR_record, distributed_load, distributing_load, round_robin,  SPN
varMachineAccount: To find the machine account name in the Web UI, click **Cluster > Active Directory** and write down the name under **Machine Account**.
varLowercase: To maximize compatibility with Linux, we recommend formatting SPN entries in lowercase.
---

## Configuring DNS in Active Directory
{{site.varKerberosDns}}

You can use a variety of DNS implementations with Kerberos. In some cases, for example, it might be convenient to use the DNS server that the AD DC provides. For this reason, this section discusses DNS configuration in general terms.


## Modifying the Default DNS Configuration
By default, the Qumulo domain-join operation creates a machine account on the domain in the organizational unit (OU)&mdash;that you specify during the join process&mdash;automatically. This machine account represents all nodes in the cluster, not a single machine.

By default, this machine account has a single, automatically created DNS `A` record that refers to the node on which the system performs the domain-join operation. This DNS record exists on the AD DC used for the domain-join operation and the record refers to a single, public IP address for the node.

The default DNS configuration is generally not useful without additional modifications because:

* **It applies to the DNS server for the DC:** If the environment doesn't use this DNS server, you must create the entry on the DNS server manually.

* **It creates only a DNS `A` (forward) record:** You must create the `PTR` record (a reverse record that maps an IP address to a hostname) manually. This can require creating a reverse zone for the subnet and then adding the specific `PTR` record to the zone.

* **We don't recommend assigning a single IP address to an entire cluster:** In such a configuration, any client that mounts the cluster points at the same node.

<a id="configure-round-robin-dns"></a>
## Configuring DNS for Distributing Workflows Across Nodes
The Qumulo distributed file system works best when you spread the workload evenly across multiple nodes. We recommend configuring round-robin DNS in Active Directory.

This approach provides a list of IP addresses which refer to different nodes in the cluster. Successive DNS queries for the single cluster hostname return different IP addresses. From the perspective of Kerberos, all nodes that comprise a Qumulo cluster act as one host and have the same Kerberos key table. In this way, the Kerberos experience is the same regardless of the selected node.

Unless you need direct access to a specific node through a DNS fully qualified domain name (FQDN), it isn't necessary to use individual DNS `A` records for each node in the cluster (for example, `qumulo1.example.com`, `qumulo2.example.com`, `qumulo3.example.com`, and so on). Instead, we recommend creating a DNS `A` record for the cluster and then duplicating this `A` record for each IP address in the cluster (for example, `qumulo.example.com` &rarr; `{{site.exampleIP0}}`, `qumulo.example.com` &rarr; `{{site.exampleIP1}}`, and so on).

### To Configure Round-Robin DNS
1. [Join your Qumulo cluster to AD](kerberos-prerequisites-joining-cluster-active-directory.md).

1. Find the DNS entry for the cluster on the DNS server.

   Unless you renamed the cluster after joining it to AD, this entry is generally the cluster's name. {{page.varMachineAccount}}

1. Update the list of IP addresses for this host record. Include the IP addresses for all nodes.

   To find the IP addresses in the Web UI, click **Cluster > Network Configuration**.

1. Configure the DNS resolver to point to the DNS server.

   To find the IP addresses, look up the hostname for the DC. For example:
   
   ```bash
   nslookup stuff.example.com
   ```

1. Confirm that successive `ping <cluster_name>` requests connect to a different IP address every time.


## Configuring the Service Principal Name (SPN) for NFS
The SPN is a string that identifies the Kerberos services that a particular host provides. We recommend configuring the Qumulo cluster to provide the NFS service. When you configure the SPN, clients can enumerate the cluster and the NFS service as part of a service-ticket-granting request. 

### To Configure the SPN for NFS by Using the Windows Server Attribute Editor
{{site.data.alerts.note}}
{{page.varLowercase}}
{{site.data.alerts.end}}

1. Use RDP to log in to the DC for your AD domain.

1. Open **Active Directory Users and Computers**.

1. Find the machine account for your Qumulo cluster.

   {{page.varMachineAccount}}

1. Right-click the account and then click **Properties > Attribute Editor**.

1. On the **Attribute Editor** tab, find the `servicePrincipalName` attribute and edit its value to include a new SPN in the `nfs/<machine_account>.<domain_fqdn>` format, for example:

   ```
   nfs/<qumulo-cluster>.ad.eng.example.com
   ```

   {% include tip.html content="You can use the other, automatically generated entries as syntax examples." %}

### To Configure the SPN for NFS by Using the Windows Server Command Prompt
{{site.data.alerts.note}}
<ul>
  <li>{{page.varLowercase}}</li>
  <li>The SPN formatting in the following example is generally sufficient for Linux service ticket requests. However, depending on your environment and client configuration, additional entries might be necessary.</li>
</ul>
{{site.data.alerts.end}}

1. Open a command prompt with administrative privileges.

1. Use RDP or SSH to connect to your AD domain.

1. Run the `setspn` command with the machine account (in this example, `<qumulo-cluster>`) followed by a period (`.`) and the FQDN (in this example, `ad.eng.example.com`). For example:

   ```
   setspn -s nfs/<qumulo-cluster>.ad.eng.example.com
   ```

1. Confirm the configuration by using the `setspn` command with the machine account name. For example:

   ```
   setspn <qumulo-cluster>
   ```

### To Troubleshoot Your SPN Configuration
If your SPN is configured incorrectly, a client is likely to display the following error:

```
mount.nfs: access denied by server while mounting <qumulo-cluster>.ad.eng.qumulo.com:/
```

1. Take a client-side packet capture and find the logs for the client and AD Kerberos.

1. Search the logs for the `S_PRINCIPAL_UNKNOWN` error.

1. Add the required client parameters to the SPN configuration.


## Configuring SPN with DNS
For Kerberos authentication to work correctly, SPN entries must correspond to DNS `A` records exactly. Although the machine account is sometimes the same as the DNS `A` record created during the domain-join process, depending on your the DNS environment, this might not always be true.

In the following example, a Qumulo cluster has a machine account with the SPN `nfs/qumulo.example.com` and two DNS `A` records that point to the same Qumulo cluster IP, `{{site.exampleIP0}}`:
* `qumulo.example.com`
* `storage.example.com`

Because the `storage.example.com` doesn't have a corresponding SPN, you can perform Kerberos authentication by using the `qumulo.example.com` record. However, if you add the second SPN (`nfs/storage.example.com`) to the machine account account SPN list, the account can authenticate by using either of the two hostnames.

`CNAME` (alias) records are an exception to this arrangement. `CNAME` records that point to a correctly-configured `A` record, and which have a corresponding SPN entry in the machine account, don't require the `CNAME` host to be added to the SPN. For example, the `CNAME` record `storage-alias.example.com` that points to `storage.example.com` requires the SPN list to contain only `nfs/storage.example.com` to authenticate against `storage-alias.example.com`.
