## How QDNS Enables DNS Resolution and Load Balancing
QDNS allows your Qumulo cluster to provide load balancing for inbound connections by hosting a delegated DNS zone. QDNS supports:

* Any IPv4 or IPv6 floating IP addresses in your cluster

* Independent resolution for each Qumulo network and tenant

* Restrictions on the sources of DNS queries

* Connection balancing for each node

To enable automatic DNS responses and traffic load balancing, every Qumulo cluster hosts and manages a single fully qualified domain name (FQDN) that provides DNS records to all queries.

{{site.data.alerts.note}}
<ul>
  <li>Regardless of the number of tenants or network configurations, it is possible to configure only one FQDN for every Qumulo cluster.</li>
  <li>QDNS uses the naming convention <code>&lt;NetworkID&gt;.&lt;ClusterFQDN&gt;</code>. For example, <code>1.my-cluster.example.com</code> indicates network ID 1 for cluster <code>my-cluster.example.com</code>.</li>
</ul>
{{site.data.alerts.end}}

### DNS Resolution Example
The following example shows how clients resolve hostnames by using DNS in Qumulo Core.

1. A client attempts to mount `storage.example.com`.

1. The client queries its DNS resolver for the IP address of `storage.example.com`.

1. The DNS resolver determines that `storage.example.com` is a `CNAME` for `1.my-cluster.example.com`.

1. The DNS resolver determines that `my-cluster.example.com` is a delegated zone managed by the DNS server `qumulo-node1.example.com`.

1. The DNS resolver queries QDNS for the IP address of `1.my-cluster.example.com`.

1. QDNS returns the IP address `{{site.exampleIP4}}` for `1.my-cluster.example.com`.

1. The DNS resolver returns the IP address `{{site.exampleIP4}}` as the resolved address for the `CNAME` `storage.example.com`.

1. The client connects to `{{site.exampleIP4}}`.

## Prerequisites
Before you enable QDNS on your Qumulo cluster, ensure that you have:

* Administrative access to your Qumulo cluster

* Permissions to configure DNS (for example, create `NS` records) and DNS delegation for your domain

<a id="configure-dns-delegation"></a>
### Configuring DNS Delegation for Your Domain
To route DNS queries from your cluster's FQDN to QDNS, you must configure DNS delegation according to your DNS provider:

* **Microsoft DNS:** Create a _delegated zone_. For more information, see [Manage DNS zones using DNS server in Windows Server](https://learn.microsoft.com/en-us/windows-server/networking/dns/manage-dns-zones) in the Windows Server documentation.

* **Infoblox:** Configure _zone delegation_. For more information, see [Configuring Delegated, Forward, and Stub Zones](https://docs.infoblox.com/space/NAG8/22251653/Configuring+Delegated%2C+Forward%2C+and+Stub+Zones) in the Infoblox documentation.

* **Other DNS Providers:** If you use a cloud DNS provider (such as Amazon Route 53, Microsoft Azure DNS, or Google Cloud DNS) and the cloud service can't communicate with your Qumulo cluster directly, you must create `NS` (Name Server) records in the parent zone and point them to your Qumulo cluster's name server IP addresses. For example:

  ```
  my-cluster.example.com. NS my-cluster-ns1.example.com.
  my-cluster.example.com. NS my-cluster-ns2.example.com.
  my-cluster.example.com. NS my-cluster-ns3.example.com.
    
  my-cluster-ns1.example.com. A {{site.exampleIP1}}
  my-cluster-ns2.example.com. A {{site.exampleIP2}}
  my-cluster-ns3.example.com. A {{site.exampleIP3}}
  ```

  When you specify the name server's IP addresses, use a minimum of three floating IP addresses from your Qumulo cluster. These floating IP addresses act as the DNS endpoints that respond to queries for the delegated zone.

  {% include important.html content="If you use a DNS resolver hosted in the cloud or in Active Directory, the resolver must be able to reach the nodes in your Qumulo cluster." %}


## Configuring QDNS by Using the qq CLI
This section explains how to enable QDNS, restrict DNS queries to specific client IP addresses, remove host restrictions from DNS queries, modify the fully qualified domain name (FQDN) for your QDNS configuration, and disable QDNS by using the `qq` CLI.

### To Enable QDNS for All Nodes
Use the {% include qq.html command="authoritative_dns_modify_settings" %} command with the `--enable` flag and specify your FQDN. For example:

```bash
qq authoritative_dns_modify_settings \
  --enable \
  --fqdn my-cluster.example.com.
```
{% capture neverForget %}Include the trailing dot at the end of your FQDN.{% endcapture %}
{% include tip.html content=neverForget %}

### To View the Current QDNS Configuration
Use the {% include qq.html command="authoritative_dns_get_settings" %} command.

{{site.exampleOutput}}

```json
{
  "enabled": true,
  "fqdn": "my-cluster.example.com.",
  "host_restrictions": ["{{ site.exampleNetworkSegment1 }}", "{{ site.exampleIP42 }}"]
}
```

### To Modify the Fully Qualified Domain Name (FQDN) for Your QDNS Configuration
{{site.data.alerts.important}}
<ul>
  <li>{{neverForget}}</li>
  <li>After you change the FQDN for your QDNS configuration, you must <a href="#configure-dns-delegation">reconfigure the DNS delegation</a> for your domain.</li>
</ul>
{{site.data.alerts.end}}

Use the {% include qq.html command="authoritative_dns_modify_settings" %} command and specify your FQDN.

```bash
qq authoritative_dns_modify_settings \
  --fqdn new-domain.example.com.
```

### To Restrict DNS Queries to Specific Client IP Addresses
To limit DNS queries to authorized resolvers, add host restrictions to your QDNS configuration.

{% include tip.html content="You can specify multiple IP addresses or CIDR blocks separated by spaces." %}

Use the {% include qq.html command="authoritative_dns_modify_settings" %} command and specify the host restrictions. For example:

```bash
qq authoritative_dns_modify_settings \
  --host-restrictions {{ site.exampleNetworkSegment1 }} {{ site.exampleIP42 }}
```

In this example, the command restricts DNS queries to resolvers from the {{ site.exampleNetworkSegment1 }} subnet and the IP address {{ site.exampleIP42 }}.

### To Remove Host Restrictions from DNS Queries
Use the {% include qq.html command="authoritative_dns_modify_settings" %} command with the `--disable-host-restrictions` flag.

### To Disable QDNS for All Nodes
Use the {% include qq.html command="authoritative_dns_modify_settings" %} command with the `--disable` flag.

{% include note.html content="When you disable QDNS, any previously configured FQDN and host restrictions remain on the cluster in an inactive state." %}

## Known Limits
Currently, Qumulo Core doesn't support the following functionality:

* Balancing connections across static IP addresses for any network or tenant

* Balancing connections based on node CPU capacity

* Resolving DNS queries using external DNS servers

* Resolving DNS queries for domains outside Qumulo clusters
