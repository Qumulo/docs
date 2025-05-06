---
title: "Replacing Hardware Components in Your HPE Apollo 4200 G10 Plus Nodes"
summary: "This section explains how to replace hardware components in HPE Apollo 4200 G10 plus nodes."
permalink: /hardware-guide/hpe-apollo-4200-gen10-plus/replacing-hardware-components.html
sidebar: hardware_guide_sidebar
platform:
  - hpe
  - a4200g10p
---

{% include content-reuse/hardware-guides/platform-agnostic-part-replacement-admonitions.md %}

{% include content-reuse/hardware-guides/platform-agnostic-part-replacement-procedure-fvt.md %}

## Replacing a HDD or SSD Drive
Your {{site.a4200g10p}} chassis contains either 24 or 9 HDDs and either 8 or 3 SSDs.

For information about replacing an NVMe drive, see [Storage Drives (HDDs and SSDs)](https://support.hpe.com/hpesc/public/docDisplay?docId=sd00001251en_us&page=GUID-BFE1C861-8A51-4C3F-A227-C2AA3A95BDBE.html) in the HPE documentation.


## Replacing an M.2 Boot Drive
Your {{site.a4200g10p}} chassis contains one NVMe boot drive on a riser card.

For information about replacing an M.2 boot drive, see [Installing an M.2 Solid State Drive](https://support.hpe.com/hpesc/public/docDisplay?docId=sd00001251en_us&page=GUID-8A272CD0-F390-46AA-B093-E7D07AF1E2A8.html) in the HPE documentation.


## Initializing the Replacement Boot Drive
{{site.bootDriveInit}}

{% include content-reuse/hardware-guides/platform-agnostic-boot-drive-replacement.md %}


## Replacing a Power Supply Unit (PSU)
Your {{site.a4200g10p}} chassis contains two PSUs.

For information about replacing a PSU, see [Power Supply](https://support.hpe.com/hpesc/public/docDisplay?docId=sd00001251en_us&page=GUID-90F5B689-ACA8-41BE-AA32-D04283516089.html) in the HPE documentation.


## Replacing a Fan
Your {{site.a4200g10p}} chassis has five internal fans.

For information about replacing a fan, see [System Fans](https://support.hpe.com/hpesc/public/docDisplay?docId=sd00001251en_us&page=GUID-51D1A8C7-B6DF-4DAD-A7B3-280DAAA81A29.html) in the HPE documentation.


## Replacing a DIMM
Your {{site.a4200g10p}} chassis has 24 DIMM slots.

For information about replacing a DIMM, see [DIMM Installation](https://support.hpe.com/hpesc/public/docDisplay?docId=sd00001251en_us&page=GUID-79584D31-2CAF-43DE-BCE0-A512AA6155FE.html) in the HPE documentation.

{% include note.html content="To identify which DIMM failed, you must use the baseboard management controller (BMC) on the node or another hardware monitoring solution." %}
