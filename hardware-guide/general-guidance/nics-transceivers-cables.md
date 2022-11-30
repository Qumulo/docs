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
keywords: network transceiver, network transceivers, nic, mellanox, short range transceiver, long range transceiver, fiber, fiber optic, fiber optic cable
---

## To Identify Your NIC
First, identify the NICs present in your node. Most nodes are compatible with multiple NIC models, and which transceivers are compatible is determined by the specific NIC model.

1. Use SSH to connect to your node.

1. Run `lspci | grep "Ethernet controller"` .

   {% include note.html content="This command might return information about (unused) onboard NICs that have interfaces with speeds of 10 Gbps (or slower)." %}

   A list of NICs is displayed. In the following example, we ran the command on a {{site.sm1114s}} node, which has two ConnectX-6 NICs.

   ```
   45:00.0 Ethernet controller: Broadcom Inc. and subsidiaries BCM57416 NetXtreme-E Dual-Media 10G RDMA Ethernet Controller (rev 01)
   45:00.1 Ethernet controller: Broadcom Inc. and subsidiaries BCM57416 NetXtreme-E Dual-Media 10G RDMA Ethernet Controller (rev 01)
   81:00.0 Ethernet controller: Mellanox Technologies MT28908 Family [ConnectX-6]
   81:00.1 Ethernet controller: Mellanox Technologies MT28908 Family [ConnectX-6]
   c5:00.0 Ethernet controller: Mellanox Technologies MT28908 Family [ConnectX-6]
   c5:00.1 Ethernet controller: Mellanox Technologies MT28908 Family [ConnectX-6]
   ```

<table>
<thead>
  <tr>
    <th>NIC</th>
    <th>Speed</th>
    <th>Vendor Transceiver<br>Compatibility List</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td>ConnectX-6</td>
    <td>100 Gbps</td>
    <td><a href="https://docs.nvidia.com/networking/display/ConnectX6Firmwarev20301004/Firmware+Compatible+Products">Nvidia Compatible Products</a></td>
  </tr>
  <tr>
    <td>ConnectX-6Dx</td>
    <td>100 Gbps</td>
    <td><a href="https://docs.nvidia.com/networking/display/ConnectX6DxFirmwarev22311014/Firmware+Compatible+Products">Nvidia Compatible Products</a></td>
  </tr>
  <tr>
    <td>ConnectX-5</td>
    <td>100 Gbps</td>
    <td><a href="https://docs.nvidia.com/networking/display/ConnectX5Firmwarev16301004/Firmware+Compatible+Products#FirmwareCompatibleProducts-SupportedDevicesSupportedDevices">Nvidia Supported Devices</a></td>
  </tr>
  <tr>
    <td>ConnectX-4 Lx</td>
    <td>25 Gbps</td>
    <td><a href="https://docs.nvidia.com/networking/display/ConnectX4LxFirmwarev14311014/Firmware+Compatible+Products">Nvidia Supported Devices</a></td>
  </tr>
  <tr>
    <td>ConnectX-4</td>
    <td>40 Gbps</td>
    <td><a href="https://docs.nvidia.com/networking/display/ConnectX4Firmwarev12282006/Firmware+Compatible+Products">Nvidia Compatible Products</a></td>
  </tr>
  <tr>
    <td>ConnectX-3Pro</td>
    <td>40 Gbps</td>
    <td><a href="https://network.nvidia.com/related-docs/firmware/ConnectX3Pro-FW-2_42_5000-release_notes.pdf">FW release notes (see section 1.2)</a></td>
  </tr>
  <tr>
    <td>ConnectX-3</td>
    <td>10 Gbps</td>
    <td><a href="https://network.nvidia.com/sites/default/files/related-docs/firmware/ConnectX3-FW-2_42_5000-release_notes.pdf)">FW release notes (see section 1.2)</a></td>
  </tr>
  <tr>
    <td>P2100G</td>
    <td>100 Gbps</td>
    <td>
      <ul>
        <li><a href="https://www.broadcom.com/products/fiber-optic-modules-components/networking/optical-transceivers">Broadcom Optical Transceivers</a></li>
        <li><a href="https://techdocs.broadcom.com/us/en/storage-and-ethernet-connectivity/ethernet-nic-controllers/bcm957xxx/1-0/installation_3/connecting-the-network-cables.html">Broadcom-Supported Third Party</a></li>
      </ul>
    </td>
  </tr>
  <tr>
    <td>P225P</td>
    <td>25 Gbps</td>
    <td>
      <ul>
        <li><a href="https://www.broadcom.com/products/fiber-optic-modules-components/networking/optical-transceivers">Broadcom Optical Transceivers</a></li>
        <li><a href="https://techdocs.broadcom.com/us/en/storage-and-ethernet-connectivity/ethernet-nic-controllers/bcm957xxx/1-0/installation_3/connecting-the-network-cables.html">Broadcom-Supported Third Party</a></li>
      </ul>
    </td>
  </tr>
  <tr>
    <td>82599ES</td>
    <td>10 Gbps</td>
    <td><a href="https://www.intel.com/content/www/us/en/embedded/products/networking/82599-10-gbe-controller-datasheet.html?asset=2377">82599-data-sheet</a></td>
  </tr>
  <tr>
    <td>AOC-S100G-b2C</td>
    <td>100 Gbps</td>
    <td>
      <ul>
        <li><a href="https://www.supermicro.com/en/support/resources/aoc/cables-transceivers">SMC Networking Cables and Transceivers Compatibility Matrix</a></li>
        <li><a href="https://www.broadcom.com/products/fiber-optic-modules-components/networking/optical-transceivers">Broadcom Optical Transceivers</a></li>
        <li><a href="https://techdocs.broadcom.com/us/en/storage-and-ethernet-connectivity/ethernet-nic-controllers/bcm957xxx/1-0/installation_3/connecting-the-network-cables.html">Broadcom-Supported Third Party</a></li>
      </ul>
    </td>
  </tr>
  <tr>
    <td>E810-CQDA2</td>
    <td>100 Gbps</td>
    <td>
      <ul>
        <li><a href="https://compatibleproducts.intel.com/ProductDetails?activeModule=Intel%C2%AE%20Ethernet&prdName=Intel%C2%AE%20Ethernet%20Network%20Adapter%20E810-2CQDA2">Intel Optical Transceivers</a></li>
        <li>Third party transceivers may be supported but are not verified by Intel</li>
      </ul>
    </td>
  </tr>
