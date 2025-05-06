---
title: "Replacing Hardware Components in Your HPE Alletra 4110 Nodes"
summary: "This section explains how to replace hardware components in HPE Alletra 4110 nodes."
permalink: /hardware-guide/hpe-alletra-4110/replacing-hardware-components.html
sidebar: hardware_guide_sidebar
platform:
  - hpe
  - all4110
---

{% include content-reuse/hardware-guides/platform-agnostic-part-replacement-admonitions.md %}

{% include content-reuse/hardware-guides/platform-agnostic-part-replacement-procedure-fvt.md %}

## Replacing an NVMe Drive
Your {{site.all4110}} chassis contains either 20 or 10 NVMe drives.

For information about replacing an NVMe drive, see [Storage Drives (NVMe)](https://support.hpe.com/hpesc/public/docDisplay?docId=sd00002471en_us&page=GUID-99E03D04-E2E2-4226-8043-DD006DEF0C4F.html) in the HPE documentation.


## Replacing an M.2 Boot Drive
Your {{site.all4110}} chassis contains one NVMe boot drive in a server module.

For information about replacing an M.2 boot drive, see [Installing an M.2 Solid State Drive](https://support.hpe.com/hpesc/public/docDisplay?docId=sd00002471en_us&page=GUID-2E7D27B3-9665-4615-87A4-4256C3E8373D.html) in the HPE documentation.


## Initializing the Replacement Boot Drive
{{site.bootDriveInit}}

{% include content-reuse/hardware-guides/platform-agnostic-boot-drive-replacement.md %}


## Replacing a Power Supply Unit (PSU)
Your {{site.all4110}} chassis contains two PSUs.

For information about replacing a PSU, see [Power Supply](https://support.hpe.com/hpesc/public/docDisplay?docId=sd00002471en_us&page=GUID-B8FE4382-F5A2-423D-9444-3AD4A652A86F.html) in the HPE documentation.


## Replacing a Fan
Your {{site.all4110}} chassis has seven fans at the back of the chassis.

For information about replacing a fan, see [System Fans](https://support.hpe.com/hpesc/public/docDisplay?docId=sd00002471en_us&page=GUID-4A0B9B1C-2ED3-4E2A-8B7A-5BC0D34E5072.html) in the HPE documentation.


## Replacing a DIMM
Your {{site.all4110}} chassis has 24 DIMM slots.

For information about replacing a DIMM, see [DIMM Installation](https://support.hpe.com/hpesc/public/docDisplay?docId=sd00002471en_us&page=GUID-79584D31-2CAF-43DE-BCE0-A512AA6155FE.html) in the HPE documentation.

{% include note.html content="To identify which DIMM failed, you must use the baseboard management controller (BMC) on the node or another hardware monitoring solution." %}

