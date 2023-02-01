---
title: "Wiring Nodes and Networking Your HPE Apollo 4200 Gen9 Cluster"
summary: "This section explains how to wire NIC ports on HPE Apollo 4200 Gen9 nodes and how to network a cluster."
permalink: /hardware-guide/hpe-apollo-4200-gen9/wiring-nodes-networking-cluster.html
redirect_from:
  - /hardware-guide/hpe-apollo-4200-gen9/networking-cluster.html
  - /hardware/hpe-apollo-4200-gen9/networking-cluster.html
sidebar: hardware_guide_sidebar
keywords: network, networking, cluster, switch, Ethernet, ports, IP, 90T, 180T, 288T
---

{% include content-reuse/hpe-apollo-4200-gen-9-90t-180t-288t-eops.md %}

## Node NICs and Ports
The following diagrams show the NICs and ports on {{site.a4200g9}} node types.

### 288T (Dual NICs)
{% include note.html content="Currently, NIC2 on this model is unused." %}

{% capture alt_tag %}NIC ports on the dual {{site.a4200g9}} 288T node type{% endcapture %}
{% include image.html alt=alt_tag file="hpe-288t-dual.png" %}

### 288T (Single NIC)
{% capture alt_tag %}NIC ports on the single {{site.a4200g9}} 288T node type{% endcapture %}
{% include image.html alt=alt_tag file="hpe-288t-single.png" %}

### 180T
{% include note.html content="Currently, NIC2 on this model is unused." %}

{% capture alt_tag %}NIC ports on the {{site.a4200g9}} 180T node type{% endcapture %}
{% include image.html alt=alt_tag file="hpe-180t-dual.png" %}

### 90T
{% capture alt_tag %}NIC ports on the {{site.a4200g9}} 90T node type{% endcapture %}
{% include image.html alt=alt_tag file="hpe-90t-single.png" %}


## Prerequisites

* A network switch with the following criteria:
  * 40 Gbps Ethernet connection
  * Fully non-blocking architecture
  * IPv6 compatibility
* Compatible network cables
* A sufficient number of ports for connecting all nodes to the same switch fabric
* One static IP for each node, for each defined VLAN

{% include important.html content="Before you connect any Qumulo-supported equipment to your network, we strongly recommend consulting with your network engineering team." %}

## Recommended Configuration

* Two redundant switches
* One physical connection to each redundant switch, for each node
* One Link Aggregation Control Protocol (LACP) port-channel for each node with the following configuration:
  * Active mode
  * Slow transmit rate
  * Trunk port with a native VLAN
  * Enabled IEEE 802.3x flow control (full-duplex mode)
* DNS servers
* Network Time Protocol (NTP) server
* Firewall protocol or ports configured for [Qumulo Care Proactive Monitoring](https://care.qumulo.com/hc/en-us/articles/115007283828)
* Where `N` is the number of nodes, up to 10 `N-1` floating IP addresses for each node, for each client-facing VLAN

  {% include note.html content="The number of floating IP addresses depends on your workflow and on the clients that connect to the cluster, with a minimum of two floating IP addresses for each node, for each client-facing VLAN, but with no more than ten floating IP addresses for each node, for each client-facing VLAN." %}

* Nodes connected at their maximum Ethernet speed (this ensures advertised performance). To avoid network bottlenecks, Qumulo validates system performance with this configuration by using clients connected at the same link speed and to the same switch as the nodes.

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
