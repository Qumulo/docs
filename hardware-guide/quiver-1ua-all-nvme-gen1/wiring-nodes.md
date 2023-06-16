---
title: "Wiring Your Quiver 1U All-NVMe Gen1 Nodes"
summary: "This section explains how to wire the out-of-band management (IPMI) port, 100 Gbps ports, and power on Quiver 1UA Gen1 nodes."
permalink: /hardware-guide/quiver-1ua-all-nvme-gen1/wiring-nodes.html
sidebar: hardware_guide_sidebar
keywords: out-of-band_management, out_of_band_management, IPMI, DHCP, network, networking, LAN, ipmitool, 100 Gbps, Ethernet, power
---

{% capture unusedPorts %}{{site.unusedEthPorts}}{% endcapture %}
{% include note.html content=unusedPorts %}

{% capture alt_tag %}Back Diagram of the {{site.q1uag1Long}} Node{% endcapture %}
{% include image.html alt=alt_tag file="quiver-1ua-all-nvme-gen1-back-diagram.png" url="/hardware-guide/quiver-1ua-all-nvme-gen1/images/quiver-1ua-all-nvme-gen1-back-diagram.png" %}

{% include content-reuse/platform-agnostic-unified-or-split-networking-wiring-100-gbps.md %}
