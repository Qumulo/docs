## Prerequisites
{{site.data.alerts.note}}
{{site.jumboFramesPrereq}}
{{site.data.alerts.end}}

Your node requires the following resources.

* A network switch with the following specifications:

  * 100 Gbps Ethernet
  
  * Fully non-blocking architecture

  * IPv6 capability

* Compatible networking cables

* A sufficient number of ports for connecting all nodes to the same switch fabric

* One static IP for each node, for each defined VLAN


## Recommended Configuration
* **Single NIC:** {{site.unifyNetDefine}} However, for greater reliability, we recommend connecting both 100 Gbps ports on every node to each switch.

* **Dual NIC:** {{site.splitNetDefine}} However, for greater reliability, we recommend connecting all four 100 Gbps ports on every node: Connect both front-end NIC ports to the front-end switch and both back-end NIC ports to the back-end switch.

  {% capture noSingleNIC %}{{site.splitNetDontConnectSingleNIC}}{% endcapture %}
  {% include important.html content=noSingleNIC %}

We recommend the following configuration for your node.

* Your Qumulo MTU configured to match your client environment

* Physical connections

  * **Single NIC:** Two physical connections for each node, one connection for each redundant switch

  * **Dual NIC:** One physical connection for each node, for each redundant switch

* One Link Aggregation Control Protocol (LACP) port-channel for each network on each node, with the following configuration

  * Active mode

  * Slow transmit rather

  * Access port or trunk port with a native VLAN

* DNS servers

* A Network Time Protocol (NTP) server

* Firewall protocols or ports allowed for proactive monitoring

* Where `N` is the number of nodes, `N-1` floating IPs for each node, for each client-facing VLAN


## Connecting to Redundant Switches
For redundancy, we recommend connecting your cluster to dual switches. If either switch becomes inoperative, the cluster is still be accessible from the remaining switch.

### Single NIC

* Connect the two NIC ports (2 &#215; 100 Gbps) on your nodes to separate switches.

* The uplinks to the client network must equal the bandwidth from the cluster to the switch.

* The two ports form an LACP port channel by using a multi-chassis link aggregation group.

* Use an appropriate inter-switch link or virtual port channel.

### Dual NIC

* **Front End**

  * Connect the two front-end NIC ports (2 &#215; 100 Gbps) on your nodes to separate switches.

  * The uplinks to the client network must equal the bandwidth from the cluster to the switch.

  * The two ports form an LACP port channel by using a multi-chassis link aggregation group.

* **Back End**

  * Connect the two back-end NIC ports (2 &#215; 100 Gbps) on your nodes to separate switches.

  * Use an appropriate inter-switch link or virtual port channel.

* **Link Aggregation Control Protocol (LACP)**

  * For all connection speeds, the default behavior is that of an LACP with 1,500 MTU for the front-end and 9,000 MTU for the back-end interfaces.


## Connecting to a Single Switch
You can connect a your cluster to a single switch. If this switch becomes inoperative, the entire cluster becomes inaccessible.

### Single NIC

* Connect the two NIC ports (2 &#215; 100 Gbps) on your nodes to a single switch.

* The uplinks to the client network must equal the bandwidth from the cluster to the switch.

* The two ports form an LACP port channel.

### Dual NIC

* **Front End**

  * Connect the two front-end NIC ports (2 &#215; 100 Gbps) to a single switch.

  * The uplinks to the client network must equal the bandwidth from the cluster to the switch.

  * The two ports form an LACP port channel.

* **Back End**

  * Connect the two band-end ports (2 &#215; 100 Gbps) to a single switch.

  * Link Aggregation Control Protocol (LACP)

  * For all connection speeds, the default behavior is that of an LACP with 1,500 MTU for the front-end and 9,000 MTU for the back-end interfaces.
