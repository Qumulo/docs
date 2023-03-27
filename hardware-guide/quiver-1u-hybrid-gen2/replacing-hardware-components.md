---
title: "Replacing Hardware Components in Your Quiver 1U Hybrid Gen2 Nodes"
summary: "This section explains how to replace hardware components in Quiver 1U Hybrid Gen2 nodes."
permalink: /hardware-guide/quiver-1u-hybrid-gen2/replacing-hardware-components.html
sidebar: hardware_guide_sidebar
keywords: technical specifications, tech specs, specs, specifications, Quiver 1U Hybrid Gen2, pci express, pcie, drive, drives, power supply unit, psu, fan, dimm, memory
varRemovePCIeCard: <a href="#replace-pci-e-riser-card">Remove the PCIe card from the motherboard.</a>
varHotPlug: You can replace this component without powering off the node.
varNoHotPlug: To replace this component, you must first power off the node.
---

{{site.data.alerts.caution}}
<ul>
  <li>Don't update your node firmware unless a Qumulo representative instructs you to perform an update.</li>
  <li>{{site.seeTechSpecs}}</li>
</ul>    
{{site.data.alerts.end}}


## To Remove and Replace the Top Cover
Your {{site.q1uhg2}} chassis has a label with instructions for removing the top cover.

{% include image.html alt="Quiver 1U Hybrid Gen2 Top Cover Label Removal Instructions" file="quiver-1u-hybrid-gen2-top-cover-label-removal-instructions.png" %}

1. To remove the top cover, press the blue latches located near the back, on each side of the node, upwards and slide out the cover towards the front.

   {% include image.html alt="Quiver 1U Hybrid Gen2 Side Blue Latch" file="quiver-1u-hybrid-gen2-side-blue-latch.png" %}

1. To replace the top cover, slide it towards the back, ensuring that the guide pin is fixed fully in the guide hole and the blue latches click into place.

   {% include image.html alt="Quiver 1U Hybrid Gen2 Top Cover Guide Hole" file="quiver-1u-hybrid-gen2-top-cover-guide-hole.png" %}


<a id="replace-pci-e-riser-card"></a>
## To Replace a PCI Express (PCIe) Riser Card
Your {{site.q1uhg2}} chassis contains a PCIe riser card inserted vertically into the motherboard. The PCIe riser card holds the NIC and M.2 boot drive.

{% include note.html content="The PCIe riser card installation is toolless." %}

1. {{page.varNoHotPlug}}

1. To remove the existing PCIe riser card, pull it vertically out of the PCIe slot.

   {% include image.html alt="Quiver 1U Hybrid Gen2 PCIe Riser Card" file="quiver-1u-hybrid-gen2-pci-e-riser-card.png" %}

1. To install a replacement PCIe riser card, insert it vertically into the PCIe slot.


<a id="replace-nic"></a>
## To Replace the NIC
Your {{site.q1uhg2}} chassis contains a NIC inserted horizontally into the PCIe riser card.

{% include note.html content="Although the NIC installation is toolless, depending on the NIC that ships with your node model, you might have to replace the exterior-facing metal frame on your NIC with a different one. For more information, see [Technical Specifications](technical-specifications.md)." %}

1. {{page.varNoHotPlug}}

1. {{page.varRemovePCIeCard}}

1. Insert the NIC into the PCIe riser card horizontally.

   {% include image.html alt="Quiver 1U Hybrid Gen2 PCIe Riser Card NIC Installed" file="quiver-1u-hybrid-gen2-pci-e-riser-card-nic-installed.png" %} 

1. Insert the PCIe riser card vertically into the PCIe slot.


