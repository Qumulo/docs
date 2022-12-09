---
title: "Identifying NICs and Choosing Transceivers and Cables for Your Qumulo Node"
summary: "This section explains how to identify the NICs in your nodes and choose the correct transceivers and cables."
permalink: /hardware-guide/general-guidance/nics-transceivers-cables.html
redirect_from:
  - /nics-transceivers-cables.html
  - /administrator-guide/nics-transceivers-cables.html
  - /administrator-guide/networking/nics-transceivers-cables.html
  - /hardware/general-guidance/nics-transceivers-cables.html
sidebar: hardware_guide_sidebar
keywords: network, transceiver, NIC, Mellanox, Nvidia, SMC, Intel, Broadcom, short range, long range, fiber, optic, cable
---

## Step 1: Identify the NICs in Your Nodes
Most Qumulo-certified nodes are compatible with multiple NIC models. The NIC model determines transceiver compatibility.

1. Use SSH to connect to your node.

1. Run the `lspci | grep "Ethernet controller"` command.

   {% include note.html content="This command might return information about unused NICs that have interfaces with speeds of 10 Gbps (or slower)." %}

   A list of NICs appears. In the following example, we ran the command on a {{site.sm1114s}} node, which has two ConnectX-6 NICs.

   ```
   45:00.0 Ethernet controller: Broadcom Inc. and subsidiaries BCM57416 NetXtreme-E Dual-Media 10G RDMA Ethernet Controller (rev 01)
   45:00.1 Ethernet controller: Broadcom Inc. and subsidiaries BCM57416 NetXtreme-E Dual-Media 10G RDMA Ethernet Controller (rev 01)
   81:00.0 Ethernet controller: Mellanox Technologies MT28908 Family [ConnectX-6]
   81:00.1 Ethernet controller: Mellanox Technologies MT28908 Family [ConnectX-6]
   c5:00.0 Ethernet controller: Mellanox Technologies MT28908 Family [ConnectX-6]
   c5:00.1 Ethernet controller: Mellanox Technologies MT28908 Family [ConnectX-6]
   ```
   
1. To determine the speed and firmware compatibility information for the NICs in your node, refer to the following table.

   <table>
     <thead>
       <tr>
         <th>NIC Model</th>
         <th>Speed</th>
         <th>Firmware Compatibility Information</th>
       </tr>
     </thead>
     <tbody>
       <tr>
         <td>82599ES</td>
         <td>10 Gbps</td>
         <td><a href="https://www.intel.com/content/www/us/en/products/sku/41282/intel-82599es-10-gigabit-ethernet-controller/specifications.html">Intel 82599ES 10 Gigabit Ethernet Controller</a></td>
       </tr>
       <tr>
         <td>AOC-S100G-b2C</td>
         <td>100 Gbps</td>         
         <td rowspan=2>
           <ul>
             <li><a href="https://www.supermicro.com/en/support/resources/aoc/cables-transceivers">Supermicro Networking Cables and Transceivers Compatibility Matrix</a></li>
             <li><a href="https://www.broadcom.com/products/fiber-optic-modules-components/networking/optical-transceivers">Broadcom Optical Transceivers</a></li>
             <li><a href="https://techdocs.broadcom.com/us/en/storage-and-ethernet-connectivity/ethernet-nic-controllers/bcm957xxx/adapters/installation/connecting-the-network-cables.html">Supported Cables for Broadcom Ethernet Network Adapters</a> in the Broadcom Ethernet Network Adapter User Guide</li>
           </ul>
         </td>
       </tr>
       <tr>
         <td>AOC-S25G-b2S</td>
         <td>25 Gbps</td>       
       </tr>
       <tr>
         <td>ConnectX-3</td>
         <td>10 Gbps</td>
         <td><a href="https://network.nvidia.com/pdf/firmware/ConnectX3-FW-2_42_5000-release_notes.pdf#page=7">Supported Cables and Modules</a> in the Mellanox ConnectX-3 Firmware Release Notes</td>
       </tr>       
       <tr>
         <td>ConnectX-3 Pro</td>
         <td>40 Gbps</td>
         <td><a href="https://network.nvidia.com/related-docs/firmware/ConnectX3Pro-FW-2_42_5000-release_notes.pdf#page=8">Supported Cables and Modules</a> in the Mellanox ConnectX-3 Pro Firmware Release Notes</td>
       </tr>       
       <tr>
         <td>ConnectX-4</td>
         <td>40 Gbps</td>
         <td><a href="https://docs.nvidia.com/networking/display/ConnectX4Firmwarev12282006/Firmware+Compatible+Products">Firmware Compatible Products</a> in the NVIDIA Mellanox ConnectX-4 Adapter Cards Firmware Release Notes</td>
       </tr>       
       <tr>
         <td>ConnectX-4 Lx</td>
         <td>25 Gbps</td>
         <td><a href="https://docs.nvidia.com/networking/display/ConnectX4LxFirmwarev14321010/Firmware+Compatible+Products">Firmware Compatible Products</a> in the NVIDIA ConnectX-4 Lx Adapter Cards Firmware Release Notes</td>
       </tr>
       <tr>
         <td>ConnectX-5</td>
         <td>100 Gbps</td>
         <td><a href="https://docs.nvidia.com/networking/display/ConnectX5Firmwarev16331048/Firmware+Compatible+Products">Firmware Compatible Products</a> in the NVIDIA ConnectX-5 Adapter Cards Firmware Release Notes</td>
       </tr>       
       <tr>
         <td>ConnectX-6</td>
         <td>100 Gbps</td>
         <td><a href="https://docs.nvidia.com/networking/display/ConnectX6Firmwarev20321010/Firmware+Compatible+Products">Firmware Compatible Products</a> in the NVIDIA ConnectX-6 Adapter Cards Firmware Release Notes</td>
       </tr>
       <tr>
         <td>ConnectX-6 Dx</td>
         <td>100 Gbps</td>
         <td><a href="https://docs.nvidia.com/networking/display/ConnectX6DxFirmwarev22322004/Firmware+Compatible+Products">Firmware Compatible Products</a> in the NVIDIA ConnectX-6 Dx Adapter Cards Firmware Release Notes</td>
       </tr>       
       <tr>
         <td>E810-CQDA2</td>
         <td>100 Gbps</td>
         <td>
           <p><a href="https://compatibleproducts.intel.com/ProductDetails?activeModule=Intel%C2%AE%20Ethernet&prdName=Intel%C2%AE%20Ethernet%20Network%20Adapter%20E810-2CQDA2">Intel Ethernet Network Adapter E810-2CQDA2</a></p>
           {% include note.html content="Intel might support, but doesn't verify, third-party transceiver compatibility." %}
         </td>
       </tr>
       <tr>
         <td>P225P</td>
         <td>25 Gbps</td>         
         <td rowspan=2>
           <ul>
             <li><a href="https://www.broadcom.com/products/fiber-optic-modules-components/networking/optical-transceivers">Broadcom Optical Transceivers</a></li>
             <li><a href="https://techdocs.broadcom.com/us/en/storage-and-ethernet-connectivity/ethernet-nic-controllers/bcm957xxx/adapters/installation/connecting-the-network-cables.html">Supported Cables for Broadcom Ethernet Network Adapters</a> in the Broadcom Ethernet Network Adapter User Guide</li>
           </ul>
         </td>
       </tr>
       <tr>
         <td>P2100G</td>
         <td>100 Gbps</td>
       </tr>       
     </tbody>
     </table>


