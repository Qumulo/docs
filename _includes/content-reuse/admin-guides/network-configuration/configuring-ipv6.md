{{site.data.alerts.note}}
<ul>
  <li>The Qumulo Core Web UI doesn't show the default gateway for IPv6.</li>
  <li>As for IPv4, you can configure one untagged IPv6 network by using VLAN 0 or multiple tagged networks by using VLAN 1-4094 statically.</li>
  <li>It is possible to configure an IPv4 network alongside an IPv6 network on any VLAN.</li>
  <li>Currently, Qumulo Core doesn't support VPN connections by using IPv6.</li>
</ul>
{{site.data.alerts.end}}

## To Configure IPv6 by Using the qq CLI

1. To specify the default gateway for IPv4 and IPv6 traffic, use the {% include qq.html command="network_mod_interface" %} command. For example:

   ```bash
   qq network_mod_interface --default-gateway {{site.exampleGateway1}} \
     --default-gateway-ipv6 {{site.exampleIPv60}} \
     --mtu 1500
   ```

1. To specify IPv6 addresses for your Qumulo cluster, use the {% include qq.html command="network_mod_network" %} command to modify the default network configuration. For example:

   ```bash
   qq network_mod_network --network-id 1 \
     --assigned-by STATIC \
     --netmask {{site.exampleNetworkSegmentIPv62}} \
     --ip-ranges {{site.exampleIPv6range1}} \
     --floating-ip-range {{site.exampleIPv6range2}} \
     --dns-servers {{site.exampleIPv61}} \
       {{site.exampleIPv62}} \
     --dns-search-domains example.com
   ```

   {% include note.html content="For IPv6 networks, you can specify subnets by using CIDR notation (for example, `2001:DB8/32`) or by using a standard netmask (for example, `ffff:ffff:ffff:ffff::`)." %}

1. To verify the configuration and confirm the assigned IPv6 addresses, uses the {% include qq.html command="network_poll" %} command.

1. (Optional) to check that the assigned IPv6 addresses are accessible, use the `ping` command with the IPv6 address of a node in your cluster.
