---
title: "Identifying NICs and Choosing Transceivers and Cables for Your Qumulo Node"
summary: "This topic explains how you can identify your node's NICs and choose the correct transceivers and cables for your Qumulo nodes."
permalink: nics-transceivers-cables.html
sidebar: administrator_guide_sidebar
keywords: network transceiver, network transceivers, nic, mellanox, short range transceiver, long range transceiver, fiber, fiber optic, fiber optic cable
---

This section explains how you can identify your node's NICs and choose the correct transceivers and cables for your Qumulo nodes.

## NICs that may be present in your NodeIdentifying the NICs in Your Node

The following table lists node types, the NICs used in them, NIC's speed, and a link to the latest transceiver compatbility documentation provided by the vendor. Some vendors update this list with every firmware release. In this case the link provided matches the latest firmware Qumulo Core supports. 

<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;}
.tg td{border-color:black;border-style:solid;border-width:1px;font-size:14px;
  overflow:hidden;padding:8px 4px;word-break:normal;}
.tg th{border-color:black;border-style:solid;border-width:1px;font-size:18px;
  font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
.tg .tg-baqh{text-align:center;vertical-align:middle}
.tg .tg-5j4b{font-weight:bold;text-align:center;vertical-align:middle}
.tg .tg-0lax{text-align:left;vertical-align:middle}
</style>
<table class="tg">
<thead>
  <tr>
    <th class="tg-5j4b">Node Type</th>
    <th class="tg-5j4b">NIC</th>
    <th class="tg-5j4b">Speed</th>
    <th class="tg-5j4b">Vendor Transceiver<br>Compatibility List</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td class="tg-0lax">C-72T, C-168T</td>
    <td class="tg-0lax">ConnectX-4Lx</td>
    <td class="tg-baqh">25 Gbps</td>
    <td class="tg-0lax"><a href="https://docs.nvidia.com/networking/display/ConnectX4LxFirmwarev14311014/Firmware+Compatible+Products" target="_blank" rel="noopener noreferrer">14.31.1014</a></td>
  </tr>
  <tr>
    <td class="tg-0lax" rowspan="2">C-192T, C-432T</td>
    <td class="tg-baqh">ConnectX-5</td>
    <td class="tg-baqh" rowspan="2">100 Gbps</td>
    <td class="tg-0lax"><a href="https://docs.nvidia.com/networking/spaces/viewspace.action?key=ConnectX5Firmwarev16301004" target="_blank" rel="noopener noreferrer">16.30.1004</a></td>
  </tr>
  <tr>
    <td class="tg-baqh">P2100G</td>
    <td class="tg-0lax"><a href="https://docs.broadcom.com/doc/BC-0591EN" target="_blank" rel="noopener noreferrer">BC-0591</a></td>
  </tr>
  <tr>
    <td class="tg-0lax" rowspan="2">HPE Apollo 4200 Gen9</td>
    <td class="tg-baqh">ConnectX-3Pro</td>
    <td class="tg-baqh" rowspan="2">40 Gbps</td>
    <td class="tg-0lax"><a href="https://network.nvidia.com/related-docs/firmware/ConnectX3Pro-FW-2_42_5000-release_notes.pdf" target="_blank" rel="noopener noreferrer">2.42.5000</a></td>
  </tr>
  <tr>
    <td class="tg-0lax">ConnectX-5</td>
    <td class="tg-0lax"><a href="https://docs.nvidia.com/networking/spaces/viewspace.action?key=ConnectX5Firmwarev16301004" target="_blank" rel="noopener noreferrer">16.30.1004</a></td>
  </tr>
  <tr>
    <td class="tg-0lax" rowspan="2">HPE Apollo 4200 Gen10 <br>192T</td>
    <td class="tg-baqh">ConnectX-5</td>
    <td class="tg-baqh" rowspan="2">100 Gbps</td>
    <td class="tg-0lax"><a href="https://docs.nvidia.com/networking/spaces/viewspace.action?key=ConnectX5Firmwarev16301004" target="_blank" rel="noopener noreferrer">16.30.1004</a></td>
  </tr>
  <tr>
    <td class="tg-baqh">ConnectX6Dx</td>
    <td class="tg-0lax"><a href="https://docs.nvidia.com/networking/spaces/viewspace.action?key=ConnectX6DxFirmwarev22311014" target="_blank" rel="noopener noreferrer">22.31.1014</a></td>
  </tr>
  <tr>
    <td class="tg-0lax" rowspan="2">HPE Apollo 4200 Gen10 <br>36T</td>
    <td class="tg-baqh">ConnectX-4Lx</td>
    <td class="tg-baqh" rowspan="2">25 Gbps</td>
    <td class="tg-0lax"><a href="https://docs.nvidia.com/networking/display/ConnectX4LxFirmwarev14311014/Firmware+Compatible+Products" target="_blank" rel="noopener noreferrer">14.31.1014</a></td>
  </tr>
  <tr>
    <td class="tg-baqh">P225P</td>
    <td class="tg-0lax"><a href="https://docs.broadcom.com/doc/BC-0591EN" target="_blank" rel="noopener noreferrer">BC-0591</a></td>
  </tr>
  <tr>
    <td class="tg-0lax" rowspan="4">HPE Apollo 4200 Gen10 <br>90T, 336T</td>
    <td class="tg-baqh">ConnectX-5</td>
    <td class="tg-baqh" rowspan="2">40 Gbps</td>
    <td class="tg-0lax"><a href="https://docs.nvidia.com/networking/spaces/viewspace.action?key=ConnectX5Firmwarev16301004" target="_blank" rel="noopener noreferrer">16.30.1004</a></td>
  </tr>
  <tr>
    <td class="tg-baqh">ConnectX-6Dx</td>
    <td class="tg-0lax"><a href="https://docs.nvidia.com/networking/spaces/viewspace.action?key=ConnectX6DxFirmwarev22311014" target="_blank" rel="noopener noreferrer">22.31.1014</a></td>
  </tr>
  <tr>
    <td class="tg-baqh">ConnectX-4Lx</td>
    <td class="tg-baqh" rowspan="2">25 Gbps</td>
    <td class="tg-0lax"><a href="https://docs.nvidia.com/networking/display/ConnectX4LxFirmwarev14311014/Firmware+Compatible+Products" target="_blank" rel="noopener noreferrer">14.31.1014</a></td>
  </tr>
  <tr>
    <td class="tg-baqh">P225P</td>
    <td class="tg-0lax"><a href="https://docs.broadcom.com/doc/BC-0591EN" target="_blank" rel="noopener noreferrer">BC-0591</a></td>
  </tr>
  <tr>
    <td class="tg-0lax">HPE ProLiant DL325 Gen10 Plus</td>
    <td class="tg-baqh">ConnectX-6</td>
    <td class="tg-baqh">100 Gbps</td>
    <td class="tg-0lax"><a href="https://docs.nvidia.com/networking/spaces/viewspace.action?key=ConnectX6Firmwarev20301004" target="_blank" rel="noopener noreferrer">16.30.1004</a></td>
  </tr>
  <tr>
    <td class="tg-0lax" rowspan="2">K-144T, K-168T</td>
    <td class="tg-baqh">Intel82599ES</td>
    <td class="tg-baqh" rowspan="2">10 Gbps</td>
    <td class="tg-0lax"><a href="https://www.intel.com/content/www/us/en/embedded/products/networking/82599-10-gbe-controller-datasheet.html?asset=2377" target="_blank" rel="noopener noreferrer">82599-data-sheet</a></td>
  </tr>
  <tr>
    <td class="tg-0lax">ConnectX-4Lx</td>
    <td class="tg-0lax"><a href="https://docs.nvidia.com/networking/display/ConnectX4LxFirmwarev14311014/Firmware+Compatible+Products" target="_blank" rel="noopener noreferrer">14.31.1014</a></td>
  </tr>
  <tr>
    <td class="tg-0lax" rowspan="2">K-432T</td>
    <td class="tg-baqh">ConnectX-4Lx</td>
    <td class="tg-baqh" rowspan="2">25 Gbps</td>
    <td class="tg-0lax"><a href="https://docs.nvidia.com/networking/display/ConnectX4LxFirmwarev14311014/Firmware+Compatible+Products" target="_blank" rel="noopener noreferrer">14.31.1014</a></td>
  </tr>
  <tr>
    <td class="tg-baqh">P225P</td>
    <td class="tg-0lax"><a href="https://docs.broadcom.com/doc/BC-0591EN" target="_blank" rel="noopener noreferrer">BC-0591</a></td>
  </tr>
  <tr>
    <td class="tg-0lax">P-23T, P-92T, P-184T, P-368T</td>
    <td class="tg-baqh">ConnectX-5</td>
    <td class="tg-baqh">100 Gbps</td>
    <td class="tg-0lax"><a href="https://docs.nvidia.com/networking/spaces/viewspace.action?key=ConnectX5Firmwarev16301004" target="_blank" rel="noopener noreferrer">16.30.1004</a></td>
  </tr>
  <tr>
    <td class="tg-0lax" rowspan="2">QC24, QC40</td>
    <td class="tg-baqh">ConnectX-3</td>
    <td class="tg-baqh" rowspan="2">10 Gbps</td>
    <td class="tg-0lax"><a href="https://network.nvidia.com/sites/default/files/related-docs/firmware/ConnectX3-FW-2_42_5000-release_notes.pdf)" target="_blank" rel="noopener noreferrer">2.42.5000</a></td>
  </tr>
  <tr>
    <td class="tg-baqh">ConnectX-4Lx</td>
    <td class="tg-0lax"><a href="https://docs.nvidia.com/networking/display/ConnectX4LxFirmwarev14311014/Firmware+Compatible+Products" target="_blank" rel="noopener noreferrer">14.31.1014</a></td>
  </tr>
  <tr>
    <td class="tg-0lax" rowspan="2">QC104, QC208, <br>QC260, QC360</td>
    <td class="tg-baqh">ConnectX-3 Pro</td>
    <td class="tg-baqh" rowspan="2">40 Gbps</td>
    <td class="tg-0lax"><a href="https://network.nvidia.com/related-docs/firmware/ConnectX3Pro-FW-2_42_5000-release_notes.pdf" target="_blank" rel="noopener noreferrer">2.42.5000</a></td>
  </tr>
  <tr>
    <td class="tg-baqh">ConnectX-4</td>
    <td class="tg-0lax"><a href="https://docs.nvidia.com/networking/display/ConnectX4Firmwarev12282006" target="_blank" rel="noopener noreferrer">12.28.2006</a></td>
  </tr>
  <tr>
    <td class="tg-0lax" rowspan="2">Supermicro A+ WIO 1114S-WN10RT</td>
    <td class="tg-baqh">ConnectX-6</td>
    <td class="tg-baqh" rowspan="2">100 Gbps</td>
    <td class="tg-0lax"><a href="https://docs.nvidia.com/networking/spaces/viewspace.action?key=ConnectX6Firmwarev20301004" target="_blank" rel="noopener noreferrer">16.30.1004</a></td>
  </tr>
  <tr>
    <td class="tg-baqh">P2100G</td>
    <td class="tg-0lax"><a href="https://docs.broadcom.com/doc/BC-0591EN" target="_blank" rel="noopener noreferrer">BC-0591</a></td>
  </tr>
</tbody>
</table>

## Identifying your NIC
If your node type has more than one possible NIC type, you may need to identify what NIC is present in your node(s). Ssh to the commandline interface of your node. Run the following<br>
`lspci | grep "Ethernet controller"`<br>
An example output
```
45:00.0 Ethernet controller: Broadcom Inc. and subsidiaries BCM57416 NetXtreme-E Dual-Media 10G RDMA Ethernet Controller (rev 01)
45:00.1 Ethernet controller: Broadcom Inc. and subsidiaries BCM57416 NetXtreme-E Dual-Media 10G RDMA Ethernet Controller (rev 01)
81:00.0 Ethernet controller: Mellanox Technologies MT28908 Family [ConnectX-6]
81:00.1 Ethernet controller: Mellanox Technologies MT28908 Family [ConnectX-6]
c5:00.0 Ethernet controller: Mellanox Technologies MT28908 Family [ConnectX-6]
c5:00.1 Ethernet controller: Mellanox Technologies MT28908 Family [ConnectX-6]
```

When running this command, it may return the onboard NICs which are 10 Gbps interfaces. These many be ignored. In this example, which was run on a Supermicro A+ WIO 1114S-WN10RT, we see that this node has 2 ConnectX-6 NICs. 

## Choosing Transceivers for Your Node
The two main types of fiber optic cables are the Lucent connector (LC) with two fibers (commonly used for 10 Gbps and 25 Gbps connections) and the multi-fiber push on (MPO) connector with eight fibers (commonly used for 40 Gbps connections). Although there are transceivers that can use LC fiber optic cables for 40 Gbps and 100 Gbps connections, these transceivers are generally more expensive, consume more power, and are mainly intended for reusing LC cabling or for long-distance applications.

Newer switches have 100 Gbps connections using double 50 Gbps PAM4 connections instead of the more common four 25 Gbps connections. However, the most common and cost-efficient transmission standard for 100 Gbps is SR4, with four QSFP28 connections over an eight-fiber cable. The maximum range for SR4 is 100 m. The most common transmission standard for 25 Gbps is the Lucent connector duplex (LC duplex) with two fibers. The maximum short-range connection is 100 m and long-range connection is 10 km. There is also an extended-range standard with a maximum of 40 km.

## Choosing Cables for Your Transceiver
* **Optical Cables:** We recommend using optical cables and optical transceivers that both the NIC and the switch support.

* **Direct Attach Cables (DACs):** Although these cables are significantly cheaper than optical cables and are less prone to compatibility and thermal issues, they are limited in length (2-3 m, up to 5 m maximum).

* **Active Optical Cables (AOCs):** Although these cables are cheaper than dedicated transceivers and fiber optic cables, they might cause compatibility issues, or your NIC or switch might not support them.

{% include note.html content="If you use DAC or AOC cables, ensure that your NIC vendor and the maker of your network switch both support your cables." %}
