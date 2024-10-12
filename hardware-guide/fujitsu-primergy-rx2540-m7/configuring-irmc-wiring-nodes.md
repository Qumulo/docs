---
title: "Configuring the Integrated Remote Management Controller (iRMC) and Wiring Your Fujitsu PRIMERGY RX2540 M7 Nodes"
summary: "This section explains how to wire the out-of-band management (iRMC) port, 25 Gbps ports, and power on Fujitsu RX2540 M7 nodes."
permalink: /hardware-guide/fujitsu-primergy-rx2540-m7/configuring-irmc-wiring-nodes.html
sidebar: hardware_guide_sidebar
---

{{site.unifyNetDefine}}

{% capture alt_tag %}Back Diagram of the {{site.fprx2540m7Long}} Node{% endcapture %}
{% include image.html alt=alt_tag file="fujitsu-primergy-rx2540-m7-back-diagram.png" url="/hardware-guide/fujitsu-primergy-rx2540-m7/images/fujitsu-primergy-rx2540-m7-back-diagram.png" %}

{% include content-reuse/platform-agnostic-irmc.md %}
To configure the iRMC port, you must use Fujitsu ServerView. For more information, see <a href="https://docs.qumulo.com/pdf/fujitsu-software-serverview-suite-irmc-s6-configuration-maintenance-03-2023.pdf#page=30" class="pdf">Logging on to the iRMC S6 for the first time (p. 30)</a> and <a href="https://docs.qumulo.com/pdf/fujitsu-software-serverview-suite-irmc-s6-configuration-maintenance-03-2023.pdf#page=31" class="pdf">iRMC factory defaults (p. 31)</a> in the Fujitsu iRMC S6 Configuration and Maintenance Manual.
{% include content-reuse/platform-agnostic-unified-networking-wiring.md bmcType="iRMC" ethernetSpeed="25 Gbps" portCompatibility=" (compatible with SFP28)" %}

| NIC Manufacturer | Port Location | Port Labels |
| ---------------- | ------------- | ----------- |
| Intel            | Left          | 1 (`eth1`)  |
| Intel            | Right         | 2 (`eth2`)  |

{% include content-reuse/platform-agnostic-unified-networking-wiring-power.md ethernetSpeed="25 Gbps" %}
