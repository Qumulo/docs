---
title: "Configuring the Intelligent Platform Management Interface (IPMI) and Wiring Your Supermicro A+ ASG-2015S-E1CR24L Nodes"
summary: "This section explains how to wire the out-of-band management (IPMI) port, 25 Gbps or 100 Gbps ports, and power on Supermicro 2015s nodes."
permalink: /hardware-guide/supermicro-a-plus-asg-2015s-e1cr24l/configuring-ipmi-wiring-nodes.html
sidebar: hardware_guide_sidebar
---

{{site.unifyNetDefine}}

{% capture unusedPorts %}{{site.unusedEthPorts}}{% endcapture %}
{% include note.html content=unusedPorts %}

{% capture alt_tag %}Back Diagram of the {{site.sm2015sLong}} Node{% endcapture %}
{% include image.html alt=alt_tag file="supermicro-1014s-back-diagram.png" url="/hardware-guide/supermicro-a-plus-asg-2015s-e1cr24l/images/supermicro-1014s-back-diagram.png" %}

{% include content-reuse/platform-agnostic-ipmi.md %}
{{site.hardware.ipmiConfig.smc}}
{{site.hardware.ipmiCreds.smc}}
{{site.data.alerts.note}}
{{site.hardware.ipmiCreds.smcNote}} {{site.hardware.ipmiCreds.smcMoreInfo1014S}}
{{site.data.alerts.end}}

{% include content-reuse/platform-agnostic-unified-networking-wiring.md bmcType="IPMI" ethernetSpeed="25 Gbps or 100 Gbps" portCompatibility=" (compatible with QSFP28 and QSFP56)" %}

| NIC Manufacturer | Port Location | Port Labels |
| ---------------- | ------------- | ----------- |
| Broadcom         | Left          | 2 (`eth3`)  |
| Broadcom         | Right         | 1 (`eth2`)  |
| Mellanox         | Left          | 2 (`eth1`)  |
| Mellanox         | Right         | 1 (`eth0`)  |

{% include content-reuse/platform-agnostic-unified-networking-wiring-power.md ethernetSpeed="25 Gbps or 100 Gbps" %}
