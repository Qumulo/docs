---
title: "Replacing Hardware Components in Your Supermicro A+ ASG-1014S-ACR12N4H Nodes"
summary: "This section explains how to replace hardware components in Supermicro 1014S nodes."
permalink: /hardware-guide/supermicro-a-plus-asg-1014s-acr12n4h/replacing-hardware-components.html
redirect_from:
  - /hardware/supermicro-a-plus-asg-1014s-acr12n4h/replacing-hardware-components.html
sidebar: hardware_guide_sidebar
---

{% include content-reuse/platform-agnostic-part-replacement-admonitions.md %}

{% include content-reuse/platform-agnostic-part-replacement-procedure-fvt.md %}

## To Replace a Drive
Your {{site.sm1014s}} chassis contains 12 HDDs, 4 NVMe drives, and one NVMe boot drive in an internal M.2 expansion slot. For information about replacing a drive, see [Drive Bay Mapping](drive-bay-mapping.html) and the following topics in the Supermicro documentation.

* [Storage Drives (HDD and NVMe)](https://www.supermicro.com/manuals/superserver/1U/MNL-2436.pdf#page=40)

* [Installing an M.2 Solid State Drive](https://www.supermicro.com/manuals/superserver/1U/MNL-2436.pdf#page=44)


## To Replace a Power Supply Unit (PSU)
Your {{site.sm1014s}} chassis contains two PSUs. For information about replacing a PSU, see [Power Supply](https://www.supermicro.com/manuals/superserver/1U/MNL-2436.pdf#page=48) in the Supermicro documentation.


## To Replace a Fan
Your {{site.sm1014s}} chassis has six internal fans. For information about replacing a fan, see [System Fans](https://www.supermicro.com/manuals/superserver/1U/MNL-2436.pdf#page=46) in the Supermicro documentation.


## To Replace a DIMM
Your {{site.sm1014s}} chassis has 16 DIMM slots. For information about replacing a DIMM, see [DIMM Installation](https://www.supermicro.com/manuals/superserver/1U/MNL-2436.pdf#page=36) and [DIMM Module Population](https://www.supermicro.com/manuals/superserver/1U/MNL-2436.pdf#page=34) in the Supermicro documentation.

{% include note.html content="To identify which DIMM failed, you must use the baseboard management controller (BMC) on the node or another hardware monitoring solution." %}