## Step 2: Choose Transceivers for Your Nodes
This section lists and explains the differences between the types of transceivers available for your nodes.

* **Lucent Connector (LC):** The LC with two fibers is very common for 10 Gbps and 25 Gbps connections.

  {% include note.html content="Although there are transceivers that can use LC fiber optic cables for 40 Gbps and 100 Gbps connections, these transceivers are generally more expensive, consume more power, and are mainly intended for reusing LC cabling, or for long-distance applications." %}

* **Lucent Connector Duplex (LC Duplex):** The LC duplex with two fibers is the most common standard for 25 Gbps connections. The maximum short-range connection is 100 m and long-range connection is 10 km. There is also an extended-range standard with a maximum of 40 km.

* **Multi-Fiber Push On (MPO):** The MPO connector with eight fibers is a common connector for 40 Gbps connections.

* **PAM4:** Some newer switches can establish 100 Gbps connections by using double 50 Gbps PAM4 connections instead of the more common four 25 Gbps connections. For information about configuring Pulse Amplitude Modulation 4-level (PAM4), see [Auto-Negotiation on Ethernet NIC Controllers](https://techdocs.broadcom.com/us/en/storage-and-ethernet-connectivity/ethernet-nic-controllers/bcm957xxx/1-0/Configuration-adapter/auto-negotiation-configuration.html) in the Broadcom documentation.

* **SR4:** The SR4, with four QSFP28 connections over an eight-fiber cable, is the most common and cost-efficient standard for 100 Gbps connections. The maximum range for SR4 is 100 m.


## Step 3: Choose Cables for Your Transceivers
This section lists and explains the differences between the types of cables available for your transceivers.

{% include note.html content="If you use DAC or AOC cables, ensure that the manufacturers of your NIC and network switch both support your cables." %}

* **Optical Cables:** We recommend using optical cables and optical transceivers that both the NIC and the switch support.

* **Direct Attach Cables (DACs):** Although these cables are significantly cheaper than optical cables and are less prone to compatibility and thermal issues, they are limited in length (2-3 m, up to 5 m maximum).

* **Active Optical Cables (AOCs):** Although these cables are cheaper than dedicated transceivers and fiber optic cables, they might cause compatibility issues, or your NIC or switch might not support them.
