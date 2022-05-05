---
title: "HPE Apollo 4200 Gen10 Network Guide"
summary: "Networking recommendations for the HPE Apollo 4200 Gen10 server."
permalink: platforms/hpe-apollo-4200-gen10/networking-cluster.html
sidebar: platforms_sidebar
---
## In This Article

This article explains the ways in which you can connect HPE Apollo 4200 Gen10 clusters to your network.

## Requirements

-   HPE Apollo 4200 Gen10 cluster
-   A network switch with the following criteria
    -   Ethernet connection
        -   HPE Apollo 4200 Gen10 (36T, 90T): 25, 40, or 100 Gbps
        -   HPE Apollo 4200 Gen10 (192T): 100 Gbps
        -   HPE Apollo 4200 Gen10 (336T): 25 Gbps or 40 Gbps
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

## HPE Apollo 4200 Gen10 NIC1 Ports

{% include image.html alt="" file="hpe-networking-gen10-rear.png" %}

## Connecting To A Switch

### Connecting To Redundant Switches

This section explains how to connect a four-node HPE cluster to dual switches for redundancy. We recommend this configuration for HPE hardware. If either switch becomes inoperative, the cluster will still be accessible through the remaining switch.

-   Connect the two ports (two 25 Gbps, two 40 Gbps, or two 100 Gbps) on the nodes to separate switches.
-   Use at least one port on both switches as an uplink to the client network. To ensure an acceptable level of physical network redundancy and to meet the necessary client access throughput rates, use an appropriate combination of 10, 25, 40, or 100 Gbps network uplinks.
-   Use at least one peer link between the switches.

### Connecting To A Single Switch

This section explains how to connect a four-node HPE cluster to a single switch.

{{site.data.alerts.note}}
If the switch becomes inoperative, the cluster becomes inaccessible.
{{site.data.alerts.end}}

-   Connect two ports (two 25 Gbps, two 40 Gbps, or two 100 Gbps) to the switch.
-   Connect any uplink ports to the client network.
