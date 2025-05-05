---
title: "Creating and Configuring a Qumulo Cluster with Fsas Technologies PRIMERGY RX2540 M7 Nodes"
summary: "This section explains how to prepare Fsas Technologies RX2540 M7 nodes for creating a Qumulo cluster."
permalink: /hardware-guide/fsas-technologies-primergy-rx2540-m7/creating-configuring-cluster.html
redirect_from:
  - /hardware-guide/fsas-technologies-primergy-rx2540-m7/getting-started.html
  - /hardware-guide/fujitsu-primergy-rx2540-m7/creating-configuring-cluster.html
sidebar: hardware_guide_sidebar
---

{% capture askFsasTech %}Your {{site.fprx2540m7}} node might require a firmware update. Before you get started with Qumulo Core, contact [Fsas Technologies Product Support](https://support.ts.fujitsu.com/) for information about the minimum required firmware level and hardware configuration.{% endcapture %}
{% include important.html content=askFsasTech %}

## Step 1: Verify Your Node
{% include content-reuse/hardware-guides/platform-agnostic-verify-node-preamble.md %}


## Step 2: Boot by Using the Qumulo Core USB Drive Installer
1. When the node powers on and begins to boot, on the **Fsas Technologies** screen, press **F12**.

   {% include note.html content="The boot setting is persistent: When you boot from a USB drive once, the node continues to boot from the USB drive. After you finish installing Qumulo Core, remove the USB drive from the node." %}

1. On the **Please select boot device:** screen, select your USB drive (usually labeled with `UEFI OS`) and boot into it.

1. On the GRUB menu, select your USB drive.


## Step 3: Create and Configure Your Cluster
The Qumulo Installer runs automatically.
{% include content-reuse/hardware-guides/create-configure-cluster.md %}
