---
title: "Configuring the Intelligent Platform Management Interface (IPMI) and Wiring Your Quiver 1U Hybrid Gen2 Nodes"
summary: "This section explains how to wire the out-of-band management (IPMI) port, 25 Gbps or 100 Gbps ports, and power on Quiver 1UH Gen2 nodes."
permalink: /hardware-guide/quiver-1u-hybrid-gen2/configuring-ipmi-wiring-nodes.html
redirect_from:
  - /hardware-guide/quiver-1u-hybrid-gen2/wiring-nodes.html
sidebar: hardware_guide_sidebar
---

{{site.unifyNetDefine}}

{% capture alt_tag %}Back Diagram of the {{site.q1uhg2Long}} Node{% endcapture %}
{% include image.html alt=alt_tag file="quiver-1u-hybrid-gen2-back-diagram.png" url="/hardware-guide/quiver-1u-hybrid-gen2/images/quiver-1u-hybrid-gen2-back-diagram.png" %}

{% include content-reuse/platform-agnostic-ipmi.md %}
To configure the IPMI port, you must use the BMC UI. For more information, see the [BMC section in the {{site.q1uhg2Long}} Service Guide (p.107)](https://care.qumulo.com/hc/en-us/articles/19236348044947-Quiver-1U-Hybrid-Gen2-Service-Guide) {{site.loginRequired}}. {{site.hardware.ipmiCreds.quiver}}
{% include content-reuse/platform-agnostic-unified-networking-wiring.md bmcType="iRMC" ethernetSpeed="25 Gbps or 100 Gbps" portCompatibility=" (compatible with QSFP28 and QSFP56)" %}

| NIC Manufacturer | Port Location | Port Labels |
| ---------------- | ------------- | ----------- |
| Broadcom         | Left          | 2 (`eth3`)  |
| Broadcom         | Right         | 1 (`eth2`)  |
| Mellanox         | Left          | 2 (`eth1`)  |
| Mellanox         | Right         | 1 (`eth0`)  |

{% include content-reuse/platform-agnostic-unified-networking-wiring-power.md ethernetSpeed="25 Gbps or 100 Gbps" %}
