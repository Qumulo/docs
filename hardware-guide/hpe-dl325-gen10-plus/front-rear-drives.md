---
title: "Front and Rear Drive Bays on HPE ProLiant DL325 Gen10 Plus Nodes"
summary: "This section explains the front and rear drive bays in HPE ProLiant DL325 Gen10 Plus nodes. On this platform, the drives in a node are arranged into <em>rows</em> and groups called <em>boxes</em>."
permalink: /hardware-guide/hpe-dl325-gen10-plus/front-rear-drives.html
redirect_from:
  - /hardware/hpe-dl325-gen10-plus/front-rear-drives.html
sidebar: hardware_guide_sidebar
keywords: front drive, rear drive, boot drive, drive, drive bay
---

## Front Drive Row
The following diagram shows the front drive row. In the diagram, box 1 holds bays 1-8 (indicated in green) and box 2 holds bays 1-2 (indicated in orange).

{% capture alt_tag %}Bays 1-8 (box 1) and bays 1-2 (box 2) on the {{site.dl325g10p}} node{% endcapture %}
{% include image.html alt=alt_tag file="dl325-drive-diagram.png" %}

## Second Drive Row
The second drive row flips up behind the first drive row in the node.

{% include image.html alt="The second drive row flips up behind the first drive row in the node. Box 3 holds bays 1-8 and box 4 holds bays 1-2." file="dl325-node-photo.png" %}<br>

For the second row, box 3 holds bays 1-8 and box 4 holds bays 1-2.

{% capture alt_tag %}Bays 1-8 (box 3) and bays 1-2 (box 4) on the {{site.dl325g10p}} node{% endcapture %}
{% include image.html alt=alt_tag file="dl325-drive-diagram-second-row.png" %}

## Boot Drive
The boot drive is in box 1, bay 1.
{% include important.html content="Before you remove the boot drive, contact the [Qumulo Care Team](https://care.qumulo.com/hc/en-us/articles/115008409408) for additional instructions." %}
