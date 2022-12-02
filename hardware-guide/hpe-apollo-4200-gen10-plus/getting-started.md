---
title: "Getting Started with Qumulo on HPE Apollo 4200 Gen10 Plus"
summary: "This section explains how to prepare HPE Apollo 4200 Gen10 Plus nodes for creating a Qumulo Core cluster. This guide is for system administrators, professional service providers, and colleagues in your organization who are responsible for installing and configuring server hardware."
permalink: /hardware-guide/hpe-apollo-4200-gen10-plus/getting-started.html
sidebar: hardware_guide_sidebar
keywords: getting started guide, quick reference, HPE, Apollo 4200 Gen10 Plus, verify node, field verification tool, FVT
---

## Prerequisites
<a href="https://docs.qumulo.com/administrator-guide/qumulo-core/creating-usb-drive-installer.html" class="no_icon">Qumulo Core USB Drive Installer</a>


## Step 1: Verify Your Node

{% include content-reuse/platform-agnostic-verify-node-preamble.md %}

   {% capture alt_tag %}Front Diagram of the {{site.a4200g10p}} Node{% endcapture %}
   {% include image.html alt=alt_tag file="hpe-apollo-4200-gen10-plus-front-panel-power.png" %}

1. On the **HPE ProLiant** boot screen, do one of the following:

   * If the **Boot Mode: Legacy BIOS** message appears, skip the rest of this section and continue to [boot by using the Qumulo Core USB Drive Installer](#step-2-boot-by-using-the-qumulo-core-usb-drive-installer).

   * If the **Boot Mode: Legacy BIOS** message doesn't appear, press **F9**.

1. On the **System Utilities** page, click **System Configuration > BIOS/Platform Configuration (RBSU) > Boot Options**.

1. On the **Boot Options** page, set **Boot Mode** to **Legacy BIOS Mode** and then press **F10**.

1. Press **Esc** until you return to the main page.

1. Click **Reboot the System**.


## Step 2: Boot by Using the Qumulo Core USB Drive Installer

1. On the **HPE ProLiant** boot screen, press **F11**.

   {% include note.html content="The **Boot Menu** page might take a few minutes to appear." %}

1. On the **One-Time Boot Menu** page, click **Generic USB Boot** and continue to run the Field Verification Tool (FVT).

1. In the **Question** dialog box, click **OK**.

   {% include note.html content="The **Default Boot Override Options** page might take a few minutes to appear." %}

1. In the **Default Boot Override Options** menu, select **2) One Time Boot to USB DriveKey**.



## Step 3: Run the Field Verification Tool (FVT)

After the node reboots, the Field Verification Tool runs automatically.

Select **[1] Factory reset (DESTROYS ALL DATA)** and then enter `DESTROY ALL DATA`.


### Fixable Issues During Installation
If the FVT finds fixable issues, it prompts you to auto-correct any detected issues, depending on your installation scenario. Issues that the FVT can auto-correct include the following:

* BIOS Configuration
* Drive firmware
* Drive controller firmware
* NIC mode for CX5
* Boot order

1. To attempt auto-correction, select **[1] Run FVT Flash. This will try to fix issues then reboot.**

   If the fixes are successful, the FVT reboots the node automatically.

1. To re-attempt verification, [boot by using the Qumulo Core USB Drive Installer](#step-2-boot-by-using-the-qumulo-core-usb-drive-installer) and then continue the installation.


### Non-Fixable Issues
If the FVT is unable to auto-correct any issues, the message **Not fixable issues were detected.** appears, providing reasons for failure.

For help with troubleshooting your node, contact [Qumulo Care](https://care.qumulo.com/hc/en-us/articles/115008409408).

   
## Step 4: Create and Configure Your Cluster

{% include content-reuse/create-configure-cluster.md %}
