---
title: "Managing Encryption at Rest in Qumulo Core"
summary: "This section explains how encryption at rest works in Qumulo Core, how to rotate master keys, how to configure a Key Management Server (KMS), and how to ensure that the master keys across your cluster are secured correctly by using the <code>qq</code> CLI."
permalink: /administrator-guide/encryption-data-security/managing-encryption-at-rest.html
redirect_from:
  - /administrator-guide/data-security/managing-encryption-at-rest.html
  - /administrator-guide/protecting-data/managing-encryption-at-rest.html
  - /administrator-guide/encryption-data-security/configuring-remote-key-management-server.html
sidebar: administrator_guide_sidebar
varLocalKey: The master key is stored locally.
varKmsKey: The master key is stored in a KMS.
varExampleHostname: kms.example.com
---

{{site.data.alerts.important}}
<ul>
  <li>Upgrading a Qumulo cluster from a version of Qumulo Core lower than 3.1.5 doesn't enable encryption automatically. You must rebuild your cluster to take advantage of this feature. When you <a href="https://care.qumulo.com/hc/en-us/articles/115014525587">create a new cluster</a>, Qumulo Core enables encryption automatically and distributes the master key to all nodes in the cluster.</li>
  <li>In case of replication processes, Qumulo Core maintains the encryption type after data transfers. Although source and target clusters don't require encryption for replication, we strongly recommend encrypting both source and target clusters.</li>
</ul>
{{site.data.alerts.end}}

## How Encryption at Rest and Master Keys Work in Qumulo Core
In Qumulo Core 3.1.5 (and higher), in addition to encrypting data _in transit_ (for example, to clients that use SMBv.3.1), software-based encryption also secures data _at rest_ for on-premises clusters. Qumulo Core encrypts all data and metadata in the file system. Removing or reinserting drives and replication doesn't affect encryption at rest. For more information, see [Encryption Limitations](#encryption-limitations).

Qumulo Core uses a _master key_ to protect the _data key_ that encrypts the data on the cluster. The master key is stored either locally&mdash;on the boot drive of every node, in a file that only the `root` user can access&mdash;or on an external Key Management Server (KMS)&mdash;from where the system retrieves the master key upon startup. Both approaches help protect your data from potential threats such as a malicious actor's access to stolen or decommissioned disks.


## Retrieving Information about a Qumulo Cluster's Encryption Configuration
This section explains how to retrieve the status or detailed information about an active encryption configuration for a Qumulo cluster and gives examples for a system that uses a locally stored master key and a system that uses a Key Management Server (KMS).

{% include note.html content="The `qq` CLI commands `encryption_get_key_store` and `encryption_get_status` require the `PRIVILEGE_ENCRYPTION_READ` privilege." %}

<a id="encryption-get-status"></a>
### To View the Status of an Active Encryption Configuration
Run the `qq encryption_get_status` command.

{{site.exampleOutput}} {{page.varLocalKey}}

```json
{
  "last_key_rotation_time": "2022-11-20T12:15:25.683207795Z",
  "status": "Encrypted",
  "type": "Local"
}
```

{{site.exampleOutput}} {{page.varKmsKey}}

```json
{
  "ca_cert_expiry": "2027-04-18T19:55:17Z",
  "client_cert_expiry": "2027-04-18T19:55:17Z",
  "last_key_rotation_time": "2023-09-05T20:15:40.06864014Z",
  "last_status_update_time": "2023-09-05T20:28:58.108120131Z",
  "status": "KMS Available",
  "type": "KMS"
}
```

<a id="encryption-get-key-store"></a>
### To View Detailed Information for an Active Encryption Configuration
Run the `qq encryption_get_key_store` command.

{{site.exampleOutput}} {{page.varLocalKey}}

```json
{
  "config_details": {
    "status": "Encrypted"
  },
  "config_type": "Local"
}
```

{{site.exampleOutput}} {{page.varKmsKey}}

```json
{
  "config_details": {
    "config_creation_time": "2024-02-28T20:01:25.683207795Z",
    "hostname": "{{page.varExampleHostname}}",
      "key_id": "{{site.exampleKeyID}}",
      "port": 5696
    },
  "config_type": "KMS"
}
```


## Configuring Qumulo Core to Use a Master Key Stored Locally or in a Key Management Server (KMS)
This section explains how to configure Qumulo Core to use a master key stored locally or in a Key Management Server (KMS) by using the `qq` CLI.