<a id="replace-nvme-m2-boot-drive"></a>
## To Replace the NVMe M.2 Boot Drive
Your {{site.q1uhg2}} chassis contains an NVMe boot drive inserted vertically into an M.2 expansion slot on the PCIe riser card. For more information, see [NVMe M.2 Boot Drive](drive-bay-mapping.md#nvme-m2-boot-drive).

1. {{page.varNoHotPlug}}

1. {{page.varRemovePCIeCard}}

1. Remove the two diagonally placed screws that fasten the PCIe riser card's board to its bracket.

   {% include image.html alt="Quiver 1U Hybrid Gen2 PCIe Riser Card M.2 Boot Drive Screws" file="quiver-1u-hybrid-gen2-pci-e-riser-card-m.2-boot-drive-screws.png" %} 

1. Insert the M.2 boot drive into the M.2 expansion slot on the PCIe riser card's board.

   {% include image.html alt="Quiver 1U Hybrid Gen2 PCIe Riser Card M.2 Boot Drive" file="quiver-1u-hybrid-gen2-pci-e-riser-card-m.2-boot-drive.png" %} 

1. Reattach the PCIe riser card to its bracket so that the M.2 boot drive is located between the board and the bracket.

   {% include image.html alt="Quiver 1U Hybrid Gen2 PCIe Riser Card M.2 Boot Drive Installed" file="quiver-1u-hybrid-gen2-pci-e-riser-card-m.2-boot-drive-installed.png" %} 
   
1. Insert the PCIe riser card vertically into the PCIe slot.


<a id="replace-hdd"></a>
## To Replace an HDD
Your {{site.q1uhg2}} chassis contains 12 HDDs. For more information, see [HDD Drives](drive-bay-mapping.md#hdd-drives).

{{site.data.alerts.note}}
<ul>
  <li>{{page.varHotPlug}}</li>
  <li>Sliding out the tray that holds the HDD carriers doesn't interfere with your node's operation.</li>
</ul>
{{site.data.alerts.end}}

1. Slide the tray with the HDD carriers out of the chassis.

   {% include caution.html content="Don't place any weight on the tray with the HDD carriers while the tray is extended." %}

1. Lift up the drive carrier handle and remove the carrier with the HDD from the tray.

1. Remove the three screws from the existing HDD.

1. Remove the existing HDD from its carrier.

1. Install the new HDD in the carrier.

1. Install the three screws in the new HDD.

1. Insert the carrier with the new HDD into the tray and lower the drive carrier handle.

1. Slide the tray with the HDD carriers into the chassis.


<a id="replace-nvme-drive"></a>
## To Replace an NVMe Drive
Your {{site.q1uhg2}} chassis contains 4 NVMe drives. For more information, see [NVMe Drives](drive-bay-mapping.md#nvme-drives).

1. {{page.varNoHotPlug}}

1. To remove the existing NVMe drive, pull out the SSD bracket while pressing the blue latch.

1. Remove the four screws from the existing NVMe drive.

1. Remove the existing NVMe drive from the SSD bracket.

1. Install the new NVMe drive in the SSD bracket.

1. Install the four screws in the new NVMe drive.

1. Insert the SSD bracket with the new NVMe drive into the chassis until the blue latch snaps into place.


<a id="replace-psu"></a>
## To Replace a Power Supply Unit (PSU)
Your {{site.q1uhg2}} chassis contains two PSUs.

{% capture psuHotPlugOK %}{{page.varHotPlug}}{% endcapture %}
{% include note.html content=psuHotPlugOK %}

1. Unfasten the power cord latch and remove the power cord from the existing PSU.

1. To remove the existing PSU, press the blue latch while pulling on the black handle.

1. Slide the new PSU into the chassis.

1. Fasten the power cord latch to the power cord.


## To Replace a Fan Module
Your {{site.q1uhg2}} chassis has two three-fan modules. The fans are marked **L** (left), **M** (middle), and **R** (right). Each module has six rubber clips on each side and latches that hold cables in place.

{% include image.html alt="Quiver 1U Hybrid Gen2 Fan Module" file="quiver-1u-hybrid-gen2-fan-module.png" %}

1. {{page.varNoHotPlug}}

1. Remove the air duct from the existing fan module.

1. Remove the connector cable from the motherboard.

1. Remove the rubber clips from the existing fan module and the cables from their latches.

1. To remove the existing fan module, pull it from its cage.

1. Slide the new fan module into its cage.

1. Install the rubber clips in the new fan module and place cables into their latches.

1. Plug the connector cable into the motherboard.

1. Replace the air duct onto the new fan module.


<a id="replace-dimms"></a>
## To Replace a DIMM
Your {{site.q1uhg2}} chassis has 12 DIMM slots, with a locking latch on each side of each DIMM.

1. {{page.varNoHotPlug}}

1. To remove an existing DIMM, press down on the latches and pull the module upwards.

1. Match the notch on the new DIMM with the protrusion on the DIMM slot.

1. Firmly press the DIMM into the slot until it clicks in and the latches lock.

{% include note.html content="To identify which DIMM failed, you must use the baseboard management controller (BMC) on the node or another hardware monitoring solution." %}


## To Replace the Node Chassis
{% include important.html content="After you perform a chassis swap, you must reconfigure the IPMI settings for your node." %}

1. At the back of the node, disconnect the power cabling from both power supply units (PSUs) and [remove both existing PSUs](#replace-psu) from the node.

1. Disconnect the network cabling from the NIC port and [remove the existing NIC](#replace-nic) from the node.

1. Remove the existing [HDDs](#replace-hdd), [NVMe drives](#replace-nvme-drive), and the [NVMe M.2 boot drive](#replace-nvme-m2-boot-drive) from the node.

1. [Remove the existing chassis](racking-nodes.md#remove-chassis) from the server rack.

   {% capture content_lift %}{{site.twoPeopleOrLift}}{% endcapture %}
   {% include important.html content=content_lift %}

1. Install the new chassis in the server rack.

   {% capture content_warp %}{{site.doNotWarpChassis}}{% endcapture %}
   {% include caution.html content=content_warp %}

1. Install the existing HDDs, NVMe drives, and the boot drive in the node.

1. For the NIC, do one of the following:

   * If your replacement chassis comes with a NIC, install the new NIC in the chassis and connect the network cabling to the NIC ports.
   
   * If your replacement chassis doesn't come with a NIC, install and connect the existing NIC.

1. For the PSUs, do one of the following:

   * If your replacement chassis comes with PSUs, install the new PSUs in the chassis and connect the power cabling to the PSUs.

   * If your replacement chassis doesn't come with PSUs, install and connect the existing PSUs.

1. [Run the File Verification Tool (FVT) on the node.](getting-started.html#step-2-boot-by-using-the-qumulo-core-usb-drive-installer)
