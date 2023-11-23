---
title: "Drive Bay Mapping in Fujitsu PRIMERGY RX2540 M7 Nodes"
summary: "This section explains the drive bay mapping in Fujitsu RX2540 M7 nodes."
permalink: /hardware-guide/fujitsu-primergy-rx2540-m7/drive-bay-mapping.html
sidebar: hardware_guide_sidebar
keywords: drive, hard_drive, drive_bay, mapping, Fujitsu_PRIMERGY_RX2540_M7, Fujitsu, PRIMERGY, RX2540, 2540, M7
---

Your {{site.fprx2540m7}} chassis contains 12 or 8 HDDs in the front, 4 NVMe drives in the back, and 2 mirrored NVMe boot drives in internal M.2 expansion slots. The following is the mapping for the drives.

{% include note.html content="To determine the drive configuration for your node, see [Technical Specifications](technical-specifications.html)." %}

<a id="hdd-drives"></a>
## Front HDD Drives
For more information, see [To Replace an HDD](replacing-hardware-components.html#to-replace-an-hdd).

### 48TB and 144TB Nodes
In [48TB and 144TB Nodes](technical-specifications.html), all drive bays are populated.

{% capture alt_tag %}{{site.fprx2540m7Long}} Front HDD Bay Mapping (48TB and 144TB){% endcapture %}
{% include image.html alt=alt_tag file="fujitsu-primergy-rx2540-m7-hdd-bay-mapping-48tb-144tb.png" url="/hardware-guide/fujitsu-primergy-rx2540-m7/images/fujitsu-primergy-rx2540-m7-hdd-bay-mapping-48tb-144tb.png" %}

### 96TB Nodes
In [96TB Nodes](technical-specifications.html), some drive bays are empty.

{% capture alt_tag %}{{site.fprx2540m7Long}} Front HDD Bay Mapping (96TB){% endcapture %}
{% include image.html alt=alt_tag file="fujitsu-primergy-rx2540-m7-hdd-bay-mapping-96tb.png" url="/hardware-guide/fujitsu-primergy-rx2540-m7/images/fujitsu-primergy-rx2540-m7-hdd-bay-mapping-96tb.png" %}

<a id="nvme-drives"></a>
## Back NVMe Drives
For more information, see [To Replace an NVMe Drive](replacing-hardware-components.html#replace-nvme-drive).

{% include note.html content="Because the expansion bays are universal, your node might contain labels such as **HDD0** for the NVMe slots." %}

{% capture alt_tag_nvme %}{{site.fprx2540m7Long}} NVMe Drive Bay Mapping{% endcapture %}
{% include image.html alt=alt_tag_nvme file="fujitsu-primergy-rx2540-m7-nvme-drive-bay-mapping.png" url="/hardware-guide/fujitsu-primergy-rx2540-m7/images/fujitsu-primergy-rx2540-m7-nvme-drive-bay-mapping.png" %}

<a id="nvme-m2-boot-drives"></a>
## Internal NVMe M.2 Boot Drive
The boot drives are located at the M.2 expansion slot on an interposer (controller) board. For more information, see [To Replace an NVMe M.2 Boot Drive](replacing-hardware-components.html#replace-nvme-m2-boot-drive).

{{site.fprx2540m7followDocs}} <a href="https://docs.qumulo.com/pdf/fujitsu-primergy-rx2540-m7-upgrade-maintenance-manual-09-2023.pdf#page=58" class="pdf">Slots for M.2 SSDs on the M.2 interposer board (p. 211)</a>.
