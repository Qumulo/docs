---
title: "Drive Bay Mapping in Quiver 1U All-NVMe Gen1 Nodes"
summary: "This section explains the drive bay mapping in Quiver 1UA Gen1 nodes."
permalink: /hardware-guide/quiver-1ua-all-nvme-gen1/drive-bay-mapping.html
sidebar: hardware_guide_sidebar
keywords: drive, hard_drive, drive_bay, mapping, Quiver_1U_All-NVMe_Gen1, Quiver, Quiver_1UA
---

Your {{site.q1uag1}} chassis contains up to 12 2.5" hot-swap NVMe drives in front storage bays and one boot drive in an internal M.2 expansion slot. The following is the mapping for the drives.

{% include note.html content="Certain node types have four additional NVMe drives in internal storage bays. For more information, see [Technical Specifications](technical-specifications.html)." %}

## NVMe Drives in Front Storage Bays
{{site.q1uag1Drives.frontStorageBays}}

{% capture alt_tag_nvme %}{{site.q1uag1Long}} NVMe Front Storage Bay Mapping{% endcapture %}
{% include image.html alt=alt_tag_nvme file="quiver-1ua-all-nvme-gen1-nvme-front-storage-bay-mapping.png" url="/hardware-guide/quiver-1ua-all-nvme-gen1/images/quiver-1ua-all-nvme-gen1-nvme-front-storage-bay-mapping.png" %}

<a id="internal-storage-bays"></a>
## NVMe Drives in Internal Storage Bays
{{site.q1uag1Drives.internalStorageBays}}

{% capture alt_tag_nvme %}{{site.q1uag1Long}} NVMe Internal Storage Bay Mapping{% endcapture %}
{% include image.html alt=alt_tag_nvme file="quiver-1ua-all-nvme-gen1-nvme-internal-storage-bay-mapping.png" %}


## NVMe M.2 Boot Drive
{{site.q1uag1Drives.internalBootDrive}}
