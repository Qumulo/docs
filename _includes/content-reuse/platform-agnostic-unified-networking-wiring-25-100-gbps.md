## Step 1: Connecting the Out-of-Band Management (IPMI) Port
The dedicated out-of-band management port allows functionality such as remote display, control, and power. The port uses the Intelligent Platform Management Interface (IPMI) protocol. Connect the IPMI port first on the back of your node (above the USB ports).

{% include important.html content="The list of IPMI accounts contains the user `qumulo_<random>`. This account is critical for Qumulo Core functionality. Don't disable or tamper with it. To administer Qumulo Core, create your own IPMI user account." %}


## Step 2: Connecting the 25 Gbps or 100 Gbps Ports
{% include content-reuse/see-technical-specifications.md %}

After you connect the IPMI port, connect your 25 Gbps or 100 Gbps ports (compatible with QSFP28 and QSFP56). There are two 25 Gbps or 100 Gbps ports on the back of your node. {{site.unifyNetDefine}}

{% include note.html content="The `eth` port labels vary depending on the NIC manufacturer." %}

| NIC Manufacturer | Port Location | Port Labels |
| ---------------- | ------------- | ----------- |
| Broadcom         | Left          | 2 (eth3)    |
| Broadcom         | Right         | 1 (eth2)    |
| Mellanox         | Left          | 2 (eth1)    |
| Mellanox         | Right         | 1 (eth0)    |


## Step 3: Connecting the Power
{% include important.html content="Make sure that the voltages for both power supply units (PSUs) are the same (for example, both at 115 V or both at 208 V)." %}

After you connect your 25 Gbps or 100 Gbps ports, connect power to the node. There are two power sockets on the back of your node. To maximize redundancy, connect each PSU to a separate power supply or power distribution unit (PDU).
