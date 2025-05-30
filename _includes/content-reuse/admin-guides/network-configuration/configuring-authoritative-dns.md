## How Qumulo Authoritative DNS (QDNS) Enables DNS Resolution and Load Balancing
QDNS works by hosting a DNS zone directly on a Qumulo cluster. This allows Qumulo Core to:

* Send automatic DNS responses by using the floating IP addresses of nodes in a cluster
* Load-balance client traffic across nodes in a cluster
* Support resolution of IPv4 and IPv6 addresses
* Support multi-network and multi-tenant environments
* Filter queries based on client source

To enable automatic DNS responses and traffic load balancing, every Qumulo cluster hosts and manages a single fully qualified domain name (FQDN), which provides DNS records to all queries.

{% include note.html content="Regardless of the number of tenants or network configurations, it is possible to configure only one FQDN for every Qumulo cluster." %}

### DNS Access for Clients
To access the floating IP addresses of the nodes in the cluster, a client can query subdomains of the configured FQDN by using a naming format based on the network ID. For example, if the FQDN `grumpquat-lb.example.com` is configured on a cluster which has floating IP addresses from {{ site.exampleIP1 }} to {{ site.exampleIP4 }}, a query to `1.grumpquat-lb.example.com` returns one of the floating IP addresses by using load balancing.

{% include note.html content="The base domain never resolves to an IP address." %}

To simplify client access, you can configure `CNAME` records that point to the network-specific domain. For example:

```
CNAME grumpquat.qumulo.com. 1.grumpquat-lb.qumulo.com.
```

This allows client connections to `grumpquat.example.com` to benefit from load-balanced traffic distribution.


## Prerequisites
Before you enable QDNS on your Qumulo cluster, ensure that you have:

* Administrative access to your Qumulo cluster
* Permissions to configure DNS (for example, create `NS` records) and DNS delegation for your domain

<a id="configure-dns-delegation"></a>
### Configuring DNS Delegation for Your Domain
To route DNS queries from your cluster's FQDN to QDNS, you must configure DNS delegation according to your DNS provider:

* **Microsoft DNS:** Create a _delegated zone_. For more information, see [Manage DNS zones using DNS server in Windows Server](https://learn.microsoft.com/en-us/windows-server/networking/dns/manage-dns-zones) in the Windows Server documentation.

* **Infoblox:** Configure _zone delegation_. For more information, see [Configuring Delegated, Forward, and Stub Zones](https://docs.infoblox.com/space/NAG8/22251653/Configuring+Delegated%2C+Forward%2C+and+Stub+Zones) in the Infoblox documentation.

* **Other DNS Providers:** If you use a cloud DNS provider (such as Amazon Route 53, Microsoft Azure DNS, or Google Cloud DNS) and the cloud service isn't able to communicate with your Qumulo cluster directly, you must create `NS` (Name Server) records in the parent zone and point them to your Qumulo cluster's name server IP addresses. For example:

  ```
  grumpquat-lb.example.com. NS grumpquat-lb-ns1.example.com.
  grumpquat-lb.example.com. NS grumpquat-lb-ns2.example.com.
  grumpquat-lb.example.com. NS grumpquat-lb-ns3.example.com.
    
  grumpquat-lb-ns1.example.com. A {{ site.exampleIP1 }}
  grumpquat-lb-ns2.example.com. A {{ site.exampleIP2 }}
  grumpquat-lb-ns3.example.com. A {{ site.exampleIP3 }}
  ```

  When you specify the name server IP addresses, use approximately four floating IP addresses from your Qumulo cluster which will act as the DNS endpoints that respond to queries for the delegated zone.

  {% include important.html content="If you use a cloud-hosted DNS resolver, the resolver must be able to reach the nodes in your Qumulo cluster." %}


## Configuring QDNS by Using the qq CLI
This section explains how to enable QDNS, restrict DNS queries to specific client IP addresses, remove host restrictions from DNS queries, modify the fully qualified domain name (FQDN) for your QDNS configuration, and disable QDNS by using the `qq` CLI.

### To Enable QDNS for All Nodes
Use the {% include qq.html command="authoritative_dns_modify_settings" %} command with the `--enable` flag and specify your FQDN. For example:

```bash
qq authoritative_dns_modify_settings \
  --enable \
  --fqdn grumpquat-lb.example.com.
```
{% capture neverForget %}Include the trailing dot at the end of your FQDN.{% endcapture %}
{% include tip.html content=neverForget %}

### To View the Current QDNS Configuration
Use the {% include qq.html command="authoritative_dns_get_settings" %} command.

{{site.exampleOutput}}

```json
{
  "enabled": true,
  "fqdn": "grumpquat-lb.example.com.",
  "host_restrictions": ["{{ site.exampleNetworkSegment1 }}", "{{ site.exampleIP42 }}"]
}
```

### To Restrict DNS Queries to Specific Client IP Addresses
To limit DNS queries to authorized resolvers, add host restrictions to your QDNS configuration.

{% include tip.html content="You can specify multiple IP addresses or CIDR blocks separated by spaces." %}

Use the {% include qq.html command="authoritative_dns_modify_settings" %} command and specify the host restrictions. For example:

```bash
qq authoritative_dns_modify_settings \
  --host-restrictions {{ site.exampleNetworkSegment1 }} {{ site.exampleIP42 }}
```

In this example, the command restricts DNS queries to the {{ site.exampleNetworkSegment1 }} subnet and the IP address {{ site.exampleIP42 }}.

### To Remove Host Restrictions from DNS Queries
Use the {% include qq.html command="authoritative_dns_modify_settings" %} command with the `--disable-host-restrictions` flag.

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

### To Disable QDNS for All Nodes
Use the {% include qq.html command="authoritative_dns_modify_settings" %} command with the `--disable` flag.

{% include note.html content="When you disable QDNS, any previously configured FQDN and host restrictions remain on the cluster in an inactive state." %}
