---
title: "Replacing Hardware Components in Your Quiver 1U All-NVMe Gen1 Nodes"
summary: "This section explains how to replace hardware components in Quiver 1U All-NVMe Gen1 nodes."
permalink: /hardware-guide/quiver-1ua-all-nvme-gen1/replacing-hardware-components.html
sidebar: hardware_guide_sidebar
keywords: replace, hardware, component, replace_top_cover, remove_top_cover, top_cover, replace_pcie_riser, pcie_riser, replace_nic, nic, replace_boot_drive, boot_drive, replace_hdd, hdd, replace_nvme, nvme, replace_psu, psu, replace_fan_module, fan_module, replace_dimm, dimm, memory, replace_chassis, chassis, Quiver_1U_All-NVMe_Gen1, Quiver, Quiver_1UA
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
Follow the instructions in the ASUS documentation:

1. [Remove the rear cover](https://dlcdnets.asus.com/pub/ASUS/server/RS500A-E12-RS12U/Manual/E21507_RS500A-E12-RS12U_UM_V2_WEB.pdf?model=RS500A-E12-RS12U#page=30).

1. [Remove the backplane cover](https://dlcdnets.asus.com/pub/ASUS/server/RS500A-E12-RS12U/Manual/E21507_RS500A-E12-RS12U_UM_V2_WEB.pdf?model=RS500A-E12-RS12U#page=31).

1. [Remove the air ducts](https://dlcdnets.asus.com/pub/ASUS/server/RS500A-E12-RS12U/Manual/E21507_RS500A-E12-RS12U_UM_V2_WEB.pdf?model=RS500A-E12-RS12U#page=32).

1. When reassembling the chassis, follow these instructions in reverse order.


<a id="replace-nic"></a>
## To Replace the NIC
{% include note.html content="Certain node types have two NICs. For more information, see [Technical Specifications](technical-specifications.html)." %}

Follow the instructions in the ASUS documentation:

* For the left NIC, see [Installing an Expansion Card to the Butterfly Riser Card Bracket](https://dlcdnets.asus.com/pub/ASUS/server/RS500A-E12-RS12U/Manual/E21507_RS500A-E12-RS12U_UM_V2_WEB.pdf?model=RS500A-E12-RS12U#page=52).

* For the right NIC, see [Installing an Expansion Card to the Riser Card Bracket](https://dlcdnets.asus.com/pub/ASUS/server/RS500A-E12-RS12U/Manual/E21507_RS500A-E12-RS12U_UM_V2_WEB.pdf?model=RS500A-E12-RS12U#page=50).


<a id="replace-nvme-m2-boot-drive"></a>
## To Replace the NVMe M.2 Boot Drive
{{site.q1uag1Drives.internalBootDrive}}


<a id="replace-nvme-drive-front-storage-bay"></a>
## To Replace an NVMe Drive in Front Storage Bays
{{site.q1uag1Drives.frontStorageBays}}


<a id="replace-nvme-drive-internal-storage-bay"></a>
## To Replace an NVMe Drive in Internal Storage Bays
{{site.q1uag1Drives.internalStorageBays}}


<a id="replace-psu"></a>
## To Replace a Power Supply Unit (PSU)
Your {{site.q1uag1}} chassis contains two PSUs. Follow the instructions to [replace a power supply module](https://dlcdnets.asus.com/pub/ASUS/server/RS500A-E12-RS12U/Manual/E21507_RS500A-E12-RS12U_UM_V2_WEB.pdf?model=RS500A-E12-RS12U#page=71) in the ASUS documentation.


<a id="replace-fan"></a>
## To Replace a System Fan
Your {{site.q1uag1}} chassis has five system fans on the left and two on the right. The fans mount to the chassis with a toolless system. For more information, see [Internal Features](https://dlcdnets.asus.com/pub/ASUS/server/RS500A-E12-RS12U/Manual/E21507_RS500A-E12-RS12U_UM_V2_WEB.pdf?model=RS500A-E12-RS12U#page=19) in the ASUS documentation.

1. Disconnect a fan from the motherboard. For more information, see [Cable Connections](https://dlcdnets.asus.com/pub/ASUS/server/RS500A-E12-RS12U/Manual/E21507_RS500A-E12-RS12U_UM_V2_WEB.pdf?model=RS500A-E12-RS12U#page=62) and [System Fan Connectors](https://dlcdnets.asus.com/pub/ASUS/server/RS500A-E12-RS12U/Manual/E21507_RS500A-E12-RS12U_UM_V2_WEB.pdf?model=RS500A-E12-RS12U#page=90) in the ASUS documentation.

1. To remove a fan, lift it upwards from the chassis.


<a id="replace-dimms"></a>
## To Replace a DIMM
Your {{site.q1uag1}} chassis has 24 DDR5 DIMM slots. For more information, see [System Memory](https://dlcdnets.asus.com/pub/ASUS/server/RS500A-E12-RS12U/Manual/E21507_RS500A-E12-RS12U_UM_V2_WEB.pdf?model=RS500A-E12-RS12U#page=39) and [Memory Configurations](https://dlcdnets.asus.com/pub/ASUS/server/RS500A-E12-RS12U/Manual/E21507_RS500A-E12-RS12U_UM_V2_WEB.pdf?model=RS500A-E12-RS12U#page=40) in the ASUS documentation.

Follow the instructions for [removing and installing a DIMM](https://dlcdnets.asus.com/pub/ASUS/server/RS500A-E12-RS12U/Manual/E21507_RS500A-E12-RS12U_UM_V2_WEB.pdf?model=RS500A-E12-RS12U#page=41) in the ASUS documentation.


## To Replace the Node Chassis
{% include important.html content="After you perform a chassis swap, you must reconfigure the IPMI settings for your node." %}

1. At the back of the node, disconnect the power cabling from both power supply units (PSUs) and [remove both existing PSUs](#replace-psu) from the node.

1. Disconnect the network cabling from the NIC ports and [remove the existing NICs](#replace-nic) from the node.

1. Remove the [NVMe drives in front storage bays](#replace-nvme-drive-front-storage-bay), the [NVMe drives in internal storage bays](#replace-nvme-drive-internal-storage-bay), and the [NVMe M.2 boot drive](#replace-nvme-m2-boot-drive) from the node.

1. Remove the existing chassis from the server rack.

   {% capture content_lift %}{{site.twoPeopleOrLift}}{% endcapture %}
   {% include important.html content=content_lift %}

1. Install the new chassis in the server rack.

   {% capture content_warp %}{{site.doNotWarpChassis}}{% endcapture %}
   {% include caution.html content=content_warp %}

1. Install the NVMe drives and the boot drive in the node.

1. Do one of the following:

   * If your replacement chassis comes with NICs, install the new NICs in the chassis and connect the network cabling to the NIC ports.
   
   * If your replacement chassis doesn't come with NICs, install and connect the existing NICs.

1. For the PSUs, do one of the following:

   * If your replacement chassis comes with PSUs, install the new PSUs in the chassis and connect the power cabling to the PSUs.

   * If your replacement chassis doesn't come with PSUs, install and connect the existing PSUs.

1. [Run the File Verification Tool (FVT) on the node.](getting-started.html#step-2-boot-by-using-the-qumulo-core-usb-drive-installer)
