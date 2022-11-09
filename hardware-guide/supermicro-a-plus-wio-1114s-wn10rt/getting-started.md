---
title: "Getting Started with Qumulo on Supermicro A+ WIO 1114S-WN10RT"
summary: "This section explains how to prepare Supermicro A+ WIO 1114S-WN10RT nodes for creating a Qumulo Core cluster."
permalink: hardware-guide/supermicro-a-plus-wio-1114s-wn10rt/getting-started.html
redirect_from:
  - supermicro.html
  - hardware/supermicro-a-plus-wio-1114s-wn10rt/getting-started.html
sidebar: hardware_guide_sidebar
keywords: getting started guide, quick reference, Supermicro 1114S, WN10RT, verify node, field verification tool, FVT
---

This section explains how to prepare {{site.sm1114s}} nodes for creating a Qumulo Core cluster.

## Step 1: Verify Your Node

1. Shut down your node and connect a display, a keyboard, and a mouse to it.

1. Plug the [Qumulo Core USB Drive Installer](/administrator-guide/qumulo-core/creating-usb-drive-installer.html) into an available USB port on the node and then press the power button.

   {% capture alt_tag %}Front Diagram of the {{site.sm1114sLong}} Node{% endcapture %}
   {% include image.html alt=alt_tag file="supermicro-1114s-front-diagram.png" url="/hardware-guide/supermicro-a-plus-wio-1114s-wn10rt/images/supermicro-1114s-front-diagram.png" %}


## Step 2: Boot by Using the Qumulo Core USB Drive Installer

1. When the node powers on and begins to boot, on the **Supermicro** screen, press **F11**.

   {% include note.html content="The boot setting is persistent: When you boot from a USB drive once, the node continues to boot from the USB drive. After you finish installing Qumulo Core, remove the USB drive from the node." %}

1. On the **Please select boot device:** screen, select your USB drive (usually labelled with `UEFI OS`) and boot into it.


## Step 3: Install Qumulo Core

{% include content-reuse/install-qumulo-core.md %}
   

## Step 4: Create and Configure Your Cluster

{% include content-reuse/create-configure-cluster.md %}
