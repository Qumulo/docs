<a id="host-access-rule"></a>

In Qumulo Core 6.2.0.1, you can add a host access rule to an NFS export to restrict the export by IP address or hostname.

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
* **Allowed Kerberos Security Flavors**
  To restrict access to NFSv4.1 clients that use only specific Kerberos security flavors, add the following special strings to the list of host access rules. For example:
  * `KRB5P@`: Allow only encrypted access for the specified export.
  * `KRB5@`, `KRB5I@`, and `KRB5P@`: Allow any Kerberos-authenticated access, but not `AUTH_SYS` access.
  For more information, see [Choosing a Kerberos Security Flavor](../kerberos/kerberos-with-qumulo-core.html#choosing-a-kerberos-security-flavor)

{% include important.html content="If you don't specify a host access rule, Qumulo Core allows access to all IP addresses." %}


## Prerequisites
To be able to use hostnames, you must:

* Enable and configure reverse lookups on your DNS server.
  
* Use fully qualified domain names (FQDNs).

* Use wildcards carefully because they match only one hostname level. For example, `*.accounting.example.com` matches `user1.accounting.example.com` but not `machine.user1.accounting.example.com`.

* [Optimize your system for reverse-dns lookups.](#optimize-for-reverse-dns)


## Adding a Host Access Rule to an Existing NFS Export
This section explains how you can add a host access rule to an existing NFS export by using the Web UI or the `qq` CLI.

### To Add a Host Access Rule by Using the Web UI

1. Log in to Qumulo Core.

1. Click **Sharing > NFS Exports**.

1. For an NFS export, in the **Actions** column, click {% include shared_inline_image.html alt="Edit" file="shared-images/admin-guides/edit.png" max-width="40" %}.

1. On the **NFS Export** page, in the **Host Access Rules** section, do the following:

   1. For **Allowed Hosts**, enter a comma-separated [host access rule.](#host-access-rule)

   1. (Optional) To ensure that the allowed hosts have limited access to the NFS export, click **Read-only**.
      
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
       ]
     }]
   }
   ```

1. Use the `qq nfs_mod_export` command and specify the export path and the file with the host access rules. For example:

   ```bash
   qq nfs_mod_export \
     --export-path / \
     --restrictions root_restrictions.json
   ```

   {{page.varExampleJSONoutput}}

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
       "require_privileged_port": false,
       "user_mapping": "NFS_MAP_NONE"
     }],
     "tenant_id": 1
   }
   ```


## To Troubleshoot Host Access Rules for an NFS Export
This section describes the troubleshooting steps for a scenario in which an NFS client can't mount or access an NFS export.

{% include note.html content="Currently, if you use multiple DNS servers, the <code>dns_resolve_hostnames</code> and <code>dns_resolve_ips</code> commands aren&apos;t tenant-aware and might not return the same results as the DNS resolution mechanism in NFS." %}

1. To view the NFS export's host access rules, run the `qq nfs_get_export` command and specify the export path. For example:

   ```bash
   qq nfs_get_export --export-path /
   ```

   The following is example output from the command.

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

1. <a id="dns_resolve_ips"></a>

   To find the client's hostname, use the `qq dns_resolve_ips` command and specify the client's IP address. For example:

   ```bash
   qq dns_resolve_ips --ips {{site.exampleIP2}}
   ```

   {{page.varExampleJSONoutput}}

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
     
   * Use the [`dns_resolve_ips`](#dns_resolve_ips) command to verify that the IP address maps to the correct name.
   
   * Update the host access rules for `user2.accounting.example.com`.
     
   * Ensure that your Qumulo cluster's DNS cache isn't out of date, for example, if `{{site.exampleIP2}}` should resolve to `user1.accounting.example.com`.
   
     To reset your Qumulo cluster's DNS cache, use the `qq dns_clear_lookup_cache` command.

   * Use the `qq dns_resolve_hostnames` command and specify the hostname to perform a lookup for `user1.accounting.example.com`.
  
     The following is example output from the command.

     ```json
     [{
       "hostname": "user2.accounting.example.com",
       "ip_addresses": ["{{site.exampleIP1}}"],
       "result": "OK"
     }]
     ```

   * Use the `qq dns_resolve_ips` command to find the hostname for your client's IP address and:
  
     * If the NFS client can't access a share, but should be able to, add the IP address to the NFS export's host access rules.
       
     * If the NFS client can access a share, but shouldn't be able to, remove the IP address from the NFS export's host access rules.


<a id="optimize-for-reverse-dns"></a>
## Optimizing Your System for Reverse-DNS Lookups
Qumulo Core checks hostnames by performing a reverse-DNS lookup on the cluster. Because continuous reverse-DNS lookups can affect system performance, Qumulo Core caches the results on the cluster. Because Qumulo Core's cache abides by the DNS TTL, a low TTL can cause cache entries to expire frequently, which might require a new query.

By increasing TTL, you can reduce the number of DNS requests that your cluster makes. However, this might cause your cluster to keep outdated results for a longer time. For the most optimal configuration, list your organization's DNS servers first in your DNS configuration.

To bypass DNS, you can set explicit IP-host mappings for your cluster by using the `qq dns_set_lookup_overrides` command. If Qumulo Core finds an override for an IP address or host, it uses the override instead of the DNS cache.

In the following JSON example, the IP address `{{site.exampleIP2}}` binds to the host `user3.accounting.qumulo.com` explicitly.

```json
{
  "lookup_overrides": [{
    "aliases": ["user3.accounting.example.com"],
    "ip_address": "{{site.exampleIP2}}"
  }]
}
```
