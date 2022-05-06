---
title: "Networking Your HPE Apollo 4200 Gen9 Cluster"
summary: "This section explains how to network your HPE Apollo 4200 Gen9 cluster."
permalink: platforms/hpe-apollo-4200-gen9/networking-cluster.html
sidebar: platforms_sidebar
keywords: network, networking, cluster, switch, Ethernet, ports, IP, 90T, 180T, 288T
---

This section explains how to network your HPE Apollo 4200 Gen9 cluster.

## Prerequisites

* A network switch with the following criteria:
  * 40 Gbps Ethernet connection
  * Fully non-blocking architecture
  * IPv6 compatibility
* Compatible network cables
* A sufficient number of ports for connecting all nodes to the same switch fabric
* One static IP per node, per defined VLAN

{% include important.html content="Before you connect any Qumulo-supported equipment to your network, we strongly recommend consulting with your network engineering team." %}

## Recommended Configuration

* Two redundant switches
* One physical connection to each redundant switch, per node
* One Link Aggregation Control Protocol (LACP) port-channel per node with the following configuration:
  * Active mode
  * Slow transmit rate
  * Trunk port with a native VLAN
  * Enabled IEEE 802.3x flow control (full-duplex mode)
* DNS servers
* Network Time Protocol (NTP) server
* Firewall protocol or ports configured for [Qumulo Care Proactive Monitoring](https://care.qumulo.com/hc/en-us/articles/115007283828-Qumulo-Care-Proactive-Monitoring)
* Where N is the number of nodes, up to 10 N-1 floating IP addresses per node, per client-facing VLAN

  {% include note.html content="The number of floating IP addresses depends on your workflow and on the clients that connect to the cluster, with a minimum of two floating IP addresses per node, per client-facing VLAN, but with no more than ten floating IP addresses per node, per client-facing VLAN&mdash;or 70 floating IP addresses per namespace." %}

* Nodes connected at their maximum Ethernet speed (this ensures advertised performance). To avoid network bottlenecks, Qumulo validates system performance with this configuration by using clients connected at the same link speed and to the same switch as the nodes.

## Node NICs and Ports
The following diagrams show the NICs and ports on HPE Apollo 4200 Gen9 nodes.

### 90T NIC1 Ports

{% include image.html alt="NIC1 ports on the HPE Apollo 4200 Gen9 90T node" file="hpe-90t-single.png" %}

### 180T NIC1 Ports

{% include note.html content="Currently, NIC2 on this model is unused." %}

{% include image.html alt="NIC1 ports on the HPE Apollo 4200 Gen9 180T node" file="hpe-180t-dual.png" %}

### 288T NIC1 Ports (Single)

{% include image.html alt="NIC1 ports on the single HPE Apollo 4200 Gen9 288T node" file="hpe-288t-single.png" %}

### 288T NIC1 Ports (Dual)

{% include note.html content="Currently, NIC2 on this model is unused." %}

{% include image.html alt="NIC1 ports on the dual HPE Apollo 4200 Gen9 288T node" file="hpe-288t-dual.png" %}

## Connecting to Redundant Switches

This section explains how to connect a four-node HPE cluster to dual switches for redundancy. We recommend this configuration for HPE hardware. If either switch becomes inoperative, the cluster remains accessible through the remaining switch.

* Connect the two 40 Gbps ports on the nodes to separate switches.
* Use at least one port on both switches as an uplink to the client network. To ensure an acceptable level of physical network redundancy and to meet the necessary client access throughput rates, use an appropriate combination of 10 Gbps, 25 Gbps, 40 Gbps, or 100 Gbps network uplinks.
* Use at least one peer link between the switches.

## Connecting to a Single Switch

This section explains how to connect a four-node HPE cluster to a single switch.

{% include note.html content="If the switch becomes inoperative, the cluster becomes inaccessible." %}

* Connect two 40 Gbps ports to the switch.
* Connect any uplink ports to the client network.
