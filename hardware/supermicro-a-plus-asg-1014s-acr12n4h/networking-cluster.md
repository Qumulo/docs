---
title: "Networking Your Supermicro A+ ASG-1014S-ACR12N4H Cluster"
summary: "This section explains how to network your Supermicro A+ ASG-1014S-ACR12N4H cluster."
permalink: hardware/supermicro-a-plus-asg-1014s-acr12n4h/networking-cluster.html
sidebar: hardware_sidebar
keywords: network, networking, cluster, switch, Ethernet, ports, IP, Supermicro 1014S, ACR12N4H
---

This section explains the networking prerequisites, outlines the recommended configuration, and explains how you can connect to redundant switches or to a single switch.

{% include content-reuse/see-technical-specifications.md %}

##  Prerequisites
{{site.data.alerts.note}}
{{site.unifyNetJumboFrames}}
{{site.data.alerts.end}}

Your node requires the following resources.
* A network switch with the following specifications:

  * 25 Gbps or 100 Gbps Ethernet
  
  * Fully non-blocking architecture

  * IPv6 capability

* Compatible networking cables

* A sufficient number of ports for connecting all nodes to the same switch fabric

* One static IP per node, per defined VLAN


## Recommended Configuration
{{site.unifyNetDefine}} However, for greater reliability, we recommend connecting both 25 Gbps or 100 Gbps ports on every node to each switch.

We recommend the following configuration for your node.

* Your Qumulo MTU configured to match your client environment

* One physical connection per node, per each redundant switch

* One Link Aggregation Control Protocol (LACP) port-channel per network on each node, with the following configuration

  * Active mode

  * Slow transmit rather

  * Access port or trunk port with a native VLAN

* DNS servers

* A Network Time Protocol (NTP) server

* Firewall protocols or ports allowed for proactive monitoring

* Where `N` is the number of nodes, `N-1` floating IPs per node, per client-facing VLAN


## Connecting to Redundant Switches
For redundancy, we recommend connecting a {{site.sm1014s}} cluster to dual switches. If either switch becomes inoperative, the cluster is still be accessible from the remaining switch.

* **Unified Networking**

  * Connect the two NIC ports (2 &#215; 25 Gbps or 100 Gbps) on your nodes to separate switches.

  * The uplinks to the client network must equal the bandwidth from the cluster to the switch.

  * The two ports form an LACP port channel using a multi-chassis link aggregation group.

  * Use an appropriate inter-switch link or virtual port channel.


## Connecting to a Single Switch
You can connect a Supermicro {{site.sm1014s}} cluster to a single switch. If this switch becomes inoperative, the entire cluster becomes inaccessible.

* **Unified Networking**

  * Connect the two NIC ports (2 &#215; 25 Gbps or 100 Gbps) on your nodes to a single switch.

  * The uplinks to the client network must equal the bandwidth from the cluster to the switch.

  * The two ports form an LACP port channel. 


## Four-Node Cluster Architecture Diagram
The following is the recommended configuration for a four-node cluster connected to an out-of-band management switch and redundant switches.

{% include image.html alt="Four-Node Cluster Architecture Diagram" file="supermicro-1014s-four-node-cluster-architecture-diagram.png" url="/hardware/supermicro-a-plus-asg-1014s-acr12n4h/images/supermicro-1014s-four-node-cluster-architecture-diagram.png" %}
