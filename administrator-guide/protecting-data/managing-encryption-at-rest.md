---
title: "Managing Encryption at Rest in Qumulo Core"
summary: "This section explains how encryption at rest works in Qumulo Core, how to rotate master keys, and how to ensure that the master keys across your cluster are secured correctly."
permalink: /administrator-guide/protecting-data/managing-encryption-at-rest.html
sidebar: administrator_guide_sidebar
keywords: encryption, at rest, encryption at rest, data key, master key, rotate keys
---

## How Master Keys and Data Keys Work in Qumulo Core
In addition to encrypting data _in transit_ (for example, to clients that use SMBv.3.1), in Qumulo Core 3.1.5 (and higher) software-based encryption secures data _at rest_ for on-premises clusters. Qumulo Core encrypts all data and metadata in the file system. Removing or reinserting drives and replication doesn't affect encryption at rest. For more information, see [Encryption Limitations](#encryption-limitations).

To encrypt data and data keys, Qumulo Core uses _master keys_ that it stores on the boot drive of every node in the cluster, in a file that only the `root` user can access. The _master key_ protects the _data key_ that encrypts the data on the cluster. This lets Qumulo Core protect your data from potential threats such as a malicious actors' access to stolen or decommissioned disks.

{{site.data.alerts.important}}
<ul>
  <li>While the <em>master key</em> on your boot drive encrypts your <em>data keys</em>, the master key <em>itself</em> isn't encrypted.</li>
  <li><a href="https://docs.qumulo.com/contacting-qumulo-care-team.html">Qumulo Care</a> team members can help you <a href="#rotate-master-key">rotate your master keys</a>. However, they don't have access to your encryption keys and can't retrieve them for you.</li>
  <li>The boot drive contains the disk image, the installed build of Qumulo Core, and configuration files. In the unlikely event that your boot drive fails and requires replacement, remove the encrypted data keys associated with the master key from the boot drive by <a href="#rotate-master-key">rotating the master key</a>. When you complete the key rotation process, you can dispose of the failed boot drive securely.</li>
  <li>To avoid potential decryption, ensure that your data keys eventually <em>age out</em> by rotating the master key any time you replace a drive in your cluster.</li>
</ul>
{{site.data.alerts.end}}

While encryption at rest is available by default on all clusters that you create by using Qumulo Core 3.1.5 (and higher), upgrading from a version of Qumulo Core lower than 3.1.5 doesn't provide encryption capability. You must rebuild your cluster to take advantage of this feature. When you [create a new cluster](https://care.qumulo.com/hc/en-us/articles/115014525587), Qumulo Core enables encryption at rest automatically and distributes the master key to all nodes in the cluster.

For replication, Qumulo Core maintains the encryption type after a transfer. Although source and target clusters don't require encryption for replication, we strongly recommend encrypting both source and target clusters.

<a id="rotate-master-key"></a>
## Rotating the Master Key
This section explains how to rotate the master key and check the encryption status for your cluster by using the `qq` CLI and Web UI.

### To Rotate the Master Key by Using the qq CLI
1. Use the `qq rotate_encryption_keys` command.

   When the command completes, it shows the following message.

   ```
   Key rotation complete
   ```

1. To check your cluster's encryption status and the last key rotation time, use the `qq encryption_status` command.


### To Check Your Cluster's Encryption Status by Using the Web UI
1. Log in to Qumulo Core.

1. On the **Dashboard** page, in the **Cluster Overview** section, click **More details**.

1. If encryption is enabled for your cluster, the **Cluster** page shows the message **Data Encrypted**.


<a id="encryption-limitations"></a>
## Encryption Limitations
* Qumulo Core doesn't encrypt host file system data on the node (such as system logs, core files, and so on).

* Qumulo Core doesn't support removing encryption from encrypted clusters.

* Single-stream write throughput and latency might experience up to 10-10% degradation and reads might experience up to 5% degradation.

* Qumulo Cloud clusters don't support encryption at rest and should use cloud-native solutions for this functionality.
