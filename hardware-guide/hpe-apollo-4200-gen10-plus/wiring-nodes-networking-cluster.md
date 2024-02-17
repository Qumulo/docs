---
title: "Wiring Nodes and Networking Your HPE Apollo 4200 Gen10 Plus Cluster"
summary: "This section explains how to wire NIC ports on HPE Apollo 4200 Gen10 Plus nodes and how to network a cluster."
permalink: /hardware-guide/hpe-apollo-4200-gen10-plus/wiring-nodes-networking-cluster.html
sidebar: hardware_guide_sidebar
---

{{site.unifyNetDefine}}

## Node NIC and Ports
The following diagrams show the NIC and ports on {{site.a4200g10p}} node types.

{% include important.html content="For your node to work correctly, you must connect at least one port in the NIC." %}

{% capture alt_tag %}Back Diagram of the {{site.a4200g10p}} Node{% endcapture %}
{% include image.html alt=alt_tag file="hpe-apollo-4200-gen10-plus-back-diagram.png" url="/hardware-guide/hpe-apollo-4200-gen10-plus/images/hpe-apollo-4200-gen10-plus-back-diagram.png" %}

{% include content-reuse/platform-agnostic-unified-networking-cluster.md ethernetSpeed="25 Gbps or 100 Gbps"%}

{% include image.html alt="Platform-Agnostic Unified Networking Four-Node Cluster Architecture Diagram" file="../../platform-agnostic/images/platform-agnostic-unified-networking-four-node-cluster.png" %}
