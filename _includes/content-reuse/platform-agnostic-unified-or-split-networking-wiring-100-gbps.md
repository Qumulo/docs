## Step 1: Connecting the Out-of-Band Management (IPMI) Port
The dedicated out-of-band management port allows functionality such as remote display, control, and power. The port uses the Intelligent Platform Management Interface (IPMI) protocol. Connect the IPMI port first on the back of your node (above the USB ports).

{% include important.html content="The list of IPMI accounts contains the user `qumulo_<random>`. This account is critical for Qumulo Core functionality. Don't disable or tamper with it. To administer Qumulo Core, create your own IPMI user account." %}


## Step 2: Connecting the 100 Gbps Ports
After you connect the IPMI port, connect your 100 Gbps ports (compatible with QSFP28 or QSFP56).

* **Single NIC:** {{site.unifyNetDefine}}

* **Dual NIC:** {{site.splitNetDefine}} 

{% include note.html content="The `eth` port labels vary depending on the NIC manufacturer." %}


## Step 3: Connecting the Power
After you connect your 100 Gbps ports, connect power to the node. There are two power sockets on the back of your node. To maximize redundancy, connect each PSU to a separate power supply or power distribution unit (PDU).
