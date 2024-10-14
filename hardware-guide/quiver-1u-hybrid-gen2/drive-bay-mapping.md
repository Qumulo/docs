---
title: "Drive Bay Mapping in Quiver 1U Hybrid Gen2 Nodes"
summary: "This section explains the drive bay mapping in Quiver 1UH Gen2 nodes."
permalink: /hardware-guide/quiver-1u-hybrid-gen2/drive-bay-mapping.html
sidebar: hardware_guide_sidebar
---

* For 240T and 96T nodes, your chassis contains 12 HDDs and 4 NVMe drives.

* For 48T nodes, your chassis contains 6 HDDs and 3 NVMe drives.

All {{site.q1uhg2}} nodes contain one boot drive in an internal M.2 expansion slot.

## HDD Drives

* For 240T and 96T nodes, all drive bays are populated.

* For 48T nodes, only the following bays are populated: 0, 3, 4, 7, 8, 11.

For more information, see [To Replace an HDD](replacing-hardware-components.html#to-replace-an-hdd).

{% capture alt_tag %}{{site.q1uhg2Long}} HDD Bay Mapping{% endcapture %}
{% include image.html alt=alt_tag file="quiver-1u-hybrid-gen2-hdd-bay-mapping.png" %}


## NVMe Drives

* For 240T and 96T nodes, all drive bays are populated.

* For 48T nodes, only the following drive bays are populated: 0, 1, 2.

  {% include important.html content="When replacing faulty drives, use only the originally populared drive bays." %}

For more information, see [To Replace an NVMe Drive](replacing-hardware-components.html#replace-nvme-m2-boot-drive)

{% capture alt_tag_nvme %}{{site.q1uhg2Long}} NVMe Drive Bay Mapping{% endcapture %}
{% include image.html alt=alt_tag_nvme file="quiver-1u-hybrid-gen2-nvme-drive-bay-mapping.png" url="/hardware-guide/quiver-1u-hybrid-gen2/images/quiver-1u-hybrid-gen2-nvme-drive-bay-mapping.png" %}


## NVMe M.2 Boot Drive
The boot drive is located at the M.2 expansion slot at Riser Slot 4. For more information, see [To Replace an NVMe M.2 Boot Drive](replacing-hardware-components.html#replace-nvme-m2-boot-drive).

{% capture alt_tag_nvme %}{{site.q1uhg2Long}} NVMe Boot Drive Location{% endcapture %}
{% include image.html alt=alt_tag_nvme file="quiver-1u-hybrid-gen2-nvme-boot-drive-location.png" %}
