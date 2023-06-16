---
title: "Wiring Your Supermicro A+ WIO 1114S-WN10RT Nodes"
summary: "This section explains how to wire the out-of-band management (IPMI) port, 100 Gbps ports, and power on Supermicro 1114S nodes."
permalink: /hardware-guide/supermicro-a-plus-wio-1114s-wn10rt/wiring-nodes.html
redirect_from:
  - /hardware/supermicro-a-plus-wio-1114s-wn10rt/wiring-nodes.html
sidebar: hardware_guide_sidebar
keywords: out-of-band_management, out_of_band_management, IPMI, DHCP, network, networking, LAN, ipmitool, 100_Gbps, Ethernet, power
---

{% capture unusedPorts %}{{site.unusedEthPorts}}{% endcapture %}
{% include note.html content=unusedPorts %}

{% capture alt_tag %}Back Diagram of the {{site.sm1114sLong}} Node{% endcapture %}
{% include image.html alt=alt_tag file="supermicro-1114s-back-diagram.png" url="/hardware-guide/supermicro-a-plus-wio-1114s-wn10rt/images/supermicro-1114s-back-diagram.png" %}

## Step 1: Connecting the Out-of-Band Management (IPMI) Port
The dedicated out-of-band management port allows functionality such as remote display, control, and power. The port uses the Intelligent Platform Management Interface (IPMI) protocol. Connect the IPMI port first on the back of your node (above the USB ports).

{% include important.html content="The list of IPMI accounts contains the user `qumulo_<random>`. This account is critical for Qumulo Core functionality. Don't disable or tamper with it. To administer Qumulo Core, create your own IPMI user account." %}


## Step 2: Connecting the 100 Gbps Ports
After you connect the IPMI port, connect your front-end and back-end 100 Gbps ports (compatible with QSFP28 and QSFP56). There are four 100 Gbps ports on the back of your node. To maximize redundancy, split interfaces across subnets by connecting each port to a different switch.

| Port Location         | Port Labels        | Port Type  | Purpose                     |
| --------------------- | ------------------ | ---------- | --------------------------- |
| Top row               | 2 (eth3), 1 (eth2) | Front end  | Communication with clients  |
| Bottom row            | 2 (eth5), 1 (eth4) | Back end   | Communication between nodes |


## Step 3: Connecting the Power
After you connect your 100 Gbps ports, connect power to the node. There are two power sockets on the back of your node. To maximize redundancy, connect each PSU to a separate power supply or power distribution unit (PDU).
