---
title: "Replacing Hardware Components in Your HPE DL325 Gen10 Plus"
summary: "This section explains how to replace hardware components in HPE DL325 Gen10 Plus nodes."
permalink: /hardware-guide/hpe-dl325-gen10-plus/replacing-hardware-components.html
sidebar: hardware_guide_sidebar
platform:
  - hpe
  - dl325g10p
---

{% include content-reuse/hardware-guides/platform-agnostic-part-replacement-admonitions.md %}

{% include content-reuse/hardware-guides/platform-agnostic-part-replacement-procedure-fvt.md %}


## Replacing an NVMe Drive
Your {{site.dl325g10p}} chassis contains either 19 or 9 NVMe drives.

For information about replacing an NVMe drive, see [Storage Drives (NVMe)](https://support.hpe.com/hpesc/public/docDisplay?docId=a00093911en_us&page=GUID-40B992A0-C005-4E07-A725-956FABE3B75D.html) in the HPE documentation.


## Replacing an M.2 Boot Drive
Your {{site.dl325g10p}} chassis contains one M.2 boot drive on a riser card.

For information about replacing a boot drive, see [Removing and Replacing the Boot Device](https://support.hpe.com/hpesc/public/docDisplay?docId=a00093911en_us&page=GUID-E5F5E6D8-BCC3-429D-9180-82E1E1619F38.html) in the HPE documentation.


## Initializing the Replacement Boot Drive
{{site.bootDriveInit}}

{% include content-reuse/hardware-guides/platform-agnostic-boot-drive-replacement.md %}


## Replacing a Power Supply Unit (PSU)
Your {{site.dl325g10p}} chassis contains two PSUs.

For information about replacing a PSU, see [Power Supply](https://support.hpe.com/hpesc/public/docDisplay?docId=a00093911en_us&page=GUID-3E577198-D96F-4241-B967-863C824B9383.html) in the HPE documentation.


## Replacing a Fan
Your {{site.dl325g10p}} chassis has eight internal fans.

For information about replacing a fan, see [System Fans](https://support.hpe.com/hpesc/public/docDisplay?docId=a00093911en_us&page=GUID-C061F742-043E-4270-9DC5-FDC3A6D9F166.html) in the HPE documentation.


## Replacing a DIMM
Your {{site.dl325g10p}} chassis has 8 DIMM slots.

For information about replacing a DIMM, see [DIMM Installation](https://support.hpe.com/hpesc/public/docDisplay?docId=sd00002471en_us&page=GUID-79584D31-2CAF-43DE-BCE0-A512AA6155FE.html) in the HPE documentation.

{% include note.html content="To identify which DIMM failed, you must use the baseboard management controller (BMC) on the node or another hardware monitoring solution." %}
