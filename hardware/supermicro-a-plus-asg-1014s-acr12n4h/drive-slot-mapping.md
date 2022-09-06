---
title: "Drive Slot Mapping in Supermicro A+ ASG-1014S-ACR12N4H Nodes"
summary: "This section explains the drive slot mapping on Supermicro A+ ASG-1014S-ACR12N4H nodes."
permalink: hardware/supermicro-a-plus-asg-1014s-acr12n4h/drive-slot-mapping.html
sidebar: hardware_sidebar
keywords: drive, hard drive, drive slot, mapping, Supermicro 1014S, ACR12N4H
---

This section explains the drive slot mapping in {{site.sm1014s}} nodes.

Your {{site.sm1014s}} chassis contains 12 HDDs, 4 NVMe drives, and one NVMe boot drive (in an internal M.2 slot).


## HDD Drives
{% capture alt_tag_hdd %}{{site.sm1014sLong}} HDD Mapping{% endcapture %}
{% include image.html alt=alt_tag_hdd file="supermicro-1014s-hdd-slot-mapping.png" url="/hardware/supermicro-a-plus-asg-1014s-acr12n4h/images/supermicro-1014s-hdd-slot-mapping.png" %}


## NVMe Drives
{% capture alt_tag_nvme %}{{site.sm1014sLong}} NVMe Drive Mapping{% endcapture %}
{% include image.html alt=alt_tag_nvme file="supermicro-1014s-nvme-drive-slot-mapping.png" url="/hardware/supermicro-a-plus-asg-1014s-acr12n4h/images/supermicro-1014s-nvme-drive-slot-mapping.png" %}


## NVMe Boot Drive
The boot drive is located at the M.2-HC1 connector. For information about the NVMe boot drive, see [Installing an M.2 Solid State Drive](https://www.supermicro.com/manuals/superserver/1U/MNL-2436.pdf#page=44) in the Supermicro documentation.
