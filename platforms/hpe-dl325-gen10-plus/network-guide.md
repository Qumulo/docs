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

-   Two redundant switches
-   One physical connection to each redundant switch per node
-   One Link Aggregation Control Protocol (LACP) port-channel per node with the following configuration
    -   Active mode
    -   Slow transmit rate
    -   Trunk port with a native VLAN
    -   IEEE 802.3x flow control enabled (full duplex)
-   DNS servers
-   Network Time Protocol (NTP) server
-   Firewall protocol or ports configured for [Proactive Monitoring](https://care.qumulo.com/hc/en-us/articles/115007283828-Qumulo-Care-Proactive-Monitoring)
-   Where N is the number of nodes: N-1 floating IP addresses per node (up to 10 IP addresses), per client-facing VLAN **Note:** The number of floating IP addresses depends on your workflow and the clients that connect to the cluster, with a minimum of two floating IP addresses per node, per client-facing VLAN, but with no more than ten floating IP addresses per node, per client-facing VLAN—or 70 floating IP addresses per namespace.
-   You can achieve advertised performance only if you connect your nodes at their maximum Ethernet speed. To avoid network bottlenecks, Qumulo validates system performance with this configuration by using clients that are connected at the same link speed and to the same switch as the nodes.

## HPE Proliant Dl325 Gen10 Plus NIC1 And NIC2 Ports

On this platform, there are two sets of NICs, one for the front-end and one for the back-end. **Important:** For your node to work correctly, you must connect at least one port in each NIC.

{% include image.html alt="" file="dl325-rear-networking.png" %}

## Connecting To A Switch

### Connecting To Redundant Switches

This section explains how to connect a four-node HPE cluster to dual switches for redundancy. We recommend this configuration for HPE hardware. If either switch becomes inoperative, the cluster will still be accessible through the remaining switch.

-   Connect the two 100Gbps ports on the nodes to separate switches.
-   Use at least one port on both switches as an uplink to the client network. To ensure an acceptable level of physical network redundancy and to meet the necessary client access throughput rates, use an appropriate combination of 10, 25, 40, or 100 Gbps network uplinks.
-   Use at least one peer link between the switches.

### Connecting To A Single Switch

This section explains how to connect a four-node HPE cluster to a single switch.

{{site.data.alerts.note}}
If the switch becomes inoperative, the cluster becomes inaccessible.
{{site.data.alerts.end}}

-   Connect two 100Gbps ports to the switch.
-   Connect any uplink ports to the client network.
