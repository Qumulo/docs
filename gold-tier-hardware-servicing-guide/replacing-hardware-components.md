---
title: "Replacing Hardware Components in Your Nodes"
summary: "This section explains how to replace hardware components in your platform's nodes."
permalink: /gold-tier-hardware-servicing-guide/replacing-hardware-components.html
sidebar: gold_tier_hardware_servicing_guide_sidebar
platform: agnostic
---

For detailed instructions, see the documentation from your hardware vendor.


## Locating a Failed Drive
Gold-Tier hardware doesn't use predefined drive mapping or panel LEDs to indicate drive health.

### To Locate a Failed Drive by using the Web UI

1. Log in to Qumulo Core.

1. Click **Cluster > Overview** and then click the name of the node with a failed drive.

1. On the page for the node, under **Drive Details**, the serial number for the failed drive is listed.

1. Use the failed drive's serial number and a server management tool to determine the physical location of the failed drive.


## Initializing a Replacement Boot Drive
{{site.bootDriveInit}}

{% include content-reuse/hardware-guides/platform-agnostic-boot-drive-replacement.md %}
