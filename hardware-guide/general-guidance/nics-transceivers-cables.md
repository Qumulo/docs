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

## Corresponding Node and NIC Types
The following table lists node types and the speeds of the NICs included. The table further down lists NIC models and links their transceiver compatibility tables.
Not all nodes are compatible with all NICs of a given speed, if you need to change your NICs to a different model, contact Qumulo Care.

<table>
<thead>
  <tr>
    <th>Node Type</th>
    <th>Speed</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td>SM 1114S</td>
    <td rowspan=8>100 Gbps</td>
  </tr>
  <tr>
    <td>P-23T</td>
  </tr>
  <tr>
    <td>P-92T</td>
  </tr>
  <tr>
    <td>P-184T</td>
  </tr>
  <tr>
    <td>P-368T</td>
  </tr>
  <tr>
    <td>C-192T</td>
  </tr>
  <tr>
    <td>C-432T</td>
  </tr>
  <tr>
    <td>HPE DL325 Gen10+</td>
  </tr>

  <tr>
    <td>SM 1014S</td>
    <td>100 Gbps or 25 Gbps depending on license
  </tr>

  <tr>
    <td>QC104</td>
    <td rowspan=5>40 Gbps</td>
  </tr>
  <tr>
    <td>QC208</td>
  </tr>
  <tr>
    <td>QC260</td>
  </tr>
  <tr>
    <td>QC360</td>
  </tr>
  <tr>
    <td>HPE A4200 Gen9</td>
  </tr>

  <tr>
    <td>HPE A4200 Gen10
    <ul>
        <li>36T</li>
        <li>90T</li>
      </ul>
    </td>
    <td>10 Gbps/25 Gbps/40 Gbps/100 Gbps</td>
  </tr>
  <tr>
    <td>HPE A4200 Gen10
    <ul>
        <li>192T</li>
      </ul>
    </td>
    <td>40 Gbps/100 Gbps</td>
  </tr>
  <tr>
    <td>HPE A4200 Gen10
    <ul>
        <li>336T</li>
      </ul>
    </td>
    <td>25 Gbps/40 Gbps</td>
  </tr>
  <tr>
    <td>C-72T</td>
    <td rowspan=3 >25 Gbps</td>
  </tr>
  <tr>
    <td>C-168T</td>
  </tr>
  <tr>
    <td>K432T</td>
  </tr>

  <tr>
    <td>K-144T</td>
    <td rowspan=4 >10 Gbps</td>
  </tr>
  <tr>
    <td>K-168T</td>
  </tr>
  <tr>
    <td>QC24</td>
  </tr>
  <tr>
    <td>QC40</td>
  </tr>
</tbody>
</table>

## To Identify Your NIC
First, identify the NICs present in your node. Most nodes are compatible with multiple NICs, and which transceivers are compatible is determined by the specific NIC model.

1. Use SSH to connect to your node.

