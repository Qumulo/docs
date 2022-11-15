---
title: "Front and Rear Drive Bays on HPE Apollo 4200 Gen10 Plus Nodes"
summary: "This section shows the front large form factor (LFF) and rear small form factor (SFF) drive bays in HPE Apollo 4200 Gen10 Plus nodes. For more information, see <a href='https://www.hpe.com/psnow/product-documentation?oid=1013422400&cc=ca&lc=en&jumpid=in_pdp-psnow-docs'>HPE Apollo 4200 Gen10 Plus System - Product Documentation</a>."
permalink: hardware-guide/hpe-apollo-4200-gen10-plus/front-rear-drives.html
sidebar: hardware_guide_sidebar
keywords: front drive, rear drive, drive, drive bay
---

<br>

## Front LFF Drive Row
{% capture alt_tag %}The front large form factor drive row in the {{site.a4200g10p}} node{% endcapture %}
{% include image.html alt=alt_tag file="hpe-gen10-drives-front.png" %}

## Second LFF Drive Row
{% capture alt_tag %}The second large form factor drive row in the {{site.a4200g10p}} node{% endcapture %}
{% include image.html alt=alt_tag file="hpe-gen10-drives-front2.png" %}

## Rear SFF Hot-Plug Drives
{% capture alt_tag %}The rear small form factor hot-plug drive in the {{site.a4200g10p}} node{% endcapture %}
{% include image.html alt=alt_tag file="hpe-gen10-drives-rear.png" %}

## Boot Drive
{% include important.html content="Before you remove the boot drive, contact the [Qumulo Care Team](https://care.qumulo.com/hc/en-us/articles/115008409408) for additional instructions." %}

### 36T and 90T Nodes
In 36T and 90T nodes, the boot drive is located in the second LFF drive row.

{% capture alt_tag %}The boot drive in the second LFF drive row in {{site.a4200g10p}} 36T and 90T nodes{% endcapture %}
{% include image.html alt=alt_tag file="hpe-gen10-90-boot.png" %}

### 192T Nodes
In 192T nodes, the boot drive is a BOSS PCIe riser card.

{% capture alt_tag %}The boot drive is a BOSS PCIe riser card in {{site.a4200g10p}} 192T nodes{% endcapture %}
{% include image.html alt=alt_tag file="hpe-gen10-196t-boot.png" %}

### 336T Nodes
In 336T nodes, the boot drive is located with the rear SFF hot-plug drives.

{% capture alt_tag %}The boot drive with the rear SFF hot-plug drives in {{site.a4200g10p}} 336T nodes{% endcapture %}
{% include image.html alt=alt_tag file="hpe-gen10-336tboot.png" %}
