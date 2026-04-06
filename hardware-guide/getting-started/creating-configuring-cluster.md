---
title: "Creating and Configuring a Qumulo Cluster with Your Nodes"
summary: "This section explains how to prepare your platform nodes for creating a Qumulo cluster."
permalink: /hardware-guide/getting-started/creating-configuring-cluster.html
redirect_from:
 - /gold-tier-hardware-servicing-guide/getting-started/creating-configuring-cluster.html
sidebar: hardware_guide_sidebar
---

## Step 1: Boot by Using the Qumulo Core USB Drive Installer
1. Insert a USB drive with the [Qumulo Core installer](creating-usb-drive-installer.html) into an available port and power on the node.

1. When the node begins to boot, enter the boot menu.

   {% include note.html content="The boot setting is persistent: When you boot from a USB drive once, the node continues to boot from the USB drive. After you finish installing Qumulo Core, remove the USB drive from the node." %}

1. On the boot drive selection screen, select your USB drive (usually labeled with `UEFI OS`) and boot into it.

   The Qumulo Core installation begins.

## Step 2: Create and Configure Your Cluster
{% include content-reuse/hardware-guides/create-configure-cluster.md %}
