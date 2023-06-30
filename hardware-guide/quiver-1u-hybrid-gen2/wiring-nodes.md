---
title: "Wiring Your Quiver 1U Hybrid Gen2 Nodes"
summary: "This section explains how to wire the out-of-band management (IPMI) port, 25 Gbps or 100 Gbps ports, and power on Quiver 1UH Gen2 nodes."
permalink: /hardware-guide/quiver-1u-hybrid-gen2/wiring-nodes.html
sidebar: hardware_guide_sidebar
keywords: out-of-band_management, out_of_band_management, IPMI, DHCP, network, networking, LAN, ipmitool, 100 Gbps, Ethernet, power
---

{% capture alt_tag %}Back Diagram of the {{site.q1uhg2Long}} Node{% endcapture %}
{% include image.html alt=alt_tag file="quiver-1u-hybrid-gen2-back-diagram.png" url="/hardware-guide/quiver-1u-hybrid-gen2/images/quiver-1u-hybrid-gen2-back-diagram.png" %}

{% include content-reuse/platform-agnostic-ipmi.md %}
{{site.hardware.ipmiCreds.quiver}}
{% include content-reuse/platform-agnostic-unified-networking-wiring-25-100-gbps.md %}
