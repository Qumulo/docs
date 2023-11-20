---
title: "Configuring the Integrated Remote Management Controller (iRMC) and Wiring Your Fujitsu PRIMERGY RX2540 M7 Nodes"
summary: "This section explains how to wire the out-of-band management (iRMC) port, 25 Gbps ports, and power on Fujitsu RX2540 M7 nodes."
permalink: /hardware-guide/fujitsu-primergy-rx2540-m7/configuring-irmc-wiring-nodes.html
sidebar: hardware_guide_sidebar
keywords: out-of-band_management, out_of_band_management, iRMC, DHCP, network, networking, LAN, 25 Gbps, Ethernet, power, Fujitsu_PRIMERGY_RX2540_M7, Fujitsu, PRIMERGY, RX2540, 2540, M7
---

{{site.unifyNetDefine}}

{% capture alt_tag %}Back Diagram of the {{site.fprx2540m7Long}} Node{% endcapture %}
{% include image.html alt=alt_tag file="fujitsu-primergy-rx2540-m7-back-diagram.png" url="/hardware-guide/fujitsu-primergy-rx2540-m7/images/fujitsu-primergy-rx2540-m7-back-diagram.png" %}

{% include content-reuse/platform-agnostic-irmc.md %}
To configure the iRMC port, you must use the web UI of the Remote Management Controller. For more information, see the [Starting Web Interface section in the Remote Management Controller User's Guide (p. 107)](https://www.fujitsu.com/global/Images/b7fh-5631-01en.pdf#page=17) {{site.hardware.irmcCreds.fprx}}
{% include content-reuse/platform-agnostic-unified-networking-wiring.md bmcType="iRMC" ethernetSpeed="25 Gbps" portCompatibility=" (compatible with SFP28)" %}

| NIC Manufacturer | Port Location | Port Labels |
| ---------------- | ------------- | ----------- |
| Intel            | Left          | 1 (`eth1`)  |
| Intel            | Right         | 2 (`eth2`)  |

{% include content-reuse/platform-agnostic-unified-networking-wiring-power.md ethernetSpeed="25 Gbps" %}
