---
title: "Front and Rear Drive Locations on HPE Apollo 4200 Gen10 Nodes"
summary: "This section explains the front and rear drive locations in your HPE Apollo 4200 Gen10 node."
permalink: hardware/hpe-apollo-4200-gen10/front-rear-drives.html
sidebar: hardware_sidebar
keywords: front drive, rear drive, drive, drive location
---

This section shows the front large form factor (LFF) and rear small form factor (SFF) drive locations in your HPE Apollo 4200 Gen10 node. For more information, see [HPE Apollo 4200 Gen10 Server - Document List](https://support.hpe.com/hpesc/public/docDisplay?docLocale=en_US&docId=emr_na-a00061642en_us).

<br>

## Front LFF Drive Row
{% include image.html alt="The front large form factor drive row in the HPE Apollo 4200 Gen10 node" file="hpe-gen10-drives-front.png" %}

## Second LFF Drive Row
{% include image.html alt="The second large form factor drive row in the HPE Apollo 4200 Gen10 node" file="hpe-gen10-drives-front2.png" %}

## Rear SFF Hot-Plug Drives
{% include image.html alt="The rear small form factor hot-plug drive in the HPE Apollo 4200 Gen10 node" file="hpe-gen10-drives-rear.png" %}

## Boot Drive
{% include important.html content="Before you remove the boot drive, contact the [Qumulo Care Team](https://care.qumulo.com/hc/en-us/articles/115008409408) for additional instructions." %}

### 36T and 90T Nodes
In 36T and 90T nodes, the boot drive is located in the second LFF drive row.

{% include image.html alt="The boot drive in the second LFF drive row in HPE Apollo 4200 Gen10 36T and 90T nodes" file="hpe-gen10-90-boot.png" %}

### 192T Nodes
In 192T nodes, the boot drive is a BOSS PCIe riser card.

{% include image.html alt="The boot drive is a BOSS PCIe riser card in HPE Apollo 4200 Gen10 192T nodes" file="hpe-gen10-196t-boot.png" %}

### 336T Nodes
In 336T nodes, the boot drive is located with the rear SFF hot-plug drives.

{% include image.html alt="The boot drive with the rear SFF hot-plug drives in HPE Apollo 4200 Gen10 336T nodes" file="hpe-gen10-336tboot.png" %}
