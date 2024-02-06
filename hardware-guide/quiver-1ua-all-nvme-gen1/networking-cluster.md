---
title: "Networking Your Quiver 1U All-NVMe Gen1 Cluster"
summary: "This section explains how to network a Quiver 1U All-NVMe Gen1 cluster."
permalink: /hardware-guide/quiver-1ua-all-nvme-gen1/networking-cluster.html
sidebar: hardware_guide_sidebar
keywords: network, networking, cluster, switch, Ethernet, ports, IP, Quiver_1U_All-NVMe_Gen1, Quiver, Quiver_1UA
platform: q1uag1
---

{% include content-reuse/run-anywhere-conditional-admonitions.md %}

{% include content-reuse/platform-agnostic-unified-or-split-networking-cluster.md ethernetSpeed="100 Gbps" ethernetSpeedSingleNIC="100 Gbps" ethernetSpeedDualNIC="100 Gbps"%}

## Four-Node Cluster Architecture Diagrams

### Single NIC
The following is the recommended configuration for a four-node cluster connected to an out-of-band management switch and redundant switches.
{% include image.html alt="Platform-Agnostic Unified Networking Four-Node Cluster Architecture Diagram" file="../../platform-agnostic/images/platform-agnostic-unified-networking-four-node-cluster.png" %}

### Dual NIC
The following is the recommended configuration for a four-node cluster connected to an out-of-band management switch, redundant front-end switches, and redundant back-end switches.
{% include image.html alt="Platform-Agnostic Unified Networking Four-Node Cluster Architecture Diagram" file="../../platform-agnostic/images/platform-agnostic-split-networking-four-node-cluster.png" %}