1. Run the `lspci | grep "Ethernet controller"` command.

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
    <th>Node Type</th>
    <th>Speed</th>
    <th>NIC</th>
    <th>Vendor Transceiver<br>Compatibility List</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td><ul><li>C-72T</li><li>C-168T</li></ul></td>
    <td>25 Gbps</td>
    <td>ConnectX-4 Lx</td>
    <td><a href="https://docs.nvidia.com/networking/display/ConnectX4LxFirmwarev14311014/Firmware+Compatible+Products">Nvidia Supported Devices</a></td>
  </tr>
  <tr>
    <td rowspan="2"><ul><li>C-192T</li><li>C-432T</li></ul></td>
    <td rowspan="2">100 Gbps</td>
    <td>ConnectX-5</td>
    <td><a href="https://docs.nvidia.com/networking/display/ConnectX5Firmwarev16301004/Firmware+Compatible+Products#FirmwareCompatibleProducts-SupportedDevicesSupportedDevices">Nvidia Supported Devices</a></td>
  </tr>
  <tr>
    <td>P2100G</td>
    <td><ul><li><a href="https://www.broadcom.com/products/fiber-optic-modules-components/networking/optical-transceivers">Broadcom Optical Transceivers</a></li><li><a href="https://techdocs.broadcom.com/us/en/storage-and-ethernet-connectivity/ethernet-nic-controllers/bcm957xxx/1-0/installation_3/connecting-the-network-cables.html">Broadcom-Supported Third Party</a></li></ul></td>
  </tr>
  <tr>
    <td rowspan="2">HPE A4200 Gen9</td>
    <td rowspan="2">40 Gbps</td>
    <td>ConnectX-3Pro</td>
    <td><a href="https://network.nvidia.com/related-docs/firmware/ConnectX3Pro-FW-2_42_5000-release_notes.pdf">FW release notes (see section 1.2)</a></td>
  </tr>
  <tr>
    <td>ConnectX-5</td>
    <td><a href="https://docs.nvidia.com/networking/display/ConnectX5Firmwarev16301004/Firmware+Compatible+Products#FirmwareCompatibleProducts-SupportedDevicesSupportedDevices">Nvidia Supported Devices</a></td>
  </tr>
  <tr>
    <td rowspan="2">HPE A4200 Gen10<ul><li>192T</li></ul></td>
    <td rowspan="2">100 Gbps</td>
    <td>ConnectX-5</td>
    <td><a href="https://docs.nvidia.com/networking/display/ConnectX5Firmwarev16301004/Firmware+Compatible+Products#FirmwareCompatibleProducts-SupportedDevicesSupportedDevices">Nvidia Supported Devices</a></td>
  </tr>
  <tr>
    <td>ConnectX-6Dx</td>
    <td><a href="https://docs.nvidia.com/networking/display/ConnectX6DxFirmwarev22311014/Firmware+Compatible+Products">Nvidia Compatible Products</a></td>
  </tr>
  <tr>
    <td rowspan="2">HPE A4200 Gen10<ul><li>36T</li></ul></td>
    <td rowspan="2">25 Gbps</td>
    <td>ConnectX-4 Lx</td>
    <td><a href="https://docs.nvidia.com/networking/display/ConnectX4LxFirmwarev14311014/Firmware+Compatible+Products">Nvidia Compatible Products</a></td>
  </tr>
  <tr>
    <td>P225P</td>
    <td><ul><li><a href="https://www.broadcom.com/products/fiber-optic-modules-components/networking/optical-transceivers">Broadcom Optical Transceivers</a></li><li><a href="https://techdocs.broadcom.com/us/en/storage-and-ethernet-connectivity/ethernet-nic-controllers/bcm957xxx/1-0/installation_3/connecting-the-network-cables.html">Broadcom-Supported Third Party</a></li></ul></td>
  </tr>
  <tr>
    <td rowspan="4">HPE A4200 Gen10<ul><li>90T</li><li>336T</li></ul></td>
    <td rowspan="2">40 Gbps</td>
    <td>ConnectX-5</td>
    <td><a href="https://docs.nvidia.com/networking/display/ConnectX5Firmwarev16301004/Firmware+Compatible+Products#FirmwareCompatibleProducts-SupportedDevicesSupportedDevices">Nvidia Supported Devices</a></td>
  </tr>
  <tr>
    <td>ConnectX-6Dx</td>
    <td><a href="https://docs.nvidia.com/networking/display/ConnectX6DxFirmwarev22311014/Firmware+Compatible+Products">Nvidia Compatible Products</a></td>
  </tr>
  <tr>
    <td rowspan="2">25 Gbps</td>
    <td>ConnectX-4 Lx</td>
    <td><a href="https://docs.nvidia.com/networking/display/ConnectX4LxFirmwarev14311014/Firmware+Compatible+Products">Nvidia Compatible Products</a></td>
  </tr>
  <tr>
    <td>P225P</td>
    <td><ul><li><a href="https://www.broadcom.com/products/fiber-optic-modules-components/networking/optical-transceivers">Broadcom Optical Transceivers</a></li><li><a href="https://techdocs.broadcom.com/us/en/storage-and-ethernet-connectivity/ethernet-nic-controllers/bcm957xxx/1-0/installation_3/connecting-the-network-cables.html">Broadcom-Supported Third Party</a></li></ul></td>
  </tr>
  <tr>
    <td>HPE DL325 Gen10 Plus</td>
    <td>100 Gbps</td>
    <td>ConnectX-6</td>
    <td><a href="https://docs.nvidia.com/networking/display/ConnectX6Firmwarev20301004/Firmware+Compatible+Products">Nvidia Compatible Products</a></td>
  </tr>
  <tr>
    <td rowspan="2"><ul><li>K-144T</li><li>K-168T</li></ul></td>
    <td rowspan="2">10 Gbps</td>
    <td>82599ES</td>
    <td><a href="https://www.intel.com/content/www/us/en/embedded/products/networking/82599-10-gbe-controller-datasheet.html?asset=2377">82599-data-sheet</a></td>
  </tr>
  <tr>
    <td>ConnectX-4 Lx</td>
    <td><a href="https://docs.nvidia.com/networking/display/ConnectX4LxFirmwarev14311014/Firmware+Compatible+Products">Nvidia Compatible Products</a></td>
  </tr>
  <tr>
    <td rowspan="2"><ul><li>K-432T</li></ul></td>
    <td rowspan="2">25 Gbps</td>
    <td>ConnectX-4 Lx</td>
    <td><a href="https://docs.nvidia.com/networking/display/ConnectX4LxFirmwarev14311014/Firmware+Compatible+Products">Nvidia Compatible Products</a></td>
  </tr>
  <tr>
    <td>P225P</td>
    <td><ul><li><a href="https://www.broadcom.com/products/fiber-optic-modules-components/networking/optical-transceivers">Broadcom Optical Transceivers</a></li><li><a href="https://techdocs.broadcom.com/us/en/storage-and-ethernet-connectivity/ethernet-nic-controllers/bcm957xxx/1-0/installation_3/connecting-the-network-cables.html">Broadcom-Supported Third Party</a></li></ul></td>
  </tr>
  <tr>
    <td><ul><li>P-23T</li><li>P-92T</li><li>P-184T</li><li>P-368T</li></ul></td>
    <td>100 Gbps</td>
    <td>ConnectX-5</td>
    <td><a href="https://docs.nvidia.com/networking/display/ConnectX5Firmwarev16301004/Firmware+Compatible+Products#FirmwareCompatibleProducts-SupportedDevicesSupportedDevices">Nvidia Supported Devices</a></td>
  </tr>
  <tr>
    <td rowspan="2"><ul><li>QC24</li><li>QC40</li></ul></td>
    <td rowspan="2">10 Gbps</td>
    <td>ConnectX-3</td>
    <td><a href="https://network.nvidia.com/sites/default/files/related-docs/firmware/ConnectX3-FW-2_42_5000-release_notes.pdf)">FW release notes (see section 1.2)</a></td>
  </tr>
  <tr>
    <td>ConnectX-4 Lx</td>
    <td><a href="https://docs.nvidia.com/networking/display/ConnectX4LxFirmwarev14311014/Firmware+Compatible+Products">Nvidia Compatible Products</a></td>
  </tr>
  <tr>
    <td rowspan="2"><ul><li>QC104</li><li>QC208</li><li>QC260</li><li>QC360</li></ul></td>
    <td rowspan="2">40 Gbps</td>
    <td>ConnectX-3 Pro</td>
    <td><a href="https://network.nvidia.com/related-docs/firmware/ConnectX3Pro-FW-2_42_5000-release_notes.pdf">FW release notes (see section 1.2)</a></td>
  </tr>
  <tr>
    <td>ConnectX-4</td>
    <td><a href="https://docs.nvidia.com/networking/display/ConnectX4Firmwarev12282006/Firmware+Compatible+Products">Nvidia Compatible Products</a></td>
  </tr>
  <tr>
    </tr>
  <tr>
    <td rowspan="2">{{site.sm1114s}}</td>
    <td rowspan="2">100 Gbps</td>
    <td>ConnectX-6</td>
    <td><a href="https://docs.nvidia.com/networking/display/ConnectX6Firmwarev20301004/Firmware+Compatible+Products">Nvidia Compatible Products</a></td>
  </tr>
  <tr>
    <td>AOC-S100G-b2C</td>
    <td><ul><li><a href="https://www.supermicro.com/en/support/resources/aoc/cables-transceivers">SMC Networking Cables and Transceivers Compatibility Matrix</a></li><li><a href="https://www.broadcom.com/products/fiber-optic-modules-components/networking/optical-transceivers">Broadcom Optical Transceivers</a></li><li><a href="https://techdocs.broadcom.com/us/en/storage-and-ethernet-connectivity/ethernet-nic-controllers/bcm957xxx/1-0/installation_3/connecting-the-network-cables.html">Broadcom-Supported Third Party</a></li></ul></td>
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
