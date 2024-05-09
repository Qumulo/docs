---
title: "Drive Bay Mapping in Supermicro A+ ASG-2015S-E1CR24L Nodes"
summary: "This section explains the drive bay mapping in Supermicro 2015S nodes."
permalink: /hardware-guide/supermicro-a-plus-asg-2015s-e1cr24l/drive-bay-mapping.html
sidebar: hardware_guide_sidebar
---

Your {{site.sm2015s}} chassis contains 12 HDDs, 4 NVMe drives, and one NVMe boot drive in an internal M.2 expansion slot. The following is the mapping for the drives.

## HDD Drives
{% capture alt_tag_hdd %}{{site.sm2015sLong}} HDD Bay Mapping{% endcapture %}
{% include image.html alt=alt_tag_hdd file="supermicro-1014s-hdd-bay-mapping.png" %}


## NVMe Drives
{% capture alt_tag_nvme %}{{site.sm2015sLong}} NVMe Drive Bay Mapping{% endcapture %}
{% include image.html alt=alt_tag_nvme file="supermicro-1014s-nvme-drive-bay-mapping.png" url="/hardware-guide/supermicro-a-plus-asg-2015s-e1cr24l/images/supermicro-1014s-nvme-drive-bay-mapping.png" %}


## NVMe Boot Drive
The boot drive is located at the M.2-HC1 expansion slot. For information about the NVMe boot drive, see [Installing an M.2 Solid State Drive](https://www.supermicro.com/manuals/superserver/1U/MNL-2436.pdf#page=44) in the Supermicro documentation.
