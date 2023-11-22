---
title: "Replacing Hardware Components in Your Fujitsu PRIMERGY RX2540 M7 Nodes"
summary: "This section explains how to replace hardware components in Fujitsu PRIMERGY RX2540 M7 nodes."
permalink: /hardware-guide/fujitsu-primergy-rx2540-m7/replacing-hardware-components.html
sidebar: hardware_guide_sidebar
keywords: replace, hardware, component, replace_top_cover, remove_top_cover, top_cover, replace_pcie_riser, pcie_riser, replace_nic, nic, replace_boot_drive, boot_drive, replace_hdd, hdd, replace_nvme, nvme, replace_psu, psu, replace_fan_module, fan_module, replace_dimm, dimm, memory, replace_chassis, chassis, Fujitsu_PRIMERGY_RX2540_M7, Fujitsu, PRIMERGY, RX2540, 2540, M7
varRemoveRAIDModule: <a href="#replace-raid-module-riser">Remove the RAID module riser from the motherboard.</a>
varHotPlug: You can replace this component without powering off the node.
varNoHotPlug: To replace this component, you must first power off the node.
---

{% include content-reuse/platform-agnostic-part-replacement-admonitions.md %}

## To Remove and Replace the Top Cover
{{site.fprx2540m7followDocs}} <a href="/pdf/fujitsu-primergy-rx2540-m7-upgrade-maintenance-manual-09-2023.pdf#page=58" class="pdf">Removing the top covers (p. 58)</a>.


<a id="replace-nic"></a>
## To Replace the NIC
Your {{site.fprx2540m7}} chassis contains two horizontal PCIe riser modules and a NIC inserted horizontally into the bottom module.

{{site.fprx2540m7followDocs}} <a href="/pdf/fujitsu-primergy-rx2540-m7-upgrade-maintenance-manual-09-2023.pdf#page=317" class="pdf">Removing an expansion card from a riser module (p. 317)</a>.


<a id="replace-raid-module-riser"></a>
## To Replace a RAID Module Riser
Your {{site.fprx2540m7}} chassis contains two RAID riser modules (for the two mirrored boot drives) inserted horizontally into the motherboard. Each riser module holds an [interposer (controller) board](#replace-interposer-board).

{{site.fprx2540m7followDocs}} <a href="/pdf/fujitsu-primergy-rx2540-m7-upgrade-maintenance-manual-09-2023.pdf#page=72" class="pdf">Handling riser modules (p. 72)</a>.


<a id="replace-interposer-board"></a>
## To Replace an Interposer (Controller) Board
Each of the two [RAID module risers](#replace-raid-module-riser) on your chassis contains an interposer (controller) board which, in turn, holds an M.2 boot drive.

{{site.fprx2540m7followDocs}} <a href="/pdf/fujitsu-primergy-rx2540-m7-upgrade-maintenance-manual-09-2023.pdf#page=222" class="pdf">Removing the M.2 interposer board (p. 222)</a>.


<a id="replace-nvme-m2-boot-drive"></a>
## To Replace an NVMe M.2 Boot Drive
Your {{site.fprx2540m7}} chassis contains two mirrored NVMe boot drives, each of which is inserted into an [interposer (controller) board](#replace-interposer-board). For more information, see [NVMe M.2 Boot Drive](drive-bay-mapping.html#nvme-m2-boot-drives).

1. {{page.varNoHotPlug}}

1. {{page.varRemoveRAIDModule}}

1. {{site.fprx2540m7followDocs}}

   1. <a href="/pdf/fujitsu-primergy-rx2540-m7-upgrade-maintenance-manual-09-2023.pdf#page=216" class="pdf">Remove the M.2 SSD (p. 216)</a>.
   
   1. <a href="/pdf/fujitsu-primergy-rx2540-m7-upgrade-maintenance-manual-09-2023.pdf#page=212" class="pdf">Install an M.2 SSD (p. 212)</a>.


<a id="replace-hdd"></a>
## To Replace an HDD
Your {{site.fprx2540m7}} chassis contains 12 or 8 HDDs. For more information, see [HDD Drives](drive-bay-mapping.html#hdd-drives).

{{site.data.alerts.note}}
<ul>
  <li>{{page.varHotPlug}}</li>
  <li>{{site.seeTechSpecs}}</li>
</ul>
{{site.data.alerts.end}}

{{site.fprx2540m7followDocs}} <a href="/pdf/fujitsu-primergy-rx2540-m7-upgrade-maintenance-manual-09-2023.pdf#page=150" class="pdf">Installing 3.5-inch HDD modules (p. 150)</a>.


<a id="replace-nvme-drive"></a>
## To Replace an NVMe Drive
Your {{site.fprx2540m7}} chassis contains 4 NVMe drives in cages 1 (left) and 2 (middle) at the back of the node. For more information, see [NVMe Drives](drive-bay-mapping.html#nvme-drives).

{{site.fprx2540m7followDocs}} <a href="/pdf/fujitsu-primergy-rx2540-m7-upgrade-maintenance-manual-09-2023.pdf#page=227" class="pdf">Rear HDD/SSD extension box (p. 227)</a>.


<a id="replace-psu"></a>
## To Replace a Power Supply Unit (PSU)
Your {{site.fprx2540m7}} chassis contains two PSUs.

{% capture psuHotPlugOK %}{{page.varHotPlug}}{% endcapture %}
{% include note.html content=psuHotPlugOK %}

{{site.fprx2540m7followDocs}} <a href="/pdf/fujitsu-primergy-rx2540-m7-upgrade-maintenance-manual-09-2023.pdf#page=126" class="pdf">Installing a hot-plug PSU (p. 126)</a>.


## To Replace a Fan Module
Your {{site.fprx2540m7}} chassis has 6 fan modules.

{{site.fprx2540m7followDocs}} <a href="/pdf/fujitsu-primergy-rx2540-m7-upgrade-maintenance-manual-09-2023.pdf#page=76" class="pdf">Handling the fan cage (p. 76)</a>.


<a id="replace-dimms"></a>
## To Replace a DIMM
Your {{site.fprx2540m7}} chassis has 12 DIMM slots, with a locking latch on each side of each DIMM.

1. {{page.varNoHotPlug}}

1. {{site.fprx2540m7followDocs}} <a href="/pdf/fujitsu-primergy-rx2540-m7-upgrade-maintenance-manual-09-2023.pdf#page=345" class="pdf">Installing the memory modules (p. 345)</a>.
