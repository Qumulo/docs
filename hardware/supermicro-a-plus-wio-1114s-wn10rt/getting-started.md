---
title: "Getting Started with Qumulo on Supermicro A+ WIO 1114S-WN10RT"
summary: "This section explains how to prepare Supermicro A+ WIO 1114S-WN10RT nodes for creating a Qumulo Core cluster."
permalink: hardware/supermicro-a-plus-wio-1114s-wn10rt/getting-started.html
sidebar: hardware_sidebar
redirect_from:
  - supermicro.html
keywords: getting started guide, quick reference, Supermicro 1114S, WN10RT, verify node, field verification tool, FVT
---

This section explains how to prepare Supermicro 1114S nodes for creating a Qumulo Core cluster.

## Step 1: Verify Your Node

1. Shut down your node and connect a display, a keyboard, and a mouse to it.

1. Plug the [Qumulo Core USB Drive Installer](/administrator-guide/qumulo-core/creating-usb-drive-installer.html) into an available USB port on the node and then press the power button.

   {% include image.html alt="Front Diagram of the Supermicro A+ WIO 1114S-WN10RT Node" file="supermicro-front-diagram.png" url="/hardware/supermicro-a-plus-wio-1114s-wn10rt/images/supermicro-front-diagram.png" %}


## Step 2: Boot by Using the Qumulo Core USB Drive Installer

1. When the node powers on and begins to boot, on the **Supermicro** screen, press **F11**.

   {% include note.html content="The boot setting is persistent: When you boot from a USB drive once, the node continues to boot from the USB drive. After you finish installing Qumulo Core, remove the USB drive from the node." %}

1. On the **Please select boot device:** screen, select your USB drive (usually labelled with `UEFI OS`) and boot into it.


## Step 3: Install Qumulo Core

After the node reboots, the Field Verification Tool runs automatically.

Select **[1] Factory reset (DESTROYS ALL DATA)** and then enter `DESTROY ALL DATA`.

When the FVT finishes, the **FVT passed!** message appears.

Qumulo Core is now installed on your node.


### Fixable Issues During Installation
If the FVT finds fixable issues, it prompts you to auto-correct any detected issues, depending on your installation scenario. Issues that the FVT can auto-correct include the following:

* BIOS Configuration
* Drive firmware
* NIC mode
* Boot order

1. To attempt auto-correction, select **[1] Run FVT Flash. This will try to fix issues then reboot.**

   If the fixes are successful, the FVT reboots the node automatically.

1. To re-attempt verification, [boot by using the Qumulo Core USB Drive Installer](#step-2-boot-by-using-the-qumulo-core-usb-drive-installer) and then continue the installation.


### Non-Fixable Issues
If the FVT is unable to auto-correct any issues, the message **Not fixable issues were detected.** appears, providing reasons for failure.

For help with troubleshooting your node, contact [Qumulo Care](https://care.qumulo.com/hc/en-us/articles/115008409408).
   

## Step 4: Create and Configure Your Cluster

{% include content-reuse/create-configure-cluster.md %}
