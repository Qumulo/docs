---
title: "Configuring the Integrated Remote Management Controller (iRMC) and Wiring Your Fsas Technologies PRIMERGY RX2540 M7 Nodes"
summary: "This section explains how to wire the out-of-band management (iRMC) port, 25 Gbps ports, and power on Fsas Technologies RX2540 M7 nodes."
permalink: /hardware-guide/fsas-technologies-primergy-rx2540-m7/configuring-irmc-wiring-nodes.html
redirect_from:
  - /hardware-guide/fujitsu-primergy-rx2540-m7/configuring-irmc-wiring-nodes.html
sidebar: hardware_guide_sidebar
---

{{site.unifyNetDefine}}

{% capture alt_tag %}Back Diagram of the {{site.fprx2540m7Long}} Node{% endcapture %}
{% include image.html alt=alt_tag file="fsas-technologies-primergy-rx2540-m7-back-diagram.png" url="/hardware-guide/fsas-technologies-primergy-rx2540-m7/images/fsas-technologies-primergy-rx2540-m7-back-diagram.png" %}

{% include content-reuse/hardware-guides/platform-agnostic-irmc.md %}
To configure the iRMC port, you must use Fsas Technologies ServerView. For more information, see <a href="/pdf/fujitsu-software-serverview-suite-irmc-s6-configuration-maintenance-03-2023.pdf#page=30" class="pdf">Logging on to the iRMC S6 for the first time (p. 30)</a> and <a href="/pdf/fujitsu-software-serverview-suite-irmc-s6-configuration-maintenance-03-2023.pdf#page=31" class="pdf">iRMC factory defaults (p. 31)</a> in the Fsas Technologies iRMC S6 Configuration and Maintenance Manual.
{% include content-reuse/hardware-guides/platform-agnostic-unified-networking-wiring.md bmcType="iRMC" ethernetSpeed="25 Gbps" portCompatibility=" (compatible with SFP28)" %}

{% include content-reuse/hardware-guides/platform-agnostic-unified-networking-wiring-power.md ethernetSpeed="25 Gbps" %}