</tbody>
</table>

## Choosing Transceivers for Your Node
The two main types of fiber optic cables are the Lucent connector (LC) with two fibers (commonly used for 10 Gbps and 25 Gbps connections) and the multi-fiber push on (MPO) connector with eight fibers (commonly used for 40 Gbps connections). Although there are transceivers that can use LC fiber optic cables for 40 Gbps and 100 Gbps connections, these transceivers are generally more expensive, consume more power, and are mainly intended for reusing LC cabling or for long-distance applications.

Newer switches have 100 Gbps connections by using double 50 Gbps PAM4 connections instead of the more common four 25 Gbps connections. However, the most common and cost-efficient transmission standard for 100 Gbps is SR4, with four QSFP28 connections over an eight-fiber cable. The maximum range for SR4 is 100 m. The most common transmission standard for 25 Gbps is the Lucent connector duplex (LC duplex) with two fibers. The maximum short-range connection is 100 m and long-range connection is 10 km. There is also an extended-range standard with a maximum of 40 km.


## Choosing Cables for Your Transceiver

{% include note.html content="If you use DAC or AOC cables, ensure that the manufacturers of your NIC and network switch both support your cables." %}

* **Optical Cables:** We recommend using optical cables and optical transceivers that both the NIC and the switch support.

* **Direct Attach Cables (DACs):** Although these cables are significantly cheaper than optical cables and are less prone to compatibility and thermal issues, they are limited in length (2-3 m, up to 5 m maximum).

* **Active Optical Cables (AOCs):** Although these cables are cheaper than dedicated transceivers and fiber optic cables, they might cause compatibility issues, or your NIC or switch might not support them.


## Configuring PAM4 for Broadcom 100 Gbps NICs
For information about configuring Pulse Amplitude Modulation 4-level (PAM4), see [Auto-Negotiation on Ethernet NIC Controllers](https://techdocs.broadcom.com/us/en/storage-and-ethernet-connectivity/ethernet-nic-controllers/bcm957xxx/1-0/Configuration-adapter/auto-negotiation-configuration.html) in the Broadcom documentation.
