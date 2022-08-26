---
title: "Wiring Your Supermicro A+ ASG-1014S-ACR12N4H Nodes"
summary: "This section explains how to wire your out-of-band management (IPMI) port, 100 Gbps ports, and power on Supermicro A+ ASG-1014S-ACR12N4H nodes."
permalink: hardware/supermicro-a-plus-asg-1014s-acr12n4h/wiring-nodes.html
sidebar: hardware_sidebar
keywords: out-of-band management, out of band management, IPMI, DHCP, network, networking, LAN, ipmitool, 100 Gbps, Ethernet, power, Supermicro 1014S, ACR12N4H
---

This section explains how to wire your out-of-band management (IPMI) port, 25 Gbps or 100 Gbps ports, and power on {{site.sm1014s}} nodes.

{% include note.html content="The two Ethernet ports on the back of your node (to the right of the USB ports) are unused." %}

{% capture alt_tag_hdd %}Back Diagram of the {{site.sm1014s}} Node% endcapture %}
{% include image.html alt=alt_tag file="supermicro-1014s-back-diagram.png" url="/hardware/supermicro-a-plus-asg-1014s-acr12n4h/images/supermicro-1014s-back-diagram.png" %}

## Step 1: Connecting the Out-of-Band Management (IPMI) Port
The dedicated out-of-band management port allows functionality such as remote display, control, and power (similar to HPE iLO). The port uses the Intelligent Platform Management Interface (IPMI) protocol. Connect the IPMI port first on the back of your node (above the USB ports).

{% include important.html content="The list of IPMI accounts contains the user `qumulo_<random>`. This account is critical for Qumulo Core functionality. Don't disable or tamper with it. To administer Qumulo Core, create your own IPMI user account." %}


## Step 2: Connecting the 25 Gbps or 100 Gbps Ports
{% include content-reuse/see-technical-specifications.md %}

After you connect the IPMI port, connect your front-end and back-end 25 Gbps or 100 Gbps ports (compatible with QSFP28 and QSFP56). There are two 25 Gbps or 100 Gbps ports on the back of your node. To maximize redundancy, split interfaces across subnets by connecting each port to a different switch.

{% include note.html content="The `eth` port labels vary depending on the NIC manufacturer." %}

| NIC Manufacturer | Port Location | Port Labels | Port Type | Purpose                     |
| ---------------- | ------------- | ----------- | --------- | --------------------------- |
| Broadcom         | Left          | 2 (eth3)    | Back end  | Communication between nodes |
| Broadcom         | Right         | 1 (eth2)    | Front end | Communication with clients  |
| Mellanox         | Left          | 2 (eth1)    | Back end  | Communication between nodes |
| Mellanox         | Right         | 1 (eth0)    | Front end | Communication with clients  |


## Step 3: Connecting the Power
{% include important.html content="Make sure that the voltages for both power supply units (PSUs) are the same (for example, both at 115 V or both at 208 V)." %}

After you connect your 25 Gbps or 100 Gbps ports, connect power to the node. There are two power sockets on the back of your node. To maximize redundancy, connect each PSU to a separate power supply or power distribution unit (PDU).
