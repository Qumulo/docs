---
title: "Getting Started with Qumulo on HPE ProLiant DL325 Gen10 Plus"
summary: "This section explains how to prepare HPE ProLiant DL325 Gen10 Plus nodes for creating a Qumulo cluster. This guide is for system administrators, professional service providers, and colleagues in your organization who are responsible for installing and configuring server hardware."
permalink: /hardware-guide/hpe-dl325-gen10-plus/getting-started.html
redirect_from:
  - /hardware/hpe-dl325-gen10-plus/getting-started.html
sidebar: hardware_guide_sidebar
---

## Prerequisites
{{site.xrefUSBinstaller}}

## Step 1: Verify Your Node

{% include content-reuse/platform-agnostic-verify-node-preamble.md %}

   {% capture alt_tag %}Front Diagram of the {{site.dl325g10p}} Node{% endcapture %}
   {% include image.html alt=alt_tag file="dl325-front.png" %}


## Step 2: Boot by Using the Qumulo Core USB Drive Installer

1. On the **HPE ProLiant** boot screen, press **F11**.

   {% include note.html content="The **Boot Menu** page might take a few minutes to appear." %}

1. On the **Boot Menu** page, to perform a one-time boot, do one of the following:

   * If the **Legacy BIOS One-Time Boot Menu** option is available, click it.

   * If the **Legacy BIOS One-Time Boot Menu** option is unavailable, click **Generic USB Boot** and continue to run the Field Verification Tool (FVT).

1. In the **Question** dialog box, click **OK**.

   {% include note.html content="The **Default Boot Override Options** page might take a few minutes to appear." %}

1. In the **Default Boot Override Options** menu, select **2) One Time Boot to USB DriveKey**.


## Step 3: Run the Field Verification Tool (FVT)

After the node reboots, the Qumulo Installer runs automatically.

1. Choose **[1] Factory reset (DESTROYS ALL DATA)**.

1. To perform a clean installation of Qumulo Core on your node, type `DESTROY ALL DATA` (case-sensitive).

1. Review the verification results and consider the following before proceeding with the installation.

   * If the **FVT Passed!** message appears, select **[1] Install Qumulo Core**.

   * If **FAIL** messages appear, use one of the following resolutions.

1. When the FVT passes all checks, select **[1] Install Qumulo Core**.


### Fixable Issues During Installation
If the FVT finds fixable issues, it prompts you to auto-correct any detected issues, depending on your installation scenario. Issues that the FVT can auto-correct include the following:

* BIOS Configuration
* Drive firmware
* NVMe sector size
* NIC mode
* NIC firmware
* Boot order

1. To attempt auto-correction, select **[1] Run FVT Flash. This will try to fix issues then reboot.**

   If the fixes are successful, the FVT reboots the node automatically.

1. To re-attempt verification, [boot by using the Qumulo Core USB Drive Installer](#step-2-boot-by-using-the-qumulo-core-usb-drive-installer) and then continue the installation.


### Non-Fixable Issues
If the FVT is unable to auto-correct any issues, the message **Not fixable issues were detected.** appears, providing reasons for failure.

For help with troubleshooting your node, {{site.contactQumuloCare}}.


## Step 4: Create and Configure Your Cluster

{% include content-reuse/create-configure-cluster.md %}
