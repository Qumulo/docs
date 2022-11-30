---
title: "Front and Internal Drive Bays on HPE Apollo 4200 Gen10 Plus Nodes"
summary: "This section shows the front large form factor (LFF), internal LFF, and internal small form factor (SFF) drive bays in HPE Apollo 4200 Gen10 Plus nodes. For more information, see <a href='https://www.hpe.com/psnow/product-documentation?oid=1013422400&cc=ca&lc=en&jumpid=in_pdp-psnow-docs'>HPE Apollo 4200 Gen10 Plus System - Product Documentation</a>."
permalink: /hardware-guide/hpe-apollo-4200-gen10-plus/front-internal-drives.html
sidebar: hardware_guide_sidebar
keywords: front drive, internal drive, boot drive, drive, drive bay
---

## Front LFF Drive Row
The following diagram shows the front drive row, or cage 1. Cage 1 holds half of the drives in box 1, bays 1-12.

{% capture alt_tag %}The front large form factor drive row, or cage 1, in the {{site.a4200g10p}} node{% endcapture %}
{% include image.html alt=alt_tag file="hpe-apollo-4200-gen10-plus-front-panel-lff-cage-1-box-1.png" %}

## Internal LFF Drive Row
The internal drive row flips up behind the front drive row in the node, or cage 2. Cage 2 holds half of the drives in box 1, bays 13-24.

{% capture alt_tag %}The internal large form factor drive row, or cage 2, in the {{site.a4200g10p}} node{% endcapture %}
{% include image.html alt=alt_tag file="hpe-apollo-4200-gen10-plus-internal-lff-cage-2-box-1.png" %}

## Internal SFF Drive Row
{% capture alt_tag %}The internal small form factor drive row in the {{site.a4200g10p}} node{% endcapture %}
{% include image.html alt=alt_tag file="hpe-apollo-4200-gen10-plus-internal-sff.png" %}

## Boot Drive
{% include important.html content="Before you remove the boot drive, contact the [Qumulo Care Team](https://care.qumulo.com/hc/en-us/articles/115008409408) for additional instructions." %}

The boot drive is located at the rear of the node.

{% capture alt_tag %}The boot drive at the rear of {{site.a4200g10p}} nodes{% endcapture %}
{% include image.html alt=alt_tag file="hpe-apollo-4200-gen10-plus-boot-drive.png" %}
