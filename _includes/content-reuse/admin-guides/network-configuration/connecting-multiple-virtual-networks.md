Each node in a Qumulo cluster has a single NIC labeled `bond0` and creates a bond between two physical ports by using either _active backup_ (a redundant configuration in which one port is active while the other is in standby mode) or _LACP_ (the aggregation of multiple, parallel network connections).

When you create a Qumulo cluster, its configuration includes a network named `Default`. The configuration uses DHCP, the bond, and a single default gateway associated with the bond.

## Step 1: Configure Default DHCP Settings
You can configure your Qumulo cluster from the default DHCP configuration. If you have already configured a single static network, skip this step and [add another network](#add-more-networks).

1. To assign a default gateway, run the {% include qq.html command="network_mod_interface" %} command. For example:

   ```bash
   qq network_mod_interface \
     --default-gateway {{site.exampleIP0}}
   ```

1. To configure the `Default` network to use static (rather than DHCP) addressing, run the {% include qq.html command="network_mod_network" %} command. For example:

   ```bash
   qq network_mod_network \
     --network-id 1\ 
     --assigned-by STATIC \
     --ip-ranges {{site.exampleIPrange2}} \
     --floating-ip-ranges {{site.exampleIPrange3}} \
     --netmask {{site.exampleNetMask1}} \
     --dns-servers {{site.exampleIP1}} \
     --dns-search-domains example.com
   ```

1. Log in to the system by using one of the assigned IP addresses.

<a id="add-more-networks"></a>
## Step 2: Add More Networks
After you configure the first network for your Qumulo cluster, you can add more networks to it.

{{site.data.alerts.note}}
<ul>
  <li>If you can add both static and floating IP addresses, they must be on the same network.</li>
  <li>You can use multiple <code>--floating-ip-ranges</code> or <code>--dns-servers</code> flags.</li>
  <li>Each VLAN can have different MTU values, as long as the MTU value of the <code>Default</code> network is equal or greater than the combined MTU values of all networks in your Qumulo cluster. To set the MTU value for the <code>Default</code> network, run the {% include qq.html command="network_mod_interface" %} command. Then, you can set an equal or smaller MTU value for the other networks.</li>
</ul>
{{site.data.alerts.end}}

1. To add a network, run the {% include qq.html command="network_add_network" %} command. For example:

   ```bash
   qq network_add_network \
     --name MyNetworkName \
     --ip-ranges {{site.exampleGatewayRange1}} \
     --floating-ip-ranges {{site.exampleGatewayRange2}} \
     --netmask {{site.exampleNetMask1}} \
     --dns-servers {{site.exampleDNSserver1}} \
     --dns-search-domains example.com \
     --mtu 1500 \
     --vlan-id 200
   ```

1. To view the details your networks, run the {% include qq.html command="network_list_networks" %} command.

1. To view the IP addresses assigned to the nodes in your cluster, run the {% include qq.html command="network_poll" %} command.
