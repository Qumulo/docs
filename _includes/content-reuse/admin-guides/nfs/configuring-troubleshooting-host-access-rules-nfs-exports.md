## How Host Access Rules for NFS Exports Work in Qumulo Core
This section explains the three types of host access rules for NFS exports.

### Restricting Access by IP Address or Hostname
In Qumulo Core 6.2.0.1 (and higher), you can add a host access rule to an NFS export to restrict the export by IP address or hostname.
{: #host-access-rule}

The following examples show the elements that a host access rule can include.

* **Hostnames**
   
   * Without a wildcard (`name.example.com`)

   * With a wildcard (`*.example.com`)

* **IP Addresses**

  * Single IP addresses (`{{site.exampleIP0}}`)

  * IP address range (`{{site.exampleIPrange1}}` or `{{site.exampleIPrange2}}`)

* **Network Segment**

  * Without a subnet mask (`{{site.exampleNetworkSegment1}}`)

  * With a subnet mask (`{{site.exampleNetworkSegment2}}`)

{% include important.html content="If you don't specify a host access rule, Qumulo Core allows access to all IP addresses." %}

### Restricting Access by the NFS Client's Kerberos Security Flavor
In Qumulo Core 7.7.1.1 (and higher), it is possible to further restrict access to NFSv4.1 clients that use the following [Kerberos security flavors](../kerberos/kerberos-with-qumulo-core.html#choosing-a-kerberos-security-flavor):

* **None:** No authentication restrictions.

* **KRB5:** Allows access to clients that use any Kerberos flavor for authentication.

* **KRB5I:** Allows access only to clients that use a Kerberos flavor with message integrity or encryption for authentication.

* **KRB5P:** Allows access only to clients that use a Kerberos flavor with encryption for authentication.

### Restricting Access by the NFS Client's TLS Connectivity {#require-tls}
{% include caution.html content="If you set **Require TLS** on a host access rule that matches clients that still mount the export in plaintext, their mounts fail at the next NFS call, and the clients lose any writes that they have cached but not yet sent to the cluster. On NFSv4.1, a client with files open at that moment can't close or unlock them on the cluster. Their opens and byte-range locks remain on the cluster until the client unmounts the export or restarts, and until then, other clients can't lock those byte ranges. To avoid losing data, move your clients to NFS over TLS before you require it." %}

In Qumulo Core 7.11.0 (and higher), you can require the hosts that a host access rule matches to use NFS over TLS for an NFS export. When a rule has **Require TLS** set, Qumulo Core refuses NFS calls that arrive in plaintext from the hosts that the rule matches, and it serves the same calls when they arrive over TLS.{% unless page.permalink contains 'nfs-over-tls' %} For more information about configuring your cluster and your clients for NFS over TLS, see [Enabling and Using NFS over TLS in Qumulo Core](nfs-over-tls-enabling-using.html).{% endunless %}

**Require TLS** is a separate setting from the other settings of a rule, such as **Read-only** and **Required Authentication Mode**, and a rule can require both TLS and a Kerberos security flavor. Qumulo Core applies only the first rule whose hosts match a client, so **Require TLS** affects a client only when that rule has it set. When that rule refuses a plaintext client, Qumulo Core doesn't try the rules below it.


## Prerequisites
To be able to use hostnames, you must:

* Enable and configure reverse look-ups on your DNS server.
  
* Use fully qualified domain names (FQDNs).

* Use wildcards carefully because they match only one hostname level. For example, `*.accounting.example.com` matches `user1.accounting.example.com` but not `machine.user1.accounting.example.com`.

* [Optimize your system for reverse-dns look-ups.](#optimize-for-reverse-dns)


## Adding a Host Access Rule to an Existing NFS Export
This section explains how you can add a host access rule to an existing NFS export by using the Qumulo Core Web UI or the `qq` CLI.

### To Add a Host Access Rule by Using the Qumulo Core Web UI

1. {{site.logIntoWebUI}}

1. Click **Sharing > NFS Exports**.

1. For an NFS export, in the **Actions** column, click {% include shared_inline_image.html alt="Edit" file="shared-images/admin-guides/edit.png" max-width="40" %}.

1. On the **NFS Export** page, in the **Host Access Rules** section:

   1. For **Allowed Hosts**, enter a comma-separated [host access rule.](#host-access-rule)

   1. (Optional) To ensure that the allowed hosts have limited access to the NFS export, click **Read-only**.

   1. (Optional) To require the allowed hosts to use NFS over TLS, click **Require TLS**.

      For more information, see [Restricting Access by the NFS Client's TLS Connectivity](#require-tls).

   1. (Optional) Select the **Required Authentication Mode**.
      
   1. (Optional) For **User mapping** select one of the following:
  
      * **No mapping:** Qumulo Core doesn't apply a user mapping when it accesses the NFS export and relies on default NFS protocol behavior.
        
      * **Map root to...:** Qumulo Core associates the root user that accesses the NFS export with a specific user in your Qumulo cluster.
     
      * **Map all to...:** Qumulo Core associates all users that access the NFS export with a specific user in your Qumulo cluster.
     
   1. To add a new rule, click **+ Add a Host Access Rule**.
  
   1. Click **Save**.
  
Qumulo Core applies the host access rule to the NFS export.


### To Add a Host Access Rule by Using the qq CLI

1. Prepare a list of host access rules in JSON format. The following is an example of the contents of `root_restrictions.json`.

   ```json
   {
     "restrictions": [{
       "host_restrictions": [
         "user1.accounting.example.com",
         "*.eng.example.com",
         "{{site.exampleIP0}}"
       ],
       "required_authentication_mode": "AUTHENTICATION_MODE_KRB5"
     }]
   }
   ```

1. Run the {% include qq.html command="nfs_mod_export" %} command and specify the export path and the file with the host access rules. For example:

   ```bash
   qq nfs_mod_export \
     --export-path / \
     --restrictions root_restrictions.json
   ```

   {{site.exampleOutput}}

   ```json
   {
     "description": "",
     "export_path": "/",
     "fields_to_present_as_32_bit": [],
     "fs_path": "/",
     "id": "1",
     "restrictions": [{
       "host_restrictions": [
         "user1.accounting.example.com",
         "*.eng.example.com",
         "{{site.exampleIP0}}"
       ],
       "read_only": false,
       "required_authentication_mode": "AUTHENTICATION_MODE_KRB5",
       "require_privileged_port": false,
       "user_mapping": "NFS_MAP_NONE"
     }],
     "tenant_id": 1
   }
   ```

### To Add an NFS over TLS Host Access Rule by Using the Qumulo Core Web UI

1. {{site.logIntoWebUI}}

1. Click **Sharing > NFS Exports**.

1. For an NFS export, in the **Actions** column, click {% include shared_inline_image.html alt="Edit" file="shared-images/admin-guides/edit.png" max-width="40" %}.

1. On the **NFS Export** page, in the **Host Access Rules** section, for each rule whose hosts must use NFS over TLS, click **Require TLS**.

1. Click **Save**.

On the **NFS Exports** page, the **Require TLS** column shows which exports require TLS.

### To Add an NFS over TLS Host Access Rule by Using the qq CLI
{{site.data.alerts.important}}
<ul>
  <li>When you replace all of an export's host access rules by using the <code>--restrictions</code> flag of the {% include qq.html command="nfs_modify_export" %} command or the <a href="https://docs.qumulo.com/rest-api-guide/nfs-methods-v3/v3_nfs_exports_export_id.html"><code>/v3/nfs/exports/{export_id}</code></a> Qumulo REST API endpoint, include <code>require_tls</code> for each rule. A rule written without it doesn't require TLS.</li>
  <li>A <code>qq</code> CLI from a Qumulo Core version lower than 7.11.0 turns off <strong>Require TLS</strong> for every rule when it creates an export or replaces an export's host access rules, even if the rules file specifies <code>require_tls</code>. To manage exports that require TLS, use the <code>qq</code> CLI from Qumulo Core 7.11.0 (or higher).</li>
</ul>
{{site.data.alerts.end}}

1. To require TLS for an existing host access rule, run the {% include qq.html command="nfs_modify_export_host_access" %} command with the `modify_entry` subcommand, specify the export path and the rule's position, and use the `--require-tls` flag. For example:

   ```bash
   qq nfs_modify_export_host_access \
     --export-path /data \
     modify_entry \
     --position 1 \
     --require-tls
   ```

   To stop requiring TLS, use the `--no-require-tls` flag instead. To add a new rule that requires TLS, use the `add_entry` subcommand with the `--require-tls` flag.

1. To check the export's host access rules, run the {% include qq.html command="nfs_get_export" %} command and specify the export path. For example:

   ```bash
   qq nfs_get_export --export-path /data
   ```

   {{site.exampleOutput}}

   ```
   ID:          2
   Export Path: /data
   Tenant ID:   1
   FS Path:     /data
   Description:
   32bit-mapped fields: None
   Host Access:
   ID  Hosts           Authentication Mode       Access Options
   ==  ==============  ========================  =========================================
   1   {{site.exampleNetworkSegment1}}  AUTHENTICATION_MODE_NONE  rw, insecure, xprtsec=tls, no_root_squash
   ```

   For a rule that requires TLS, the `Access Options` column shows `xprtsec=tls`.

### To Require NFS over TLS while Permitting Some Clients to Mount in Plaintext
While you move clients to NFS over TLS, you can require TLS only for the hosts that have already moved. Because Qumulo Core applies the first rule that matches a client, add a rule that requires TLS for the moved hosts and put it above the rule that matches the other hosts. For example:

| Position | Hosts                                            | Require TLS |
|----------|--------------------------------------------------|-------------|
| 1        | `{{site.exampleNetworkSegment1}}` (moved to TLS) | Yes         |
| 2        | `*`                                              | No          |

To insert a rule at the top of the list, run the {% include qq.html command="nfs_modify_export_host_access" %} command with the `add_entry` subcommand, and specify `0` for the `--insert-after` flag. For example:

```bash
qq nfs_modify_export_host_access \
  --export-path /data \
  add_entry \
  --hosts {{site.exampleNetworkSegment1}} \
  --insert-after 0 \
  --require-tls
```

As more hosts move, widen the first rule. When most hosts have moved, you can reverse the arrangement: put a rule without **Require TLS** for the hosts that still mount in plaintext first, and a rule with **Require TLS** for all hosts (`*`) below it.

An NFSv4.1 TLS mount that a client makes while it has a plaintext NFSv4.1 mount of the same node open sends its traffic in plaintext, and a rule with **Require TLS** refuses that traffic. For this reason, count a host as moved only when it has no plaintext NFSv4.1 mounts of the cluster left and the `findmnt` command shows `xprtsec=tls` for each of its mounts of the cluster. For more information, see [Mixing TLS and Plaintext Mounts on One Client](nfs-over-tls-enabling-using.html#mixing-tls-and-plaintext-mounts-on-one-client).


## To Troubleshoot Host Access Rules for an NFS Export
This section describes the troubleshooting steps for a scenario in which an NFS client can't mount or access an NFS export.

{% capture multiDNS %}Currently, if you use multiple DNS servers, the {% include qq.html command="dns_resolve_hostnames" %} and {% include qq.html command="dns_resolve_ips" %} commands aren&apos;t tenant-aware and might not return the same results as the DNS resolution mechanism in NFS.{% endcapture %}
{% include note.html content=multiDNS %}

1. To view the NFS export's host access rules, run the {% include qq.html command="nfs_get_export" %} command and specify the export path. For example:

   ```bash
   qq nfs_get_export --export-path /
   ```

   {{site.exampleOutput}}

   ```
   ID:          1
   Export Path: /
   Tenant ID:   1
   FS Path:     /
   Description: 
   32bit-mapped fields: None
   Host Access:
   ID  Hosts                          Access Options
   ==  =============================  ============================
   1   user1.accounting.example.com   rw, insecure, no_root_squash
   ```

   In this example, only the machine `user1.accounting.example.com` can access the NFS export at `/`.

1. To find the client's IP address, we recommend viewing your Qumulo cluster logs. For example:

   ```
   Client {{site.exampleIP2}} is not authorized to use export ExportId(1)
   ```

1. To find the client's hostname, run the {% include qq.html command="dns_resolve_ips" %} command and specify the client's IP address. For example:

   ```bash
   qq dns_resolve_ips --ips {{site.exampleIP2}}
   ```

   {{site.exampleOutput}}

   ```json
   [{
     "hostname": "user2.accounting.example.com",
     "ip_address": "{{site.exampleIP2}}",
     "result": "OK"
   }]
   ```

   In this example, the `{{site.exampleIP2}}` IP address maps to `user2.accounting.example.com`.

1. To troubleshoot the NFS client, you can take one or more of the following steps:

   * Ensure the NFS client configuration entry is correct.
     
   * Run the {% include qq.html command="dns_resolve_ips" %} command to verify that the IP address maps to the correct name.
   
   * Update the host access rules for `user2.accounting.example.com`.
     
   * Ensure that your Qumulo cluster's DNS cache isn't out of date, for example, if `{{site.exampleIP2}}` should resolve to `user1.accounting.example.com`.
   
     To reset your Qumulo cluster's DNS cache, run the {% include qq.html command="dns_clear_cache" %} command.

   * Run the {% include qq.html command="dns_resolve_hostnames" %} command and specify the hostname to perform a lookup for `user1.accounting.example.com`.
  
     {{site.exampleOutput}}

     ```json
     [{
       "hostname": "user2.accounting.example.com",
       "ip_addresses": ["{{site.exampleIP1}}"],
       "result": "OK"
     }]
     ```

   * Run the {% include qq.html command="dns_resolve_ips" %} command to find the hostname for your client's IP address and&hellip;
  
     * If the NFS client can't access a share, but should be able to, add the IP address to the NFS export's host access rules.
       
     * If the NFS client can access a share, but shouldn't be able to, remove the IP address from the NFS export's host access rules.


## Optimizing Your System for Reverse-DNS Look-Ups {#optimize-for-reverse-dns}
Qumulo Core checks hostnames by performing a reverse-DNS lookup on the cluster. Because continuous reverse-DNS look-ups can affect system performance, Qumulo Core caches the results on the cluster. Because Qumulo Core's cache abides by the DNS TTL, a low TTL can cause cache entries to expire frequently, which might require a new query.

By increasing TTL, you can reduce the number of DNS requests that your cluster makes. However, this might cause your cluster to keep outdated results for a longer time. For the most optimal configuration, list your organization's DNS servers first in your DNS configuration.

To bypass DNS, you can set explicit IP-host mappings for your cluster by using the {% include qq.html command="dns_set_lookup_overrides" %} command. If Qumulo Core finds an override for an IP address or host, it uses the override instead of the DNS cache.

In the following JSON example, the IP address `{{site.exampleIP2}}` binds to the host `user3.accounting.qumulo.com` explicitly.

```json
{
  "lookup_overrides": [{
    "aliases": ["user3.accounting.example.com"],
    "ip_address": "{{site.exampleIP2}}"
  }]
}
```
