---
title: "HPE Proliant DL325 Gen10 Plus Network Guide"
summary: "Networking recommendations for the HPE Apollo Proliant DL325 Gen10 Plus server"
permalink: platforms/hpe-dl325-gen10-plus/network-guide.html
sidebar: platforms_sidebar
---
## In This Article

This article explains the various ways in which you can connect HPE DL325 Gen10 Plus clusters to your network.

## Requirements

-   HPE DL325 Gen10 Plus cluster
-   A network switch with the following criteria
    -   100Gbps Ethernet connection
    -   Fully non-blocking architecture
    -   IPv6 capability
-   Compatible network cables
-   Enough ports to connect all nodes to the same switch fabric
-   One static IP per node, per defined VLAN

{{site.data.alerts.tip}}
We recommend consulting with your network engineering team before connecting any Qumulo-supported equipment to your network.
{{site.data.alerts.end}}

## Configuration Recommendations

* One set of redundant switches for the front-end network, with an MTU that matches that of the clients that use the storage cluster. Typically, 1,500 MTU is recommended, but in some instances it might be 9,000 MTU.
* One set of redundant switches for the back-end network (9,000 MTU minimum)
* One physical connection per node, per each redundant switch
* One Link Aggregation Control Protocol (LACP) port-channel per network (front-end and back-end) on each node, with the following configuration
  * Active mode
  * Slow transmit rather
  * Access port or trunk port with a native VLAN
* DNS servers
* A Network Time Protocol (NTP) server
* Firewall protocols or ports allowed for proactive monitoring
* Where `N` is the number of nodes, `N-1` floating IPs per node, per client-facing VLAN
-   You can achieve advertised performance only if you connect your nodes at their maximum Ethernet speed. To avoid network bottlenecks, Qumulo validates system performance with this configuration by using clients that are connected at the same link speed and to the same switch as the nodes.

## HPE Proliant Dl325 Gen10 Plus NIC1 And NIC2 Ports

On this platform, there are two sets of NICs, one for the front-end and one for the back-end. **Important:** For your node to work correctly, you must connect at least one port in each NIC.

{% include image.html alt="" file="dl325-rear-networking.png" %}

## Connecting To A Switch

### Connecting a Cluster to Redundant Switches
For redundancy, we recommend connecting an HPE All-NVMe cluster to dual switches. If either switch becomes inoperative, the cluster will still be accessible from the remaining switch.

* **Front End**
  * Connect the two front-end NIC ports (2 &#215; 100 Gbps) on your nodes to separate switches.
  * The uplinks to the client network must equal the bandwidth from the cluster to the switch.
  * The two ports form an LACP port channel using a multi-chassis link aggregation group.
* **Back End**
  * Connect the two back-end NIC ports (2 &#215; 100 Gbps) on your nodes to separate switches.
  * Use an appropriate inter-switch link or virtual port channel.
* **MTU**
  * For all connection speeds, the default behavior is that of an LACP with 1,500 MTU for the front-end and 9,000 MTU for the back-end interfaces.

### Connecting a Cluster to a Single Switch
You can connect an HPE All-NVMe cluster to a single switch. If this switch becomes inoperative, the entire cluster will be inaccessible.

* **Front End**
  * Each node has two front-end NIC ports (2 &#215; 100 Gbps) connected to a single switch.
  * The uplinks to the client network must equal the bandwidth from the cluster to the switch.
  * The two ports form an LACP port channel.
* **Back End**
  * Each node has two band-end ports (2 &#215; 100 Gbps) connected to a single switch.
* **MTU**
  * For all connection speeds, the default behavior is that of an LACP with 1,500 MTU for the front-end and 9,000 MTU for the back-end interfaces.

