## Step 2: Connecting the 100 Gbps Ports

After you connect the IPMI port, connect your {{include.ethernetSpeedSingleNIC}} {{include.ethernetSpeedDualNIC}}.

* **Single NIC:** {{site.unifyNetDefine}}

* **Dual NIC:** {{site.splitNetDefine}} 

{% capture ethDiff %}{{site.hardware.ethDiff}}{% endcapture %}
{% include note.html content=ethDiff %}


## Step 3: Connecting the Power
After you connect your {{include.ethernetSpeed}} ports, connect power to the node. There are two power sockets on the back of your node. To maximize redundancy, connect each PSU to a separate power supply or power distribution unit (PDU).
