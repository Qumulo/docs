---
title: "Front and Internal Drive Bays on HPE Apollo 4200 Gen10 Plus Nodes"
summary: "This section shows the front large form factor (LFF), internal LFF, and internal small form factor (SFF) drive bays in HPE Apollo 4200 Gen10 Plus nodes."
permalink: /hardware-guide/hpe-apollo-4200-gen10-plus/front-internal-drives.html
sidebar: hardware_guide_sidebar
keywords: front_drive, internal_drive, boot_drive, drive, drive_bay, HPE_Apollo_4200_Gen10_Plus, HPE, Apollo, 4200_Gen10_Plus
---

## 480TB and 240TB Nodes
In [480TB and 240TB nodes](technical-specifications.md), all drive bays are populated.

### Front LFF Drive Row
The following diagram shows the front LFF drive row, or cage 1. Cage 1 holds the first half of the drives in box 1, bays 1-12.

{% capture alt_tag %}The front large form factor drive row, or cage 1, in the {{site.a4200g10p}} node (480TB and 240TB).{% endcapture %}
{% include image.html alt=alt_tag file="hpe-apollo-4200-gen10-plus-front-panel-lff-cage-1-box-1-480tb-240tb.png" %}

### Internal LFF Drive Row
The internal LFF drive row, or cage 2, flips up behind the front drive row in the node. Cage 2 holds the second half of the drives in box 1, bays 13-24.

{% capture alt_tag %}The internal large form factor drive row, or cage 2, in the {{site.a4200g10p}} node (480TB and 240TB).{% endcapture %}
{% include image.html alt=alt_tag file="hpe-apollo-4200-gen10-plus-internal-lff-cage-2-box-1-480tb-240tb.png" %}

### Internal SFF Drive Row
The internal SFF drive row flips up behind the internal LFF drive row. This row holds box 3, bays 1-8.

{% capture alt_tag %}The internal small form factor drive row in the {{site.a4200g10p}} node (480TB and 240TB).{% endcapture %}
{% include image.html alt=alt_tag file="hpe-apollo-4200-gen10-plus-internal-sff-box-3-480tb-240tb.png" %}


## 90TB and 36TB Nodes
In [90TB and 36TB Nodes](technical-specifications.md), some drive bays are empty.

{% include note.html content="In the following diagrams, empty drive bays appear in gray." %}

### Front LFF Drive Row
The following diagram shows the front LFF drive row, or cage 1. Cage 1 holds the drives in box 1, bays 1-9. Bays 10-12 are empty.

{% capture alt_tag %}The front large form factor drive row, or cage 1, in the {{site.a4200g10p}} node (90TB and 36TB). Cage 1 holds the drives in box 1, bays 1-9. Bays 10-12 are empty.{% endcapture %}
{% include image.html alt=alt_tag file="hpe-apollo-4200-gen10-plus-front-panel-lff-cage-1-box-1-90tb-36tb.png" %}

### Internal LFF Drive Row
The internal LFF drive row, or cage 2, flips up behind the front drive row in the node. Bays 13-24 in cage 2, box 1 are empty.

{% capture alt_tag %}The internal large form factor drive row, or cage 2, in the {{site.a4200g10p}} node (90TB and 36TB). Bays 13-24 in cage 2, box 1 are empty.{% endcapture %}
{% include image.html alt=alt_tag file="hpe-apollo-4200-gen10-plus-internal-lff-cage-2-box-1-90tb-36tb.png" %}

### Internal SFF Drive Row
The internal SFF drive row flips up behind the internal LFF drive row. Bays 1-4 and 8 in box 3 are empty.

{% capture alt_tag %}The internal small form factor drive row in the {{site.a4200g10p}} node (90TB and 36TB). Bays 1-4 and 8 in box 3 are empty.{% endcapture %}
{% include image.html alt=alt_tag file="hpe-apollo-4200-gen10-plus-internal-sff-box-3-90tb-36tb.png" %}


## Boot Drive
{% include content-reuse/platform-agnostic-boot-drive-additional-instructions.md %}

The boot drive is located inside the node at the indicated location. The drive is mounted onto a PCI Express slot and connected to the motherboard with a SATA cable.

{% capture alt_tag %}The boot drive inside the {{site.a4200g10p}} node{% endcapture %}
{% include image.html alt=alt_tag file="hpe-apollo-4200-gen10-plus-boot-drive.png" url="/hardware-guide/hpe-apollo-4200-gen10-plus/images/hpe-apollo-4200-gen10-plus-boot-drive.png"%}
