---
title: "Networking Your Supermicro A+ ASG-1014S-ACR12N4H Cluster"
summary: "This section explains how to network your Supermicro A+ ASG-1014S-ACR12N4H cluster."
permalink: hardware/supermicro-a-plus-asg-1014s-acr12n4h/networking-cluster.html
sidebar: hardware_sidebar
keywords: network, networking, cluster, switch, Ethernet, ports, IP, Supermicro 1014S, ACR12N4H
---

This section explains the networking prerequisites, outlines the recommended configuration, and explains how you can connect to redundant switches or to a single switch.

{% include content-reuse/see-technical-specifications.md %}

{{site.sm1014sSpecs}}

##  Prerequisites
{% include important.html content="Before you create your Qumulo cluster, you must configure all switch ports connected to the back-end NIC to have at least 9,000 MTU, with Jumbo Frames enabled." %}

Your node requires the following resources.
* A network switch with the following specifications:

  * 25 Gbps or 100 Gbps Ethernet
   
    {% include note.html content="You can use 40 Gbps connections with 40 Gbps transceivers." %}

  * Fully non-blocking architecture

  * IPv6 capability

  * Jumbo Frame support (9,000 MTU minimum) for the back-end network

* Compatible networking cables

* A sufficient number of ports for connecting all nodes to the same switch fabric

* One static IP per node, per defined VLAN


## Recommended Configuration
{% include important.html content="We don't recommend connecting to a single back-end NIC port because the node becomes unavailable if the single connection fails." %}

The {{site.sm1014s}} platform uses a networking configuration in which different NICs handle back-end and front-end traffic. You can connect the front-end and back-end NICs to the same switch or to different switches. However, for greater reliability, we recommend connecting all four 100 Gbps ports on every node: Connect both front-end NIC ports to the front-end switch and both back-end NIC ports to the back-end switch.

We recommend the following configuration for your node.

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


## Connecting to Redundant Switches
For redundancy, we recommend connecting a Supermicro {{site.sm1014s}} cluster to dual switches. If either switch becomes inoperative, the cluster is still be accessible from the remaining switch.

* **Front End**

  * Connect the two front-end NIC ports (2 &#215; 100 Gbps) on your nodes to separate switches.

  * The uplinks to the client network must equal the bandwidth from the cluster to the switch.

  * The two ports form an LACP port channel using a multi-chassis link aggregation group.

* **Back End**

  * Connect the two back-end NIC ports (2 &#215; 100 Gbps) on your nodes to separate switches.

  * Use an appropriate inter-switch link or virtual port channel.

* **MTU**

  * For all connection speeds, the default behavior is that of an LACP with 1,500 MTU for the front-end and 9,000 MTU for the back-end interfaces.


## Connecting to a Single Switch
You can connect a Supermicro {{site.sm1014s}} cluster to a single switch. If this switch becomes inoperative, the entire cluster becomes inaccessible.

* **Front End**

  * Each node has two front-end NIC ports (2 &#215; 100 Gbps) connected to a single switch.

  * The uplinks to the client network must equal the bandwidth from the cluster to the switch.

  * The two ports form an LACP port channel. 

* **Back End**

  * Each node has two band-end ports (2 &#215; 100 Gbps) connected to a single switch.

* **MTU**

  * For all connection speeds, the default behavior is that of an LACP with 1,500 MTU for the front-end and 9,000 MTU for the back-end interfaces.


## Four-Node Cluster Architecture Diagram
The following is the recommended configuration for a four-node cluster connected to an out-of-band management switch, redundant front-end switches, and redundant back-end switches.

{% include image.html alt="Four-Node Cluster Architecture Diagram" file="supermicro-four-node-cluster-architecture-diagram.png" url="/hardware/supermicro-a-plus-asg-1014s-acr12n4h/images/supermicro-1014s-four-node-cluster-architecture-diagram.png" %}
