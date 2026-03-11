---
title: "Replacing Hardware Components in Your Quiver 2U Hybrid Gen2 Nodes"
summary: "This section explains how to replace hardware components in Quiver 2U Hybrid Gen2 nodes."
permalink: /hardware-guide/quiver-2u-hybrid-gen2/replacing-hardware-components.html
sidebar: hardware_guide_sidebar
varRemovePCIeCard: <a href="#replace-pci-e-riser-card">Remove the PCIe card from the motherboard.</a>
varHotPlug: You can replace this component without powering off the node.
varNoHotPlug: To replace this component, you must first power off the node.
platform:
  - quiver
  - q2uhg2
---

For detailed hardware replacement instructions, see <a href="/pdf/quiver-2uh-hybrid-rackmount-chassis-user-manual.pdf#page=11" class="pdf">RSC-2MS Rackmount Chassis User's Manual</a> {{site.hardware.fromAIC}}.

{% capture ShipScrews %}Before installing your {{site.q2uhg2}} node in a server rack, you must remove the shipping screws from the node.{% endcapture %}
{% include important.html content=ShipScrews %}


## Removing and Replacing the Top Cover
Follow the instructions in the SC-2MS Rackmount Chassis User's Manual: <a href="/pdf/quiver-2uh-hybrid-rackmount-chassis-user-manual.pdf#page=13" class="pdf">Top Cover (p. 13)</a>.


## Initializing the Replacement Boot Drive
{{site.bootDriveInit}} For more information, see [NVMe M.2 Boot Drive](drive-bay-mapping.html#nvme-m2-boot-drive).

{% include content-reuse/hardware-guides/platform-agnostic-boot-drive-replacement.md %}


## Replacing an HDD Drive
Your {{site.q2uhg2}} chassis contains 24 HDDs. For more information about drive location and mapping, see [Internal HDD Drives](drive-bay-mapping.html#internal-hdd-drives).


## Replacing an NVMe Drive
Your {{site.q2uhg2}} chassis contains 6 NVMe drives. For more information about drive location and mapping, see [Rear NVMe Drives](drive-bay-mapping.html#rear-nvme-drives).


## Replacing a Power Supply Unit (PSU)
Follow the instructions in the SC-2MS Rackmount Chassis User's Manual: <a href="/pdf/quiver-2uh-hybrid-rackmount-chassis-user-manual.pdf#page=14" class="pdf">Power Supply Unit Module (p. 14)</a>.


## Replacing a Fan Module
Follow the instructions in the SC-2MS Rackmount Chassis User's Manual: <a href="/pdf/quiver-2uh-hybrid-rackmount-chassis-user-manual.pdf#page=15" class="pdf">Fan Module (p. 15)</a>.


## To Replace the Node Chassis
{% include important.html content="After you perform a chassis swap, you must reconfigure the IPMI settings for your node." %}

1. Remove the existing HDD and NVMe drives, the boot drive, and the NIC from the chassis.

1. Install the existing components in the new chassis.

{% include content-reuse/hardware-guides/platform-agnostic-part-replacement-procedure-fvt.md %}
