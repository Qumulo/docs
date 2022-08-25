---
title: "Replacing Hardware Components in Your Supermicro A+ ASG-1014S-ACR12N4H Nodes"
summary: "This section explains how you can replace hardware components in your Supermicro A+ ASG-1014S-ACR12N4H nodes."
permalink: hardware/supermicro-a-plus-asg-1014s-acr12n4h/replacing-hardware-components.html
sidebar: hardware_sidebar
keywords: technical specifications, tech specs, specs, specifications, Supermicro 1014S, ACR12N4H
---

This section explains how you can replace hardware components in your {{site.sm1014s}} nodes.

{{site.data.alerts.caution}}
<ul>
  <li>We strongly recommend engaging an on-site Supermicro engineer to replace failed hardware components including but not limited to any procedure that:
    <ul>
      <li>This guide doesn't cover</li>
      <li>You haven't received training on</li>
      <li>Requires precautions to avoid damage caused by electrostatic discharge (ESD) by using industry standard anti-static equipment (such as gloves or wrist straps)</li>
    </ul>
  </li>
  <li>Don't update your node firmware unless a Qumulo representative instructs you to perform an update.</li>
</ul>
{{site.data.alerts.end}}

This section explains the most common scenarios of replacing failed hardware components such as:
* Drives
* Power Supply Units (PSUs)
* Fans
* DIMMs (memory)

{% include content-reuse/see-technical-specifications.md %}

## To Perform the Part Replacement Procedure by Using the FVT
When you replace a component such as the motherboard or an NIC card in your node, you must ensure that the firmware version and configuration are correct for your new components. To do this, you must perform the part replacement procedure using the FVT.

{{site.data.alerts.note}}
<p>Before you replace the motherboard, you must request a new Data Center Management Suite (DCMS) license key from Supermicro and apply it before you run the FVT. (The license key uses the BMC MAC address which changes with the motherboard.) If you don't install a DCMS license on a {{site.sm1014s}} node, the Field Verification Tool (FVT) fails, preventing you from installing Qumulo Core.</p>
{{site.data.alerts.end}}

1. Boot by using the latest version of the Qumulo Core USB Drive Installer.

1. Select **[*] Perform maintenance**.
   
1. Select **[2] Perform automatic repair after part replacement (non-destructive)**.

   The part replacement procedure runs and the **FVT passed!** message appears.

{% include note.html content="In some cases, after the part replacement procedure, the message `FIX: Run the FVT flash command.` appears. Enter `1` as you would for a [fixable issue](/hardware/supermicro-a-plus-asg-1014s-acr12n4h/getting-started.html#fixable-issues-during-installation) to reboot the node and then repeat the part replacement procedure." %}

## To Replace a Drive
Your {{site.sm1014s}} chassis contains 12 HDDs, 4 NVMe drives, and one NVMe boot drive (in an internal M.2 slot). For information about replacing a drive, see [Drive Slot Mapping](drive-slot-mapping.md) and the following topics in the Supermicro documentation.

* [Storage Drives (HDD and NVMe)](https://www.supermicro.com/manuals/superserver/1U/MNL-2436.pdf#page=40)

* [Installing an M.2 Solid State Drive](https://www.supermicro.com/manuals/superserver/1U/MNL-2436.pdf#page=44)


## To Replace a Power Supply Unit (PSU)
Your {{site.sm1014s}} chassis contains two PSUs. For information about replacing a PSU, see [Power Supply](https://www.supermicro.com/manuals/superserver/1U/MNL-2436.pdf#page=48) in the Supermicro documentation.


## To Replace a Fan
Your {{site.sm1014s}} chassis has six internal fans. For information about replacing a fan, see [System Fans](https://www.supermicro.com/manuals/superserver/1U/MNL-2436.pdf#page=46) in the Supermicro documentation.


## To Replace a DIMM
Your {{site.sm1014s}} chassis has 16 DIMM slots. For information about replacing a DIMM, see [DIMM Installation](https://www.supermicro.com/manuals/superserver/1U/MNL-2436.pdf#page=36) and [DIMM Module Population](https://www.supermicro.com/manuals/superserver/1U/MNL-2436.pdf#page=34) in the Supermicro documentation.

{% include note.html content="To identify which DIMM failed, you must use the baseboard management controller (BMC) on the node or another hardware monitoring solution." %}
