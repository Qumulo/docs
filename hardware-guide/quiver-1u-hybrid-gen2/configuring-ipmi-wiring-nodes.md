---
title: "Configuring the Intelligent Platform Management Interface (IPMI) and Wiring Your Quiver 1U Hybrid Gen2 Nodes"
summary: "This section explains how to wire the out-of-band management (IPMI) port, 25 Gbps or 100 Gbps ports, and power on Quiver 1UH Gen2 nodes."
permalink: /hardware-guide/quiver-1u-hybrid-gen2/configuring-ipmi-wiring-nodes.html
redirect_from:
  - /hardware-guide/quiver-1u-hybrid-gen2/wiring-nodes.html
sidebar: hardware_guide_sidebar
keywords: out-of-band_management, out_of_band_management, IPMI, DHCP, network, networking, LAN, ipmitool, 100 Gbps, Ethernet, power, Quiver_1U_Hybrid_Gen2, Quiver, Quiver_1UH, QVRG2-96T, QVRG2-240T, QVRG296T, QVRG2240T
---

{{site.unifyNetDefine}}

{% capture alt_tag %}Back Diagram of the {{site.q1uhg2Long}} Node{% endcapture %}
{% include image.html alt=alt_tag file="quiver-1u-hybrid-gen2-back-diagram.png" url="/hardware-guide/quiver-1u-hybrid-gen2/images/quiver-1u-hybrid-gen2-back-diagram.png" %}

{% include content-reuse/platform-agnostic-ipmi.md %}
To configure the IPMI port, you must use the BMC UI. For more information, see BMC section in the [{{site.q1uhg2Long}} Service Guide](https://care.qumulo.com/hc/en-us/article_attachments/19236306533267/D52T-1ULH-Field-Service-Guide_Qumulo_.pdf#page=107). {{site.hardware.ipmiCreds.quiver}}
{% include content-reuse/platform-agnostic-unified-networking-wiring.md ethernetSpeed="25 Gbps or 100 Gbps"%}
