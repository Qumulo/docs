---
title: "Replacing Hardware Components in Your Supermicro A+ ASG-2015S-E1CR24L Nodes"
summary: "This section explains how to replace hardware components in Supermicro 2015S nodes."
permalink: /hardware-guide/supermicro-a-plus-asg-2015s-e1cr24l/replacing-hardware-components.html
sidebar: hardware_guide_sidebar
---

{% include content-reuse/platform-agnostic-part-replacement-admonitions.md %}

## To Replace a Drive
Your {{site.sm2015s}} chassis contains 24 HDDs, 4 NVMe drives, and one NVMe boot drive in an internal M.2 expansion slot. For information about replacing a drive, see [Drive Bay Mapping](drive-bay-mapping.html) and [Storage Drives (HDD and NVMe)](https://www.supermicro.com/manuals/superstorage/MNL-2628.pdf#page=49) in the Supermicro documentation.


## To Replace a Power Supply Unit (PSU)
Your {{site.sm2015s}} chassis contains two PSUs. For information about replacing a PSU, see [Power Supply](https://www.supermicro.com/manuals/superstorage/MNL-2628.pdf#page=62) in the Supermicro documentation.


## To Replace a Fan
Your {{site.sm2015s}} chassis has four internal fans. For information about replacing a fan, see [System Cooling](https://www.supermicro.com/manuals/superstorage/MNL-2628.pdf#page=58) in the Supermicro documentation.


## To Replace a DIMM
Your {{site.sm2015s}} chassis has 16 DIMM slots. For information about replacing a DIMM, see [DIMM Installation](https://www.supermicro.com/manuals/superstorage/MNL-2628.pdf#page=467) and [DIMM Module Population Sequence](https://www.supermicro.com/manuals/superstorage/MNL-2628.pdf#page=46) in the Supermicro documentation.

{% include note.html content="To identify which DIMM failed, you must use the baseboard management controller (BMC) on the node or another hardware monitoring solution." %}
