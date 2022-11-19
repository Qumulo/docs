---
title: "Replacing Hardware Components in Your Supermicro A+ ASG-1014S-ACR12N4H Nodes"
summary: "This section explains how to replace hardware components in Supermicro 1014S nodes."
permalink: /hardware-guide/supermicro-a-plus-asg-1014s-acr12n4h/replacing-hardware-components.html
redirect_from:
  - /hardware/supermicro-a-plus-asg-1014s-acr12n4h/replacing-hardware-components.html
sidebar: hardware_guide_sidebar
keywords: technical specifications, tech specs, specs, specifications, Supermicro 1014S, ACR12N4H
---

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
  <li>{{site.seeTechSpecs}}</li>
</ul>
{{site.data.alerts.end}}


## To Perform the Part Replacement Procedure by Using the FVT
{{site.partReplaceDefine}}

{% capture content_tag %}{{site.partReplaceDcms}}{% endcapture %}
{% include note.html content=content_tag %}

1. Boot by using the latest version of the Qumulo Core USB Drive Installer.

1. Select **[*] Perform maintenance**.
   
1. Select **[2] Perform automatic repair after part replacement (non-destructive)**.

   The part replacement procedure runs and the **FVT passed!** message appears.

{% include note.html content="In some cases, after the part replacement procedure, the message `FIX: Run the FVT flash command.` appears. Enter `1` as you would for a [fixable issue](/hardware-guide/supermicro-a-plus-asg-1014s-acr12n4h/getting-started.html#fixable-issues-during-installation) to reboot the node and then repeat the part replacement procedure." %}


## To Replace a Drive
Your {{site.sm1014s}} chassis contains 12 HDDs, 4 NVMe drives, and one NVMe boot drive (in an internal M.2 expansion slot). For information about replacing a drive, see [Drive Bay Mapping](drive-bay-mapping.md) and the following topics in the Supermicro documentation.

* [Storage Drives (HDD and NVMe)](https://www.supermicro.com/manuals/superserver/1U/MNL-2436.pdf#page=40)

* [Installing an M.2 Solid State Drive](https://www.supermicro.com/manuals/superserver/1U/MNL-2436.pdf#page=44)


## To Replace a Power Supply Unit (PSU)
Your {{site.sm1014s}} chassis contains two PSUs. For information about replacing a PSU, see [Power Supply](https://www.supermicro.com/manuals/superserver/1U/MNL-2436.pdf#page=48) in the Supermicro documentation.


## To Replace a Fan
Your {{site.sm1014s}} chassis has six internal fans. For information about replacing a fan, see [System Fans](https://www.supermicro.com/manuals/superserver/1U/MNL-2436.pdf#page=46) in the Supermicro documentation.


## To Replace a DIMM
Your {{site.sm1014s}} chassis has 16 DIMM slots. For information about replacing a DIMM, see [DIMM Installation](https://www.supermicro.com/manuals/superserver/1U/MNL-2436.pdf#page=36) and [DIMM Module Population](https://www.supermicro.com/manuals/superserver/1U/MNL-2436.pdf#page=34) in the Supermicro documentation.

{% include note.html content="To identify which DIMM failed, you must use the baseboard management controller (BMC) on the node or another hardware monitoring solution." %}
