---
title: "Wiring Nodes and Networking Your HPE ProLiant DL325 Gen10 Plus Cluster"
summary: "This section explains how to wire NIC ports on HPE ProLiant DL325 Gen10 Plus nodes and how to network a cluster."
permalink: /hardware-guide/hpe-dl325-gen10-plus/wiring-nodes-networking-cluster.html
redirect_from:
  - /hardware-guide/hpe-dl325-gen10-plus/networking-cluster.html
  - /hardware/hpe-dl325-gen10-plus/networking-cluster.html
sidebar: hardware_guide_sidebar
keywords: network, networking, cluster, switch, Ethernet, ports, IP, HPE_ProLiant_DL325_Gen10_Plus, HPE, ProLiant, DL325
---

{{site.splitNetDefine}}

## Node NICs and Ports
The following diagram shows the NICs and ports on {{site.dl325g10p}} nodes. On this platform, there are two sets of NICs, one for the front end and one for the back end.

{% include important.html content="For your node to work correctly, you must connect at least one port in each NIC." %}

{% capture alt_tag %}Front End (NIC1) and Back End (NIC2) ports on {{site.dl325g10p}} nodes, Port 1 (eth4) and Port 2 (eth5) on the left, and Port 2 (eth7) and Port 1 (eth6) on the right.{% endcapture %}
{% include image.html alt=alt_tag file="dl325-rear-networking.png" %}

{% include content-reuse/platform-agnostic-split-wiring-networking-cluster.md ethernetSpeed="100 Gbps" %}
