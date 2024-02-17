---
title: "Configuring the Intelligent Platform Management Interface (IPMI) and Wiring Your Quiver 1U All-NVMe Gen1 Nodes"
summary: "This section explains how to wire the out-of-band management (IPMI) port, 100 Gbps ports, and power on Quiver 1UA Gen1 nodes."
permalink: /hardware-guide/quiver-1ua-all-nvme-gen1/configuring-ipmi-wiring-nodes.html
redirect_from:
  - /hardware-guide/quiver-1ua-all-nvme-gen1/wiring-nodes.html
sidebar: hardware_guide_sidebar
---

{{site.unifySplitDepends}} For more information, see [Connecting the 100 Gbps Ports](#step-2-connecting-the-100-gbps-ports).

{{site.data.alerts.note}}
<ul>
  <li>{{site.dualNICfrontBackEnd}}</li>
  <li>{{site.unusedEthPorts}}</li>
</ul>
{{site.data.alerts.end}}

{% capture alt_tag %}Back Diagram of the {{site.q1uag1Long}} Node{% endcapture %}
{% include image.html alt=alt_tag file="quiver-1ua-all-nvme-gen1-back-diagram.png" url="/hardware-guide/quiver-1ua-all-nvme-gen1/images/quiver-1ua-all-nvme-gen1-back-diagram.png" %}

{% include content-reuse/platform-agnostic-ipmi.md %}
To configure the IPMI port, you must use the Server Management Interface. For more information, see [ASMB11-iKVM Server Management Board User Guide](https://dlcdnets.asus.com/pub/ASUS/server/accessory/ASMB11/Manual/E20952_ASMB11-iKVM_UM_WEB.pdf?model=RS500A-E12-RS12U) in the ASUS documentation. {{site.hardware.ipmiCreds.quiver}}
{% include content-reuse/platform-agnostic-unified-or-split-networking-wiring.md ethernetSpeed="100 Gbps" ethernetSpeedSingleNIC="100 Gbps ports (compatible with QSFP28 or QSFP56)" %}
