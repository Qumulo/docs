---
title: "Wiring Nodes and Networking Your HPE Apollo 4200 Gen10 Plus Cluster"
summary: "This section explains how to wire NIC ports on HPE Apollo 4200 Gen10 Plus nodes and how to network a cluster."
permalink: /hardware-guide/hpe-apollo-4200-gen10-plus/wiring-nodes-networking-cluster.html
sidebar: hardware_guide_sidebar
keywords: network, networking, cluster, switch, Ethernet, ports, IP, HPE, Apollo 4200 Gen10 Plus
---

## Node NICs and Ports
The following diagram shows the NICs and ports on {{a4200g10p}} nodes. On this platform, there are two sets of NICs, one for the front end and one for the back end.

{% include important.html content="For your node to work correctly, you must connect at least one port in the NIC." %}

{% capture alt_tag %}NIC ports on {{site.a4200g10p}} nodes{% endcapture %}
{% include image.html alt=alt_tag file="hpe-apollo-4200-gen10-plus-networking.png" %}

{% include content-reuse/platform-agnostic-unified-networking-cluster-25-100gbps.md %}

{% include image.html alt="Platform-Agnostic Unified Networking Four-Node Cluster Architecture Diagram" file="../../platform-agnostic/images/platform-agnostic-unified-networking-four-node-cluster.png" %}
