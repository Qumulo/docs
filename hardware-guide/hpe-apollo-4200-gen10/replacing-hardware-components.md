---
title: "Replacing Hardware Components in Your HPE Apollo 4200 Gen10 Nodes"
summary: "This section explains how to replace hardware components in HPE Apollo 4200 Gen10 nodes."
permalink: /hardware-guide/hpe-apollo-4200-gen10/replacing-hardware-components.html
sidebar: hardware_guide_sidebar
platform:
  - hpe
  - a4200g10
---

{% include content-reuse/hardware-guides/platform-agnostic-part-replacement-admonitions.md %}

{% include content-reuse/hardware-guides/platform-agnostic-part-replacement-procedure-fvt.md %}

## Replacing an HDD or SSD Drive
Your {{site.a4200g10}} chassis contains either 24 or 9 HDD drives and 6, 4, or 3 SSD drives. For more information, see [Front and Rear Drive Bays](front-rear-drives.html).

For information about replacing an HDD or SSD drive, see [Removing and Replacing a Hot-Plug Drive](https://support.hpe.com/hpesc/public/docDisplay?docId=a00061190en_us&page=GUID-55A7BABF-1B14-4F24-B1EE-359C37873904.html) in the HPE documentation.


## Replacing an M.2 Boot Drive
Your {{site.a4200g10}} chassis contains one boot drive on a riser card. For more information, see [Boot Drive](front-rear-drives.html#boot-drive).

For information about replacing an NVMe M.2 boot drive, see [Removing and Replacing the Boot Device](https://support.hpe.com/hpesc/public/docDisplay?docId=a00061190en_us&docLocale=en_US&page=GUID-64B9C290-9421-4536-BE32-B8F8A1C93669.html) in the HPE documentation.


## Initializing the Replacement Boot Drive
{{site.bootDriveInit}}

{% include content-reuse/hardware-guides/platform-agnostic-boot-drive-replacement.md %}


## Replacing a Power Supply Unit (PSU)
Your {{site.a4200g10}} chassis contains two PSUs.

For information about replacing a PSU, see [Removing and Replacing a Power Supply](https://support.hpe.com/hpesc/public/docDisplay?docId=a00061190en_us&docLocale=en_US&page=GUID-A8C03739-A4DA-4E40-994E-7201266E21AC.html) in the HPE documentation.


## Replacing a Fan
Your {{site.a4200g10}} chassis has internal fans.

For information about replacing a fan, see [Removing and Replacing a Fan](https://support.hpe.com/hpesc/public/docDisplay?docId=a00061190en_us&docLocale=en_US&page=GUID-4F9989B8-CE22-4157-8D33-3AF50664B6DE.html) in the HPE documentation.


## Replacing a DIMM
Your {{site.a4200g10}} chassis has DIMM slots.

For information about replacing a DIMM, see [Removing and Replacing a DIMM](https://support.hpe.com/hpesc/public/docDisplay?docId=a00061190en_us&page=GUID-8DE43667-C4BC-468E-9E6F-59855C1FDF18.html) in the HPE documentation.

{% include note.html content="To identify which DIMM failed, you must use the baseboard management controller (BMC) on the node or another hardware monitoring solution." %}