{{site.data.alerts.note}}
<ul>
  <li>The <code>qq</code> CLI command {% include qq.html command="encryption_set_key_store" %} requires the <code>PRIVILEGE_ENCRYPTION_WRITE</code> privilege.</li>
  <li>To be able to configure an external KMS, the KMS must support Key Management Interoperability Protocol (KMIP) 1.0.</li>
</ul>
{{site.data.alerts.end}}

### To Configure Qumulo Core to Use a Master Key Stored Locally
{{site.data.alerts.important}}
<ul>
  <li>While the <em>master key</em> on your boot drive encrypts your <em>data keys</em>, the master key <em>itself</em> isn't encrypted.</li>
  <li>The boot drive contains the disk image, the installed build of Qumulo Core, and configuration files. In the unlikely event that your boot drive fails and requires replacement, remove the encrypted data keys associated with the master key from the boot drive by <a href="#rotate-master-key">rotating the master key</a>. When you complete the key rotation process, you can dispose of the failed boot drive securely.</li>
  <li>To avoid potential decryption, ensure that your data keys eventually <em>age out</em> by rotating the master key any time you replace a drive in your cluster.</li>
</ul>
{{site.data.alerts.end}}

1. To configure the system to use a local key store, run the {% include qq.html command="encryption_set_key_store" %} with the `local` subcommand.

1. To confirm that the system is configured correctly, {% include qq.html command="encryption_get_status" %}.

   In the output, ensure that the `type` field is set to `Local`.

### To Configure Qumulo Core to Use a Master Key Stored in a Key Management Server (KMS)
{{site.data.alerts.caution}}
<ul>
  <li>If the master key is deleted from the KMS, and all nodes in the cluster are rebooted, all data on the cluster becomes permanently unrecoverable.</li>
  <li>If you allow the certificates to expire, or the master key is deleted accidentally, you must create a new, valid configuration as soon as possible. To warn you of this scenario, the Qumulo Core Web UI indicates if any of your certificates are about to expire, or if the configured master key becomes unavailable.</li>
</ul>
{{site.data.alerts.end}}

1. To configure the system to use a KMS, use `qq encryption_set_key_store kms` command and specify the path to the client certificate, private key, the server CA certificate, the key ID, and the KMS server hostname. For example:
   
   ``` bash
   qq encryption_set_key_store kms \
     --client-cert path/to/client_cert.pem \
     --client-private-key path/to/client_pk.pem \
     --server-ca-cert /path/to/server_cert.pem \
     --key-id {{site.exampleKeyID}} \
     --host-name {{page.varExampleHostname}}
   ```

1. To confirm that the system is configured correctly, run the {% include qq.html command="encryption_get_key_store" %} command.

   In the output, ensure that the `type` field is set to `KMS`.


<a id="rotate-master-key"></a>
## Rotating the Master Key
This section explains how to rotate the master key and check the encryption status for your cluster by using the `qq` CLI and how to check the encryption status by using the Qumulo Core Web UI.

{% include caution.html content="[Qumulo Care](https://docs.qumulo.com/contacting-qumulo-care-team.html) team members can help you [rotate your master keys](#rotate-master-key). However, they don't have access to your encryption keys and can't retrieve them for you." %}

### To Rotate Master Keys Stored Locally
1. Run the `qq rotate_encryption_keys` command.

   When the process is complete, the command shows the `Key rotation complete` message.

1. To view your cluster's encryption status and the last key rotation time, run {% include qq.html command="encryption_get_status" %}.

### To Rotate Master Keys Stored in a Key Management Server (KMS)
1. Run the `qq rotate_encryption_keys` command and specify the key ID. For example:

   ```bash
   qq rotate_encryption_keys --key-id {{site.exampleKeyID}}
   ```
   
   {% include tip.html content="The key ID might be different from the key name." %}
   
1. To ensure that the system is using the new key, run {% include qq.html command="encryption_get_key_store" %}.

   In the output, ensure that the `key_id` field lists the new key ID.

### To Check the Encryption Status of a Qumulo Cluster by Using the Qumulo Core Web UI
1. {{site.logIntoWebUI}}

1. On the **Dashboard** page, in the **Cluster Overview** section, click **More details**.

1. If encryption is enabled for your cluster, the **Cluster** page shows the message **Data Encrypted**.


## Encryption Limitations
* Qumulo Core doesn't encrypt host file system data on the node (such as system logs, core files, and so on).

* Qumulo Core doesn't support removing encryption from encrypted clusters.

* On encrypted systems, single-stream throughput and latency might experience up to 5-10% degradation for writes and up to 5% for reads.

* Qumulo Cloud clusters don't support encryption at rest and should use cloud-native solutions for this functionality.
