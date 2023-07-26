## Step 2: Connecting the 25 Gbps or 100 Gbps Ports
{% capture content_tag %}{{site.seeTechSpecs}}{% endcapture %}
{% include note.html content=content_tag %}

After you connect the IPMI port, connect your 25 Gbps or 100 Gbps ports (compatible with QSFP28 and QSFP56). There are two 25 Gbps or 100 Gbps ports on the back of your node. {{site.unifyNetDefine}}

{% capture ethDiff %}{{site.hardware.ethDiff}}{% endcapture %}
{% include note.html content=ethDiff %}

| NIC Manufacturer | Port Location | Port Labels |
| ---------------- | ------------- | ----------- |
| Broadcom         | Left          | 2 (`eth3`)  |
| Broadcom         | Right         | 1 (`eth2`)  |
| Mellanox         | Left          | 2 (`eth1`)  |
| Mellanox         | Right         | 1 (`eth0`)  |


## Step 3: Connecting the Power
After you connect your 25 Gbps or 100 Gbps ports, connect power to the node. There are two power sockets on the back of your node. To maximize redundancy, connect each PSU to a separate power supply or power distribution unit (PDU).
