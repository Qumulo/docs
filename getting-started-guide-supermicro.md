# Qumulo on Supermicro Getting Started Guide
Welcome to Qumulo on Supermicro. This guide is intended for system administrators, professional service providers, and colleagues in your organization who are responsible for installing and configuring server hardware.

This guide includes quick-reference diagrams for Supermicro All-NVMe nodes and cluster architecture diagrams; explains the prerequisites for installation; and walks you through racking and wiring your nodes, installing Qumulo Core on your nodes, and creating a Qumulo cluster. The [Appendix](#appendix) contains the Supermicro node specifications, drive diagram, LED guide, and currently known behavior of Supermicro nodes.

For more information about administering your cluster, see the [Qumulo Care](https://care.qumulo.com/hc/en-us) portal. If you have any questions, you can [open a case](https://care.qumulo.com/hc/en-us/requests/new), email us at [care@qumulo.com](mailto:care@qumulo.com), or contact us in your private channel in the [qumulocare](https://qumulocare.slack.com/) Slack workspace.


# Quick Reference
This section contains quick-reference diagrams for the front and back of your Supermicro node, as well as an example four-node cluster.

## Front and Back Node Diagrams

## Four-Node Cluster Architecture Diagram


# Prerequisites
This section describes the network, switch, and firmwarew prerequisites for installing Qumulo Core.

## Networking and Switch Requirements

## Special Firmware Instructions


# Step 1: Racking Your Nodes
**Tip:** You can use the following instructions to add new nodes after your initial cluster deployment.

This section describes how to use the outside and inside rails of your Supermicro node and how to rack your nodes in your data center.

## Using the Outside and Inside Rails

## Inserting the Chassis


# Step 2: Wiring Your Nodes
This section describes how to wire the remote access, network, and power ports of your Supermicro node.

## Connecting the IPMI
The Intelligent Platform Management Interface (IPMI) is a dedicated port that allows functionality such as remote display, remote control, and remote power on or off (similar to HPE iLO). There is one IPMI port on the back of your node.

## Connecting the SFP28
There are four SFP28 (25 Gbps) ports on the back of your node.

| Port Location         | Function           |
| --------------------- | ------------------ |
| Top row (`1`, `0`)    | Front-end ports    |
| Bottom row (`1`, `0`) | Back-end ports     |

## Connecting the Power


# Step 3: Installing Qumulo Core on Your Nodes
This section describes how to install Qumulo Core on your Supermicro nodes.

## Running the Field Verification Tool

## Installing the Software Image


# Step 4: Creating a Qumulo Cluster
This section describes how to combine your Supermicro nodes into a Qumulo cluster.

## Verifying the Node Order

## Creating the Cluster


# Appendix
The following appendix contains the technical specifications for Supermicro 153 TB, 76 TB, and 30 TB nodes, a drive map, an LED guide, and current known behavior of Supermicro nodes.

## Supermicro Technical Specifications
<table cellspacing="0" cellpadding="0">
<thead>
<tr>
<th><strong>Specification</strong></th>
<th><strong>Supermicro All-NVMe 153 TB</strong></th>
<th><strong>Supermicro All-NVMe 76 TB</strong></th>
<th><strong>Supermicro All-NVMe 30 TB</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td><strong>Connectivity Ports (NIC)</strong></td>
<td colspan="3" style="text-align: center;">4 &#215; 100 GbE (2 x Mellanox CX-6 NICs)</td>
</tr>
<tr>
<td><strong>Management Ports (BMC)</strong></td>
<td colspan="3" style="text-align: center;">1 &#215; 1 GbE Base-T (RJ45)</td>
</tr>
<tr>
<td><strong>Solid State Storage Media</strong></td>
<td>
<div>10 &#215; 15.36 TB NVMe drives (Micron 9300 or WDC SN840)</div>
</td>
<td>
<div>10 &#215; 7.68 TB NVMe drives (Micron 7300 or WDC SN640)</div>
</td>
<td>
<div>8 &#215; 3.84 TB NVMe drives (Micron 7300 or WDC SN640)</div>
</td>
</tr>
<tr>
<td><strong>Boot Drive</strong></td>
<td colspan="3" style="text-align: center;">1 TB M.2 NVMe drive (Intel P4511 1 TB)</td>
</tr>
<tr>
<td><strong>CPU</strong></td>
<td colspan="3" style="text-align: center;">AMD EPYC 7402P 24-Core Processor</td>
</tr>
<tr>
<td><strong>Memory</strong></td>
<td colspan="3" style="text-align: center;">128 GB (16 GB &#215; 8)</td>
</tr>
<tr>
<td><strong>Power Supply</strong></td>
<td colspan="3" style="text-align: center;">2 &#215; 750 W Power Supplies</td>
</tr>
<tr>
<td><strong>Dimensions (H &#215; W &#215; D)</strong></td>
<td colspan="3" style="text-align: center;">1.7" &#215; 17.2" &#215; 23.5" (43 mm &#215; 437 mm &#215; 597 mm)</td>
</tr>
<tr>
<td><strong>Weight</strong></td>
<td colspan="3" style="text-align: center;">46 lbs (20.9 kg)</td>
</tr>
<tr>
<td><strong>Power Requirements</strong></td>
<td colspan="3" style="text-align: center;">100&ndash;240 V, 50/60Hz</td>
</tr>
<tr>
<td><strong>Typical Power Consumption</strong></td>
<td>265 W</td>
<td>230 W</td>
<td>230 W</td>
</tr>
<tr>
<td><strong>Typical Thermal Rating</strong></td>
<td>904 BTU/hr</td>
<td>785 BTU/hr</td>
<td>785 BTU/hr</td>
</tr>
<tr>
<td>
<div><strong>Maximum Power Consumption</strong></div>
</td>
<td>460 W</td>
<td>415 W</td>
<td>384 W</td>
</tr>
<tr>
<td><strong>Maximum Thermal Rating</strong></td>
<td>1569 BTU/hr</td>
<td>1416 BTU/hr</td>
<td>1310 BTU/hr</td>
</tr>
<tr>
<td><strong>Operating Temperature</strong></td>
<td colspan="3" style="text-align: center;">50&deg;F&ndash;95&deg;F(10&deg;C&ndash;35&deg;C)</td>
</tr>
<tr>
<td><strong>Non-Operating Temperature</strong></td>
<td colspan="3" style="text-align: center;">40&deg;F&ndash;158&deg;F(-40&deg;C&ndash;70&deg;C)</td>
</tr>
<tr>
<td><strong>Operating Relative Humidity</strong></td>
<td colspan="3" style="text-align: center;">8%&ndash;90% (non-condensing)</td>
</tr>
<tr>
<td>
<div><strong>Non-Operating Relative Humidity</strong></div>
</td>
<td colspan="3" style="text-align: center;">5%&ndash;95% (non-condensing)</td>
</tr>
</tbody>
</table>

## Drive Mapping
A Supermicro node contains slots for 10 drives and one boot drive. The following is the mapping for the drives using the `<slot_id>: <pcie_mapping>` format.

**Note:** The mapping for the boot drive is `4b:00.0`.

<table>
<thead>
  <tr>
    <th>Row</th>
    <th colspan="5">Drive Slots</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td>Top</td>
    <td><code>1: c2:00.0</code></td>
    <td><code>2: c4.00.0</code></td>
    <td><code>3: 83:00.0</code></td>
    <td><code>4: 04:00.0</code></td>
    <td><code>5: 44:00.0</code></td>
  </tr>
  <tr>
    <td>Bottom</td>
    <td><code>6: c1:00.0</code></td>
    <td><code>7: c3:00.0</code></td>
    <td><code>8: 82:00.0</code></td>
    <td><code>9: 03.00.0</code></td>
    <td><code>10: 43:00.0</code></td>
  </tr>
</tbody>
</table>

## LED Guide
On the front, right side of your Supermicro node, there are five LEDs.

| Label         | Color       | Normal Behavior                 |
| ------------- | ----------- | ------------------------------- |
| Info          | 🔴 (red)    | Blinks if power cable unplugged |
| Lan A         | (unused)    | Off                             |
| Lan B         | (unused)    | Off                             |
| Disk Activity | 🟡 (yellow) | On or blinking                  |
| Power         | 🟢 (green)  | On                              |

**Note:** During normal operation, the **Lan B** LED might appear to be lit slightly when the **Disk Activity** LED is on.

On the back of your Supermicro node, LAN LEDs are located behind the vent holes on the NIC. Each port has one light. Network traffic *doesn't* affect the speed of the light's blinking.

| Color      | Status             | Normal Behavior  |
| ---------- | ------------------ | ---------------- |
| &#8212;    | Off                | No link          |
| 🟢 (green) | On or blinking     | Link established |

## Known Behavior
The following is the currently known behavior for Supermicro nodes.

### USB Drive Boot Priority
To boot a Supermicro node from a USB drive, you must manually set **Boot Option #1** to **[UEFI] USB key**.

### Data Center Management Suite (DCMS) Licenses
**Important:** If a DCMS license isn't installed on a Supermicro node, the Field Verification Tool (FVT) fails, preventing you from installing Qumulo Core.

A DCMS license is also required for certain other features to work.
