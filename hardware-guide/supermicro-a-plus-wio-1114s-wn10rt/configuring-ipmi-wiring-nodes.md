---
title: "Configuring the Intelligent Platform Management Interface (IPMI) and Wiring Your Supermicro A+ WIO 1114S-WN10RT Nodes"
summary: "This section explains how to wire the out-of-band management (IPMI) port, 100 Gbps ports, and power on Supermicro 1114S nodes."
permalink: /hardware-guide/supermicro-a-plus-wio-1114s-wn10rt/configuring-ipmi-wiring-nodes.html
redirect_from:
  - /hardware-guide/supermicro-a-plus-wio-1114s-wn10rt/wiring-nodes.html
  - /hardware/supermicro-a-plus-wio-1114s-wn10rt/wiring-nodes.html
sidebar: hardware_guide_sidebar
---

{{site.splitNetDefine}}

{% capture unusedPorts %}{{site.unusedEthPorts}}{% endcapture %}
{% include note.html content=unusedPorts %}

{% capture alt_tag %}Back Diagram of the {{site.sm1114sLong}} Node{% endcapture %}
{% include image.html alt=alt_tag file="supermicro-1114s-back-diagram.png" url="/hardware-guide/supermicro-a-plus-wio-1114s-wn10rt/images/supermicro-1114s-back-diagram.png" %}

{% include content-reuse/hardware-guides/platform-agnostic-ipmi.md %}
{{site.hardware.ipmiConfig.smc}}

## Step 2: Connecting the 100 Gbps Ports
After you connect the IPMI port, connect your front-end and back-end 100 Gbps ports (compatible with QSFP28 and QSFP56). There are four 100 Gbps ports on the back of your node. To maximize redundancy, split interfaces across subnets by connecting each port to a different switch.

{% include content-reuse/hardware-guides/platform-agnostic-identify-eth-port.md %}

## Step 3: Connecting the Power
After you connect your 100 Gbps ports, connect power to the node. There are two power sockets on the back of your node. To maximize redundancy, connect each PSU to a separate power supply or power distribution unit (PDU).
