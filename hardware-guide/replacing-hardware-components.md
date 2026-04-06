---
title: "Replacing Hardware Components in Your Nodes"
summary: "This section explains how to replace hardware components in your platform's nodes."
permalink: /hardware-guide/replacing-hardware-components.html
redirect_from:
  - /gold-tier-hardware-servicing-guide/replacing-hardware-components.html
sidebar: hardware_guide_sidebar
---

For detailed instructions, see the documentation from your hardware vendor.


## To Locate a Failed Drive by using the Qumulo Core Web UI

1. Log in to Qumulo Core.

1. Click **Cluster > Overview** and then click the name of the node with a failed drive.

1. On the page for the node, under **Drive Details**, the serial number for the failed drive is listed.

1. Use the failed drive's serial number and a server management tool to determine the physical location of the failed drive.


## Initializing a Replacement Boot Drive
{{site.bootDriveInit}}

{% include content-reuse/hardware-guides/platform-agnostic-boot-drive-replacement.md %}
