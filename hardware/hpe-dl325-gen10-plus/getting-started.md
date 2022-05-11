---
title: "Getting Started with Qumulo on HPE ProLiant DL325 Gen10 Plus"
summary: "This section explains how to prepare HPE ProLiant DL325 Gen10 Plus nodes for creating a Qumulo Core cluster."
permalink: hardware/hpe-dl325-gen10-plus/getting-started.html
sidebar: hardware_sidebar
keywords: getting started guide, quick reference, HPE, ProLiant DL325 Gen10 Plus, verify node, field verification tool, FVT, intelligent provisioning
---

This section explains how to prepare HPE ProLiant DL325 Gen10 Plus nodes for creating a Qumulo Core cluster. This guide is for system administrators, professional service providers, and colleagues in your organization who are responsible for installing and configuring server hardware. For more information, see [HPE ProLiant DL325 Gen10 Plus Server - Document List](https://support.hpe.com/hpesc/public/docDisplay?docLocale=en_US&docId=a00102298en_us).

## Prerequisites
* The latest Qumulo-certified HPE service pack installed on your nodes. For more information, contact [Qumulo Care](https://care.qumulo.com/hc/en-us/articles/115008409408).
* The [Qumulo Core USB Drive Installer](https://care.qumulo.com/hc/en-us/articles/360034690034)


## Step 1: Verify Your Node
1. Shut down your node and connect a display, a keyboard, and a mouse to it.

1. Plug the Qumulo Core USB Drive Installer into an available USB port on the node and then press the power button.

   {% include image.html alt="To power on the node, press the power button." file="dl325-front.png" %}

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

1. On the **Boot Menu** page, to perform a one-time boot, click **Generic USB Boot**.

## Step 3: Use the Field Verification Tool (FVT)

After the node reboots, the Field Verification Tool starts automatically.

1. Choose **[1] Factory reset (DESTROYS ALL DATA)**.

1. To perform a clean installation of Qumulo Core on your node, type `DESTROY ALL DATA` (case-sensitive).

1. Review the verification results and consider the following before proceeding with the installation.

   * If the **FVT Passed!** message appears, select **[1] Install Qumulo Core**.

   * If **FAIL** messages appear, use one of the following resolutions.


### Fixable Issues During Installation
If the FVT finds fixable issues, it prompts you to auto-correct any detected issues, depending on your installation scenario. Issues that the FVT can auto-correct include the following:

* BIOS Configuration
* Drive firmware
* NVMe sector size
* NIC mode
* NIC firmware
* Boot order

1. To attempt auto-correction, select **[1] Run FVT Flash. This will try to fix issues then reboot. Please take caution as this MAY DESTROY EXISTING DATA.**

   If the fixes are successful, the FVT reboots the node automatically.

1. To re-attempt verification, [boot by using the Qumulo Core USB Drive Installer](#step-2-boot-by-using-the-qumulo-core-usb-drive-installer) and then continue the installation.


### Fixable Issues During Part Replacement
In Qumulo Core 3.1.0 (and higher), the FVT can auto-correct issues (such as firmware upgrades) after you replace a part.

To attempt auto-correction, select **[2] Run FVT Flash for a part replacement. This will try to fix issues, then reboot. This will NOT destroy existing data.**

The FVT reboots the node automatically and lets you continue the installation.


### Non-Fixable Issues
If the FVT is unable to auto-correct any issues, the message **Not fixable issues were detected.** appears, providing reasons for failure. Issues that the FVT can't auto-correct include the following:

* BIOS version
* iLO version
* NIC firmware

For help with troubleshooting your node, contact [Qumulo Care](https://care.qumulo.com/hc/en-us/articles/115008409408).


## Step 5: Create and Configure Your Cluster

{% include content-reuse/create-configure-cluster.md %}
