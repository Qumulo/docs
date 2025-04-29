---
title: "Creating and Configuring a Qumulo Cluster with Supermicro A+ WIO 1114S-WN10RT Nodes"
summary: "This section explains how to prepare Supermicro 1114S nodes for creating a Qumulo cluster."
permalink: /hardware-guide/supermicro-a-plus-wio-1114s-wn10rt/creating-configuring-cluster.html
redirect_from:
  - /supermicro.html
  - /hardware/supermicro-a-plus-wio-1114s-wn10rt/getting-started.html
  - /hardware-guide/supermicro-a-plus-wio-1114s-wn10rt/getting-started.html
sidebar: hardware_guide_sidebar
---

## Step 1: Verify Your Node

{% include content-reuse/hardware-guides/platform-agnostic-verify-node-preamble.md %}


## Step 2: Boot by Using the Qumulo Core USB Drive Installer

1. When the node powers on and begins to boot, on the **Supermicro** screen, press **F11**.

   {% include note.html content="The boot setting is persistent: When you boot from a USB drive once, the node continues to boot from the USB drive. After you finish installing Qumulo Core, remove the USB drive from the node." %}

1. On the **Please select boot device:** screen, select your USB drive (usually labeled with `UEFI OS`) and boot into it.


## Step 3: Install Qumulo Core

{% include content-reuse/hardware-guides/install-qumulo-core.md %}
   

## Step 4: Create and Configure Your Cluster

{% include content-reuse/hardware-guides/create-configure-cluster.md %}
