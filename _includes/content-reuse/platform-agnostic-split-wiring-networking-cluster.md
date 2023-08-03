## Prerequisites

* A network switch with the following criteria:
  * {{include.ethernetSpeed}} Ethernet connection
  * Fully non-blocking architecture
  * IPv6 compatibility
* Compatible network cables
* A sufficient number of ports for connecting all nodes to the same switch fabric
* One static IP for each node, for each defined VLAN

{% include important.html content="Before you connect any Qumulo-supported equipment to your network, we strongly recommend consulting with your network engineering team." %}

## Recommended Configuration

* One set of redundant switches for the front-end network, with an MTU that matches that of the clients that use the storage cluster. Typically, we recommend 1,500 MTU but in some instances 9,000 MTU is the optimal setting.
* One set of redundant switches for the back-end network (9,000 MTU minimum)
* One physical connection to each redundant switch, for each node
* One Link Aggregation Control Protocol (LACP) port-channel for each network (front-end and back-end) on each node with the following configuration:
  * Active mode
  * Slow transmit rate
  * Trunk port with a native VLAN
* DNS servers
* Network Time Protocol (NTP) server
* Firewall protocol or ports configured for [Qumulo Care Proactive Monitoring](https://care.qumulo.com/hc/en-us/articles/115007283828)
* Where `N` is the number of nodes, up to 10 `N-1` floating IP addresses for each node, for each client-facing VLAN
* Nodes connected at their maximum Ethernet speed (this ensures advertised performance). To avoid network bottlenecks, Qumulo validates system performance with this configuration by using clients connected at the same link speed and to the same switch as the nodes.

## Connecting to Redundant Switches

This section explains how to connect a four-node cluster to dual switches for redundancy. We recommend this configuration. If either switch becomes inoperative, the cluster remains accessible through the remaining switch.

* **Front End**
  * Connect the two front-end {{include.ethernetSpeed}} ports on your nodes to separate switches.
  * The uplinks to the client network must equal the bandwidth from the cluster to the switch.
  * The two ports form an LACP port channel by using a multi-chassis link aggregation group.
* **Back End**
  * Connect the two back-end {{include.ethernetSpeed}} NIC ports on your nodes to separate switches.
  * Use an appropriate inter-switch link or virtual port channel.
* **MTU**
  * For all connection speeds, the default behavior is that of an LACP with 1,500 MTU for the front-end and 9,000 MTU for the back-end.

## Connecting to a Single Switch

This section explains how to connect a four-node cluster to a single switch.

* **Front End**
  * Each node has two front-end {{include.ethernetSpeed}} NIC ports connected to a single switch.
  * The uplinks to the client network must equal the bandwidth from the cluster to the switch.
  * The two ports form an LACP port channel.
* **Back End**
  * Each node has two back-end {{include.ethernetSpeed}} ports connected to a single switch.
* **MTU**
  * For all connection speeds, the default behavior is that of an LACP with 1,500 MTU for the front-end and 9,000 MTU for the back-end.
 
## Four-Node Cluster Architecture Diagrams

The following is the recommended configuration for a four-node cluster connected to an out-of-band management switch, redundant front-end switches, and redundant back-end switches.

{% include image.html alt="Platform-Agnostic Unified Networking Four-Node Cluster Architecture Diagram" file="../../platform-agnostic/images/platform-agnostic-split-networking-four-node-cluster.png" %}
