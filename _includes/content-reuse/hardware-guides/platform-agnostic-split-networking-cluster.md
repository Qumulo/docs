{% include content-reuse/hardware-guides/platform-agnostic-identify-eth-port.md %}

##  Prerequisites
{{site.data.alerts.note}}
{{site.jumboFramesPrereq}}
{{site.data.alerts.end}}

Your node requires the following resources.
* A network switch with the following specifications:

  * Ethernet connection

  * Fully non-blocking architecture

  * IPv6 capability

* Compatible networking cables

* A sufficient number of ports for connecting all nodes to the same switch fabric

* One static IP for each node, for each defined VLAN


## Recommended Configuration
{% capture noSingleNIC %}{{site.splitNetDontConnectSingleNIC}}{% endcapture %}
{% include important.html content=noSingleNIC %}

{{site.splitNetDefine}} However, for greater reliability, we recommend connecting all four ports on every node: Connect both front-end NIC ports to the front-end switch and both back-end NIC ports to the back-end switch.

We recommend the following configuration for your node.

* Your Qumulo front-end MTU configured to match your client environment

* One set of redundant switches for the back-end network (9,000 MTU minimum)

  {% include note.html content="You can configure front-end and back-end traffic on the same switch." %}

* One physical connection for each node, for each redundant switch

* One Link Aggregation Control Protocol (LACP) port-channel for each network (front-end and back-end) on each node, with the following configuration

  * Active mode

  * Slow transmit

  * Access port or trunk port with a native VLAN

* DNS servers

* A Network Time Protocol (NTP) server

* Firewall protocols or ports allowed for proactive monitoring

* Where `N` is the number of nodes, `N-1` floating IP addresses for each node, for each client-facing VLAN


## Connecting to Redundant Switches
For redundancy, we recommend connecting your cluster to dual switches. If either switch becomes inoperative, the cluster is still be accessible from the remaining switch.

* **Front End**

  * Connect the two front-end NIC ports on your nodes to separate switches.

  * The uplinks to the client network must equal the bandwidth from the cluster to the switch.

  * The two ports form an LACP port channel by using a multi-chassis link aggregation group.

* **Back End**

  * Connect the two back-end NIC ports on your nodes to separate switches.

  * Use an appropriate inter-switch link or virtual port channel.

* **Link Aggregation Control Protocol (LACP)**

  * {{site.splitNetLACP}}


## Connecting to a Single Switch
You can connect your cluster to a single switch. If this switch becomes inoperative, the entire cluster becomes inaccessible.

* **Front End**

  * Connect the two front-end NIC ports to a single switch.

  * The uplinks to the client network must equal the bandwidth from the cluster to the switch.

  * The two ports form an LACP port channel.

* **Back End**

  * Connect the two band-end ports to a single switch.

* **Link Aggregation Control Protocol (LACP)**

  * {{site.splitNetLACP}}


## Four-Node Cluster Architecture Diagram
The following is the recommended configuration for a four-node cluster connected to an out-of-band management switch and redundant switches.
