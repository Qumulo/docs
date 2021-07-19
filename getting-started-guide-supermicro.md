# Qumulo Supermicro Getting Started Guide

## Who This Guide is For

## What This Guide Contains

## Cheat Sheet

### Front and Back Node Diagrams

### Four-Node Architecture Diagram


# Prerequisites

## Networking and Switch Requirements

## Special Firmware Instructions


# Racking Your Nodes

## Using the Outside and Inside Rails

## Inserting the Chassis


# Wiring Your Nodes

## Connecting the IPMI

## Connecting the SFP28

## Connecting the Power


# Installing Qumulo Core on Your Node

## Running the Field Verification Tool

## Installing the Software Image


# Creating a Qumulo Cluster

## Verifying the Node Order

## Creating the Cluster


# Appendix
The following appendix contains the technical specifications for Supermicro nodes, a drive diagram, and an LED guide.

## Supermicro Node Specifications
<table cellspacing="0" cellpadding="0">
<thead>
<tr>
<th><strong>Specification</strong></th>
<th><strong>Supermicro All-NVMe 153TB</strong></th>
<th><strong>Supermicro All-NVMe 76TB</strong></th>
<th><strong>Supermicro All-NVMe 30TB</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td><strong>Connectivity Ports (NIC)</strong></td>
<td colspan="3">4 x 100GbE (2 x Mellanox CX-6 NICs)</td>
</tr>
<tr>
<td><strong>Management Ports (BMC)</strong></td>
<td colspan="3">1 x 1GbE Base-T (RJ45)</td>
</tr>
<tr>
<td><strong>Solid State Storage Media</strong></td>
<td>
<div>10 x 15.36TB NVMe drives (Micron 9300 or WDC SN840)</div>
</td>
<td>
<div>10 x 7.68TB NVMe drives (Micron 7300 or WDC SN640)</div>
</td>
<td>
<div>8 x 3.84TB NVMe drives (Micron 7300 or WDC SN640)</div>
</td>
</tr>
<tr>
<td><strong>Boot Drive</strong></td>
<td colspan="3">1TB M.2 NVMe drive (Intel P4511 1TB)</td>
</tr>
<tr>
<td><strong>CPU</strong></td>
<td colspan="3">AMD EPYC 7402P 24-Core Processor</td>
</tr>
<tr style="height: 21.5px;">
<td style="height: 21.5px;"><strong>Memory</strong></td>
<td style="height: 21.5px;" colspan="3">128GB (16GB * 8)</td>
</tr>
<tr>
<td><strong>Power Supply</strong></td>
<td colspan="3">2 x 750W Power Supplies</td>
</tr>
<tr>
<td><strong>Dimensions (H x W x D)</strong></td>
<td colspan="3">1.7" x 17.2" x 23.5" (43mm x 437mm x 597mm)</td>
</tr>
<tr>
<td><strong>Weight</strong></td>
<td colspan="3">46 lbs (20.9kg)</td>
</tr>
<tr>
<td><strong>Power Requirements</strong></td>
<td colspan="3">100 &ndash; 240V, 50/60Hz</td>
</tr>
<tr>
<td><strong>Typical Power Consumption</strong></td>
<td>265W</td>
<td>230W</td>
<td>230W</td>
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
<td>460W</td>
<td>415W</td>
<td>384W</td>
</tr>
<tr>
<td><strong>Maximum Thermal Rating</strong></td>
<td>1569 BTU/hr</td>
<td>1416 BTU/hr</td>
<td>1310 BTU/hr</td>
</tr>
<tr>
<td><strong>Operating Temperature</strong></td>
<td colspan="3">50&deg;F-95&deg;F(10&deg;C&ndash;35&deg;C)</td>
</tr>
<tr>
<td><strong>Non-Operating Temperature</strong></td>
<td colspan="3">40&deg;F-158&deg;F(-40&deg;C&ndash;70&deg;C)</td>
</tr>
<tr>
<td><strong>Operating Relative Humidity</strong></td>
<td colspan="3">8% to 90% (non-condensing)</td>
</tr>
<tr>
<td>
<div><strong>Non-Operating Relative Humidity</strong></div>
</td>
<td colspan="3">5% to 95% (non-condensing)</td>
</tr>
</tbody>
</table>

## Drive Diagram

## LED Guide
On the front, right side of the node, there are five LEDs.

| Label         | Color    | Normal Behavior                 |
| ------------- | -------- | ------------------------------- |
| Info          | Red      | Blinks if power cable unplugged |
| Lan A         | (unused) | Off                             |
| Lan B         | (unused) | Off                             |
| Disk Activity | Yellow   | On or blinking                  |
| Power         | Green    | On                              |

**Note:** During normal operation, the **Lan B** LED might appear to be lit slightly when the **Disk Activity** LED is on.

On the back of the node, LAN LEDs are located behind the vent holes on the NIC. Each port has one green light which doesn't blink faster or slower depending on network traffic.

| Status             | Normal Behavior  |
| ------------------ | ---------------- |
| Off                | No link          |
| On or blinking     | Link established |
